Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BC6977BC93
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Aug 2023 17:13:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232645AbjHNPMm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Aug 2023 11:12:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232790AbjHNPMa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Aug 2023 11:12:30 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F08D910D1;
        Mon, 14 Aug 2023 08:12:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8FB3463763;
        Mon, 14 Aug 2023 15:12:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74862C433C8;
        Mon, 14 Aug 2023 15:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692025944;
        bh=S4zyki7PFmZ2cBORKIxO1VFOjZKURBWF9rTlNDun9pM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Yc2OS+OTzaM+C2zzmWrAmmuioDm4pRZBMfrHMAq0G5S0vuvQCACesO3XuTRnFLCId
         ehMZ83+72mLSyJb/do38gnSmpon17lzKMWw/QRDA6HBTbX/+eLh9lYf4zpcg9ih1f6
         3x5rmzpzKXh8snL+JJCwQYEJuSLDArmHYxfHZD5hKRl+npTrJkS+uv6p2vJxJbs5pd
         5YErktFtdjZiD8x+La4Kz0f4FO/6XagSapaof7Shvm6j/xi/SX1cjbg8kHggMddypS
         6JO2Ulx2Kxr1Cqd4Sqjrgqr96mTT7jKpLe2TVHzwEyi5rrGkMI9mMgD82ZCW0CeZjn
         TBMkTelLVMICg==
Date:   Mon, 14 Aug 2023 17:12:21 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Peter Rosin <peda@axentia.se>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: i2c: nxp,pca9541: convert to DT
 schema
Message-ID: <ZNpEVV3fRDVaEyya@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Doug Anderson <dianders@chromium.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Conor Dooley <conor.dooley@microchip.com>
References: <20230731163833.319258-1-krzysztof.kozlowski@linaro.org>
 <169100562788.1919254.3881890120063393214.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="aGK2mMw4XGLmgIjx"
Content-Disposition: inline
In-Reply-To: <169100562788.1919254.3881890120063393214.b4-ty@kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--aGK2mMw4XGLmgIjx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 02, 2023 at 10:10:33PM +0200, Andi Shyti wrote:
> Hi
>=20
> On Mon, 31 Jul 2023 18:38:32 +0200, Krzysztof Kozlowski wrote:
> > Convert the bindings for NXP PCA9541 I2C bus master selector to DT
> > schema.
> >=20
> >=20
>=20
> Applied to i2c/andi-for-next on

Applied to for-next (via Andi's branch), thanks!


--aGK2mMw4XGLmgIjx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTaRFUACgkQFA3kzBSg
KbaMRA//ROA0SC/R9jc9TvyvJuUT8D/GydARldGXju/36hrEaBAPGBW3sX2T4grb
/z9kBYJaPlqLJylCoseSeW2D7wxl+/CMfaA2+phe395PGA/q2W9RZI93ddMcXq2R
pnh7p0qSGSDRhS3PxEgdxFoElUDlAg8tqYdySBd3KCvgc94TLzRPW+k0huz4UlmE
sOGKunktaLPIxyRQQSnNbWWgPb9sEOuC9IEZbtmVxmDtcidnLm5pCy1CDtPASWEV
GJwz4lsY4OgtzgRxKZiejKmsmueI/BLp0AfWxEv1OpZ/zAgnpcUAKWS7Pt2PfD7O
V7K3A9SN1L/8YWDRnGE6e0YMKFufMm/QaDLmeJOsS8ARB7LaXD5JmL0pnBA4C5T6
1u1X4xWVeu+9Edfx09zWomVQ9IEWvveEgrmFAqKrLpybnm+SeKTM9uWKTvCrkm3o
IgzLy0a6zZWtnrdDYTHoSyElPQCxtn5eZQfTWuhBzoGOS5MCJBOcbbRn/bUsCewC
nsa83ZcSp7V8yJDStZp2rF+yHPNo+jCUxtFqardIRcF25Qd6d4mjWNog9/mv48j0
WhK+QCtuIOVfMD3ArGtiSBleUgxPXjQgnO29ZW4BAMGY635Vnb2c/HFa8XDE78Nk
kDdIFwEJA5XybyH3qYjZYQ+oG3i1RnqPQTcRHq672iyeGaafekA=
=QGqD
-----END PGP SIGNATURE-----

--aGK2mMw4XGLmgIjx--
