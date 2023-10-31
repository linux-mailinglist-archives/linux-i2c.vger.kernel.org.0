Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6001A7DD42F
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Oct 2023 18:07:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343698AbjJaRH3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Oct 2023 13:07:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236535AbjJaRHR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 Oct 2023 13:07:17 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14A03D63;
        Tue, 31 Oct 2023 10:06:13 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ACCDC433C7;
        Tue, 31 Oct 2023 17:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698771972;
        bh=IURdf+ELaMvBNjQ4JtTI42ePYhUeSVb18qPrqHz3arw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uIbPNRXpRvaa7V97Idx9HyKSfMSIIW0Six+5xZQeNIen57cDoX4WBjuIwP/WhYdzN
         bv1IleATgdUjejRfGBsPGttyyceo4hVQPsECH+/Z6H8WWHIBJA040qPp/nm6pXppby
         ovav7AninKn018A3P1GLs+aL/5HH6CkeSKmECkjBXDGpnVVm/IZxBYNir8zT9mK/AG
         tnXkDYQ+lAd7AE3x07prQWEcb//gEq5PbowbqjyV0FZD064B2DL0iZdQnx1pWu/Cpl
         HWPvZygc8n3KYb0puWS3JUE7jLi/fJf+VI5fnrikA53DwVaejdhcZ6fsFSjbI8hVuL
         dv3OiY80X+Haw==
Date:   Tue, 31 Oct 2023 17:06:07 +0000
From:   Conor Dooley <conor@kernel.org>
To:     Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
Cc:     patrick@stwcx.xyz, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-i2c@vger.kernel.org,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: Add lltc ltc4286 driver
 bindings
Message-ID: <20231031-sneeze-zoom-8fdb3ccebd25@spud>
References: <20231031072124.201181-1-Delphine_CC_Chiu@Wiwynn.com>
 <20231031072124.201181-2-Delphine_CC_Chiu@Wiwynn.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="f94SAZhlDIXtJjhr"
Content-Disposition: inline
In-Reply-To: <20231031072124.201181-2-Delphine_CC_Chiu@Wiwynn.com>
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--f94SAZhlDIXtJjhr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 31, 2023 at 03:21:21PM +0800, Delphine CC Chiu wrote:
> Add a device tree bindings for ltc4286 device.
>=20
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
>=20
> Changelog:
>   v3 - Revise adi,vrange-select-25p6 to adi,vrange-low-enable
>   v2 - Revise vrange_select_25p6 to adi,vrange-select-25p6
>      - Add type for adi,vrange-select-25p6
>      - Revise rsense-micro-ohms to shunt-resistor-micro-ohms
> ---
>  .../bindings/hwmon/lltc,ltc4286.yaml          | 52 +++++++++++++++++++
>  MAINTAINERS                                   | 10 ++++
>  2 files changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/lltc,ltc4286.=
yaml
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml b/=
Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
> new file mode 100644
> index 000000000000..4695bca77c05
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/lltc,ltc4286.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LTC4286 power monitors
> +
> +maintainers:
> +  - Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - lltc,ltc4286
> +      - lltc,ltc4287
> +
> +  reg:
> +    maxItems: 1
> +
> +  adi,vrange-low-enable:
> +    description:
> +      This property is a bool parameter to represent the
> +      voltage range is 25.6 volts or 102.4 volts for
> +      this chip.
> +      The default is 102.4 volts.

You've got weird wrapping of text here (short lines). Either this
property or the corollary work for me, depending on what Guenter
wants. With two nits below,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>


> +    type: boolean
> +
> +  shunt-resistor-micro-ohms:
> +    description:
> +      Resistor value in micro-Ohm

micro-ohms

> +
> +required:
> +  - compatible
> +  - reg
> +  - shunt-resistor-micro-ohms
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        power-sensor@40 {

the generic node name is "power-monitor".

Cheers,
Conor.

--f94SAZhlDIXtJjhr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZUEz/wAKCRB4tDGHoIJi
0nsPAPwMsm8WDMU9Aj1pA51Pw3mApuz03WqNCT0Y9+VAvpRndwD+LFNjRUGoV/sP
lReVzQpXC55/MqJaHLpSmwwrgf6fKw0=
=2uTo
-----END PGP SIGNATURE-----

--f94SAZhlDIXtJjhr--
