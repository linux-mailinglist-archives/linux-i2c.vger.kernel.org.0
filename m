Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5775F33FCEA
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Mar 2021 02:56:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbhCRB4B convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Wed, 17 Mar 2021 21:56:01 -0400
Received: from mail.sch.bme.hu ([152.66.249.140]:15306 "EHLO mail.sch.bme.hu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230221AbhCRBzu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 17 Mar 2021 21:55:50 -0400
Received: from mail-lj1-f171.google.com (209.85.208.171) by
 Exchange2016-1.sch.bme.hu (152.66.249.140) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2176.2; Thu, 18 Mar 2021 02:55:46 +0100
Received: by mail-lj1-f171.google.com with SMTP id u10so5580020lju.7;
        Wed, 17 Mar 2021 18:55:46 -0700 (PDT)
X-Gm-Message-State: AOAM531VgKmyz5PSYZzXj251U4ETr58Bf3c1h0Ne2wiXpnqYYNoaRzAX
        eFO1T5wBOhpcD6yB+ehyLimw01gFA6FM/ZL8RKM=
X-Google-Smtp-Source: ABdhPJxyWpPm/YE281RzskNKgSprKmNuI+vhD4p4xnqa6+dHn2CSCqHgLoTk+oOTqcmdFwUj6bwCbdc5msIw/MWLLSw=
X-Received: by 2002:a2e:6f11:: with SMTP id k17mr3927293ljc.231.1616032545955;
 Wed, 17 Mar 2021 18:55:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210317103021.1913858-1-bence98@sch.bme.hu> <20210317123344.GD1315@ninjato>
In-Reply-To: <20210317123344.GD1315@ninjato>
From:   =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <bence98@sch.bme.hu>
Date:   Thu, 18 Mar 2021 02:55:34 +0100
X-Gmail-Original-Message-ID: <CACCVKEF-R1zvr2=AKf_a0vxQodbT0_CFnu0pWMrBZ3EjxteL5g@mail.gmail.com>
Message-ID: <CACCVKEF-R1zvr2=AKf_a0vxQodbT0_CFnu0pWMrBZ3EjxteL5g@mail.gmail.com>
Subject: Re: [PATCH v2] Adding i2c-cp2615: i2c support for Silicon Labs'
 CP2615 Digital Audio Bridge
To:     Wolfram Sang <wsa@kernel.org>
CC:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Originating-IP: [209.85.208.171]
X-ClientProxiedBy: Exchange2016-1.sch.bme.hu (152.66.249.140) To
 Exchange2016-1.sch.bme.hu (152.66.249.140)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Thanks for the lightning quick response!

Wolfram Sang <wsa@kernel.org> ezt írta (időpont: 2021. márc. 17., Sze, 13:34):
>
> On Wed, Mar 17, 2021 at 10:30:21AM +0000, Bence Csókás wrote:
> > Signed-off-by: Bence Csókás <bence98@sch.bme.hu>
>
> Thanks, this looks good now and I think we are very close.
>
> > ---
>
> Next, time please provide a small summary of changes since last version.
> I get enough patches that it becomes confusing otherwise.
>

You are right, sorry, I am still familiarizing myself with `git send-email`

> > --- /dev/null
> > +++ b/drivers/i2c/busses/i2c-cp2615.c
> > @@ -0,0 +1,282 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
>
> If you want GPL v2 only, then you need to say in MODULE_LICENSE also
> "GPL v2".
>

GPLv2 or later is fine by me. If I change this to "//
SPDX-License-Identifier: GPL-2.0-or-later", is that OK?

> > +enum cp2615_iop_msg_type {
> > +     iop_GetAccessoryInfo = 0xD100,
> > +     iop_AccessoryInfo = 0xA100,
> > +     iop_GetPortConfiguration = 0xD203,
> > +     iop_PortConfiguration = 0xA203,
> > +     // ...
>
> This comment can go?

Sorry, this slipped in from before... I shall remove it.


> > +/*
> > + * This chip has some limitations: one is that the USB endpoint
> > + * can only receive 64 bytes/transfer, that leaves 54 bytes for
> > + * the I2C transfer. On top of that, EITHER read_len OR write_len
> > + * may be zero, but not both. If both are non-zero, the adapter
> > + * issues a write followed by a read. And the chip does not
> > + * support repeated START between the write and read phases.
>
> Good and useful paragraph!

Thank you!

>
> > + * FIXME: There in no quirk flag for specifying that the adapter
> > + * does not support empty transfers, or that it cannot emit a
>
> Can't we use I2C_AQ_NO_ZERO_LEN here?

I thought that meant the adapter cannot handle NEITHER zero-length
reads NOR writes, but the CP2615 can do a zero read combined with a
non-zero write or the other way around, just both cannot be zero. If
both are zero, the chip just ignores the request, as I've learned from
a very confusing situation with `i2cdetect`.

>
> > + * START condition between the combined phases.
>
> True! But it makes sense, so we can fix that. We just need to add
> I2C_AQ_NO_REP_START and a short explanation to i2c.h. If you want, you
> can do it in a seperate patch. I can do it, too, if you prefer.

Sure! I should just define it as BIT(7) or something, right? Should I
do it in a completely different patchset, or is it OK if I submit it
as the 2/2 of PATCH v3? Are there maybe other adapters that would be
affected?

> Maybe skip the defines for VID and PID and use the values directly?
> I am not a USB expert, not really sure what the consistent way is.

I think this is how they usually do it, or at least from what I've seen.

>
> So, this and the checkpatch issues and I think we are done.
>
> Thanks,
>
>    Wolfram
>

Thanks,
Bence
