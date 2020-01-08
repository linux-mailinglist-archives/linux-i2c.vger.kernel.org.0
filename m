Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 644081343D5
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jan 2020 14:29:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726254AbgAHN3U (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Jan 2020 08:29:20 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:36612 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726087AbgAHN3T (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Jan 2020 08:29:19 -0500
Received: by mail-oi1-f194.google.com with SMTP id c16so2604044oic.3;
        Wed, 08 Jan 2020 05:29:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xhnarkk62w7a7yP83H+FKmaWfy84TkPqDtlmyUDyNco=;
        b=shA+LQBLwE0ZOwZBPYX9X9/7aXE5RvmfI+MRQxrR2CxVpgUQ+Lx8QbMBEGvEr1l5uS
         Lmez+Shi/zD9VxIKZCtKfVF8AQUZkF89vJEaE1d3LZslneoBsi6R6b5kundyxpZV0zz3
         0Fs/Fm8HdVPq9qtKE2l/F4e/F4en5JeMnQXlEJ6WgYAngMqUrX11EueiWkwjkPpcdR1Q
         NQDLPOBtQwBokv0rMIt8t+QYNt52HYarpHayzCxHkxtjPqJdUIeYXy0YR6dRsv6HGZty
         SilGlyU4VTNPRg+Y0bgx1r9oQHc253CAL0oVGbNsIjbAEgB99cbK8rUHkGLxtRd4Mxce
         eEwA==
X-Gm-Message-State: APjAAAULF6uCPFtP3h8UJKMeH5Mq/6WGIeOfE22MzpcWx1v09DNsCWG9
        CAiyA0GIjoyOA4cEqIaUodU6vQ8rZUT6HcjuZGA=
X-Google-Smtp-Source: APXvYqz3EBoSzDsood5JnY9kbBwLjL7/ztqKUabUDI/upA95l+kHAVOvcBjougjqqjqjQdwDnGNST3AuKEqviQr34C8=
X-Received: by 2002:aca:1a06:: with SMTP id a6mr2813526oia.148.1578490158856;
 Wed, 08 Jan 2020 05:29:18 -0800 (PST)
MIME-Version: 1.0
References: <20191231161400.1688-1-wsa+renesas@sang-engineering.com>
 <20191231161400.1688-4-wsa+renesas@sang-engineering.com> <20200101165515.GC6226@pendragon.ideasonboard.com>
 <e008939f-531d-f7dc-4c3c-937476213030@lucaceresoli.net> <20200102211327.GB1030@kunai>
 <cc2a10ab-9f05-2c61-3a37-0e5e0184e379@lucaceresoli.net> <20200103001056.GJ4843@pendragon.ideasonboard.com>
 <20200108131929.GA834@kunai>
In-Reply-To: <20200108131929.GA834@kunai>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 8 Jan 2020 14:29:07 +0100
Message-ID: <CAMuHMdX4mCw3pSGEzJUk9PRtnTwu-_R7TdxdDhJgzPAdbVKi1Q@mail.gmail.com>
Subject: Re: [RFC PATCH 3/5] i2c: core: add function to request an alias
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran@ksquared.org.uk>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Vladimir Zapolskiy <vz@mleia.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Wed, Jan 8, 2020 at 2:20 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> > > > As I said to Laurent, too, I think the risk that a bus is not fully
> > > > described is higher than a device which does not respond to a read_byte.
> > > > In both cases, we would wrongly use an address in use.
> >
> > I don't fully agree with this, I think we shouldn't impose a penalty on
> > every user because some device trees don't fully describe the hardware.
>
> I haven't decided yet. However, my general preference is that for a
> generic OS like Linux, saftey comes first, then performance. If you have
> a fully described DT, then the overhead will be 1 read_byte transaction
> per requested alias at probe time. We could talk about using quick_read
> to half the overhead. You could even patch it away, if it is too much
> for $customer.
>
> > I think we should, at the very least, skip the probe and rely on DT if
> > DT explicitly states that all used addresses are listed. We discussed a
> > property to report addresses used by devices not described in DT, if
> > that property is listed I would prefer trusting DT.
>
> Yeah, we discussed this property and I have no intentions of dropping
> it. I haven't though of including it into this series, but it probably
> makes sense. We don't have to define much anyhow, just state what
> already exists, I guess.
>
> From Documentation/devicetree/bindings/i2c/i2c-ocores.txt:
>
>         dummy@60 {
>                 compatible = "dummy";
>                 reg = <0x60>;
>         };
>
> I think "dummy" is generic enough to be described in i2c.txt.

Dummy-the-node or dummy-the-compatible value?
Probably dummy nodes should have no compatible value at all?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
