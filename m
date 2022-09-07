Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA3615B0F48
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Sep 2022 23:39:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbiIGVjN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Sep 2022 17:39:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbiIGVjM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Sep 2022 17:39:12 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5825B7EFB;
        Wed,  7 Sep 2022 14:39:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 73359B81C29;
        Wed,  7 Sep 2022 21:39:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 465CBC433C1;
        Wed,  7 Sep 2022 21:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662586749;
        bh=8uHQGDfxSLYm/60NjBvHAd+7XrDLJ+qJfz2ZdEAirGQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Il29iMYTECrRQaHgpSyJOm8jinwXy+u9hJTL8BOS1Jyk30yzNFqvbJxx1B23KERem
         WgcA2Lj7rs845Stcf9CTaUl26lDeuTuDFkvqUwJvHM/u3hqHmTEVTlOpIlg68Lh/j4
         VdsA0BBUIjGcT5aeQOxQFQBVfFKh2bm41a3YykSytCdivcUvBowbWUprTYakoKdPzA
         KM+4Bl5vXLZW4btBR8bYhgNDJ2B2hnI6MlMRHpyUmsPCnr1IPxkvx2Els/5Zk4gpdw
         i7LCdpXIz13WEb5wvINLL93sED2cgUwabNM/iCBzHo35mW+g2Wv4jTtn+8MwKpsb3v
         fM16ZPC5yAKJQ==
Date:   Wed, 7 Sep 2022 23:39:05 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Li Yang <leoyang.li@nxp.com>
Cc:     Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-binding: i2c-imx: add SoC specific compatible strings
 for layerscape
Message-ID: <YxkPeRX46OgKU8au@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Li Yang <leoyang.li@nxp.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20220817205623.22104-1-leoyang.li@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="JxpBrjT+WlDYsSu/"
Content-Disposition: inline
In-Reply-To: <20220817205623.22104-1-leoyang.li@nxp.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--JxpBrjT+WlDYsSu/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 17, 2022 at 03:56:22PM -0500, Li Yang wrote:
> Add chip specific compatible strings for layerscape platforms to make it
> possible to do SoC specific fix-ups in the driver.
>=20
> Signed-off-by: Li Yang <leoyang.li@nxp.com>

Applied to for-next, thanks!


--JxpBrjT+WlDYsSu/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMZD3gACgkQFA3kzBSg
Kbb0Cg//bbaXGHWi6VQZZ/UaFUgRTBKK/kWOq5vTdOph75zUdUu+ZbFAdXxGTl43
0LW66FJ3iAUqfbSBc0gWLO65+wh4MUV007voIeJVT+cK66KgEsOhjFxWd14ejGWL
lCeFJZ/EjxRMoqSwr2xJCAT1LK7xIIXvT8oxvKZgOgabRdq5irA1YLYcEr7fzTPf
kHThXh+BGK4mXGJvRQqxwE56ob9gQs3zwQYn+B20wfPiq4hiBG9GHDsZQ2jhVmm3
mVxiGDpal28GoeWWGnU4k6qr4T5YGdr5QEWAKH3S7BSfZKp4ibd/qyQdCEvkh3wk
KBqBeLVZdtid/6F6QgJb3pqhZmd9nLgciTDToWkMqOPwKKaC7fBtdB/l6YCS5mX8
ovWZrk8CSsMpITPf5bpndKdK0PZqZZXxs0Mf34lkFOK1Aw5Ghp444fD6D1z8kEkZ
L81yfznCNI7kE/IA579Rg/cBBAyIqtjDvJ9q2tFV+LigRD+4MXjlKx5VOCDhClcU
e0/xdZ4+qxMZQO4wEgZK7WaFkxjPwbeOLVgNoqGKqmaDoz/dyPIdAf2fZoE6YEIy
Qg+VSlmHQjLGi0xCEFUvsnPVndgvd9ysFmx3hiDLczDRfA76PnPfSCqvGbKIvjyh
mZKabpx5X9QpfZ9cvUXDrmns9BpqRN2QC1RohpSvkHWFPCRmmX4=
=XCki
-----END PGP SIGNATURE-----

--JxpBrjT+WlDYsSu/--
