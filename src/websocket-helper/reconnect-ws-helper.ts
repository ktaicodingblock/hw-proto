import { firstValueFrom, Observable, timeout } from 'rxjs'
import { v4 as uuid } from 'uuid'
import ReconnectingWebSocket from 'reconnecting-websocket'
import { IHwClientMeta, IHwCmdRequest } from '../types'

const DEBUG = true

export async function sendAndWaitByReconnectWebSocket(params: {
    socket: ReconnectingWebSocket
    hwId: string
    clientMeta: IHwClientMeta
    cmd: string
    args: unknown[]
    requestTimeout?: number
}): Promise<any> {
    const { socket, hwId, clientMeta, cmd, args, requestTimeout = 10000 } = params

    const requestId = uuid()
    const request: IHwCmdRequest = {
        requestId,
        hwId,
        clientMeta,
        cmd,
        args,
    }

    if (DEBUG) console.log('XXX request:', request)

    const observable = new Observable((observer) => {
        socket.send(JSON.stringify({ type: 'deviceCtl', body: request }))
        const responseHandler = (response: MessageEvent) => {
            try {
                console.log('response = ', response.data)
                const result = JSON.parse(response.data.toString())
                console.log('result = ', result)
                if (result['type'] === 'channel' && result['channel'] === request.requestId) {
                    observer.next(result)
                    observer.complete()
                }
            } catch (err: any) {
                observer.error(err)
            }
        }

        socket.addEventListener('message', responseHandler)
        return () => {
            console.log('responseHandler disponse')
            socket.removeEventListener('message', responseHandler)
        }
    })

    return await firstValueFrom(observable.pipe(timeout(requestTimeout)))
}
