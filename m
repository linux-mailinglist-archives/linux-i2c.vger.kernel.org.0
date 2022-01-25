Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C708349ACA6
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jan 2022 07:49:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358539AbiAYGtY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jan 2022 01:49:24 -0500
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:2460 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358497AbiAYGpy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jan 2022 01:45:54 -0500
IronPort-SDR: RavLzcctKxeWmPfeSVQq0/h5zi++CKjs+wR40FTuoPI91FkRRmWfCwlNsdt8mCTWoAHhJiWhEz
 1A/osGKKPX+xgTj+Kv510RU6YsW/At6kse/y2ILH/H9Hv7LlqvAtgpknUiGE87IiVC7Tx+EjWa
 d9E0tF9H4EHlp7Rje0hmr2lmH5unf2U1Df+jiMy/brZbRr07W2zt9rk3+VpoXjDqDDQ0mnbPSu
 frq92heBJUYWnA+G9MPKziRYatr2IZjvhyPmdwMSeLJdEyGlvtrfYgJY2oDGsMPBFMd5rlaO9i
 i1zh22CU1pwxg1N28SOtNu4c
X-IronPort-AV: E=Sophos;i="5.88,314,1635235200"; 
   d="scan'208";a="71173504"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 24 Jan 2022 22:45:47 -0800
IronPort-SDR: twu5CcYaTiNsnA+NYdGL2X0/4vzJI8f01adpyAyQxPSMZaYlztDK4Dm2bMVvPq1mcRTS77pWG4
 OHvUqjtl9v+sisYWUersXHILqmetzMJt9WFll7qylz3MrFZbQXIu4EExt1w4exHXce0dZ6qzHa
 6BNOnUbDgvuh0Xf74tQwHcPc3H8fSQNaCpDTrjSfE8Klk3nTke+COZ5ymW01Mj/GXu41i93ZSn
 9Wl2Q5xurIdHVeyZxhv6B9B4fIOHhqub1TvSZ9BV+jrbu14nvIRKwhH7lOLfTWOWRYm2J2iuso
 JFg=
From:   Andrew Gabbasov <andrew_gabbasov@mentor.com>
To:     'Geert Uytterhoeven' <geert@linux-m68k.org>
CC:     'Linux-Renesas' <linux-renesas-soc@vger.kernel.org>,
        'Linux I2C' <linux-i2c@vger.kernel.org>,
        'Linux Kernel Mailing List' <linux-kernel@vger.kernel.org>,
        'Wolfram Sang' <wsa+renesas@sang-engineering.com>,
        "Surachari, Bhuvanesh" <Bhuvanesh_Surachari@mentor.com>
References: <20210922160649.28449-1-andrew_gabbasov@mentor.com> <CAMuHMdVVDpBAQR+H1TAnpf65aVbAL0Mm0km7Z9L7+1JuF6n1gQ@mail.gmail.com>   
In-Reply-To: 
Subject: RE: [PATCH] i2c: rcar: add SMBus block read support
Date:   Tue, 25 Jan 2022 09:45:34 +0300
Organization: Mentor Graphics Corporation
Message-ID: <000001d811b7$2bd58310$83808930$@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHXue1eCQdNXjaiK021FrevUeTu7qvGRbCQgEMVGxCAUkv+EIAYU0UA
Content-Language: en-us
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-10.mgc.mentorg.com (139.181.222.10) To
 svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Geert, Wolfram,

Any feedback on the patch, please?

Thanks.

Best regards,
Andrew

