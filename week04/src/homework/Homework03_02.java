package homework;

import java.util.concurrent.CountDownLatch;

/**
 * 本周作业：（必做）思考有多少种方式，在main函数启动一个新线程或线程池，
 * 异步运行一个方法，拿到这个方法的返回值后，退出主线程？
 * 写出你的方法，越多越好，提交到github。
 *
 * 一个简单的代码参考：
 */
public class Homework03_02 {

    public static void main(String[] args) throws InterruptedException {

        long start=System.currentTimeMillis();
        int[] arr = new int[1];
        // 在这里创建一个线程或线程池，
        // 异步执行 下面方法
        new myThread(arr).start();
        synchronized (arr){
            arr.wait();
        }

        int result = arr[0]; //这是得到的返回值

        // 确保  拿到result 并输出
        System.out.println("异步计算结果为："+result);

        System.out.println("使用时间："+ (System.currentTimeMillis()-start) + " ms");

        // 然后退出main线程
    }
    static class myThread extends Thread{
        private int[] arr;
        public myThread(int[] arr){
            this.arr = arr;
        }
        @Override
        public void run() {
            arr[0] = sum();
            synchronized (arr){
                arr.notify();
            }
        }
    }

    private static int sum() {
        return fibo(36);
    }

    private static int fibo(int a) {
        if ( a < 2)
            return 1;
        return fibo(a-1) + fibo(a-2);
    }
}
