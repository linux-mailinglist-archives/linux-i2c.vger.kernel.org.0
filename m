Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A5694BA345
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Feb 2022 15:43:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241961AbiBQOmh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Feb 2022 09:42:37 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:38304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241975AbiBQOmd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Feb 2022 09:42:33 -0500
X-Greylist: delayed 63 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 17 Feb 2022 06:42:15 PST
Received: from esa4.mentor.iphmx.com (esa4.mentor.iphmx.com [68.232.137.252])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7C881EA710;
        Thu, 17 Feb 2022 06:42:15 -0800 (PST)
IronPort-SDR: mYI/ABF/DRwGmr1JDfW7M1EEflyDLpZ/u/DtTUwaTAhdB+IY4z1Iv0/4Q4eCyrZ0TEJ02MIMDk
 bT3ZfG29L6GIXSNvfhzHmTpvA+0OVmKLDV4uHE3MFTYvLgMqvi1I3IqY9a2qbp1E9VOec4niQO
 g1uqKshddxrdVRjTPlppkpc6fju1h36WJxRZwelxnlYFMP3mbnd7UnfgiuEM8ByYfVW0LHeh/q
 qagJPmN6avl2lPeNvEmUjrFD4qrgeV8Gv2IHFiRoXWCoMX1R0Rb7JqM1SBSXS7vXorEBKNFYX7
 mAJUz/FNyMnYqu2nOonSf820
X-IronPort-AV: E=Sophos;i="5.88,376,1635235200"; 
   d="scan'208";a="72081798"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 17 Feb 2022 06:41:12 -0800
IronPort-SDR: 5vO35a3HQ31nmaqSObbk0ZxQamAwBV886ZZr/ckDFS4PvNtTl6wqfs1VyCVw4gV19AYTqWfRbN
 fIOS1bbxoDFnJs4ghqhVoIZOvwGLfvMXV1t6w5hr5J0WPI7IkZND3mUwtYMcM8m/nT+AXS0Ee+
 55jiF0CzanTegedPQuVhZFc9pKILPVyEncZNNgPjiba9uCiul64Q/Ttj0iP6qbe4T6Viz6zjKM
 QTg6Ys0BmPc6ekxSjWj/GlLTGNilU+jzAxv41tcCMTkLldcCnN3gTPVASIZiVwTS1ufu7fBr3y
 TkY=
From:   Andrew Gabbasov <andrew_gabbasov@mentor.com>
To:     'Geert Uytterhoeven' <geert+renesas@glider.be>,
        'Wolfram Sang' <wsa+renesas@sang-engineering.com>
CC:     'Linux-Renesas' <linux-renesas-soc@vger.kernel.org>,
        'Linux I2C' <linux-i2c@vger.kernel.org>,
        'Linux Kernel Mailing List' <linux-kernel@vger.kernel.org>,
        "Surachari, Bhuvanesh" <Bhuvanesh_Surachari@mentor.com>
References: <20210922160649.28449-1-andrew_gabbasov@mentor.com> <CAMuHMdVVDpBAQR+H1TAnpf65aVbAL0Mm0km7Z9L7+1JuF6n1gQ@mail.gmail.com>    
In-Reply-To: 
Subject: RE: [PATCH] i2c: rcar: add SMBus block read support
Date:   Thu, 17 Feb 2022 17:40:56 +0300
Organization: Mentor Graphics Corporation
Message-ID: <000001d8240c$65be7de0$313b79a0$@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHXue1eCQdNXjaiK021FrevUeTu7qvGRbCQgEMVGxCAUkv+EIAYU0UAgCSk5iA=
Content-Language: en-us
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-11.mgc.mentorg.com (139.181.222.11) To
 svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2)
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Geert, Wolfram,

Could you please let us know your opinion on this patch
and further requirements, if any.

Thanks!

Best regards,
Andrew

