Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 558EF56685C
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Jul 2022 12:42:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232503AbiGEKmZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Jul 2022 06:42:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232702AbiGEKmO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Jul 2022 06:42:14 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5B9B415FD5;
        Tue,  5 Jul 2022 03:42:13 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 725AE2B;
        Tue,  5 Jul 2022 03:42:13 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DFC033F792;
        Tue,  5 Jul 2022 03:42:11 -0700 (PDT)
Date:   Tue, 5 Jul 2022 11:42:09 +0100
From:   Andre Przywara <andre.przywara@arm.com>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Wolfram Sang <wsa@kernel.org>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: i2c: mv64xxx: Add variants with
 offload support
Message-ID: <20220705114209.69193017@donnerap.cambridge.arm.com>
In-Reply-To: <20220702052544.31443-1-samuel@sholland.org>
References: <20220702052544.31443-1-samuel@sholland.org>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat,  2 Jul 2022 00:25:42 -0500
Samuel Holland <samuel@sholland.org> wrote:

Hi,

> V536 and newer Allwinner SoCs contain an updated I2C controller which
> includes an offload engine for master mode. The controller retains the
> existing register interface, so the A31 compatible still applies.
> 
> Add the V536 compatible and use it as a fallback for other SoCs with the
> updated hardware. This includes two SoCs that were already documented
> (H616 and A100) and two new SoCs (R329 and D1).
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

That seems correct to me: I couldn't get hold of manuals of some of the new
SoCs, but at least the D1 and H616 indeed add an extra set of registers
for this "TWI driver" offload engine. But the basic operation is still
supported, so the two fallbacks make sense.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
> 
>  .../devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml   | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
> index f771c09aabfc..0ec033e48830 100644
> --- a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
> @@ -21,10 +21,18 @@ properties:
>            - enum:
>                - allwinner,sun8i-a23-i2c
>                - allwinner,sun8i-a83t-i2c
> +              - allwinner,sun8i-v536-i2c
>                - allwinner,sun50i-a64-i2c
> -              - allwinner,sun50i-a100-i2c
>                - allwinner,sun50i-h6-i2c
> +          - const: allwinner,sun6i-a31-i2c
> +      - description: Allwinner SoCs with offload support
> +        items:
> +          - enum:
> +              - allwinner,sun20i-d1-i2c
> +              - allwinner,sun50i-a100-i2c
>                - allwinner,sun50i-h616-i2c
> +              - allwinner,sun50i-r329-i2c
> +          - const: allwinner,sun8i-v536-i2c
>            - const: allwinner,sun6i-a31-i2c
>        - const: marvell,mv64xxx-i2c
>        - const: marvell,mv78230-i2c