> -----Original Message-----
> From: Andrew Gabbasov <andrew_gabbasov@mentor.com>
> Sent: Sunday, January 09, 2022 10:20 PM
> To: 'Geert Uytterhoeven' <geert@linux-m68k.org>
> Cc: 'Linux-Renesas' <linux-renesas-soc@vger.kernel.org>; 'Linux I2C' <linux-i2c@vger.kernel.org>; 'Linux Kernel
> Mailing List' <linux-kernel@vger.kernel.org>; 'Wolfram Sang' <wsa+renesas@sang-engineering.com>; Surachari,
> Bhuvanesh <Bhuvanesh_Surachari@mentor.com>
> Subject: RE: [PATCH] i2c: rcar: add SMBus block read support
> 
> Hello Geert, Wolfram,
> 
> Could you please let me know your opinion on version 2 of this patch,
> that addressed your earlier review comments?
> 
> https://lore.kernel.org/all/20211006182314.10585-1-andrew_gabbasov@mentor.com/
> 
> Does it still need any further modifications or are you going to promote it further upstream?
> 
> Thanks.
> 
> Best regards,
> Andrew
> 
> > -----Original Message-----
> > From: Andrew Gabbasov <andrew_gabbasov@mentor.com>
> > Sent: Thursday, November 18, 2021 1:35 PM
> > To: 'Geert Uytterhoeven' <geert@linux-m68k.org>
> > Cc: 'Linux-Renesas' <linux-renesas-soc@vger.kernel.org>; 'Linux I2C' <linux-i2c@vger.kernel.org>; 'Linux Kernel
> > Mailing List' <linux-kernel@vger.kernel.org>; 'Wolfram Sang' <wsa+renesas@sang-engineering.com>; Surachari,
> > Bhuvanesh <Bhuvanesh_Surachari@mentor.com>
> > Subject: RE: [PATCH] i2c: rcar: add SMBus block read support
> >
> > Hello Geert, Wolfram,
> >
> > Do you have any feedback on version 2 of this patch, that was submitted
> > after your review comments below?
> >
> > https://lore.kernel.org/all/20211006182314.10585-1-andrew_gabbasov@mentor.com/
> >
> > Thanks!
> >
> > Best regards,
> > Andrew
> >
> > > -----Original Message-----
> > > From: Andrew Gabbasov <andrew_gabbasov@mentor.com>
> > > Sent: Wednesday, October 06, 2021 9:12 PM
> > > To: 'Geert Uytterhoeven' <geert@linux-m68k.org>
> > > Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>; Linux I2C <linux-i2c@vger.kernel.org>; Linux Kernel
> > > Mailing List <linux-kernel@vger.kernel.org>; Wolfram Sang <wsa+renesas@sang-engineering.com>; Surachari,
> > > Bhuvanesh <Bhuvanesh_Surachari@mentor.com>
> > > Subject: RE: [PATCH] i2c: rcar: add SMBus block read support
> > >
> > > Hi Geert,
> > >
> > > Thank you for your review!
> > >
> > > > -----Original Message-----
> > > > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > > > Sent: Tuesday, October 05, 2021 4:32 PM
> > > > To: Gabbasov, Andrew <Andrew_Gabbasov@mentor.com>
> > > > Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>; Linux I2C <linux-i2c@vger.kernel.org>; Linux Kernel
> > > > Mailing List <linux-kernel@vger.kernel.org>; Wolfram Sang <wsa+renesas@sang-engineering.com>; Surachari,
> > > > Bhuvanesh <Bhuvanesh_Surachari@mentor.com>
> > > > Subject: Re: [PATCH] i2c: rcar: add SMBus block read support
> > > >
> > > > Hi Andrew,
> > > >
> > > > On Wed, Sep 22, 2021 at 6:14 PM Andrew Gabbasov
> > > > <andrew_gabbasov@mentor.com> wrote:
> > > > > The smbus block read is not currently supported for rcar i2c devices.
> > > > > This patchset adds the support to rcar i2c bus so that blocks of data
> > > > > can be read using SMbus block reads.(using i2c_smbus_read_block_data()
> > > > > function from the i2c-core-smbus.c).
> > > > >
> > > > > Inspired by commit 8e8782c71595 ("i2c: imx: add SMBus block read support")
> > > > >
> > > > > This patch (adapted) was tested with v4.14, but due to lack of real
> > > > > hardware with SMBus block read operations support, using "simulation",
> > > > > that is manual analysis of data, read from plain I2C devices with
> > > > > SMBus block read request.
> > > > >
> > > > > Signed-off-by: Bhuvanesh Surachari <bhuvanesh_surachari@mentor.com>
> > > > > Signed-off-by: Andrew Gabbasov <andrew_gabbasov@mentor.com>
> > > >
> > > > Thanks for your patch!
> > > >
> > > > > --- a/drivers/i2c/busses/i2c-rcar.c
> > > > > +++ b/drivers/i2c/busses/i2c-rcar.c
> > > > > @@ -429,9 +431,16 @@ static bool rcar_i2c_dma(struct rcar_i2c_priv *priv)
> > > > >                 /*
> > > > >                  * The last two bytes needs to be fetched using PIO in
> > > > >                  * order for the STOP phase to work.
> > > > > +                *
> > > > > +                * For SMBus block read the first byte was received using PIO.
> > > >
> > > > So it might be easier to read, and more maintainable, to keep the
> > > > old assignments:
> > > >
> > > >     buf = priv->msg->buf;
> > > >     len = priv->msg->len - 2;
> > > >
> > > > and adjust them for SMBus afterwards:
> > > >
> > > >     if (block_data) {
> > > >             /* For SMBus block read the first byte was received using PIO */
> > > >             buf++;
> > > >             len--;
> > > >     }
> > > >
> > > > ?
> > > >
> > > > >                  */
> > > > > -               buf = priv->msg->buf;
> > > > > -               len = priv->msg->len - 2;
> > > > > +               if (block_data) {
> > > > > +                       buf = priv->msg->buf + 1;
> > > > > +                       len = priv->msg->len - 3;
> > > > > +               } else {
> > > > > +                       buf = priv->msg->buf;
> > > > > +                       len = priv->msg->len - 2;
> > > > > +               }
> > > > >         } else {
> > > > >                 /*
> > > > >                  * First byte in message was sent using PIO.
> > > >
> > > > And below we have another case handling buf and len :-(
> > > >
> > > > So perhaps:
> > > >
> > > >     buf = priv->msg->buf;
> > > >     len = priv->msg->len;
> > > >
> > > >     if (read) {
> > > >             /*
> > > >              * The last two bytes needs to be fetched using PIO in
> > > >              * order for the STOP phase to work.
> > > >              */
> > > >             len -= 2;
> > > >     }
> > > >     if (!read || block_data) {
> > > >             /* First byte in message was sent using PIO *
> > > >             buf++;
> > > >             len--;
> > > >     }
> > >
> > > Probably I was trying to minimize the changes ;-)
> > >
> > > However, I agree with you that the whole code fragment can be simplified
> > > and your variant indeed looks more clean and understandable.
> > > Thank you for your suggestion, I'll submit version 2 of the patch
> > > with this fragment changed.
> > >
> > > Thanks!
> > >
> > > Best regards,
> > > Andrew

