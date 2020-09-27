Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E25327A23B
	for <lists+linux-i2c@lfdr.de>; Sun, 27 Sep 2020 20:02:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbgI0SCG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 27 Sep 2020 14:02:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:35590 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726325AbgI0SCG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 27 Sep 2020 14:02:06 -0400
Received: from localhost (router.4pisysteme.de [80.79.225.122])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4C0C9239D4;
        Sun, 27 Sep 2020 18:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601229725;
        bh=AqAdn5sIdh+CE+XDsgTg6w8GjI7HKLQ6xW1/BneqPcs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fJSIG+79GyZnE0N4FuOoB31OzTfYfAUnqTMvKM6yUcizMyBRBJ0bCN6sUzz0/xuAW
         VHEKvEgvzhMsK3BcOMVsEw1JN6fDYpQFua7iWRMM4t9YI0TCAy1GjfSPB8tR4rAwKa
         oSYYeH2S+TlWxVyKPxQ2PSY42pU9vEkdxTlod2rk=
Date:   Sun, 27 Sep 2020 20:02:03 +0200
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
Subject: Re: [PATCH v4 3/4] dt-bindings: i2c: imx: Add properties and use
 unevaluatedProperties
Message-ID: <20200927180203.GD19475@kunai>
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
 <20200917191321.28741-3-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qGV0fN9tzfkG3CxV"
Content-Disposition: inline
In-Reply-To: <20200917191321.28741-3-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--qGV0fN9tzfkG3CxV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2020 at 09:13:20PM +0200, Krzysztof Kozlowski wrote:
> Additional properties actually might appear (e.g. power-domains) so
> describe all typical properties, reference generic i2c schema and use
> unevaluatedProperties to fix dtbs_check warnings like:
>=20
>   arch/arm64/boot/dts/freescale/imx8mn-evk.dt.yaml: i2c@30a20000:
>     '#address-cells', '#size-cells', 'pmic@25' do not match any of the re=
gexes: 'pinctrl-[0-9]+'
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>=20

Applied to for-next, thanks!


--qGV0fN9tzfkG3CxV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9w05sACgkQFA3kzBSg
KbbJNg//VW8nvoc18tTQ8lcfA07Hi+Z7GYRJWKgzv5tn1MZ+PsK2+oSls4FQDuE3
HPWFoNf74m0yJ0OJbn/8DxsLcx78U5tfWJUteQtheoR5RPaApqPHMy73AIpWAzvn
dcsoymdv+qlE3dSO6qDmQk7m93M6OPapLIEJ9NTiY8ftuZuvIupahYd2D3MiwqAS
PrDNWiAv+PV83SPacxdpyAPB/VVBNltetmUtEXTHVxH6TQa+aHPfmw+X+jXVNdSx
EhnfWG6O/OzK9AsZVAvmgMkLSAlfhG8BZcdrZdi66sLfRKc734YgTS+kj/TDq2Hd
MAxo1Pwu1QJUN5r/3B54LAZsRiLrK8bJnVU+RaGEor83tqwJ60JZrOg6nijFRJJz
gf1SFtJFmx+hCNTAmKIzX8Aj9ZJOaphc63+KGH7WVaCaDDHVnPHCiCWj0nrOsinL
hZGCDBHeHy3kURjsLMVKePzbU//sIpweOORNLpMyY8MgeOX+lQkKEMOBmwKpKkmm
I8btUUc16x95jhpgTW/20C/bE0vbZYqWlC03/Q5+ikDPWo2jpMjAeZYTm9J98zpF
k6dfNtzmkZIp3qOAsV71lHQOUsw2Nufo7MW0V98a9MKxVSRwh+n4Col8gjGui7xH
00RcMXkLdw9gpOy0fHP4teDaDaTJTn143wWGu0gP7vtI2nqvr5c=
=Cy/L
-----END PGP SIGNATURE-----

--qGV0fN9tzfkG3CxV--
