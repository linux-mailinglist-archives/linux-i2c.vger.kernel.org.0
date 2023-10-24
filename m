Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5352B7D5908
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Oct 2023 18:44:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343914AbjJXQoJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Oct 2023 12:44:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343847AbjJXQoI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Oct 2023 12:44:08 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DE6593;
        Tue, 24 Oct 2023 09:44:06 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA18BC433C8;
        Tue, 24 Oct 2023 16:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698165845;
        bh=r07UHKkl86rdMpQ7rTOkyf3+czc76gYAgS9XGHFVCgs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BjtMEDC1HKl7I9RiMkoZqP1/cuqwYFg0wcLdGPwf0n6F6QOL7EvTLUWXvIe4J/H78
         dHiEXAYnptg3E/wOLz3X9l0vMkoYOhkajpfiFDhUYxReRg6SwY/43tV8QPorP3uFgZ
         8YbdvvYI283Spzw16g73UC1ShiPp53IT9yf3nksBSaOEUTDm80B7oyKW+BNpAYUOjv
         sfL91f+jMRTVwCebNLllgnI4idwMyB+/NZP2nf3wI/Kf21PLwaftd61sIGzjFwPY5E
         tYs3GrHMpmBhsHtnD+hQwvQ9tGgcZr9mpGro1YkE0+5Rsj/xUxuP6ZgolbfjrrjvYV
         0slMjgarQG4AQ==
Date:   Tue, 24 Oct 2023 17:44:01 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: i2c-demux-pinctrl: Convert to
 json-schema
Message-ID: <20231024-extinct-mummy-d015dad84a9d@spud>
References: <28c173dfbbc17403b0c5a6f27661d7bd33a86f84.1698068607.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hNENZ+3onzk9rqVp"
Content-Disposition: inline
In-Reply-To: <28c173dfbbc17403b0c5a6f27661d7bd33a86f84.1698068607.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--hNENZ+3onzk9rqVp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 23, 2023 at 03:53:00PM +0200, Geert Uytterhoeven wrote:
> Convert the pinctrl-based I2C bus demultiplexer Device Tree binding
> documentation to json-schema.
>=20
> Update the example to match reality.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

