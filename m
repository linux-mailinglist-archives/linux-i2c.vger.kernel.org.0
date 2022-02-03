Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB2844A8741
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Feb 2022 16:07:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351642AbiBCPHZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Feb 2022 10:07:25 -0500
Received: from mail-ua1-f42.google.com ([209.85.222.42]:38662 "EHLO
        mail-ua1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351629AbiBCPHY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Feb 2022 10:07:24 -0500
Received: by mail-ua1-f42.google.com with SMTP id n15so5710679uaq.5;
        Thu, 03 Feb 2022 07:07:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x4GrIT2t/h1QFZy/meIPFQiIESwl7eGudGvKYal0o5g=;
        b=h+eIA10NFr6yfSFt04hfMwTPNPfrv/WudxF9G2k4ee1a2Hyuy4dJ8aTO5XK/XekxBY
         kN9UFHQVjL/lVjEKxmjG/CfxXMHimJy+gmkod9NRkY6hZVpHNSn9jdAYhBzdAvi0x9xi
         wp1hbKazp23evclugPL7eLtZV/40nk6lvbzljzpWc52wOX1zV3nF2WHOgfd6Hj/3aHxz
         /IJbO5Gf6R0GzlxWgxz6uRaQ5oFoE4rMv1aQ9EcVo2t1QJ9MHfey2FAXuo53WGEiTF/V
         tj3Zu/9+4sd1dybYy3fgKytrcvueE0a1oaF0/F7Qd1UFjPYGiTYpZ613QUijQt+2egWa
         TxuQ==
X-Gm-Message-State: AOAM533bDukYNOvHfR+xbMVuAWJneY3jBepdqb3HC58A7GQCAHdiwPrZ
        Us/qWsTfOV8oRZDqTXE8l1g/T7m4cWX65w==
X-Google-Smtp-Source: ABdhPJxpMMtWv18YFehUyunGly0YfmHp2VJycqyzq1kFbdD8AoWLIeGnw6p92WzkEJSZsdOmHSpL0w==
X-Received: by 2002:ab0:6156:: with SMTP id w22mr13875087uan.61.1643900843457;
        Thu, 03 Feb 2022 07:07:23 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id s12sm4523579vsn.29.2022.02.03.07.07.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Feb 2022 07:07:23 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id r8so5834382uaj.0;
        Thu, 03 Feb 2022 07:07:23 -0800 (PST)
X-Received: by 2002:a9f:3b19:: with SMTP id i25mr14689098uah.14.1643900842947;
 Thu, 03 Feb 2022 07:07:22 -0800 (PST)
MIME-Version: 1.0
References: <e4dcee5f6f521dccd7ac7f2fb6c86cfe4a24d032.1643898820.git.geert+renesas@glider.be>
In-Reply-To: <e4dcee5f6f521dccd7ac7f2fb6c86cfe4a24d032.1643898820.git.geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 3 Feb 2022 16:07:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXJnF-Lg-z8kLXNrDxe6q3_ttSXnUAONwwqe+PDfaK_JA@mail.gmail.com>
Message-ID: <CAMuHMdXJnF-Lg-z8kLXNrDxe6q3_ttSXnUAONwwqe+PDfaK_JA@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r8a779f0: Add I2C clocks
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

CC clock people (sorry for missing that)

On Thu, Feb 3, 2022 at 3:34 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Add the module clocks used by the I2C Bus Interfaces on the Renesas
> R-Car S4-8 (R8A779F0) SoC.
>
> Extracted from a larger patch in the BSP by LUU HOAI.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued in renesas-clk-for-v5.18.
>
>  drivers/clk/renesas/r8a779f0-cpg-mssr.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/clk/renesas/r8a779f0-cpg-mssr.c b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
> index 16271b8c3ed8ea31..76b441965037798d 100644
> --- a/drivers/clk/renesas/r8a779f0-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
> @@ -115,6 +115,12 @@ static const struct cpg_core_clk r8a779f0_core_clks[] __initconst = {
>  };
>
>  static const struct mssr_mod_clk r8a779f0_mod_clks[] __initconst = {
> +       DEF_MOD("i2c0",         518,    R8A779F0_CLK_S0D6_PER),
> +       DEF_MOD("i2c1",         519,    R8A779F0_CLK_S0D6_PER),
> +       DEF_MOD("i2c2",         520,    R8A779F0_CLK_S0D6_PER),
> +       DEF_MOD("i2c3",         521,    R8A779F0_CLK_S0D6_PER),
> +       DEF_MOD("i2c4",         522,    R8A779F0_CLK_S0D6_PER),
> +       DEF_MOD("i2c5",         523,    R8A779F0_CLK_S0D6_PER),
>         DEF_MOD("scif0",        702,    R8A779F0_CLK_S0D12_PER),
>         DEF_MOD("scif1",        703,    R8A779F0_CLK_S0D12_PER),
>         DEF_MOD("scif3",        704,    R8A779F0_CLK_S0D12_PER),
> --
> 2.25.1
