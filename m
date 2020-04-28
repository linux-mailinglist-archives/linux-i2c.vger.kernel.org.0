Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7730C1BDBF0
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Apr 2020 14:21:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726853AbgD2MVi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Apr 2020 08:21:38 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:34322 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726524AbgD2MVi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Apr 2020 08:21:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1588162894; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FKkgFmxpN+MKyPoHJp2q8jKr/zPjuo5QgcSt5/FFYlM=;
        b=BJYD6VCvJr5NwVsS7cOFPVRIp+PL1rfh/JKRMIwhc70MxSxy6RmNeVJyTjDxI2otmwhfoF
        5QbtopHXuozSQsDjZN9F9OWwYTZd5UwfXQ0K+IvDlG+ysvlppxwmEpMfsvZG77b8cbJhN1
        I+8+e8MCoetpBc/ro4H5h+TdvwLBKYA=
Date:   Tue, 28 Apr 2020 16:12:21 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 8/8] dt-bindings: display: Convert ingenic,lcd.txt to YAML
To:     Rob Herring <robh+dt@kernel.org>
Cc:     od@zcrc.me, =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-i2c@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-mips@vger.kernel.org
Message-Id: <LS4I9Q.A1ZGRSEVADNN1@crapouillou.net>
In-Reply-To: <20200426185856.38826-8-paul@crapouillou.net>
References: <20200426185856.38826-1-paul@crapouillou.net>
        <20200426185856.38826-8-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This one patch will need a V2, I messed up with the clocks.

-Paul


Le dim. 26 avril 2020 =E0 20:58, Paul Cercueil <paul@crapouillou.net> a=20
=E9crit :
> Convert the ingenic,lcd.txt to a new ingenic,lcd.yaml file.
>=20
> In the process, the new ingenic,jz4780-lcd compatible string has been
> added.
>=20
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  .../bindings/display/ingenic,lcd.txt          |  45 -------
>  .../bindings/display/ingenic,lcd.yaml         | 113=20
> ++++++++++++++++++
>  2 files changed, 113 insertions(+), 45 deletions(-)
>  delete mode 100644=20
> Documentation/devicetree/bindings/display/ingenic,lcd.txt
>  create mode 100644=20
> Documentation/devicetree/bindings/display/ingenic,lcd.yaml
>=20
> diff --git=20
> a/Documentation/devicetree/bindings/display/ingenic,lcd.txt=20
> b/Documentation/devicetree/bindings/display/ingenic,lcd.txt
> deleted file mode 100644
> index 01e3261defb6..000000000000
> --- a/Documentation/devicetree/bindings/display/ingenic,lcd.txt
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -Ingenic JZ47xx LCD driver
> -
> -Required properties:
> -- compatible: one of:
> -  * ingenic,jz4740-lcd
> -  * ingenic,jz4725b-lcd
> -  * ingenic,jz4770-lcd
> -- reg: LCD registers location and length
> -- clocks: LCD pixclock and device clock specifiers.
> -	   The device clock is only required on the JZ4740.
> -- clock-names: "lcd_pclk" and "lcd"
> -- interrupts: Specifies the interrupt line the LCD controller is=20
> connected to.
> -
> -Example:
> -
> -panel {
> -	compatible =3D "sharp,ls020b1dd01d";
> -
> -	backlight =3D <&backlight>;
> -	power-supply =3D <&vcc>;
> -
> -	port {
> -		panel_input: endpoint {
> -			remote-endpoint =3D <&panel_output>;
> -		};
> -	};
> -};
> -
> -
> -lcd: lcd-controller@13050000 {
> -	compatible =3D "ingenic,jz4725b-lcd";
> -	reg =3D <0x13050000 0x1000>;
> -
> -	interrupt-parent =3D <&intc>;
> -	interrupts =3D <31>;
> -
> -	clocks =3D <&cgu JZ4725B_CLK_LCD>;
> -	clock-names =3D "lcd";
> -
> -	port {
> -		panel_output: endpoint {
> -			remote-endpoint =3D <&panel_input>;
> -		};
> -	};
> -};
> diff --git=20
> a/Documentation/devicetree/bindings/display/ingenic,lcd.yaml=20
> b/Documentation/devicetree/bindings/display/ingenic,lcd.yaml
> new file mode 100644
> index 000000000000..8e9c851dc7c5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/ingenic,lcd.yaml
> @@ -0,0 +1,113 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/ingenic,lcd.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Ingenic SoCs LCD controller devicetree bindings
> +
> +maintainers:
> +  - Paul Cercueil <paul@crapouillou.net>
> +
> +properties:
> +  $nodename:
> +    pattern: "^lcd-controller@[0-9a-f]+$"
> +
> +  compatible:
> +    enum:
> +      - ingenic,jz4740-lcd
> +      - ingenic,jz4725b-lcd
> +      - ingenic,jz4770-lcd
> +      - ingenic,jz4780-lcd
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Module clock
> +      - description: Pixel clock
> +    minItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: lcd
> +      - const: lcd_pclk
> +    minItems: 1
> +
> +  port:
> +    type: object
> +    description:
> +      A port node with endpoint definitions as defined in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt
> +
> +required:
> +    - compatible
> +    - reg
> +    - interrupts
> +    - clocks
> +    - clock-names
> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - ingenic,jz4740-lcd
> +          - ingenic,jz4780-lcd
> +then:
> +  properties:
> +    clocks:
> +      minItems: 2
> +    clock-names:
> +      minItems: 2
> +else:
> +  properties:
> +    clocks:
> +      maxItems: 1
> +    clock-names:
> +      maxItems: 1
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/jz4740-cgu.h>
> +    lcd-controller@13050000 {
> +      compatible =3D "ingenic,jz4740-lcd";
> +      reg =3D <0x13050000 0x1000>;
> +
> +      interrupt-parent =3D <&intc>;
> +      interrupts =3D <30>;
> +
> +      clocks =3D <&cgu JZ4740_CLK_LCD>, <&cgu JZ4740_CLK_LCD_PCLK>;
> +      clock-names =3D "lcd", "lcd_pclk";
> +
> +      port {
> +        endpoint {
> +          remote-endpoint =3D <&panel_input>;
> +        };
> +      };
> +    };
> +
> +  - |
> +    #include <dt-bindings/clock/jz4725b-cgu.h>
> +    lcd-controller@13050000 {
> +      compatible =3D "ingenic,jz4725b-lcd";
> +      reg =3D <0x13050000 0x1000>;
> +
> +      interrupt-parent =3D <&intc>;
> +      interrupts =3D <31>;
> +
> +      clocks =3D <&cgu JZ4725B_CLK_LCD>;
> +      clock-names =3D "lcd";
> +
> +      port {
> +        endpoint {
> +          remote-endpoint =3D <&panel_input>;
> +        };
> +      };
> +    };
> --
> 2.26.2
>=20


