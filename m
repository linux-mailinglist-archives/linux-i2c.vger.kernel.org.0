Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32DC8474190
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Dec 2021 12:37:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233595AbhLNLhm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Dec 2021 06:37:42 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:36570 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233581AbhLNLhm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Dec 2021 06:37:42 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C37BF8C4;
        Tue, 14 Dec 2021 12:37:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1639481861;
        bh=DWeOCNpggrbSb7+1z1pPA/5lS6KWoeYABLFQPY3a7KY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZzMkQC39hzgoC2iHZ8/SF/9S0YLZszWJ4p3ihJj5cRfp34DIi0kc8O4W/do7bO2k2
         RUZ8tG+L6xF8KYSoi4r9puRcRHN09zGj40XzBy6D1ekD+uJsTAE793d6ZaIVC7gqcx
         U5nD9B+xZIUYpJcgTnA01X+jnCkic03DQJy3Qa8Q=
Date:   Tue, 14 Dec 2021 13:37:39 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Patrick Rudolph <patrick.rudolph@9elements.com>
Cc:     Peter Rosin <peda@axentia.se>, Rob Herring <robh+dt@kernel.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: i2c Add regulator to pca954x
Message-ID: <YbiCA3ryjof0hDXe@pendragon.ideasonboard.com>
References: <20211214095021.572799-1-patrick.rudolph@9elements.com>
 <20211214095021.572799-3-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211214095021.572799-3-patrick.rudolph@9elements.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Patrick,

Thank you for the patch.

On Tue, Dec 14, 2021 at 10:50:20AM +0100, Patrick Rudolph wrote:
> Add a regulator called vcc and update the example.
> 
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> index bd794cb80c11..5add7db02c0c 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> @@ -64,6 +64,9 @@ properties:
>      description: if present, overrides i2c-mux-idle-disconnect
>      $ref: /schemas/mux/mux-controller.yaml#/properties/idle-state
>  
> +  vcc-supply:
> +    description: An optional voltage regulator supplying power to the chip.

The NXP datasheet names the supply VDD, could we use vdd-supply here ? I
also wouldn't call it ooptional (even if it effectively is from a DT
point of view as the property isn't listed as required), given that the
power supply isn't optional for the chip to function. How about the
following ?

  vdd-supply:
    description: The voltage regulator powering to the VDD supply.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
>  required:
>    - compatible
>    - reg
> @@ -84,6 +87,8 @@ examples:
>              #size-cells = <0>;
>              reg = <0x74>;
>  
> +            vcc-supply = <&p3v3>;
> +
>              interrupt-parent = <&ipic>;
>              interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
>              interrupt-controller;

-- 
Regards,

Laurent Pinchart
