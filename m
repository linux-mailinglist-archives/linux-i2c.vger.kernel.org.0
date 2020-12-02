Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C51022CC06A
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Dec 2020 16:11:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727868AbgLBPLT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Dec 2020 10:11:19 -0500
Received: from sauhun.de ([88.99.104.3]:39638 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727116AbgLBPLT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 2 Dec 2020 10:11:19 -0500
Received: from localhost (p54b3307e.dip0.t-ipconnect.de [84.179.48.126])
        by pokefinder.org (Postfix) with ESMTPSA id EC2C92C048D;
        Wed,  2 Dec 2020 16:10:36 +0100 (CET)
Date:   Wed, 2 Dec 2020 16:10:33 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Biwen Li <biwen.li@oss.nxp.com>
Cc:     leoyang.li@nxp.com, linux@rempel-privat.de, kernel@pengutronix.de,
        shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        aisheng.dong@nxp.com, xiaoning.wang@nxp.com,
        o.rempel@pengutronix.de, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, jiafei.pan@nxp.com,
        xiaobo.xie@nxp.com, linux-arm-kernel@lists.infradead.org,
        Biwen Li <biwen.li@nxp.com>
Subject: Re: [v10] i2c: imx: support slave mode for imx I2C driver
Message-ID: <20201202151033.GC874@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Biwen Li <biwen.li@oss.nxp.com>, leoyang.li@nxp.com,
        linux@rempel-privat.de, kernel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com,
        xiaoning.wang@nxp.com, o.rempel@pengutronix.de,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        jiafei.pan@nxp.com, xiaobo.xie@nxp.com,
        linux-arm-kernel@lists.infradead.org, Biwen Li <biwen.li@nxp.com>
References: <20201111113255.28710-1-biwen.li@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="pvezYHf7grwyp3Bc"
Content-Disposition: inline
In-Reply-To: <20201111113255.28710-1-biwen.li@oss.nxp.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--pvezYHf7grwyp3Bc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2020 at 07:32:55PM +0800, Biwen Li wrote:
> From: Biwen Li <biwen.li@nxp.com>
>=20
> The patch supports slave mode for imx I2C driver
>=20
> Signed-off-by: Biwen Li <biwen.li@nxp.com>

Applied to for-next, thanks!


--pvezYHf7grwyp3Bc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/HrmkACgkQFA3kzBSg
KbZEfxAAl1iWtO5noD8COrXpKQWBIikoqVi0aJecrofcx3BGcdPBzJlQdOZfEYe0
Ffn+qgyh6dyaU0CUQ/l6fYUJkNszo2RV03PafqmyOD26i0okfj6WqpY5GhhvJjK1
ZUEgMN5QVQ+emzwH7WpqXQqIHFHfjs2/ZblvsmiXh5KPwqRiBohSH5e/VDeHEuZQ
nzK4MErP60YAq380Xn9SzRaEH2gVsiwz4JUaQ/GGCGfBc25CNiTNqi/zYsNuEGNf
jsD72pDwKXE9pJGU/h4nQX7wn3S8OFOtjZjGA0UwuZnMlrZ/rjbASkKSjH1GfSkJ
eXavFGWFXIUFzAdnBClTgZFj10dYCBdFPE33GXsAsjbRTJblUl7h7Bjw3yOHj/QX
kJOmCx2KxPhjB1YrpIfn0ne0xM8o9DfTJs5rXnPBgx/8jSwwnYsil31BmjN8pW6X
j8fLdnzmaDLeL5qBYmnWQNvkWZnemAOt8uu5LSBBXp3Ng9Seb1UgzZpGsZBzdzke
Al7h0pvB9zliIIuVxLxf0/Bif9o1a2LA856p39uTEoIeGvQs0M3kIihIp0UFIys0
hLWVd7FiNpLnwhUUjA2oc8SB/vx9f93flVM0ws9gmD01XPfdxn2G9h4JU/PpooZM
gObfLJ04IUT+NCUwkGyEleJmykgTZf0OmnYyLZ0hcVpItHNLd70=
=WiAj
-----END PGP SIGNATURE-----

--pvezYHf7grwyp3Bc--
