Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B24F590714
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2019 19:39:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727357AbfHPRjf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Aug 2019 13:39:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:54930 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727347AbfHPRjf (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 16 Aug 2019 13:39:35 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 60509205F4;
        Fri, 16 Aug 2019 17:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565977174;
        bh=Hkql629r7jMcpDCSxxQyeYY9VUfj+ahusqlu9yDMvrc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=VEUKX1woF1+HKNWJy9m1xpe3/2wVZkOVt6mzeKpwGagd4EEyDFFQ5aIFPPYudf/u9
         WI2YjhZvHidzvy2iHc7gwEzPwnYeshMTHPpS6vQTqDNKa9bvgvUbXaZ201A9ru/0LT
         SnNpM1nc4HKDqE1dego2rca6fTLJ1bh6niL07Rho=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1565713248-4906-7-git-send-email-wahrenst@gmx.net>
References: <1565713248-4906-1-git-send-email-wahrenst@gmx.net> <1565713248-4906-7-git-send-email-wahrenst@gmx.net>
Subject: Re: [PATCH V2 06/13] clk: bcm2835: Mark PLLD_PER as CRITICAL
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Ray Jui <rjui@broadcom.com>, Rob Herring <robh+dt@kernel.org>,
        Scott Branden <sbranden@broadcom.com>,
        Stefan Wahren <wahrenst@gmx.net>,
        Wolfram Sang <wsa@the-dreams.de>
User-Agent: alot/0.8.1
Date:   Fri, 16 Aug 2019 10:39:33 -0700
Message-Id: <20190816173934.60509205F4@mail.kernel.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Quoting Stefan Wahren (2019-08-13 09:20:41)
> The VPU firmware assume that the PLLD_PER isn't modified by the ARM core.
> Otherwise this could cause firmware lookups. So mark the clock as critical
> to avoid this.
>=20
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>  drivers/clk/bcm/clk-bcm2835.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
> index fdf672a..b62052e 100644
> --- a/drivers/clk/bcm/clk-bcm2835.c
> +++ b/drivers/clk/bcm/clk-bcm2835.c
> @@ -1785,7 +1785,7 @@ static const struct bcm2835_clk_desc clk_desc_array=
[] =3D {
>                 .load_mask =3D CM_PLLD_LOADPER,
>                 .hold_mask =3D CM_PLLD_HOLDPER,
>                 .fixed_divider =3D 1,
> -               .flags =3D CLK_SET_RATE_PARENT),
> +               .flags =3D CLK_IS_CRITICAL | CLK_SET_RATE_PARENT),

Please add a comment in the code to the effect that is in the commit
text so we don't have to dig through commits to figure out why this
special CLK_IS_CRITICAL flag is here.

>         [BCM2835_PLLD_DSI0]     =3D REGISTER_PLL_DIV(
>                 SOC_ALL,
>                 .name =3D "plld_dsi0",
