Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D84021E39E
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jul 2020 01:33:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726356AbgGMXd2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Jul 2020 19:33:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:49722 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726339AbgGMXd2 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 13 Jul 2020 19:33:28 -0400
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 48EA220DD4;
        Mon, 13 Jul 2020 23:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594683207;
        bh=ASyGfa3Wk9yhEqjezqaJilEkvipfynLyaSZXaASIVX4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=QLtsmejCfy9e4auxKVg0O/r8JmxeFkxZ//UOmpI7peIMM4tvfxR1jybbdDS1mSI43
         Zeasdc+UOeNrqSkNz04BXtyNK0FY4ZKm+Ek3QlVTTteo9w+eSQVNTzYMjNkhqHPB6I
         DPwPBO4eK2buv4Qyx+Meqz7KEYfwVP6Iv0Hik/6o=
Received: by mail-oo1-f44.google.com with SMTP id t6so2808048ooh.4;
        Mon, 13 Jul 2020 16:33:27 -0700 (PDT)
X-Gm-Message-State: AOAM531f63R5S6zUy9PUcwWDD2KHRN4M1R0okKSauALtfngnL+Wk4OLD
        hy1KdgW3TZSqd+0Vqi7W7wNP41AVRrYGT5LDYA==
X-Google-Smtp-Source: ABdhPJxJn4Yq2V9XaFU8Qu7rKSKIoq5hATYp03MMXMnT6eRrlBajd27f8pUxj/NKMNWyOQuf9hIsTFEpJUwU6oj3ods=
X-Received: by 2002:a4a:7459:: with SMTP id t25mr2138469ooe.25.1594683206670;
 Mon, 13 Jul 2020 16:33:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200708071942.22595-1-frank@allwinnertech.com>
 <20200708071942.22595-2-frank@allwinnertech.com> <20200713225453.GA874275@bogus>
In-Reply-To: <20200713225453.GA874275@bogus>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 13 Jul 2020 17:33:15 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK4azgT=+vXu1VJ1tn--QnGaoied+FPSKZ68vtZs+=_sw@mail.gmail.com>
Message-ID: <CAL_JsqK4azgT=+vXu1VJ1tn--QnGaoied+FPSKZ68vtZs+=_sw@mail.gmail.com>
Subject: Re: [PATCH v3 01/16] dt-bindings: clk: sunxi-ccu: add compatible
 string for A100 CCU and R-CCU
To:     Frank Lee <frank@allwinnertech.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Corentin Labbe <clabbe@baylibre.com>, liyong@allwinnertech.com,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Icenowy Zheng <icenowy@aosc.io>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        bage@linutronix.de, Thomas Gleixner <tglx@linutronix.de>,
        "open list:THERMAL" <linux-pm@vger.kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Vasily Khoruzhick <anarsoul@gmail.com>,
        Ondrej Jirman <megous@megous.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Stefan Mavrodiev <stefan@olimex.com>,
        huangshuosheng@allwinnertech.com,
        Jason Cooper <jason@lakedaemon.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jul 13, 2020 at 4:54 PM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, 08 Jul 2020 15:19:27 +0800, Frank Lee wrote:
> > This patch adds binding to a100's ccu clock and r-ccu clock.
> >
> > Signed-off-by: Frank Lee <frank@allwinnertech.com>
> > ---
> >  .../devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml         | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Note that your series isn't threaded properly. Please send series
threaded (in reply to cover letter or 1st patch).
