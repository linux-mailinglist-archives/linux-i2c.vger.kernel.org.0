Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC946630C8C
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Nov 2022 07:40:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231909AbiKSGkF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Nov 2022 01:40:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231904AbiKSGkB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Nov 2022 01:40:01 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F6D24F1AD;
        Fri, 18 Nov 2022 22:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1668839994; bh=l+WsbfLURdjYJd9P5p3v7g6Q4AV62aE2sA1DFwUojDk=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=tnMEwqGwhsRTSm4HzdENLCLBCbVgUIRtxSa2y5ZVm6sUdBL3TwQiXl5MeVqxQ8Rk8
         rkttyM49dUedBlHWfHZgwDM4v3369ljSapgxLkbkWxRV1h1lmauxEDV7WEg8fg6Qla
         52Lgxe8Jm3fv519XwTgsq4318xdFPo5puxnyPdgX6Tf+bJrDz2ZUkdHQ63RS43IxYu
         1l5zIn7yfTwQ5Zasqp28eG2Tj02D1Ro927ZfSJJ5Z7geazGJihTk7tx28xIZ2g4Mx7
         JUVoq7XWyoFkrVM3GTDBjFYK2qJ0khvaRmKCEz6usS2afgv83m9hz4eSffw5qbT+0N
         K9A7vyplAFDPA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.184.159]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N4zAy-1p6DiY0nTQ-010rWZ; Sat, 19
 Nov 2022 07:39:54 +0100
Message-ID: <75f7bba1-8dca-ff17-f922-e3465759ba66@gmx.de>
Date:   Sat, 19 Nov 2022 07:39:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 594/606] video: fbdev: matrox: Convert to i2c's
 .probe_new()
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-595-uwe@kleine-koenig.org>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <20221118224540.619276-595-uwe@kleine-koenig.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VZ7IAwxjDCqR+1ZSYMAULZDjKb3OwL/bJQZZP+mRsalty8QZ/n8
 aRf6cSjyfqRQ+eJ4DdRt/b8yLK9hE9sDjXnP1lADZaX+7AchVX/zAp7c0alNrR19ntr+5lW
 mcDhca1dxVuRnKqnMxVEG6lTqET/fLW97TumFBs2qvuwibf3DunzSCp+jdW8GwooXCNSLM7
 Xa9AjRa57SmDBaQEiqeKA==
UI-OutboundReport: notjunk:1;M01:P0:H8sX/ATSKvQ=;oTX6ETbOe4jXDHYbibatzVli/xH
 8NThLqA8TssXhDfdFQ052wf434YbMGPp7X+Ond7PwhjiRY2K8CEeQOL0DYsVsqzuX32HO3TtR
 XhYNttThSIkAFO6YKox7hk6wfxBx8pQVU3WZUo/3eEGD3qUmDpUfL12ihvDBvAPL/wL1z044T
 fpHvxPUF601m8oqoO8lIcWJHrrtzx+hgNks5qXo2JdHWDBeeWrw0o8D8jTIiX/M6oAZOgRTBt
 IP2iUs70vI5ErJqj/9gq2abaP9EdKUY8Zgkne3Ti89D4bgg4Dv8SJN2+mIBty4Z561DYrn3Dk
 rCPwhxS8JCiLEG6Z384QOmi+XXMjOGaCozKODFYlAwGm8ygZR4MNn2Vpef88EUoMI48H6ckC2
 U6+PC9TMFXIEAWD/Syn/Cic2gpwlVv5ToourVoe5q6gYwLoiGykdFJwxfqTIr47E5zOF3CdPw
 gv+OnSg5LI/UWCVKxeKKMUYxbd+AxWcJXa6ExCK3baSlhTWGegoC/DpXE7WgQi0zfKtXpEopS
 nl3Py7y3Lxdi8xZlwdQL9g/LSCL0qS6p7ae15Tkk56AzfZDNGB2KmXRiPDVvHeFs9wBZm/ilZ
 kZMo5Cy4aMV9uJRQ76xxkjoxfu/kC8Zx31mC0jnaeoarAVAJP0mAJwk5D+sMWhudRX2cIutCm
 sYIujEZsSMayOkndCqJxef3uEAwnQQBapS+i9bUdIdHRGRNz6AnA5BIsMzZWNtWzaLpRRzUyn
 kJwh1EqZRqC6cFIMmfw7HE7v8faSVjFWd/ZftScNRLM5jak1PE7A+NcbJSgtpRzHiBlk+iCtG
 x/p50WRXEq6lTx6BGQDIVTh0FOtKnFgdnSdv9xDwTeBuYAP9liks/Q8XbEFAl1ooUsbOom5qr
 KkxPpsH4uCeZ+lJc5CIqRo6w6qUD8Q3cj5Koh7mT44S1Les6BFAcs33pS2O9WMR/Jwhygh7cu
 TF8xE6f+tA+lrXwB8Gw/E6P4xI4=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 11/18/22 23:45, Uwe Kleine-K=C3=B6nig wrote:
> From: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>
> The probe function doesn't make use of the i2c_device_id * parameter so =
it
> can be trivially converted.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

applied.

Thanks!
Helge


> ---
>   drivers/video/fbdev/matrox/matroxfb_maven.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/video/fbdev/matrox/matroxfb_maven.c b/drivers/video=
/fbdev/matrox/matroxfb_maven.c
> index f2e02958673d..727a10a59811 100644
> --- a/drivers/video/fbdev/matrox/matroxfb_maven.c
> +++ b/drivers/video/fbdev/matrox/matroxfb_maven.c
> @@ -1249,8 +1249,7 @@ static int maven_shutdown_client(struct i2c_client=
* clnt) {
>   	return 0;
>   }
>
> -static int maven_probe(struct i2c_client *client,
> -		       const struct i2c_device_id *id)
> +static int maven_probe(struct i2c_client *client)
>   {
>   	struct i2c_adapter *adapter =3D client->adapter;
>   	int err =3D -ENODEV;
> @@ -1292,7 +1291,7 @@ static struct i2c_driver maven_driver=3D{
>   	.driver =3D {
>   		.name	=3D "maven",
>   	},
> -	.probe		=3D maven_probe,
> +	.probe_new	=3D maven_probe,
>   	.remove		=3D maven_remove,
>   	.id_table	=3D maven_id,
>   };

