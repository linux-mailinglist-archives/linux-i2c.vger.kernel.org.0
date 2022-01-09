Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BA61488BF6
	for <lists+linux-i2c@lfdr.de>; Sun,  9 Jan 2022 20:20:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236614AbiAITUO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 9 Jan 2022 14:20:14 -0500
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:58058 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236466AbiAITUO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 9 Jan 2022 14:20:14 -0500
IronPort-SDR: hDTJqrzfglK+zEAByceUvgDPK7IiswBEtRQk3V/AJf96BLVF7fvimGlpNji5tXxdR8hW5S57Mt
 xqSMK2K0KR96IxNIaVFFJRUrwtQvcXAwU6rophxqXzY6UZt3bjJsiIU29zKkM8hDetsuUnVYzG
 MSfgfkhAfs9sF9eGGNZ3cwyLnpc2+lOJA1owySO+0mpgkFPrK5guElg1jGTjDVV7iNRWdakTuN
 xchuoB0EQrko20ajR3qtcj1lhrF9xz3Gvy7PX22Q0CdBh9BHLdrQRj47elDrhAzpccc9LMBumA
 PSuWVWUCy4Phph30bU98j5Ki
X-IronPort-AV: E=Sophos;i="5.88,274,1635235200"; 
   d="scan'208";a="70542448"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa2.mentor.iphmx.com with ESMTP; 09 Jan 2022 11:20:13 -0800
IronPort-SDR: HaHO8aJ1UHMYc39MNK4ycmWbuadsLMSCkyg/q04bL6ZQKChwz3qh6LyJCxM9/OL05iFBA0XlX2
 wUH+JyxNN+fzCBjG4uqXA1e8mK/B1ecKnUuJKE+iD+oGJ+VW3fu6TfOIQA8D2fvoft+Sax75Pq
 RYrxxtHuxIOePbU2YRaDhvNbXkKw8IJ35K5KnWhJoqXKTUcfD4wtlWv5Qyjprxtsx6QqkR0w5B
 JK7oZB8xhylYPpU1i5XOC/xTuuV7KGunVzlechvaYH1+AHBJ0pqDgZpeM0g6X2olSg9MQQAagv
 c+M=
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
Date:   Sun, 9 Jan 2022 22:20:01 +0300
Organization: Mentor Graphics Corporation
Message-ID: <000001d8058d$eb130710$c1391530$@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHXue1eCQdNXjaiK021FrevUeTu7qvGRbCQgEMVGxCAUkv+EA==
Content-Language: en-us
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-09.mgc.mentorg.com (139.181.222.9) To
 svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Geert, Wolfram,

Could you please let me know your opinion on version 2 of this patch,
that addressed your earlier review comments?

https://lore.kernel.org/all/20211006182314.10585-1-andrew_gabbasov@mentor.com/

Does it still need any further modifications or are you going to promote it further upstream?

Thanks.

Best regards,
Andrew

