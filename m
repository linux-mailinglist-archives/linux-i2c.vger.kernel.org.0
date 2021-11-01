Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54A01441416
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Nov 2021 08:20:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229827AbhKAHXW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Nov 2021 03:23:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbhKAHXV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 1 Nov 2021 03:23:21 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73421C061714
        for <linux-i2c@vger.kernel.org>; Mon,  1 Nov 2021 00:20:48 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1mhRcT-0001Xl-0S; Mon, 01 Nov 2021 08:20:37 +0100
Received: from ore by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1mhRcP-00016X-2V; Mon, 01 Nov 2021 08:20:33 +0100
Date:   Mon, 1 Nov 2021 08:20:33 +0100
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     David Heidelberg <david@ixit.cz>
Cc:     Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        ~okias/devicetree@lists.sr.ht, Rob Herring <robh@kernel.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: imx: hardware do not restrict
 clock-frequency to only 100 and 400 kHz
Message-ID: <20211101072033.GG20681@pengutronix.de>
References: <20211029141134.66170-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211029141134.66170-1-david@ixit.cz>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 08:19:52 up 256 days, 10:43, 105 users,  load average: 0.01, 0.10,
 0.14
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Oct 29, 2021 at 04:11:33PM +0200, David Heidelberg wrote:
> clock-frequency is only restricted by the upper limit of 400 kHz.
> 
> Found with:
> $ DT_SCHEMA_FILES=Documentation/devicetree/bindings/i2c/i2c-imx.yaml make dtbs_check
> ...
> arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dt.yaml: i2c@30a20000: clock-frequency:0:0: 387000 is not one of [100000, 400000]
> 	From schema: linux/Documentation/devicetree/bindings/i2c/i2c-imx.yaml
> ...
> 
> Fixes: 4bdc44347299 ("dt-bindings: i2c: Convert imx i2c to json-schema")
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Oleksij Rempel <o.rempel@pengutronix.de>

Thank you!

> ---
>  Documentation/devicetree/bindings/i2c/i2c-imx.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx.yaml b/Documentation/devicetree/bindings/i2c/i2c-imx.yaml
> index 3592d49235e0..c167958ae2a9 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-imx.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-imx.yaml
> @@ -57,7 +57,9 @@ properties:
>      const: ipg
>  
>    clock-frequency:
> -    enum: [ 100000, 400000 ]
> +    minimum: 1
> +    default: 100000
> +    maximum: 400000
>  
>    dmas:
>      items:
> -- 
> 2.33.0
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