> -----Original Message-----
> From: Andrew Gabbasov <andrew_gabbasov@mentor.com>
> Sent: Tuesday, January 25, 2022 9:46 AM
> To: 'Geert Uytterhoeven' <geert@linux-m68k.org>
> Cc: 'Linux-Renesas' <linux-renesas-soc@vger.kernel.org>; 'Linux I2C' <linux-i2c@vger.kernel.org>; 'Linux Kernel
> Mailing List' <linux-kernel@vger.kernel.org>; 'Wolfram Sang' <wsa+renesas@sang-engineering.com>; Surachari,
> Bhuvanesh <Bhuvanesh_Surachari@mentor.com>
> Subject: RE: [PATCH] i2c: rcar: add SMBus block read support
> 
> Hello Geert, Wolfram,
> 
> Any feedback on the patch, please?
> 
> Thanks.
> 
> Best regards,
> Andrew
> 
> > -----Original Message-----
> > From: Andrew Gabbasov <andrew_gabbasov@mentor.com>
> > Sent: Sunday, January 09, 2022 10:20 PM
> > To: 'Geert Uytterhoeven' <geert@linux-m68k.org>
> > Cc: 'Linux-Renesas' <linux-renesas-soc@vger.kernel.org>; 'Linux I2C' <linux-i2c@vger.kernel.org>; 'Linux Kernel
> > Mailing List' <linux-kernel@vger.kernel.org>; 'Wolfram Sang' <wsa+renesas@sang-engineering.com>; Surachari,
> > Bhuvanesh <Bhuvanesh_Surachari@mentor.com>
> > Subject: RE: [PATCH] i2c: rcar: add SMBus block read support
> >
> > Hello Geert, Wolfram,
> >
> > Could you please let me know your opinion on version 2 of this patch,
> > that addressed your earlier review comments?
> >
> > https://lore.kernel.org/all/20211006182314.10585-1-andrew_gabbasov@mentor.com/
> >
> > Does it still need any further modifications or are you going to promote it further upstream?
> >
> > Thanks.
> >
> > Best regards,
> > Andrew
> >
> > > -----Original Message-----
> > > From: Andrew Gabbasov <andrew_gabbasov@mentor.com>
> > > Sent: Thursday, November 18, 2021 1:35 PM
> > > To: 'Geert Uytterhoeven' <geert@linux-m68k.org>
> > > Cc: 'Linux-Renesas' <linux-renesas-soc@vger.kernel.org>; 'Linux I2C' <linux-i2c@vger.kernel.org>; 'Linux
> Kernel
> > > Mailing List' <linux-kernel@vger.kernel.org>; 'Wolfram Sang' <wsa+renesas@sang-engineering.com>; Surachari,
> > > Bhuvanesh <Bhuvanesh_Surachari@mentor.com>
> > > Subject: RE: [PATCH] i2c: rcar: add SMBus block read support
> > >
> > > Hello Geert, Wolfram,
> > >
> > > Do you have any feedback on version 2 of this patch, that was submitted
> > > after your review comments below?
> > >
> > > https://lore.kernel.org/all/20211006182314.10585-1-andrew_gabbasov@mentor.com/
> > >
> > > Thanks!
> > >
> > > Best regards,
> > > Andrew
> > >
> > > > -----Original Message-----
> > > > From: Andrew Gabbasov <andrew_gabbasov@mentor.com>
> > > > Sent: Wednesday, October 06, 2021 9:12 PM
> > > > To: 'Geert Uytterhoeven' <geert@linux-m68k.org>
> > > > Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>; Linux I2C <linux-i2c@vger.kernel.org>; Linux Kernel
> > > > Mailing List <linux-kernel@vger.kernel.org>; Wolfram Sang <wsa+renesas@sang-engineering.com>; Surachari,
> > > > Bhuvanesh <Bhuvanesh_Surachari@mentor.com>
> > > > Subject: RE: [PATCH] i2c: rcar: add SMBus block read support
> > > >
> > > > Hi Geert,
> > > >
> > > > Thank you for your review!
> > > >
> > > > > -----Original Message-----
> > > > > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > > > > Sent: Tuesday, October 05, 2021 4:32 PM
> > > > > To: Gabbasov, Andrew <Andrew_Gabbasov@mentor.com>
> > > > > Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>; Linux I2C <linux-i2c@vger.kernel.org>; Linux
> Kernel
> > > > > Mailing List <linux-kernel@vger.kernel.org>; Wolfram Sang <wsa+renesas@sang-engineering.com>; Surachari,
> > > > > Bhuvanesh <Bhuvanesh_Surachari@mentor.com>
> > > > > Subject: Re: [PATCH] i2c: rcar: add SMBus block read support
> > > > >
> > > > > Hi Andrew,
> > > > >
> > > > > On Wed, Sep 22, 2021 at 6:14 PM Andrew Gabbasov
> > > > > <andrew_gabbasov@mentor.com> wrote:
> > > > > > The smbus block read is not currently supported for rcar i2c devices.
> > > > > > This patchset adds the support to rcar i2c bus so that blocks of data
> > > > > > can be read using SMbus block reads.(using i2c_smbus_read_block_data()
> > > > > > function from the i2c-core-smbus.c).
> > > > > >
> > > > > > Inspired by commit 8e8782c71595 ("i2c: imx: add SMBus block read support")
> > > > > >
> > > > > > This patch (adapted) was tested with v4.14, but due to lack of real
> > > > > > hardware with SMBus block read operations support, using "simulation",
> > > > > > that is manual analysis of data, read from plain I2C devices with
> > > > > > SMBus block read request.
> > > > > >
> > > > > > Signed-off-by: Bhuvanesh Surachari <bhuvanesh_surachari@mentor.com>
> > > > > > Signed-off-by: Andrew Gabbasov <andrew_gabbasov@mentor.com>
> > > > >
> > > > > Thanks for your patch!
> > > > >
> > > > > > --- a/drivers/i2c/busses/i2c-rcar.c
> > > > > > +++ b/drivers/i2c/busses/i2c-rcar.c
> > > > > > @@ -429,9 +431,16 @@ static bool rcar_i2c_dma(struct rcar_i2c_priv *priv)
> > > > > >                 /*
> > > > > >                  * The last two bytes needs to be fetched using PIO in
> > > > > >                  * order for the STOP phase to work.
> > > > > > +                *
> > > > > > +                * For SMBus block read the first byte was received using PIO.
> > > > >
> > > > > So it might be easier to read, and more maintainable, to keep the
> > > > > old assignments:
> > > > >
> > > > >     buf = priv->msg->buf;
> > > > >     len = priv->msg->len - 2;
> > > > >
> > > > > and adjust them for SMBus afterwards:
> > > > >
> > > > >     if (block_data) {
> > > > >             /* For SMBus block read the first byte was received using PIO */
> > > > >             buf++;
> > > > >             len--;
> > > > >     }
> > > > >
> > > > > ?
> > > > >
> > > > > >                  */
> > > > > > -               buf = priv->msg->buf;
> > > > > > -               len = priv->msg->len - 2;
> > > > > > +               if (block_data) {
> > > > > > +                       buf = priv->msg->buf + 1;
> > > > > > +                       len = priv->msg->len - 3;
> > > > > > +               } else {
> > > > > > +                       buf = priv->msg->buf;
> > > > > > +                       len = priv->msg->len - 2;
> > > > > > +               }
> > > > > >         } else {
> > > > > >                 /*
> > > > > >                  * First byte in message was sent using PIO.
> > > > >
> > > > > And below we have another case handling buf and len :-(
> > > > >
> > > > > So perhaps:
> > > > >
> > > > >     buf = priv->msg->buf;
> > > > >     len = priv->msg->len;
> > > > >
> > > > >     if (read) {
> > > > >             /*
> > > > >              * The last two bytes needs to be fetched using PIO in
> > > > >              * order for the STOP phase to work.
> > > > >              */
> > > > >             len -= 2;
> > > > >     }
> > > > >     if (!read || block_data) {
> > > > >             /* First byte in message was sent using PIO *
> > > > >             buf++;
> > > > >             len--;
> > > > >     }
> > > >
> > > > Probably I was trying to minimize the changes ;-)
> > > >
> > > > However, I agree with you that the whole code fragment can be simplified
> > > > and your variant indeed looks more clean and understandable.
> > > > Thank you for your suggestion, I'll submit version 2 of the patch
> > > > with this fragment changed.
> > > >
> > > > Thanks!
> > > >
> > > > Best regards,
> > > > Andrew

