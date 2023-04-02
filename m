Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0E646D3AF7
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Apr 2023 01:42:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbjDBXms (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 2 Apr 2023 19:42:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjDBXmr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 2 Apr 2023 19:42:47 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 916C13A95;
        Sun,  2 Apr 2023 16:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1680478964; i=w_armin@gmx.de;
        bh=GRQnjT9KmE3AkCu9NxZlOmSvNZm9Y2yVrWsvJ5Akhzc=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=E+C+ne4OUD4oNbQRXHgGPF+NC1fyZIX0gHo/BBFIngSTZDrGynIgFa8Sohs0swbUe
         NMDMR3Ufg7IBQwrX6SWqDckNOyMA2iNb8xqkHbLM3kOcDK/Ps4qyF363Vvq5MNojP4
         8HxPD9G5wD1zVT3M8FsXLNddhf7oCIG5sx5pISDZxjQ3OxydjZ815QzaCEwCV33Q7T
         8qTsiWoWeXdsYW0YEoLOrJ9Bq+XhsJrCH47PckyoTWvuc2MG6wRIshm/FS5Fxteszf
         QbIZNWscniov1KTo3I85DoKjrGj6jyxDY2bdbI6WO/mpVvGACRvELkb95EEFOPH+p8
         20URarrO+LTeA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M8QS8-1pnV3c0mDg-004RNm; Mon, 03
 Apr 2023 01:42:44 +0200
Subject: Re: Creating a driver for MAX31827 temperature switch
To:     Daniel Matyas <daniel.matyas23@gmail.com>,
        linux-iio@vger.kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <ZCn0KeOQFJclqiAK@daniel-Precision-5530>
From:   Armin Wolf <W_Armin@gmx.de>
Message-ID: <71d56511-c7ef-e109-406d-6dff83ed382e@gmx.de>
Date:   Mon, 3 Apr 2023 01:42:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <ZCn0KeOQFJclqiAK@daniel-Precision-5530>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Provags-ID: V03:K1:teN9dg6/WI6+sZCpnhY2KsyD0BI7ua4NOF2JoTrGbhW5CdMD+uH
 klB45Ai0J2UgtDmUJtcDDLOMfvJKI61k7v6jBICBMbn11+uJf8eT2+WE77GEtO1X8U8GCUs
 RQRppOeUL22ZH4FUu2A5MKSbxcg+XwBVj/3MV7tRpBcKhJ0ZUkhjC7qEQ8EkwDzRA+ACN4T
 56TJB9yEVXnRUgJ02vgVQ==
UI-OutboundReport: notjunk:1;M01:P0:lzWBE5332gs=;gxZmyjcSnKBnWg3KWfe1wvllstf
 YumuUokZMcJWBQyK4DjjxAGZDE5OmQYxycHgtAfjRhB1rUBzALrV0YXWbPEB7erplbZ22/GJ2
 NLTC7BM3IzDjkSx9/r+fnQZc/2olB9suJJaxgTP9xOiv2Khrxh/f7r5j0Q8bvLb5Cfe7320Bs
 zpLQRYHgdaaDHpPUiI0aEEavHGo0PqfFyuhnupUnJnO9OvCTOEM+zmKp+wV31l+rjUNQtnOh2
 5qUjOlsSoBsCLZzf8+AHf7RUOBcqy3QbFmXQG58A166+swfBsNF9q1zoa2hrcJv1fqT8mWqc5
 lASYZhNWZMpDQey5burWeHPZGiptq2kMIsXZGH13u0QEZ5EWRrz6Z/P+YdawlCB6ks6kjUZl1
 uBQnfTmxXNZPLQHlNw2FboW6d7JbrWxkJNVhbMvpCqbDSNo1HTB47/kImsMdMlYZ6m5HPx5ab
 DTIlVr0nWvbWYQJJGBDhft1CemF7lr3DSFgsX8RMX0HTuols2R3vb7w5uaRF+Iw2A07AtZflr
 Z5AJhAIHvCW3DAfUAUiOkn4ItTHquduEYVZ9aHFbH77mvQRxZ8S1OsgKzsp62GXiHiQpPDyfF
 WdZ+R7lhC8C2qGdnO1a3IHZ6fcqKUHoLZCN+coV21yR6M8lZy/2AZHpFPfFZvCstqi0NCgUM2
 BIX0VXrK1qK9Jt9TjNYLOt/AiZVn8B/Zk2p1Pmt0MFXX6fq4P1FuBhcz20E4n7NyAC2Hz18F+
 zRHwai2+JomBusiM8VdkSMmcjzfCMmOJdfALhZ7nZxbLHgJFTtK5M6pPzfZhobcHpA3GVE3Zn
 GESKfGl0a/YhuNAtEYZDAwH/k2l/aonTuzpkCDeQeZIIPpZsQ4GSd2u82/lilr0MClwbuzYyV
 NCOyn5y8Lj70S3ViHF5/p7sRRmwJHgJjLGZdKp2TtP7XFVymvo8WPiz4OaKJJekdXanT6AsLL
 2/VDvEM6AjKB3xTrhsAMkNnhMBg=
X-Spam-Status: No, score=-3.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Am 02.04.23 um 23:31 schrieb Daniel Matyas:

> Dear Kernel community,
>
> I am developing an IIO driver for a temperature switch, which communicates through I2C at Analog Devices Inc.
>
> When implementing the event handling for the comparator mode of the device, I faced a problem: I don't know how to differentiate the underTemp event from the overTemp event. To understand better, I suggest you check out the device's data sheet for Address map (page 12), Configuration Register Definition (page 13) and OT/UT Status Bits and ALARM Pin Behavior (page 15) - https://www.analog.com/media/en/technical-documentation/data-sheets/MAX31827-MAX31829.pdf
>
> I had the idea to make 2 channels with the exact same attributes, but with different indexes, so that I can store the overTemp related events on channel 0 and underTemp related events on channel 1. Even so, I don't really feel like this is the right solution. Can anyone give me some advice on this?
>
> Also, I was suggested that I convert my driver from IIO to HWMON. Do you think that this is needed?
>
> Yours faithfully,
> Daniel Matyas

Hi,

regarding the question whether the driver should be a hwmon driver: i depends on the usage of the temperature sensor.
If its a low sample rate temperature sensor used to mainly monitor the temperature of the computer system itself, then
the driver should be a hwmon driver. The datasheet suggests that the sensor device is intended for monitoring computer systems,
so a hwmon driver would make sense (see https://www.kernel.org/doc/html/latest/driver-api/iio/intro.html).

Armin Wolf

