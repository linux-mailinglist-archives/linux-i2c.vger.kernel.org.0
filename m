Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F3F949598A
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jan 2022 06:43:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233558AbiAUFn1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Jan 2022 00:43:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233439AbiAUFn0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Jan 2022 00:43:26 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED29AC061574
        for <linux-i2c@vger.kernel.org>; Thu, 20 Jan 2022 21:43:25 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1nAmhg-00054s-96; Fri, 21 Jan 2022 06:43:16 +0100
Received: from ore by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1nAmhe-0005Kh-NF; Fri, 21 Jan 2022 06:43:14 +0100
Date:   Fri, 21 Jan 2022 06:43:14 +0100
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Rob Herring <robh@kernel.org>
Cc:     Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: imx: Make each example a separate entry
Message-ID: <20220121054314.GA19904@pengutronix.de>
References: <20220119015253.2437352-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220119015253.2437352-1-robh@kernel.org>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 06:41:46 up 41 days, 14:27, 46 users,  load average: 0.29, 0.31,
 0.18
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jan 18, 2022 at 07:52:53PM -0600, Rob Herring wrote:
> Each independent example should be a separate entry. This allows for
> 'interrupts' to have different cell sizes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Oleksij Rempel <o.rempel@pengutronix.de>

Thank you!

> ---
>  Documentation/devicetree/bindings/i2c/i2c-imx.yaml | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx.yaml b/Documentation/devicetree/bindings/i2c/i2c-imx.yaml
> index c167958ae2a9..01720e338b4c 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-imx.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-imx.yaml
> @@ -88,9 +88,7 @@ unevaluatedProperties: false
>  examples:
>    - |
>      #include <dt-bindings/clock/imx5-clock.h>
> -    #include <dt-bindings/clock/vf610-clock.h>
> -    #include <dt-bindings/gpio/gpio.h>
> -    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
>  
>      i2c@83fc4000 {
>          compatible = "fsl,imx51-i2c", "fsl,imx21-i2c";
> @@ -99,6 +97,9 @@ examples:
>          clocks = <&clks IMX5_CLK_I2C2_GATE>;
>      };
>  
> +  - |
> +    #include <dt-bindings/clock/vf610-clock.h>
> +
>      i2c@40066000 {
>          compatible = "fsl,vf610-i2c";
>          reg = <0x40066000 0x1000>;
> -- 
> 2.32.0
> 
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
