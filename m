Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D81637BB56
	for <lists+linux-i2c@lfdr.de>; Wed, 12 May 2021 12:55:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230139AbhELK4K convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Wed, 12 May 2021 06:56:10 -0400
Received: from mail.sch.bme.hu ([152.66.249.140]:18200 "EHLO mail.sch.bme.hu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230196AbhELK4K (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 12 May 2021 06:56:10 -0400
Received: from mail-lj1-f178.google.com (209.85.208.178) by
 Exchange2016-1.sch.bme.hu (152.66.249.140) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2176.14; Wed, 12 May 2021 12:54:59 +0200
Received: by mail-lj1-f178.google.com with SMTP id f12so16432210ljp.2;
        Wed, 12 May 2021 03:54:59 -0700 (PDT)
X-Gm-Message-State: AOAM5324pQ9Uc3zzquDVayvN5lIB/KCQN0SB0nJt8X69zjtYXK6S6/8C
        coiXyGuFv+eEEvUtZf96IaHE8RNisksv4y7NIW8=
X-Google-Smtp-Source: ABdhPJxCtb0TD+42FcE0cZYUuEqaxROPclfBlGeGdTWRDSJ/jk5GxsPmbIb0WJXK3TTrbOhf4r2Ah6Km4/TikNaPo0U=
X-Received: by 2002:a2e:8e21:: with SMTP id r1mr28462101ljk.166.1620816898710;
 Wed, 12 May 2021 03:54:58 -0700 (PDT)
MIME-Version: 1.0
References: <YJuosd6rew91vlyX@mwanda>
In-Reply-To: <YJuosd6rew91vlyX@mwanda>
From:   =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <bence98@sch.bme.hu>
Date:   Wed, 12 May 2021 12:54:47 +0200
X-Gmail-Original-Message-ID: <CACCVKEEQViw1FaSA4dZoy3KbZydxDyxdx+uf=zQW1Q=R5kRAcg@mail.gmail.com>
Message-ID: <CACCVKEEQViw1FaSA4dZoy3KbZydxDyxdx+uf=zQW1Q=R5kRAcg@mail.gmail.com>
Subject: Re: [PATCH] i2c: cp2615: check for allocation failure in cp2615_i2c_recv()
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     Wolfram Sang <wsa@kernel.org>, <linux-i2c@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Originating-IP: [209.85.208.178]
X-ClientProxiedBy: Exchange2016-1.sch.bme.hu (152.66.249.140) To
 Exchange2016-1.sch.bme.hu (152.66.249.140)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> ezt írta (időpont: 2021. máj.
12., Sze, 12:07):
>
> We need to add a check for if the kzalloc() fails.

That is correct, I missed that :/

>
> Fixes: 4a7695429ead ("i2c: cp2615: add i2c driver for Silicon Labs' CP2615 Digital Audio Bridge")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/i2c/busses/i2c-cp2615.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-cp2615.c b/drivers/i2c/busses/i2c-cp2615.c
> index 78cfecd1ea76..3ded28632e4c 100644
> --- a/drivers/i2c/busses/i2c-cp2615.c
> +++ b/drivers/i2c/busses/i2c-cp2615.c
> @@ -138,17 +138,23 @@ cp2615_i2c_send(struct usb_interface *usbif, struct cp2615_i2c_transfer *i2c_w)
>  static int
>  cp2615_i2c_recv(struct usb_interface *usbif, unsigned char tag, void *buf)
>  {
> -       struct cp2615_iop_msg *msg = kzalloc(sizeof(*msg), GFP_KERNEL);
> -       struct cp2615_i2c_transfer_result *i2c_r = (struct cp2615_i2c_transfer_result *)&msg->data;

These two lines could stay as-is, since the invalid i2c_r will never be used.

>         struct usb_device *usbdev = interface_to_usbdev(usbif);
> -       int res = usb_bulk_msg(usbdev, usb_rcvbulkpipe(usbdev, IOP_EP_IN),
> -                              msg, sizeof(struct cp2615_iop_msg), NULL, 0);
> +       struct cp2615_iop_msg *msg;
> +       struct cp2615_i2c_transfer_result *i2c_r;
> +       int res;
> +
> +       msg = kzalloc(sizeof(*msg), GFP_KERNEL);
> +       if (!msg)
> +               return -ENOMEM;

You will want to also make `cp2615_init_iop_msg()` return -ENOMEM
instead of -EINVAL, for consistency's sake.

>
> +       res = usb_bulk_msg(usbdev, usb_rcvbulkpipe(usbdev, IOP_EP_IN), msg,
> +                          sizeof(struct cp2615_iop_msg), NULL, 0);
>         if (res < 0) {
>                 kfree(msg);
>                 return res;
>         }
>
> +       i2c_r = (struct cp2615_i2c_transfer_result *)&msg->data;
>         if (msg->msg != htons(iop_I2cTransferResult) || i2c_r->tag != tag) {
>                 kfree(msg);
>                 return -EIO;
> --
> 2.30.2
>

Otherwise, the patch looks good, I shall sign off on the next version
