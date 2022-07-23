Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBEAC57F1A2
	for <lists+linux-i2c@lfdr.de>; Sat, 23 Jul 2022 23:02:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235712AbiGWVCK convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Sat, 23 Jul 2022 17:02:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231194AbiGWVCJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 23 Jul 2022 17:02:09 -0400
Received: from mail.sch.bme.hu (mail.sch.bme.hu [152.66.208.194])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F27AF13CC2;
        Sat, 23 Jul 2022 14:02:06 -0700 (PDT)
Received: from mail-pf1-f173.google.com (209.85.210.173) by
 Exchange2016-1.sch.bme.hu (152.66.208.194) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.18; Sat, 23 Jul 2022 23:02:03 +0200
Received: by mail-pf1-f173.google.com with SMTP id c3so7163877pfb.13;
        Sat, 23 Jul 2022 14:02:03 -0700 (PDT)
X-Gm-Message-State: AJIora/NXbyGZCZz6AGaDOHw1fRNzGZahjJJ/s9I4SGWjVj8QCKwDthI
        hmTXb4hLac9N0RY4+uUHfIZMbJVZ8j/u4oAX8v4=
X-Google-Smtp-Source: AGRyM1sVR/PpHNvaw4+wgsLXtgtUQbaGUx/r9cGHtO+Zs9Q3jozIMXwtamWdZa31oeSD1U4FFyITiBzRuU0gBZL7Ffw=
X-Received: by 2002:a63:c53:0:b0:412:6f28:7a87 with SMTP id
 19-20020a630c53000000b004126f287a87mr5316373pgm.136.1658610121331; Sat, 23
 Jul 2022 14:02:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220723043229.2953386-1-williamsukatube@163.com>
In-Reply-To: <20220723043229.2953386-1-williamsukatube@163.com>
From:   =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <bence98@sch.bme.hu>
Date:   Sat, 23 Jul 2022 23:01:50 +0200
X-Gmail-Original-Message-ID: <CACCVKEFXOKhXmF3rcmKQ8-aMFZJLZOf+imsuBYKAQsWptrJG6Q@mail.gmail.com>
Message-ID: <CACCVKEFXOKhXmF3rcmKQ8-aMFZJLZOf+imsuBYKAQsWptrJG6Q@mail.gmail.com>
Subject: Re: [PATCH] i2c: cp2615: check the return value of kzalloc()
To:     <williamsukatube@163.com>
CC:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        William Dean <williamsukatube@gmail.com>,
        Hacash Robot <hacashRobot@santino.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Originating-IP: [209.85.210.173]
X-ClientProxiedBy: Exchange2016-1.sch.bme.hu (152.66.208.194) To
 Exchange2016-1.sch.bme.hu (152.66.208.194)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Dear William,
thank you for your insight. However, you will find that the first
access of the variable `msg` is a call to `cp2615_init_iop_msg()`
which, on line 85, checks for the variable being NULL, and if so,
returns -EINVAL, which in turn causes `cp2615_check_iop()` to return
too. In fact, the same mechanism allows for `cp2615_i2c_send()` to
also not have to worry about `kzalloc()` returning NULL.
Though you could argue that in these cases, `cp2615_init_iop_msg()`
should return -ENOMEM instead of -EINVAL, and you would be correct.
Cheers,
Bence


<williamsukatube@163.com> ezt írta (időpont: 2022. júl. 23., Szo, 6:33):
>
> From: William Dean <williamsukatube@gmail.com>
>
> kzalloc() is a memory allocation function which can return NULL when
> some internal memory errors happen. So it is better to check the
> return value of it to prevent potential wrong memory access or
> memory leak.
>
> Fixes: 4a7695429eade ("i2c: cp2615: add i2c driver for Silicon Labs' CP2615 Digital Audio Bridge")
> Reported-by: Hacash Robot <hacashRobot@santino.com>
> Signed-off-by: William Dean <williamsukatube@gmail.com>
> ---
>  drivers/i2c/busses/i2c-cp2615.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-cp2615.c b/drivers/i2c/busses/i2c-cp2615.c
> index 3ded28632e4c..7c9403346615 100644
> --- a/drivers/i2c/busses/i2c-cp2615.c
> +++ b/drivers/i2c/busses/i2c-cp2615.c
> @@ -171,11 +171,17 @@ cp2615_i2c_recv(struct usb_interface *usbif, unsigned char tag, void *buf)
>  /* Checks if the IOP is functional by querying the part's ID */
>  static int cp2615_check_iop(struct usb_interface *usbif)
>  {
> -       struct cp2615_iop_msg *msg = kzalloc(sizeof(*msg), GFP_KERNEL);
> -       struct cp2615_iop_accessory_info *info = (struct cp2615_iop_accessory_info *)&msg->data;
> +       struct cp2615_iop_msg *msg;
> +       struct cp2615_iop_accessory_info *info;
>         struct usb_device *usbdev = interface_to_usbdev(usbif);
> -       int res = cp2615_init_iop_msg(msg, iop_GetAccessoryInfo, NULL, 0);
> +       int res;
> +
> +       msg = kzalloc(sizeof(*msg), GFP_KERNEL);
> +       if (!msg)
> +               return -ENOMEM;
>
> +       info = (struct cp2615_iop_accessory_info *)&msg->data;
> +       res = cp2615_init_iop_msg(msg, iop_GetAccessoryInfo, NULL, 0);
>         if (res)
>                 goto out;
>
> --
> 2.25.1
>
>
