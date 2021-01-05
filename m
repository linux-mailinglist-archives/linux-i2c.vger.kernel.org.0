Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D193A2EAAF1
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Jan 2021 13:32:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727766AbhAEMbd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Jan 2021 07:31:33 -0500
Received: from mail-oi1-f172.google.com ([209.85.167.172]:40268 "EHLO
        mail-oi1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727725AbhAEMbc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Jan 2021 07:31:32 -0500
Received: by mail-oi1-f172.google.com with SMTP id p5so35776748oif.7;
        Tue, 05 Jan 2021 04:31:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=12r0Bw4nS6BbOFWAUi5UOySbS/NhH/yJzSZDxReb0mc=;
        b=YGRRjcWTRcrLlo7fzVd4yx/Rp3pF59DdlemgZMj15fHVt+bOyZAlVZbnb+yKjWmTCs
         SFxcR87PA7pHplh+4zAAm0D9uf3nkpIsJqbUlCoaUqiHquF0w6g1ExAb6zS8D6ozXX4K
         knRLXYODaD7xNm2527PaqdUICFOBGB9puifeKdTz9UPwcdWOA0vpkMRa5R2bQDLK21eV
         y19iVqSBAzBwcrmKaB53PhOcHj0xobmN5Ke438MUbmGIp/mIUOXSAuVghfhZyevWZw2i
         OaxHBeP16BOcI3WGOFsgPfSCE+AhKo8ww+Ph+rCwKA6z2SFoGjByIY3dUvv9UOM2Twva
         uVyQ==
X-Gm-Message-State: AOAM531jXh8hHj8D0Wo2Nj8lT9qSy6dXRmGiBNSWJz8hOorKFH7guOGc
        H2PEIidZOXdy0jqtbjlIHYq9taYbKiVUW7kw+JI=
X-Google-Smtp-Source: ABdhPJxhfYcB3nGeskK2H/0rnXAFgFKmRJsoddbw4QCk8GH9dI0Itm4pwCPMMe046eNRfR7hZ/AgHUvnwrFtDA9WrG4=
X-Received: by 2002:aca:4b16:: with SMTP id y22mr2403452oia.148.1609849851249;
 Tue, 05 Jan 2021 04:30:51 -0800 (PST)
MIME-Version: 1.0
References: <20201223172505.34736-1-wsa+renesas@sang-engineering.com> <20201223172505.34736-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20201223172505.34736-2-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 5 Jan 2021 13:30:40 +0100
Message-ID: <CAMuHMdVKmb8tCGQUQtCOfkjB3VxbVtwuA3u9kh2XuxQumKhekg@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: i2c: renesas,i2c: add r8a779a0 (V3U) support
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Dec 23, 2020 at 6:27 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/Documentation/devicetree/bindings/i2c/renesas,i2c.txt
> +++ b/Documentation/devicetree/bindings/i2c/renesas,i2c.txt
> @@ -26,6 +26,7 @@ Required properties:
>         "renesas,i2c-r8a77980" if the device is a part of a R8A77980 SoC.
>         "renesas,i2c-r8a77990" if the device is a part of a R8A77990 SoC.
>         "renesas,i2c-r8a77995" if the device is a part of a R8A77995 SoC.
> +       "renesas,i2c-r8a779a0" if the device is a part of a R8A779A0 SoC.
>         "renesas,rcar-gen1-i2c" for a generic R-Car Gen1 compatible device.
>         "renesas,rcar-gen2-i2c" for a generic R-Car Gen2 or RZ/G1 compatible
>                                 device.

Note that this doesn't say anything about (in)compatibility with generic
R-Car Gen3 compatible devices (hint: yaml conversion?).

New features:
  - Slave Clock Stretch Select,
  - Fast Mode+ Enable,
  - Enhanced First Bit Setup Cycle configuration.

Looks like the R-Car V3U variant can be treated as a generic R-Car Gen3
variant (lacking the new features, of course).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
