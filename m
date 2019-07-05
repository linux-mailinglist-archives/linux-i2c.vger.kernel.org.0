Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7CDF604F3
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jul 2019 13:01:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727158AbfGELBM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 5 Jul 2019 07:01:12 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:51568 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726921AbfGELBL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 5 Jul 2019 07:01:11 -0400
Received: from relay12.mail.gandi.net (unknown [217.70.178.232])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id BFF673A7062;
        Fri,  5 Jul 2019 10:34:21 +0000 (UTC)
Received: from localhost (alyon-656-1-672-152.w92-137.abo.wanadoo.fr [92.137.69.152])
        (Authenticated sender: gregory.clement@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 35AFF20000C;
        Fri,  5 Jul 2019 10:34:13 +0000 (UTC)
From:   Gregory CLEMENT <gregory.clement@bootlin.com>
To:     Maxime Ripard <maxime.ripard@bootlin.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 1/2] dt-bindings: i2c: mv64xxx: Fix the example compatible
In-Reply-To: <20190703095338.11266-1-maxime.ripard@bootlin.com>
References: <20190703095338.11266-1-maxime.ripard@bootlin.com>
Date:   Fri, 05 Jul 2019 12:34:12 +0200
Message-ID: <87k1cwg47v.fsf@FE-laptop>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Maxime Ripard <maxime.ripard@bootlin.com> writes:

> One example has a compatible that isn't a valid combination according to
> the binding, and now that the examples are validated as well, this
> generates a warning.
>
> Let's fix this.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>


Acked-by: Gregory CLEMENT <gregory.clement@bootlin.com>

Thanks,

Gregory

> ---
>  Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
> index 9a5654ef5670..001f2b7abad0 100644
> --- a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
> @@ -105,7 +105,7 @@ examples:
>  
>    - |
>      i2c@11000 {
> -        compatible = "marvell,mv78230-i2c", "marvell,mv64xxx-i2c";
> +        compatible = "marvell,mv78230-i2c";
>          reg = <0x11000 0x100>;
>          interrupts = <29>;
>          clock-frequency = <100000>;
> -- 
> 2.21.0
>

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
