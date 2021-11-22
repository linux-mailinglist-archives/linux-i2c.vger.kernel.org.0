Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F15234597C7
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Nov 2021 23:39:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232220AbhKVWmV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Nov 2021 17:42:21 -0500
Received: from sibelius.xs4all.nl ([83.163.83.176]:55974 "EHLO
        sibelius.xs4all.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233768AbhKVWmV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Nov 2021 17:42:21 -0500
Received: from localhost (bloch.sibelius.xs4all.nl [local])
        by bloch.sibelius.xs4all.nl (OpenSMTPD) with ESMTPA id cdd96034;
        Mon, 22 Nov 2021 23:39:12 +0100 (CET)
Date:   Mon, 22 Nov 2021 23:39:12 +0100 (CET)
From:   Mark Kettenis <mark.kettenis@xs4all.nl>
To:     Janne Grunau <j@jannau.net>
Cc:     marcan@marcan.st, sven@svenpeter.dev, alyssa@rosenzweig.io,
        robh+dt@kernel.org, wsa@kernel.org, olof@lixom.net, arnd@arndb.de,
        kettenis@openbsd.org, robh@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20211122222440.21177-3-j@jannau.net> (message from Janne Grunau
        on Mon, 22 Nov 2021 23:24:39 +0100)
Subject: Re: [PATCH v2 2/3] dt-bindings: i2c: apple,i2c: allow multiple compatibles
References: <20211122222440.21177-1-j@jannau.net> <20211122222440.21177-3-j@jannau.net>
Message-ID: <d3caf42a8fea181b@bloch.sibelius.xs4all.nl>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> From: Janne Grunau <j@jannau.net>
> Date: Mon, 22 Nov 2021 23:24:39 +0100
> 
> The intention was to have a SoC-specific and base compatible string
> to allow forward compatibility and SoC specific quirks,
> 
> Fixes: df7c4a8c1b47 ("dt-bindings: i2c: Add Apple I2C controller bindings")
> Signed-off-by: Janne Grunau <j@jannau.net>
> Cc: Mark Kettenis <kettenis@openbsd.org>
> Reviewed-by: Sven Peter <sven@svenpeter.dev>

Reviewed-by: Mark Kettenis <kettenis@openbsd.org>

> ---
>  Documentation/devicetree/bindings/i2c/apple,i2c.yaml | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/apple,i2c.yaml b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
> index 22fc8483256f..82b953181a52 100644
> --- a/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
> @@ -20,9 +20,9 @@ allOf:
>  
>  properties:
>    compatible:
> -    enum:
> -      - apple,t8103-i2c
> -      - apple,i2c
> +    items:
> +      - const: apple,t8103-i2c
> +      - const: apple,i2c
>  
>    reg:
>      maxItems: 1
> @@ -51,7 +51,7 @@ unevaluatedProperties: false
>  examples:
>    - |
>      i2c@35010000 {
> -      compatible = "apple,t8103-i2c";
> +      compatible = "apple,t8103-i2c", "apple,i2c";
>        reg = <0x35010000 0x4000>;
>        interrupt-parent = <&aic>;
>        interrupts = <0 627 4>;
> -- 
> 2.34.0
> 
> 
