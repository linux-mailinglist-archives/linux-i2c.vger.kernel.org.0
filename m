Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ACF8357B2B
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Apr 2021 06:21:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbhDHEVg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Apr 2021 00:21:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbhDHEVd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Apr 2021 00:21:33 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6698C061761
        for <linux-i2c@vger.kernel.org>; Wed,  7 Apr 2021 21:21:22 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1lUMAT-00072i-9w; Thu, 08 Apr 2021 06:21:21 +0200
Received: from ore by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ore@pengutronix.de>)
        id 1lUMAS-0006iR-VQ; Thu, 08 Apr 2021 06:21:20 +0200
Date:   Thu, 8 Apr 2021 06:21:20 +0200
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] i2c: imx: mention Oleksij as maintainer of the binding
 docs
Message-ID: <20210408042120.szqkl7jg3yymrg3k@pengutronix.de>
References: <20210407183532.2682-1-wsa@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210407183532.2682-1-wsa@kernel.org>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 06:20:41 up 126 days, 18:27, 38 users,  load average: 0.15, 0.10,
 0.02
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Apr 07, 2021 at 08:35:32PM +0200, Wolfram Sang wrote:
> When I removed myself as a maintainer of the yaml file, I missed that
> some maintainer is required. Oleksij is already listed in MAINTAINERS
> for this file, so add him here as well.
> 
> Fixes: 1ae6b3780848 ("i2c: imx: drop me as maintainer of binding docs")
> Signed-off-by: Wolfram Sang <wsa@kernel.org>
> Cc: Oleksij Rempel <o.rempel@pengutronix.de>

Reviewed-by: Oleksij Rempel <o.rempel@pengutronix.de>

> ---
>  Documentation/devicetree/bindings/i2c/i2c-imx.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx.yaml b/Documentation/devicetree/bindings/i2c/i2c-imx.yaml
> index f33c6b29966b..3592d49235e0 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-imx.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-imx.yaml
> @@ -6,6 +6,9 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
>  title: Freescale Inter IC (I2C) and High Speed Inter IC (HS-I2C) for i.MX
>  
> +maintainers:
> +  - Oleksij Rempel <o.rempel@pengutronix.de>
> +
>  allOf:
>    - $ref: /schemas/i2c/i2c-controller.yaml#
>  
> -- 
> 2.29.2
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