This conversion seems fine to me.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
> The example includes changes from "[PATCH 0/3] dts: renesas: Fix I2C bus
> demux node names and ADV751[13] power supplies"
> (https://lore.kernel.org/r/cover.1698068646.git.geert+renesas@glider.be)
>=20
>  .../bindings/i2c/i2c-demux-pinctrl.txt        | 135 --------------
>  .../bindings/i2c/i2c-demux-pinctrl.yaml       | 172 ++++++++++++++++++
>  2 files changed, 172 insertions(+), 135 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-demux-pinct=
rl.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-demux-pinct=
rl.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-demux-pinctrl.txt =
b/Documentation/devicetree/bindings/i2c/i2c-demux-pinctrl.txt
> deleted file mode 100644
> index 86b2e433a969013c..0000000000000000
> --- a/Documentation/devicetree/bindings/i2c/i2c-demux-pinctrl.txt
> +++ /dev/null
> @@ -1,135 +0,0 @@
> -Pinctrl-based I2C Bus DeMux
> -
> -This binding describes an I2C bus demultiplexer that uses pin multiplexi=
ng to
> -route the I2C signals, and represents the pin multiplexing configuration=
 using
> -the pinctrl device tree bindings. This may be used to select one I2C IP =
core at
> -runtime which may have a better feature set for a given task than anothe=
r I2C
> -IP core on the SoC. The most simple example is to fall back to GPIO bitb=
anging
> -if your current runtime configuration hits an errata of the internal IP =
core.
> -
> -    +-------------------------------+
> -    | SoC                           |
> -    |                               |   +-----+  +-----+
> -    |   +------------+              |   | dev |  | dev |
> -    |   |I2C IP Core1|--\           |   +-----+  +-----+
> -    |   +------------+   \-------+  |      |        |
> -    |                    |Pinctrl|--|------+--------+
> -    |   +------------+   +-------+  |
> -    |   |I2C IP Core2|--/           |
> -    |   +------------+              |
> -    |                               |
> -    +-------------------------------+
> -
> -Required properties:
> -- compatible: "i2c-demux-pinctrl"
> -- i2c-parent: List of phandles of I2C masters available for selection. T=
he first
> -	      one will be used as default.
> -- i2c-bus-name: The name of this bus. Also needed as pinctrl-name for th=
e I2C
> -		parents.
> -
> -Furthermore, I2C mux properties and child nodes. See i2c-mux.yaml in this
> -directory.
> -
> -Example:
> -
> -Here is a snipplet for a bus to be demuxed. It contains various i2c clie=
nts for
> -HDMI, so the bus is named "i2c-hdmi":
> -
> -	i2chdmi: i2c@8 {
> -
> -		compatible =3D "i2c-demux-pinctrl";
> -		i2c-parent =3D <&gpioi2c>, <&iic2>, <&i2c2>;
> -		i2c-bus-name =3D "i2c-hdmi";
> -		#address-cells =3D <1>;
> -		#size-cells =3D <0>;
> -
> -		ak4643: sound-codec@12 {
> -			compatible =3D "asahi-kasei,ak4643";
> -
> -			#sound-dai-cells =3D <0>;
> -			reg =3D <0x12>;
> -		};
> -
> -		composite-in@20 {
> -			compatible =3D "adi,adv7180";
> -			reg =3D <0x20>;
> -			remote =3D <&vin1>;
> -
> -			port {
> -				adv7180: endpoint {
> -					bus-width =3D <8>;
> -					remote-endpoint =3D <&vin1ep0>;
> -				};
> -			};
> -		};
> -
> -		hdmi@39 {
> -			compatible =3D "adi,adv7511w";
> -			reg =3D <0x39>;
> -			interrupt-parent =3D <&gpio1>;
> -			interrupts =3D <15 IRQ_TYPE_LEVEL_LOW>;
> -
> -			adi,input-depth =3D <8>;
> -			adi,input-colorspace =3D "rgb";
> -			adi,input-clock =3D "1x";
> -			adi,input-style =3D <1>;
> -			adi,input-justification =3D "evenly";
> -
> -			ports {
> -				#address-cells =3D <1>;
> -				#size-cells =3D <0>;
> -
> -				port@0 {
> -					reg =3D <0>;
> -					adv7511_in: endpoint {
> -						remote-endpoint =3D <&du_out_lvds0>;
> -					};
> -				};
> -
> -				port@1 {
> -					reg =3D <1>;
> -					adv7511_out: endpoint {
> -						remote-endpoint =3D <&hdmi_con>;
> -					};
> -				};
> -			};
> -		};
> -	};
> -
> -And for clarification, here are the snipplets for the i2c-parents:
> -
> -	gpioi2c: i2c@9 {
> -		#address-cells =3D <1>;
> -		#size-cells =3D <0>;
> -		compatible =3D "i2c-gpio";
> -		gpios =3D <&gpio5 6 GPIO_ACTIVE_HIGH /* sda */
> -			 &gpio5 5 GPIO_ACTIVE_HIGH /* scl */
> -			>;
> -		i2c-gpio,delay-us =3D <5>;
> -	};
> -
> -...
> -
> -&i2c2	{
> -	pinctrl-0 =3D <&i2c2_pins>;
> -	pinctrl-names =3D "i2c-hdmi";
> -
> -	clock-frequency =3D <100000>;
> -};
> -
> -...
> -
> -&iic2	{
> -	pinctrl-0 =3D <&iic2_pins>;
> -	pinctrl-names =3D "i2c-hdmi";
> -
> -	clock-frequency =3D <100000>;
> -};
> -
> -Please note:
> -
> -- pinctrl properties for the parent I2C controllers need a pinctrl state
> -  with the same name as i2c-bus-name, not "default"!
> -
> -- the i2c masters must have their status "disabled". This driver will
> -  enable them at runtime when needed.
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-demux-pinctrl.yaml=
 b/Documentation/devicetree/bindings/i2c/i2c-demux-pinctrl.yaml
> new file mode 100644
> index 0000000000000000..2c08f2a7cf1ee28c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/i2c-demux-pinctrl.yaml
> @@ -0,0 +1,172 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/i2c-demux-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Pinctrl-based I2C Bus Demultiplexer
> +
> +maintainers:
> +  - Wolfram Sang <wsa+renesas@sang-engineering.com>
> +
> +description: |
> +  This binding describes an I2C bus demultiplexer that uses pin multiple=
xing to
> +  route the I2C signals, and represents the pin multiplexing configurati=
on
> +  using the pinctrl device tree bindings.  This may be used to select on=
e I2C
> +  IP core at runtime which may have a better feature set for a given tas=
k than
> +  another I2C IP core on the SoC.  The most simple example is to fall ba=
ck to
> +  GPIO bitbanging if your current runtime configuration hits an errata o=
f the
> +  internal IP core.
> +
> +      +-------------------------------+
> +      | SoC                           |
> +      |                               |   +-----+  +-----+
> +      |   +------------+              |   | dev |  | dev |
> +      |   |I2C IP Core1|--\           |   +-----+  +-----+
> +      |   +------------+   \-------+  |      |        |
> +      |                    |Pinctrl|--|------+--------+
> +      |   +------------+   +-------+  |
> +      |   |I2C IP Core2|--/           |
> +      |   +------------+              |
> +      |                               |
> +      +-------------------------------+
> +
> +allOf:
> +  - $ref: i2c-mux.yaml
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: i2c-demux-pinctrl
> +
> +  i2c-parent:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description:
> +      List of phandles of I2C masters available for selection.  The firs=
t one
> +      will be used as default.
> +
> +  i2c-bus-name:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description:
> +      The name of this bus.  Also needed as pinctrl-name for the I2C par=
ents.
> +
> +required:
> +  - compatible
> +  - i2c-parent
> +  - i2c-bus-name
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    gpioi2c2: i2c-9 {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +        compatible =3D "i2c-gpio";
> +        scl-gpios =3D <&gpio5 5 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +        sda-gpios =3D <&gpio5 6 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +        i2c-gpio,delay-us =3D <5>;
> +
> +        // The I2C controller must have its status "disabled".  The I2C =
bus
> +        // demultiplexer will enable it at runtime when needed.
> +        status =3D "disabled";
> +    };
> +
> +    iic2: i2c@e6520000 {
> +        reg =3D <0xe6520000 0x425>;
> +        pinctrl-0 =3D <&iic2_pins>;
> +        // The pinctrl property for the parent I2C controller needs a pi=
nctrl
> +        // state with the same name as i2c-bus-name in the I2C bus demul=
tiplexer
> +        // node, not "default"!
> +        pinctrl-names =3D "i2c-hdmi";
> +
> +        clock-frequency =3D <100000>;
> +
> +        // The I2C controller must have its status "disabled".  The I2C =
bus
> +        // demultiplexer will enable it at runtime when needed.
> +        status =3D "disabled";
> +    };
> +
> +    i2c2: i2c@e6530000 {
> +        reg =3D <0 0xe6530000 0 0x40>;
> +        pinctrl-0 =3D <&i2c2_pins>;
> +        // The pinctrl property for the parent I2C controller needs a pi=
nctrl
> +        // state with the same name as i2c-bus-name in the I2C bus demul=
tiplexer
> +        // node, not "default"!
> +        pinctrl-names =3D "i2c-hdmi";
> +
> +        clock-frequency =3D <100000>;
> +
> +        // The I2C controller must have its status "disabled".  The I2C =
bus
> +        // demultiplexer will enable it at runtime when needed.
> +        status =3D "disabled";
> +    };
> +
> +    // Example for a bus to be demuxed.  It contains various I2C clients=
 for
> +    // HDMI, so the bus is named "i2c-hdmi":
> +    i2chdmi: i2c-mux3 {
> +            compatible =3D "i2c-demux-pinctrl";
> +            i2c-parent =3D <&iic2>, <&i2c2>, <&gpioi2c2>;
> +            i2c-bus-name =3D "i2c-hdmi";
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +
> +            ak4643: codec@12 {
> +                    compatible =3D "asahi-kasei,ak4643";
> +                    #sound-dai-cells =3D <0>;
> +                    reg =3D <0x12>;
> +            };
> +
> +            composite-in@20 {
> +                    compatible =3D "adi,adv7180";
> +                    reg =3D <0x20>;
> +
> +                    port {
> +                            adv7180: endpoint {
> +                                    bus-width =3D <8>;
> +                                    remote-endpoint =3D <&vin1ep0>;
> +                            };
> +                    };
> +            };
> +
> +            hdmi@39 {
> +                    compatible =3D "adi,adv7511w";
> +                    reg =3D <0x39>;
> +                    interrupt-parent =3D <&gpio1>;
> +                    interrupts =3D <15 IRQ_TYPE_LEVEL_LOW>;
> +                    clocks =3D <&cec_clock>;
> +                    clock-names =3D "cec";
> +
> +                    avdd-supply =3D <&fixedregulator1v8>;
> +                    dvdd-supply =3D <&fixedregulator1v8>;
> +                    pvdd-supply =3D <&fixedregulator1v8>;
> +                    dvdd-3v-supply =3D <&fixedregulator3v3>;
> +                    bgvdd-supply =3D <&fixedregulator1v8>;
> +
> +                    adi,input-depth =3D <8>;
> +                    adi,input-colorspace =3D "rgb";
> +                    adi,input-clock =3D "1x";
> +
> +                    ports {
> +                            #address-cells =3D <1>;
> +                            #size-cells =3D <0>;
> +
> +                            port@0 {
> +                                    reg =3D <0>;
> +                                    adv7511_in: endpoint {
> +                                            remote-endpoint =3D <&lvds0_=
out>;
> +                                    };
> +                            };
> +
> +                            port@1 {
> +                                    reg =3D <1>;
> +                                    adv7511_out: endpoint {
> +                                            remote-endpoint =3D <&hdmi_c=
on_out>;
> +                                    };
> +                            };
> +                    };
> +            };
> +    };
> --=20
> 2.34.1
>=20

--hNENZ+3onzk9rqVp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTf0UQAKCRB4tDGHoIJi
0rIYAP9mphufOriWvXiRrx0VtN5ljnDxao9zO6Um/QraSH2usAD/X+YQaZjZSX1X
PNyswoJxGeUxK6gHYtX/Rl7FE8hs2Qw=
=x4F7
-----END PGP SIGNATURE-----

--hNENZ+3onzk9rqVp--
