Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F454BF446
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2019 15:43:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726969AbfIZNni (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Sep 2019 09:43:38 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:37803 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726216AbfIZNni (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 26 Sep 2019 09:43:38 -0400
Received: by mail-ot1-f67.google.com with SMTP id k32so2040282otc.4;
        Thu, 26 Sep 2019 06:43:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9iQoPR6Dtfrg/kE8q+V9kP7orp4W3/CCPYRyl7Gtb8k=;
        b=guMkHhRJaJ3Ux/FHRXJT0P4MeUtGGiK/rkAENC+yUAMg6B+dXjh2IHQ0cVs8YesbiG
         jxDK4UzarLmyjWne5gE0xMwVG/G/j6LSx5LZSF/2F2w5n2U/rivzwuBxIEN2ZXHUbxoz
         K3oBtYN9GmcQPxgr/xSLsdFap8InPp8NRh2tifWzH+VTY6STM/h6McdUVpAKLSHdK/BU
         esCDmp6AachOXo8h07G4B9W/buBcwQCWk6HI11B/fZjMGEzgtKloF6HNVjVPfyS5PBKU
         51ff25v8PHhEkJVdgEDupt+UayXaQ/bAFi0yxuJVaSOKAAPziuxa/1xugqHDmsjXQoip
         iztg==
X-Gm-Message-State: APjAAAXFb0o9lnSWxSky/hJDnomBmfh2gUaQx8Ij1HA/DAUiiAimUEe4
        9wNrdpxg+JebZBrpTN5NBe2p8oq+PnOAZK56XQo=
X-Google-Smtp-Source: APXvYqzlY4Qa2PVNWrJbCqqT0iWOU7qRw7aWWoYKaXfqDi5MwjlVBKkxQqUWNJew3hac3avWmm/1CejGsR0tfw3UU/4=
X-Received: by 2002:a9d:730d:: with SMTP id e13mr2635252otk.145.1569505417194;
 Thu, 26 Sep 2019 06:43:37 -0700 (PDT)
MIME-Version: 1.0
References: <1569310619-31071-1-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdXwpSeQPUtKT4g6Oa14w71WM9dw5xXj3DUZ8Qj6=9OM0g@mail.gmail.com> <OSBPR01MB2103FBD1E80060A718C32FCFB8860@OSBPR01MB2103.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB2103FBD1E80060A718C32FCFB8860@OSBPR01MB2103.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 26 Sep 2019 15:43:26 +0200
Message-ID: <CAMuHMdX1Q5p6X1+35Q1ApDC3REbxpBnG5vRncwbHXcCLmCXqxg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: i2c: sh_mobile: Add r8a774b1 support
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Biju,

On Thu, Sep 26, 2019 at 2:49 PM Biju Das <biju.das@bp.renesas.com> wrote:
> > Subject: Re: [PATCH] dt-bindings: i2c: sh_mobile: Add r8a774b1 support
> >
> > On Tue, Sep 24, 2019 at 9:37 AM Biju Das <biju.das@bp.renesas.com> wrote:
> > > Document RZ/G2N (R8A774B1) SoC bindings.
> > >
> > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > >  Documentation/devicetree/bindings/i2c/i2c-sh_mobile.txt | 1 +
> >
> > Documentation/devicetree/bindings/i2c/renesas,iic.txt
>
> OK. Will send V2 with the above file name change.

I don't know if that is needed.  Perhaps Wolfram is as good as git cherry-pick,
when applying patches against changed filenames? ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
