Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3337537BEE7
	for <lists+linux-i2c@lfdr.de>; Wed, 12 May 2021 15:53:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230435AbhELNyJ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Wed, 12 May 2021 09:54:09 -0400
Received: from mail.sch.bme.hu ([152.66.249.140]:40356 "EHLO mail.sch.bme.hu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230182AbhELNyI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 12 May 2021 09:54:08 -0400
Received: from mail-lj1-f175.google.com (209.85.208.175) by
 Exchange2016-1.sch.bme.hu (152.66.249.140) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2176.14; Wed, 12 May 2021 15:52:57 +0200
Received: by mail-lj1-f175.google.com with SMTP id f12so17106964ljp.2;
        Wed, 12 May 2021 06:52:57 -0700 (PDT)
X-Gm-Message-State: AOAM533HbYrMtgT0gWJVc4tsWfXX8BkyRGGBwmpKt6wSNZwJ5PM4VzO+
        e/zDUTXTWKClmvSTnoWF2knq288HOD2gmHxaXLs=
X-Google-Smtp-Source: ABdhPJzeRiNPcZCMpb90Z/3PTiS9IBrL68IEGlqU8RLLZLNfHVH8nKZ1FGOiWvGo9MW8NWf9VYmcZImjxMk/1KJoVds=
X-Received: by 2002:a2e:97c3:: with SMTP id m3mr29562424ljj.231.1620827576825;
 Wed, 12 May 2021 06:52:56 -0700 (PDT)
MIME-Version: 1.0
References: <YJuosd6rew91vlyX@mwanda> <CACCVKEEQViw1FaSA4dZoy3KbZydxDyxdx+uf=zQW1Q=R5kRAcg@mail.gmail.com>
 <20210512131034.GW1955@kadam>
In-Reply-To: <20210512131034.GW1955@kadam>
From:   =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <bence98@sch.bme.hu>
Date:   Wed, 12 May 2021 15:52:45 +0200
X-Gmail-Original-Message-ID: <CACCVKEGb6yKxAUZry7CsXovihdUDMxi4zNNbAL_jtoEWUD3V+A@mail.gmail.com>
Message-ID: <CACCVKEGb6yKxAUZry7CsXovihdUDMxi4zNNbAL_jtoEWUD3V+A@mail.gmail.com>
Subject: Re: [PATCH] i2c: cp2615: check for allocation failure in cp2615_i2c_recv()
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     Wolfram Sang <wsa@kernel.org>, <linux-i2c@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Originating-IP: [209.85.208.175]
X-ClientProxiedBy: Exchange2016-1.sch.bme.hu (152.66.249.140) To
 Exchange2016-1.sch.bme.hu (152.66.249.140)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

All right, if you want to do that, fine. I did it this way, because it
took 1 less `goto`s... But your approach is equally valid.

But, to keep it consistent, if you change it one place, change it
everywhere else.

Regards,
Bence

Dan Carpenter <dan.carpenter@oracle.com> ezt írta (időpont: 2021. máj.
12., Sze, 15:11):
>
> On Wed, May 12, 2021 at 12:54:47PM +0200, Bence Csókás wrote:
> > Dan Carpenter <dan.carpenter@oracle.com> ezt írta (időpont: 2021. máj.
> > 12., Sze, 12:07):
> > >
> > > We need to add a check for if the kzalloc() fails.
> >
> > That is correct, I missed that :/
> >
> > >
> > > Fixes: 4a7695429ead ("i2c: cp2615: add i2c driver for Silicon Labs' CP2615 Digital Audio Bridge")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > ---
> > >  drivers/i2c/busses/i2c-cp2615.c | 14 ++++++++++----
> > >  1 file changed, 10 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/i2c/busses/i2c-cp2615.c b/drivers/i2c/busses/i2c-cp2615.c
> > > index 78cfecd1ea76..3ded28632e4c 100644
> > > --- a/drivers/i2c/busses/i2c-cp2615.c
> > > +++ b/drivers/i2c/busses/i2c-cp2615.c
> > > @@ -138,17 +138,23 @@ cp2615_i2c_send(struct usb_interface *usbif, struct cp2615_i2c_transfer *i2c_w)
> > >  static int
> > >  cp2615_i2c_recv(struct usb_interface *usbif, unsigned char tag, void *buf)
> > >  {
> > > -       struct cp2615_iop_msg *msg = kzalloc(sizeof(*msg), GFP_KERNEL);
> > > -       struct cp2615_i2c_transfer_result *i2c_r = (struct cp2615_i2c_transfer_result *)&msg->data;
> >
> > These two lines could stay as-is, since the invalid i2c_r will never be used.
> >
>
> Yeah, I know but people shouldn't put functions which can fail inside
> the declaration block.  And I also know that doing:
>
>         struct cp2615_i2c_transfer_result *i2c_r = (struct cp2615_i2c_transfer_result *)&msg->data;
>
> is fine even when "msg" is NULL.  But don't do that, because it is ugly.
>
> > >         struct usb_device *usbdev = interface_to_usbdev(usbif);
> > > -       int res = usb_bulk_msg(usbdev, usb_rcvbulkpipe(usbdev, IOP_EP_IN),
> > > -                              msg, sizeof(struct cp2615_iop_msg), NULL, 0);
> > > +       struct cp2615_iop_msg *msg;
> > > +       struct cp2615_i2c_transfer_result *i2c_r;
> > > +       int res;
> > > +
> > > +       msg = kzalloc(sizeof(*msg), GFP_KERNEL);
> > > +       if (!msg)
> > > +               return -ENOMEM;
> >
> > You will want to also make `cp2615_init_iop_msg()` return -ENOMEM
> > instead of -EINVAL, for consistency's sake.
> >
>
> I view that as unrelated and I'm sorry but this error handling code is
> not really best practices...  I don't have time to fix it up.  :/
>
> drivers/i2c/busses/i2c-cp2615.c
>    124  static int
>    125  cp2615_i2c_send(struct usb_interface *usbif, struct cp2615_i2c_transfer *i2c_w)
>    126  {
>    127          struct cp2615_iop_msg *msg = kzalloc(sizeof(*msg), GFP_KERNEL);
>
> Don't put functions which can fail inside the declaration block.
> Although, it is relatively uncommon to put allocations inside the
> declaration block these sorts of allocations are over represented when
> it comes to memory leaks and other static analysis bugs.
>
>    128          struct usb_device *usbdev = interface_to_usbdev(usbif);
>    129          int res = cp2615_init_i2c_msg(msg, i2c_w);
>
> Handle failures immediately.  Try not to mix the error paths and the
> success paths.  After a function call, then you're going to have to deal
> with both failure and success path, but the failure path is just
> "clean up and return an error code" and the success path is hopefully
> going to continue for days or months.  So get the shorter failure path
> out of the way first, then continue with the success path.
>
>    130
>    131          if (!res)
>
> Always do error handling, don't do success handling.
>
>    132                  res = usb_bulk_msg(usbdev, usb_sndbulkpipe(usbdev, IOP_EP_OUT),
>    133                                     msg, ntohs(msg->length), NULL, 0);
>
> The success path should be indented one tab and the error handling
> should be indented two tabs.
>
>    134          kfree(msg);
>    135          return res;
>    136  }
>
> The function should look like this.
>
> static int
> cp2615_i2c_send(struct usb_interface *usbif, struct cp2615_i2c_transfer *i2c_w)
> {
>         struct usb_device *usbdev = interface_to_usbdev(usbif);
>         struct cp2615_iop_msg *msg;
>         int res;
>
>         msg = kzalloc(sizeof(*msg), GFP_KERNEL);
>         if (!msg)
>                 return -ENOMEM;
>
>         res = cp2615_init_i2c_msg(msg, i2c_w);
>         if (res)
>                 goto free;
>
>         res = usb_bulk_msg(usbdev, usb_sndbulkpipe(usbdev, IOP_EP_OUT),
>                            msg, ntohs(msg->length), NULL, 0);
> free:
>         kfree(msg);
>         return res;
> }
>
> regards,
> dan carpenter
>
