Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE89227A23E
	for <lists+linux-i2c@lfdr.de>; Sun, 27 Sep 2020 20:02:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726321AbgI0SCO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 27 Sep 2020 14:02:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:35840 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726303AbgI0SCO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 27 Sep 2020 14:02:14 -0400
Received: from localhost (router.4pisysteme.de [80.79.225.122])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E3E4F208FE;
        Sun, 27 Sep 2020 18:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601229733;
        bh=P5bAsU836nfwvWb7ckoG24QsuDwc7Fkwne2X9zdW6xA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FX5TrtVgft3KuP3ukBB2H2v65JlytF71azR8jUXCV+M6d5trMoVSx/wqW+udC6jIO
         GugqkCO3a3p6/kQxyphwZ9GmjtSVAzjTnC5RJ2hbiN4Ff2lRnkYSCc//DUZRU67oPb
         oLI0a7UVza/uvRYKEiFO6mOLccdgyYA8o7jisWIU=
Date:   Sun, 27 Sep 2020 20:02:11 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Wolfram Sang <wolfram@the-dreams.de>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/4] dt-bindings: i2c: imx: Fix i.MX 7 compatible
 matching
Message-ID: <20200927180211.GE19475@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Wolfram Sang <wolfram@the-dreams.de>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20200917191321.28741-1-krzk@kernel.org>
 <20200917191321.28741-4-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ZRyEpB+iJ+qUx0kp"
Content-Disposition: inline
In-Reply-To: <20200917191321.28741-4-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ZRyEpB+iJ+qUx0kp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2020 at 09:13:21PM +0200, Krzysztof Kozlowski wrote:
> The i.MX 7 DTSes use two compatibles so update the binding to fix
> dtbs_check warnings like:
>=20
>   arch/arm/boot/dts/imx7d-cl-som-imx7.dt.yaml: i2c@30a20000:
>     compatible: ['fsl,imx7d-i2c', 'fsl,imx21-i2c'] is not valid under any=
 of the given schemas (Possible causes of the failure):
>=20
>   arch/arm/boot/dts/imx7d-cl-som-imx7.dt.yaml: i2c@30a20000:
>     compatible: ['fsl,imx7d-i2c', 'fsl,imx21-i2c'] is too long
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Applied to for-next, thanks!


--ZRyEpB+iJ+qUx0kp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9w06MACgkQFA3kzBSg
KbYHRw//XMfUqUsamDsGsZ/tCrC0gC244igqxp8Uy1JIwbOA09cbuvBV9rbF9Ma2
Wqu2xgEi7x5ARHy6HD1LUXxMXbvRJIYKxYyq39y1DPPpT9f1m10YLWPGterXf6kU
RZ/0lXL8XBSUepsAOvTP/nJuj2j2TmhRU4lvkGuTwf4xWOr/ZRcEvJr8FKwe7IQK
wFSAeMUWUjt5RPdqemyUQcV6DpE9mDvQBvom+dlU3ss5kx0fwAgXjsTuT/vYL334
6dAcpUGxETlKav7UOwQJqGraoYf9LSrWOfmGV+VxMvNT2kHpX6UwAxad1Yc31T6L
kSpbXJhg0o1PFQe2kV+0GbWxf/MMTPJv9HmVfsdaG2tv7aKGxe1tjh6KhFdmR95K
unk/bRl3nl48pbEd8QHB+VueJ8wUqiRLzbTt4JhwTaIL0hIkHM80R/lVY3UJDKVQ
QGhlCS+orcIKwULMtnsKEKgzhDuxdsCSF/SN537sCAvvN7RUtHln8WD/sJVf9VWE
9egGEUHUSVJPNnbzFY21si2pgjbmlidQ7ExNl7aEUbO7yrPOhWP85cNmEo98EiTK
BWe8PItZ454CSSC9H2QCot1lHsIsMBjy7Vw19FCjOyyXbF+o5wFVN06Ka7hXaBQ+
iXS2ayqgIKbpQpXvAQAEjWzVUaDdMiQpTQZ9gsD9r248DiIFfV8=
=Ov0R
-----END PGP SIGNATURE-----

--ZRyEpB+iJ+qUx0kp--
