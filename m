Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD3635A606B
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Aug 2022 12:13:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230288AbiH3KNO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Aug 2022 06:13:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230175AbiH3KMK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Aug 2022 06:12:10 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C273AF2D77;
        Tue, 30 Aug 2022 03:08:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 822BEB811B3;
        Tue, 30 Aug 2022 10:08:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7313C433D6;
        Tue, 30 Aug 2022 10:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661854080;
        bh=LOI8kTNIv2SOZJIBZSHky+JNOg4JVcm+RhNRayoiQ+g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BEtaJ1arelV/0cHnhRoF+OJWXpIp0TRBT1u5G60ZHrzUA+RfHRYPeHXmiXKJN0Q0F
         p911fb4jNWTuUznfO+xfX0XSxmPNU9lnyuNqth5m2McFCMTRTeyXki9OgGu/lSHtif
         5LYYe+z4z5YhALlEAMeFnhX7MNS9S+JT/jlvsUMGX6aS2I1bj6LL+J1QRxbpN+CYBN
         pL60R8i0hOs94sAGrOKysQFxcKAzg1uUmztCcKynVuVS7K5iv5FsdpR+mJ5D2Tgv4s
         SbMy5gyZEdD5JatMyYh3T54hCCrS9Voqhu6kirpSOa3KB3LAKTkfyHR4+1g+N+Lfha
         goOGJin68XseA==
Date:   Tue, 30 Aug 2022 12:07:57 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     aisheng.dong@nxp.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, xiaoning.wang@nxp.com,
        Peng Fan <peng.fan@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH V3 4/7] dt-bindings: i2c: i2c-imx-lpi2c: add i.MX93
Message-ID: <Yw3hfcQ2JV248GIo@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, aisheng.dong@nxp.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, xiaoning.wang@nxp.com,
        Peng Fan <peng.fan@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20220823030215.870414-1-peng.fan@oss.nxp.com>
 <20220823030215.870414-5-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xUxSXNz0vdoLzOY3"
Content-Disposition: inline
In-Reply-To: <20220823030215.870414-5-peng.fan@oss.nxp.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--xUxSXNz0vdoLzOY3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 23, 2022 at 11:02:12AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>=20
> Add i.MX93 LPI2C compatible string.
>=20
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Applied to for-next, thanks!


--xUxSXNz0vdoLzOY3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMN4X0ACgkQFA3kzBSg
KbbSug//ZYjv5tR/kp3u5tX8260/ttMj25CXfjEUCayqidPgQ+4GqgdWQJR87d3T
vwdlXiOeiSkVpJCbhGsl4RC3fqhmoxG/2j3pHV7/PfNq5wpT4f5lniyvgbUG8z+X
D8DD8ipW2E5phVJF6681bggloodKIiO/b9ULVNhHPIiGOiVyejIzEc7dePBnrNkq
4qTJLuCZimfdZykoxV8Cbe0EgAN/72ZeIQZLYIOwQJAm47vdMJ8N9GsDD4g9OcXr
XxZnUSi0VVOiTlk9DOhdPYuJJLAdb7/+ZObuLmWLMtVnFY1L5K74lQ7gOtYHddVk
ciQtCSd25OKFQyZ5OrOZkiSgPuEaLQOsIoa1nVP7dhJ9uGIXWtm8lKHJUZegKmi0
IQJ0IsmZpQXul1pjfklpdOlzbHczeCwEStWcX8mf2FAAtKH+TOKpu10ZRW/0OOLQ
6GMfKRvs4DRM4B/6mxIW2YKlOlqvvyED/IY7zIMTGkw68uZenyaLaRMc0Xciqyck
t6R2cVUoYnW4H50JND+glU3Cis59ot2RcZ+onCRJ5kdcSlQBLTmPXBeTOUWeWQqy
dRtwKOxlkC0b7cYWmrw/VmJJvwQsJ0qL6VL459Dx7A8ZfA6omjZX8W2kdTXMEYnr
LCqJgz91myUKXzfjUbKOcKiEBzpotNHz0ZRkVzUINmHzBu0LfEM=
=8wZe
-----END PGP SIGNATURE-----

--xUxSXNz0vdoLzOY3--
