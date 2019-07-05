Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E68F60492
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jul 2019 12:34:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727903AbfGEKef (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 5 Jul 2019 06:34:35 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:42139 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726116AbfGEKef (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 5 Jul 2019 06:34:35 -0400
Received: from localhost (alyon-656-1-672-152.w92-137.abo.wanadoo.fr [92.137.69.152])
        (Authenticated sender: gregory.clement@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 13D0C24000C;
        Fri,  5 Jul 2019 10:34:28 +0000 (UTC)
From:   Gregory CLEMENT <gregory.clement@bootlin.com>
To:     Maxime Ripard <maxime.ripard@bootlin.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 2/2] dt-bindings: i2c: sun6i-p2wi: Fix the binding example
In-Reply-To: <20190703095338.11266-2-maxime.ripard@bootlin.com>
References: <20190703095338.11266-1-maxime.ripard@bootlin.com> <20190703095338.11266-2-maxime.ripard@bootlin.com>
Date:   Fri, 05 Jul 2019 12:34:24 +0200
Message-ID: <87h880g47j.fsf@FE-laptop>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Maxime Ripard <maxime.ripard@bootlin.com> writes:

> Even though the binding claims that the frequency can go up to 6MHz, the
> common i2c binding sets a limit at 3MHz, which then triggers a warning.
>
> Since the only SoC that uses that bus uses a frequency of 100kHz, and that
> this bus hasn't been found in an SoC for something like 5 years, let's just
> fix the example to have a frequency within the acceptable range for i2c.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>

Acked-by: Gregory CLEMENT <gregory.clement@bootlin.com>

Thanks,

Gregory
> ---
>  .../devicetree/bindings/i2c/allwinner,sun6i-a31-p2wi.yaml       | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/i2c/allwinner,sun6i-a31-p2wi.yaml b/Documentation/devicetree/bindings/i2c/allwinner,sun6i-a31-p2wi.yaml
> index 1804abe24f14..f9d526b7da01 100644
> --- a/Documentation/devicetree/bindings/i2c/allwinner,sun6i-a31-p2wi.yaml
> +++ b/Documentation/devicetree/bindings/i2c/allwinner,sun6i-a31-p2wi.yaml
> @@ -51,7 +51,7 @@ examples:
>          reg = <0x01f03400 0x400>;
>          interrupts = <0 39 4>;
>          clocks = <&apb0_gates 3>;
> -        clock-frequency = <6000000>;
> +        clock-frequency = <100000>;
>          resets = <&apb0_rst 3>;
>          #address-cells = <1>;
>          #size-cells = <0>;
> -- 
> 2.21.0
>

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
