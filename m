Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E617E1A9A57
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Apr 2020 12:25:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405753AbgDOKYI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Apr 2020 06:24:08 -0400
Received: from sauhun.de ([88.99.104.3]:51666 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2896454AbgDOKW5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Apr 2020 06:22:57 -0400
Received: from localhost (p54B33507.dip0.t-ipconnect.de [84.179.53.7])
        by pokefinder.org (Postfix) with ESMTPSA id 450FF2C1FF1;
        Wed, 15 Apr 2020 12:21:59 +0200 (CEST)
Date:   Wed, 15 Apr 2020 12:21:58 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     michal.simek@xilinx.com, wsa+renesas@sang-engineering.com,
        pierre-yves.mordret@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, alain.volmat@st.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] i2c: busses: convert to
 devm_platform_get_and_ioremap_resource
Message-ID: <20200415102158.GH1141@ninjato>
References: <20200414134827.18674-1-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4LFBTxd4L5NLO6ly"
Content-Disposition: inline
In-Reply-To: <20200414134827.18674-1-zhengdejin5@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--4LFBTxd4L5NLO6ly
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 14, 2020 at 09:48:27PM +0800, Dejin Zheng wrote:
> use devm_platform_get_and_ioremap_resource() to simplify code, which
> contains platform_get_resource() and devm_ioremap_resource(), it also
> get the resource for use by the following code.
>=20
> Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>

Applied to for-next, because it seems 'the new way' but...

> -	r_mem =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	id->membase =3D devm_ioremap_resource(&pdev->dev, r_mem);
> +	id->membase =3D devm_platform_get_and_ioremap_resource(pdev, 0, &r_mem);

=2E.. guys, do you really think this one line reduction improves
readability? Oh well...


--4LFBTxd4L5NLO6ly
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6W4EIACgkQFA3kzBSg
KbamCA/+PjnvKJsZh5zv3h9+f+/+k1RNX3gHTRtOpPy+Mq9fWzySA//u0arFuTEo
fneK30U2oflrSd1cDLiX7rE3/BI9EArmZR2hfFM7TSd1/j77Tx67y12ZP+MfndNH
I59kfBFQACoJ9QgSrClcTVVwEBUMe/kf2zpHKeXw/ly9eirKQab5hnX4f83nQI3R
5BtIv/tnyDwvUrKB9vSiUHORa1/5ObvOmgOdwv5peyHBDyjTrkFAsmJoIwZD+iKV
jX5K3SoBluFaxOIhw23/NwrZv0EfDLEVT6bX9Eo5Yz4ip3WiDrO2JOJiVgAelduW
WvrIQQIlOs9RPYua8BliSYTfr8lXUESelA5Z5N50g89+ozfH/swHtm6IiubUtW4T
q36yAh7fuZSwBwWwEO3wvu6z0moIFqw0ZecRA8ucoSRmGOBtlxQsfitJgO6O7Pi3
6HPJN7l4ZI6DZfTz1yEOOA2TET1UH02n+5exQHJIOecj6v/cg/eUV0MumkDWQ43z
3eyEuF1ZJT3S9HPbzinCgSms1a7CzeAyyVlJkNwthpI8W8jg1fOXvBRqb4GF4NHL
koP5MoMDOq7wohB+8P6EIADcQ9TD5pYrc6wt0kqzRbxOIhg3h9nNs0CgPcfF4FQp
Dqu5c1aMoa9UVSGkhIIMbIW0jBJXEV5fw1CA8LDNLC32kdhCYXw=
=uSZW
-----END PGP SIGNATURE-----

--4LFBTxd4L5NLO6ly--
