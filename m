Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FF5221A5A3
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jul 2020 19:17:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728278AbgGIRRR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Jul 2020 13:17:17 -0400
Received: from vps.xff.cz ([195.181.215.36]:52446 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727110AbgGIRRR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 9 Jul 2020 13:17:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1594315034; bh=3gV7jbp/PfKuXvsiiUXQuSbzC+4R90WKkgDUbSbOroA=;
        h=Date:From:To:Cc:Subject:References:X-My-GPG-KeyId:From;
        b=T8w15sgaUVglRVUStLjyOBe5kD6r6ILjnGJfRaIwX30oPX3HkV/WG0tir90B7u8Tn
         cwaI33E1ldqktkSPsiixkN2P9H9gkRxRVczxvTT/cGA3ybOv6S8vs2mflJ4EGQLURd
         IdchOT3qguFiAcjCF1YgaUueWR3ccklPvnTELtUM=
Date:   Thu, 9 Jul 2020 19:17:13 +0200
From:   =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To:     Frank Lee <frank@allwinnertech.com>
Cc:     robh+dt@kernel.org, mripard@kernel.org, wens@csie.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        gregory.clement@bootlin.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org,
        srinivas.kandagatla@linaro.org, linus.walleij@linaro.org,
        anarsoul@gmail.com, tiny.windzz@gmail.com, rui.zhang@intel.com,
        daniel.lezcano@linaro.org, amit.kucheria@verdurent.com,
        lee.jones@linaro.org, p.zabel@pengutronix.de, clabbe@baylibre.com,
        icenowy@aosc.io, stefan@olimex.com, bage@linutronix.de,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        liyong@allwinnertech.com, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, huangshuosheng@allwinnertech.com,
        linux-i2c@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 04/16] dt-bindings: pinctrl: sunxi: make gpio banks
 supplies required
Message-ID: <20200709171713.tutnlchji4e6i5pv@core.my.home>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
        Frank Lee <frank@allwinnertech.com>, robh+dt@kernel.org,
        mripard@kernel.org, wens@csie.org, mturquette@baylibre.com,
        sboyd@kernel.org, gregory.clement@bootlin.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org,
        srinivas.kandagatla@linaro.org, linus.walleij@linaro.org,
        anarsoul@gmail.com, tiny.windzz@gmail.com, rui.zhang@intel.com,
        daniel.lezcano@linaro.org, amit.kucheria@verdurent.com,
        lee.jones@linaro.org, p.zabel@pengutronix.de, clabbe@baylibre.com,
        icenowy@aosc.io, stefan@olimex.com, bage@linutronix.de,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        liyong@allwinnertech.com, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, huangshuosheng@allwinnertech.com,
        linux-i2c@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20200708071942.22595-1-frank@allwinnertech.com>
 <20200708071942.22595-5-frank@allwinnertech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200708071942.22595-5-frank@allwinnertech.com>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello,

On Wed, Jul 08, 2020 at 03:19:30PM +0800, Frank Lee wrote:
> Since we don't really have to care about the existing DT for boards,
> it would be great to make the gpio banks supplies required.

What if the borad doesn't use one of the banks? How would
I describe such a board if defining supplies for all banks
is required?

regards,
	o.

> Signed-off-by: Frank Lee <frank@allwinnertech.com>
> ---
>  .../devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml         | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
> index 226aba0..c30a7b7 100644
> --- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
> @@ -134,6 +134,7 @@ patternProperties:
>  required:
>    - "#gpio-cells"
>    - "#interrupt-cells"
> +  - "^vcc-p[a-hlm]-supply$"
>    - compatible
>    - reg
>    - interrupts
> -- 
> 1.9.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
