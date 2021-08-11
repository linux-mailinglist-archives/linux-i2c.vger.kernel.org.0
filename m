Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21B143E9492
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Aug 2021 17:30:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233278AbhHKPaf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Aug 2021 11:30:35 -0400
Received: from mail-ua1-f48.google.com ([209.85.222.48]:41773 "EHLO
        mail-ua1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231388AbhHKPae (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Aug 2021 11:30:34 -0400
Received: by mail-ua1-f48.google.com with SMTP id 75so1353135uav.8;
        Wed, 11 Aug 2021 08:30:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=L469o3K3DZxiKH2GQhMbCcpe1P8gTUJkOxsV39vwt1s=;
        b=Nxgt8b2O8SVInZtsTNS0ELxaPzoB9jim/zhwojqahKoRHR9AtNKNyfypNpXJtLbh1b
         1lb6ZlmW48Jgvz+BDKuvudhG8pT2C9/y670BLsautcA+MOufU9m3zqGt17CdS2M2Tnt1
         /IqUpjRfZ4XHs74v4FR4biOxfP02pMEG8Bbj3Ild5RTsLJa5DjCHf9WsQJacVquWIi+0
         z+EUI2cnbAuCCQD76nJJmKt7PU20DA5HVyvIf256F8BceBD5HZt/rfD3PzW2D+Tbp3dj
         Wj/3R8PBETHK1oyfU5lDdbajsxuZQHptidMGXiBxz8/CJA9DzLssKM8usYljSMdZ6btV
         OXSw==
X-Gm-Message-State: AOAM532CXCJ93HYXn8RT3Sz32j0TyvKkt0mpCycNaTDn7yfBBLUd2liO
        fEbDs/pvBvbLxrXyXOdUs7O7xtppr2s7fI/5w28az/ZXBiM=
X-Google-Smtp-Source: ABdhPJwjG0GpaCmPASRUhombd34bXg9609A6y1rSKXNr8AiJKDrHVCLQlbeqxDVu07BIbmzTvhLuPmR1yt6JaNDERDo=
X-Received: by 2002:ab0:208c:: with SMTP id r12mr2571587uak.106.1628695810459;
 Wed, 11 Aug 2021 08:30:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1626267422.git.geert+renesas@glider.be> <YRPdTiAakb6OBd2k@shikoro>
In-Reply-To: <YRPdTiAakb6OBd2k@shikoro>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 11 Aug 2021 17:29:59 +0200
Message-ID: <CAMuHMdVmKuYo7XhrQsLhXCOyRa=-aKwbtub=yi5nuSvJ22An2Q@mail.gmail.com>
Subject: Re: [PATCH/RFC 0/4] dt-bindings: i2c: renesas,riic: Add interrupt-names
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Rob Herring <robh+dt@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Wed, Aug 11, 2021 at 4:23 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > The Renesas RZ/A and RZ/G2L I2C Bus Interface has no less than 8
> > interrupts.  So I think it makes sense to use "interrupt-names"
> > property, to make it easier to review the interrupt mappings in DTS
> > files.
> >
> > Hence this series documents the "interrupt-names" property in the DT
> > bindings, adds the property to the DTS files, and marks it required in
> > the DT bindings. Obviously the last step cannot be applied until all
> > earlier patches are upstream.
> >
> > What do you think?
>
> I like it and I'd think it is good to go. It is probably easiest if you
> take the series via your tree to avoid merge conflicts and/or subsystem
> dependencies. It's unlikely the YAML file will see further updates. So,
> for the series:

Probably it is not worth doing this in lockstep (1/4 in v5.15 through
i2c, 2/4 and 3/4 in v5.16 through renesas-devel, and 4/4 in v5.17
through i2c).
I have different branches for DT binding and DTS, but I guess it
doesn't hurt to deviate and apply both to renesas-arm-dt-for-v5.15...

> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
