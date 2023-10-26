Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D66F7D84A2
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Oct 2023 16:26:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235036AbjJZO0E (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Oct 2023 10:26:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234902AbjJZO0D (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 26 Oct 2023 10:26:03 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3395C9C;
        Thu, 26 Oct 2023 07:26:01 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38F3AC433C7;
        Thu, 26 Oct 2023 14:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698330360;
        bh=9Cwqw/fWKM5uYNCnpfD7cgaQ4Y+kZK35kIJsOLUSy1o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Rk0fmsRFU74qvN0wrURYBETxMpTCpWBiSCdBGXjfJ6eVKk1CbB5PmlEVygDG0Veel
         uoDyi0xwJHgrVoCINq5tSt6SeMh09QWLqfXyPhRBvRssN7i6YdTbquC0+3j0aLYEJ0
         8VgVs2kr7AFhasTjd5/gWRNXLS+B2YC1ZS7648t8tBU3Eqi232Zmpep0WLNaRfqW1+
         3KMr2Cq2bGQTRHU1ct1pIlQruaGQVZLRLmiFuYOXUDyzimoSVz5erPRR4vXRt8LDDP
         rZUOUBw/ErMtS+BJ5T1Z0VQwsrfnDZZbfE9EP01kCZcq8RxST7IErLQS/vQnMzfcvH
         bjckdnconGRbA==
Date:   Thu, 26 Oct 2023 15:25:55 +0100
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
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add lltc ltc4286 driver
 bindings
Message-ID: <20231026-dicing-crispy-a10af575d3e5@spud>
References: <20231026081514.3610343-1-Delphine_CC_Chiu@Wiwynn.com>
 <20231026081514.3610343-2-Delphine_CC_Chiu@Wiwynn.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jMMeW1OsGzkZp10V"
Content-Disposition: inline
In-Reply-To: <20231026081514.3610343-2-Delphine_CC_Chiu@Wiwynn.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--jMMeW1OsGzkZp10V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Thu, Oct 26, 2023 at 04:15:11PM +0800, Delphine CC Chiu wrote:
> Add a device tree bindings for ltc4286 driver.

Bindings are for devices, not for drivers.

>=20
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
>=20
> Changelog:
>   v2 - Revise vrange_select_25p6 to adi,vrange-select-25p6
>      - Add type for adi,vrange-select-25p6
>      - Revise rsense-micro-ohms to shunt-resistor-micro-ohms
> ---
>  .../bindings/hwmon/lltc,ltc4286.yaml          | 50 +++++++++++++++++++
>  MAINTAINERS                                   | 10 ++++
>  2 files changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/lltc,ltc4286.=
yaml
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml b/=
Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
> new file mode 100644
> index 000000000000..17022de657bb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
> @@ -0,0 +1,50 @@
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

I don't recall seeing an answer to Guenter about this ltc4287 device:
https://lore.kernel.org/all/22f6364c-611c-ffb6-451c-9ddc20418d0a@roeck-us.n=
et/

> +
> +  reg:
> +    maxItems: 1
> +
> +  adi,vrange-select-25p6:
> +    description:
> +      This property is a bool parameter to represent the
> +      voltage range is 25.6 or not for this chip.

25.6 what? Volts? microvolts?
What about Guenter's suggestion to name this so that it better matches
the other, similar properties?

Cheers,
Conor.

--jMMeW1OsGzkZp10V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTp28wAKCRB4tDGHoIJi
0jT7APwIvjLDbL//84boMtfvc5RAA1QcNcVO+kfVu3dhyr7v0QD/YlNzHmAB6RRB
kYtv8yYAiBRKdn612BukEd8U5pcGjgU=
=QvBI
-----END PGP SIGNATURE-----

--jMMeW1OsGzkZp10V--
