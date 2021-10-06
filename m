Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 931384245C4
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Oct 2021 20:12:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232137AbhJFSN6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Oct 2021 14:13:58 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:45087 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232060AbhJFSN5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Oct 2021 14:13:57 -0400
IronPort-SDR: OSp/viys+sJE0Omf6cdzmsxDTqOET/ylT8lgLh20G9u+TePfsymFCD5W9qYy3Z7jGM9n954GpR
 M2OnkUDiJbHnT7aMroXIUn5dnJz8vdNLhAuEmQlK+UWGz+Kcrml5c71cQwJF9znBABY3GLOqSW
 ugIDD/FGrHMI/Jim7pX0nZcW7KEPjVOVz7mY/kDoLwzU5uzl9tYfBpxDSH7yp+oO046s4/7AqP
 rxVgBk2sAlefTfx9WX1WfH9G43Rmk9vIR42mjyXF0ysdPWYofVqBqQs5RDPeHev5tJyR/Lxdx4
 7rz/6vKnZE4DPQ4cVQHKRgMO
X-IronPort-AV: E=Sophos;i="5.85,352,1624348800"; 
   d="scan'208";a="69304206"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 06 Oct 2021 10:12:05 -0800
IronPort-SDR: bOJ0//032ffDQdJa+MvKKqEi4kO/mOVjGeIG8kgg3dKoynHfGsQwH2rZLhm/44GcUfifRT+uPm
 B8H7ZDQebSKY48fad37Xc+m4B9bhpuu0s8/as9mfXymqQKv8haGx6QIOi21v98H/4q+sFOViN6
 95TRxcUZZ082FqJB0MSuQvRa1JdOkifE+KVnwUqNj38HbqA3YkX4N3X8JWvc+qJc4Ugd7ANAOD
 qKfubhIKXkMJUAdEeUfhE1bFeHTbxhRaHCqDIVjSo6o7JkhnlpWdUnXLPJEvXWzmckvlnxe77e
 0OY=
From:   Andrew Gabbasov <andrew_gabbasov@mentor.com>
To:     'Geert Uytterhoeven' <geert@linux-m68k.org>
CC:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "Surachari, Bhuvanesh" <Bhuvanesh_Surachari@mentor.com>
References: <20210922160649.28449-1-andrew_gabbasov@mentor.com> <CAMuHMdVVDpBAQR+H1TAnpf65aVbAL0Mm0km7Z9L7+1JuF6n1gQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVVDpBAQR+H1TAnpf65aVbAL0Mm0km7Z9L7+1JuF6n1gQ@mail.gmail.com>
Subject: RE: [PATCH] i2c: rcar: add SMBus block read support
Date:   Wed, 6 Oct 2021 21:11:51 +0300
Organization: Mentor Graphics Corporation
Message-ID: <000001d7badd$a8512d30$f8f38790$@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHXue1eCQdNXjaiK021FrevUeTu7qvGRbCQ
Content-Language: en-us
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-09.mgc.mentorg.com (139.181.222.9) To
 svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Geert,

Thank you for your review!

> -----Original Message-----
> From: Geert Uytterhoeven <geert@linux-m68k.org>
> Sent: Tuesday, October 05, 2021 4:32 PM
> To: Gabbasov, Andrew <Andrew_Gabbasov@mentor.com>
> Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>; Linux I2C <linux-i2c@vger.kernel.org>; Linux Kernel
> Mailing List <linux-kernel@vger.kernel.org>; Wolfram Sang <wsa+renesas@sang-engineering.com>; Surachari,
> Bhuvanesh <Bhuvanesh_Surachari@mentor.com>
> Subject: Re: [PATCH] i2c: rcar: add SMBus block read support
> 
> Hi Andrew,
> 
> On Wed, Sep 22, 2021 at 6:14 PM Andrew Gabbasov
> <andrew_gabbasov@mentor.com> wrote:
> > The smbus block read is not currently supported for rcar i2c devices.
> > This patchset adds the support to rcar i2c bus so that blocks of data
> > can be read using SMbus block reads.(using i2c_smbus_read_block_data()
> > function from the i2c-core-smbus.c).
> >
> > Inspired by commit 8e8782c71595 ("i2c: imx: add SMBus block read support")
> >
> > This patch (adapted) was tested with v4.14, but due to lack of real
> > hardware with SMBus block read operations support, using "simulation",
> > that is manual analysis of data, read from plain I2C devices with
> > SMBus block read request.
> >
> > Signed-off-by: Bhuvanesh Surachari <bhuvanesh_surachari@mentor.com>
> > Signed-off-by: Andrew Gabbasov <andrew_gabbasov@mentor.com>
> 
> Thanks for your patch!
> 
> > --- a/drivers/i2c/busses/i2c-rcar.c
> > +++ b/drivers/i2c/busses/i2c-rcar.c
> > @@ -429,9 +431,16 @@ static bool rcar_i2c_dma(struct rcar_i2c_priv *priv)
> >                 /*
> >                  * The last two bytes needs to be fetched using PIO in
> >                  * order for the STOP phase to work.
> > +                *
> > +                * For SMBus block read the first byte was received using PIO.
> 
> So it might be easier to read, and more maintainable, to keep the
> old assignments:
> 
>     buf = priv->msg->buf;
>     len = priv->msg->len - 2;
> 
> and adjust them for SMBus afterwards:
> 
>     if (block_data) {
>             /* For SMBus block read the first byte was received using PIO */
>             buf++;
>             len--;
>     }
> 
> ?
> 
> >                  */
> > -               buf = priv->msg->buf;
> > -               len = priv->msg->len - 2;
> > +               if (block_data) {
> > +                       buf = priv->msg->buf + 1;
> > +                       len = priv->msg->len - 3;
> > +               } else {
> > +                       buf = priv->msg->buf;
> > +                       len = priv->msg->len - 2;
> > +               }
> >         } else {
> >                 /*
> >                  * First byte in message was sent using PIO.
> 
> And below we have another case handling buf and len :-(
> 
> So perhaps:
> 
>     buf = priv->msg->buf;
>     len = priv->msg->len;
> 
>     if (read) {
>             /*
>              * The last two bytes needs to be fetched using PIO in
>              * order for the STOP phase to work.
>              */
>             len -= 2;
>     }
>     if (!read || block_data) {
>             /* First byte in message was sent using PIO *
>             buf++;
>             len--;
>     }

Probably I was trying to minimize the changes ;-)

However, I agree with you that the whole code fragment can be simplified
and your variant indeed looks more clean and understandable.
Thank you for your suggestion, I'll submit version 2 of the patch
with this fragment changed.

Thanks!

Best regards,
Andrew

