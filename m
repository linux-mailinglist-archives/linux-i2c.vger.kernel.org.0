Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3B1C4A5829
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Feb 2022 08:58:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231873AbiBAH6t (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Feb 2022 02:58:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234759AbiBAH6t (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Feb 2022 02:58:49 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59F6AC061714
        for <linux-i2c@vger.kernel.org>; Mon, 31 Jan 2022 23:58:49 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1nEo3e-00046y-6s; Tue, 01 Feb 2022 08:58:34 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nEo3V-00Dmxz-QK; Tue, 01 Feb 2022 08:58:25 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nEo3U-002kWK-5c; Tue, 01 Feb 2022 08:58:24 +0100
Date:   Tue, 1 Feb 2022 08:58:24 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     conor.dooley@microchip.com
Cc:     linus.walleij@linaro.org, brgl@bgdev.pl, robh+dt@kernel.org,
        jassisinghbrar@gmail.com, thierry.reding@gmail.com,
        lee.jones@linaro.org, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, paul.walmsley@sifive.com,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, geert@linux-m68k.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-riscv@lists.infradead.org, krzysztof.kozlowski@canonical.com,
        bin.meng@windriver.com, heiko@sntech.de, lewis.hanly@microchip.com,
        daire.mcnamara@microchip.com, ivan.griffin@microchip.com,
        atishp@rivosinc.com, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 06/12] dt-bindings: pwm: add microchip corepwm binding
Message-ID: <20220201075824.aixrvkvmjde2ihxx@pengutronix.de>
References: <20220131114726.973690-1-conor.dooley@microchip.com>
 <20220131114726.973690-7-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="pqylyjr6p2p3xcpl"
Content-Disposition: inline
In-Reply-To: <20220131114726.973690-7-conor.dooley@microchip.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--pqylyjr6p2p3xcpl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 31, 2022 at 11:47:21AM +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>=20
> Add device tree bindings for the Microchip fpga fabric based "core" PWM
> controller.
>=20
> Reviewed-by: Rob Herring <robh@kernel.org>
>=20
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/pwm/microchip,corepwm.yaml       | 75 +++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/microchip,corep=
wm.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml=
 b/Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml
> new file mode 100644
> index 000000000000..26a77cde2465
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pwm/microchip,corepwm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip ip core PWM controller bindings
> +
> +maintainers:
> +  - Conor Dooley <conor.dooley@microchip.com>
> +
> +description: |
> +  corePWM is an 16 channel pulse width modulator FPGA IP
> +
> +  https://www.microsemi.com/existing-parts/parts/152118
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: microchip,corepwm-rtl-v4
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  "#pwm-cells":
> +    const: 2
> +
> +  microchip,sync-update:
> +    description: |
> +      In synchronous mode, all channels are updated at the beginning of =
the PWM period.
> +      Asynchronous mode is relevant to applications such as LED control,=
 where
> +      synchronous updates are not required. Asynchronous mode lowers the=
 area size,
> +      reducing shadow register requirements. This can be set at run time=
, provided
> +      SHADOW_REG_EN is asserted. SHADOW_REG_EN is set by the FPGA bitstr=
eam programmed
> +      to the device.
> +      Each bit corresponds to a PWM channel & represents whether synchro=
nous mode is
> +      possible for the PWM channel.
> +
> +    $ref: /schemas/types.yaml#/definitions/uint16
> +    default: 0

I'm not sure I understand this correctly. This is a soft-core and you
can synthesize it either with or without the ability to do synchronous
updates or not, right? All 16 channels share the same period length and
in the simple implementation changing the duty cycle is done at once
(maybe introducing a glitch) and in the more expensive implementation
there is a register to implement both variants?


> +  microchip,dac-mode:
> +    description: |
> +      Optional, per-channel Low Ripple DAC mode is possible on this IP c=
ore. It creates
> +      a minimum period pulse train whose High/Low average is that of the=
 chosen duty
> +      cycle. This "DAC" will have far better bandwidth and ripple perfor=
mance than the
> +      standard PWM algorithm can achieve.
> +      Each bit corresponds to a PWM channel & represents whether dac mod=
e is enabled
> +      that PWM channel.

In the last sentence a "for" is missing?

These two properties are not detectable in software?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--pqylyjr6p2p3xcpl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmH46B0ACgkQwfwUeK3K
7Am3Sgf/UTtQSsIPttdHYyNUxSYZF6fH8Mu324npdIKQ+39Z6OX/+MjR27kWtIP9
PnRVaiT3ysheX8NpDwOr4mFokpvxx6yswleZStNKVh+xzGfPDwvGMbCElcf/RL7P
UdSovN/QCVE/X+dCUDz+sZtlbnXMW3+mJmDr2Qs1xh0/R+wuHwIwetY/8jW8t1Hy
AkxUBTyiszRkAlXctrW+k+NaoXvtJnLLS3oCyp/vuHXvsCuwzp5GwHjL7alf89uE
h/EMEzivdI/Bks9p9w9jDMg6GNp3KoL4RYeQwCWz4DkO3kezyhIwIgbMRLF57IqZ
HYcnZow7dopjm+dWBk/s32mz7/prow==
=622s
-----END PGP SIGNATURE-----

--pqylyjr6p2p3xcpl--