> -----Original Message-----
> From: Andrew Gabbasov <andrew_gabbasov@mentor.com>
> Sent: Thursday, November 18, 2021 1:35 PM
> To: 'Geert Uytterhoeven' <geert@linux-m68k.org>
> Cc: 'Linux-Renesas' <linux-renesas-soc@vger.kernel.org>; 'Linux I2C' <linux-i2c@vger.kernel.org>; 'Linux Kernel
> Mailing List' <linux-kernel@vger.kernel.org>; 'Wolfram Sang' <wsa+renesas@sang-engineering.com>; Surachari,
> Bhuvanesh <Bhuvanesh_Surachari@mentor.com>
> Subject: RE: [PATCH] i2c: rcar: add SMBus block read support
> 
> Hello Geert, Wolfram,
> 
> Do you have any feedback on version 2 of this patch, that was submitted
> after your review comments below?
> 
> https://lore.kernel.org/all/20211006182314.10585-1-andrew_gabbasov@mentor.com/
> 
> Thanks!
> 
> Best regards,
> Andrew
> 
> > -----Original Message-----
> > From: Andrew Gabbasov <andrew_gabbasov@mentor.com>
> > Sent: Wednesday, October 06, 2021 9:12 PM
> > To: 'Geert Uytterhoeven' <geert@linux-m68k.org>
> > Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>; Linux I2C <linux-i2c@vger.kernel.org>; Linux Kernel
> > Mailing List <linux-kernel@vger.kernel.org>; Wolfram Sang <wsa+renesas@sang-engineering.com>; Surachari,
> > Bhuvanesh <Bhuvanesh_Surachari@mentor.com>
> > Subject: RE: [PATCH] i2c: rcar: add SMBus block read support
> >
> > Hi Geert,
> >
> > Thank you for your review!
> >
> > > -----Original Message-----
> > > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > > Sent: Tuesday, October 05, 2021 4:32 PM
> > > To: Gabbasov, Andrew <Andrew_Gabbasov@mentor.com>
> > > Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>; Linux I2C <linux-i2c@vger.kernel.org>; Linux Kernel
> > > Mailing List <linux-kernel@vger.kernel.org>; Wolfram Sang <wsa+renesas@sang-engineering.com>; Surachari,
> > > Bhuvanesh <Bhuvanesh_Surachari@mentor.com>
> > > Subject: Re: [PATCH] i2c: rcar: add SMBus block read support
> > >
> > > Hi Andrew,
> > >
> > > On Wed, Sep 22, 2021 at 6:14 PM Andrew Gabbasov
> > > <andrew_gabbasov@mentor.com> wrote:
> > > > The smbus block read is not currently supported for rcar i2c devices.
> > > > This patchset adds the support to rcar i2c bus so that blocks of data
> > > > can be read using SMbus block reads.(using i2c_smbus_read_block_data()
> > > > function from the i2c-core-smbus.c).
> > > >
> > > > Inspired by commit 8e8782c71595 ("i2c: imx: add SMBus block read support")
> > > >
> > > > This patch (adapted) was tested with v4.14, but due to lack of real
> > > > hardware with SMBus block read operations support, using "simulation",
> > > > that is manual analysis of data, read from plain I2C devices with
> > > > SMBus block read request.
> > > >
> > > > Signed-off-by: Bhuvanesh Surachari <bhuvanesh_surachari@mentor.com>
> > > > Signed-off-by: Andrew Gabbasov <andrew_gabbasov@mentor.com>
> > >
> > > Thanks for your patch!
> > >
> > > > --- a/drivers/i2c/busses/i2c-rcar.c
> > > > +++ b/drivers/i2c/busses/i2c-rcar.c
> > > > @@ -429,9 +431,16 @@ static bool rcar_i2c_dma(struct rcar_i2c_priv *priv)
> > > >                 /*
> > > >                  * The last two bytes needs to be fetched using PIO in
> > > >                  * order for the STOP phase to work.
> > > > +                *
> > > > +                * For SMBus block read the first byte was received using PIO.
> > >
> > > So it might be easier to read, and more maintainable, to keep the
> > > old assignments:
> > >
> > >     buf = priv->msg->buf;
> > >     len = priv->msg->len - 2;
> > >
> > > and adjust them for SMBus afterwards:
> > >
> > >     if (block_data) {
> > >             /* For SMBus block read the first byte was received using PIO */
> > >             buf++;
> > >             len--;
> > >     }
> > >
> > > ?
> > >
> > > >                  */
> > > > -               buf = priv->msg->buf;
> > > > -               len = priv->msg->len - 2;
> > > > +               if (block_data) {
> > > > +                       buf = priv->msg->buf + 1;
> > > > +                       len = priv->msg->len - 3;
> > > > +               } else {
> > > > +                       buf = priv->msg->buf;
> > > > +                       len = priv->msg->len - 2;
> > > > +               }
> > > >         } else {
> > > >                 /*
> > > >                  * First byte in message was sent using PIO.
> > >
> > > And below we have another case handling buf and len :-(
> > >
> > > So perhaps:
> > >
> > >     buf = priv->msg->buf;
> > >     len = priv->msg->len;
> > >
> > >     if (read) {
> > >             /*
> > >              * The last two bytes needs to be fetched using PIO in
> > >              * order for the STOP phase to work.
> > >              */
> > >             len -= 2;
> > >     }
> > >     if (!read || block_data) {
> > >             /* First byte in message was sent using PIO *
> > >             buf++;
> > >             len--;
> > >     }
> >
> > Probably I was trying to minimize the changes ;-)
> >
> > However, I agree with you that the whole code fragment can be simplified
> > and your variant indeed looks more clean and understandable.
> > Thank you for your suggestion, I'll submit version 2 of the patch
> > with this fragment changed.
> >
> > Thanks!
> >
> > Best regards,
> > Andrew

