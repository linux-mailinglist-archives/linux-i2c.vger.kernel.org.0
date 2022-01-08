Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 288F14886DF
	for <lists+linux-i2c@lfdr.de>; Sun,  9 Jan 2022 00:17:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233360AbiAHXR2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 8 Jan 2022 18:17:28 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:58476 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229761AbiAHXR1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 8 Jan 2022 18:17:27 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AC352A1B;
        Sun,  9 Jan 2022 00:17:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1641683845;
        bh=+beRkjOj8CLbVI7wLsj7Ibj+p/hURCH6exnOF8hVnbc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Cx/Nd57XLymu9eXJPMwszq9UpDsNzan2ux0lpOq+2onbYNyOIfIRDfVfMHrGDvJ1W
         FvlE634RPJ/SrK7hGhEC5fmiKCCP/D9+cpoTHVwRQHjFwjnw4vs40l+lwfxfacF5dl
         1DOhAiVn4PckbIKKN7eWYfMfEmAXRSDDNx86JknA=
Date:   Sun, 9 Jan 2022 01:17:17 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Patrick Rudolph <patrick.rudolph@9elements.com>
Cc:     Peter Rosin <peda@axentia.se>, Rob Herring <robh+dt@kernel.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] dt-bindings: i2c: Add regulator to pca954x and
 max735x
Message-ID: <YdobffwaGYmLwRjW@pendragon.ideasonboard.com>
References: <20220108185759.2086347-1-patrick.rudolph@9elements.com>
 <20220108185759.2086347-4-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220108185759.2086347-4-patrick.rudolph@9elements.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Patrick,

Thank you for the patch.

On Sat, Jan 08, 2022 at 07:57:57PM +0100, Patrick Rudolph wrote:
> Add a regulator called vdd also present in datasheets of PCA954x
> and MAX735x and update the examples.
> 
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-mux-max735x.yaml | 5 +++++
>  Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml | 5 +++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-max735x.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-max735x.yaml
> index dc924ec934ca..93eda07718e8 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mux-max735x.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mux-max735x.yaml
> @@ -57,6 +57,9 @@ properties:
>      description: if present, overrides i2c-mux-idle-disconnect
>      $ref: /schemas/mux/mux-controller.yaml#/properties/idle-state
>  
> +  vdd-supply:
> +    description: A voltage regulator supplying power to the chip.
> +
>  required:
>    - compatible
>    - reg
> @@ -75,6 +78,8 @@ examples:
>              #size-cells = <0>;
>              reg = <0x74>;
>  
> +            vdd-supply = <&p3v3>;
> +
>              i2c@1 {
>                  #address-cells = <1>;
>                  #size-cells = <0>;

This should be part of patch 1/4 (or better in my opinion, the two
binding files should be merged into a single one).

> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> index 9f1726d0356b..b28d05dc956d 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> @@ -59,6 +59,9 @@ properties:
>      description: if present, overrides i2c-mux-idle-disconnect
>      $ref: /schemas/mux/mux-controller.yaml#/properties/idle-state
>  
> +  vdd-supply:
> +    description: A voltage regulator supplying power to the chip.
> +
>  required:
>    - compatible
>    - reg
> @@ -79,6 +82,8 @@ examples:
>              #size-cells = <0>;
>              reg = <0x74>;
>  
> +            vdd-supply = <&p3v3>;
> +
>              interrupt-parent = <&ipic>;
>              interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
>              interrupt-controller;

For this part,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-- 
Regards,

Laurent Pinchart
