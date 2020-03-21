Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BFD818E3D3
	for <lists+linux-i2c@lfdr.de>; Sat, 21 Mar 2020 19:56:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727296AbgCUS4G (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 Mar 2020 14:56:06 -0400
Received: from sauhun.de ([88.99.104.3]:38402 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727015AbgCUS4G (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 21 Mar 2020 14:56:06 -0400
Received: from localhost (p54B33C59.dip0.t-ipconnect.de [84.179.60.89])
        by pokefinder.org (Postfix) with ESMTPSA id 7E72D2C1ECA;
        Sat, 21 Mar 2020 19:56:04 +0100 (CET)
Date:   Sat, 21 Mar 2020 19:56:04 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Tang Bin <tangbin@cmss.chinamobile.com>
Cc:     linux@rempel-privat.de, s.hauer@pengutronix.de,
        shawnguo@kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers/i2c/busses/i2c-imx.c:remove duplicate print
 after platform_get_irq()
Message-ID: <20200321185604.GE5632@ninjato>
References: <20200318100748.17540-1-tangbin@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="J4XPiPrVK1ev6Sgr"
Content-Disposition: inline
In-Reply-To: <20200318100748.17540-1-tangbin@cmss.chinamobile.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--J4XPiPrVK1ev6Sgr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2020 at 06:07:48PM +0800, Tang Bin wrote:
> We don't need dev_err() message because when something goes wrong,
> platform_get_irq() has print an error message itself, so we should
> remove duplicate dev_err().
>=20
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>

Applied to for-next, thanks! But please use a proper prefix in the
subject next time ("i2c: imx: ...")


--J4XPiPrVK1ev6Sgr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl52Y0MACgkQFA3kzBSg
KbYXfw/8D/9Dj1vwAHP0HpumkxNAAq+jVkt8f/v6BDRnfCjDLebfJ94ltbCjQ2ZW
jOBrltt3uJo0vnWtUzaE9OlHzw/UxO+9wrZ8MsfHZBmCGxIywISuV18DecnmbQY9
5yqW1RBNwzSCcqRH5wzRKOssKtDoE5u2sd5Wl/2Rp4OmsLFOm2YW2Zf8rOvRc+j2
5jlg8etLqD4yx6s2fGh+tOnxFb854BdPGlQqs4wPEzRcZsXVmexsbqt1/IiQG9ST
rcvbav3nA1JNM4VFzreRnXzWgt1rx49vCVHOmS1oj2k9vTeD94tL7dFaOIc+wZHg
v8enumJtue/GJHxUoEO8l0YgnVSlUmKMl484+cm0qQSkfx9tN/w7SObdzQ8Q6MUY
wC3Og0IJosL5f7vsbHwVTwCwSZGQ1/jVI3NrjjkUhXDhirq+zIH2Bh5/1PX58PEz
ficd5P10YsSk7dn7CgiXGVo6ahz0SwWNGXC3ZWGg/QMpWq4ly7n2ft0OInEnd4ty
eS2grMVnJBvB2GVRO1mlLeeFHn8U43Xe2FOmoZddDOoj0+ZDlZlqYj3n3IRJTcyX
qbxEBlaIgeN2VtxWVYcIjYFAK7kz6IJNwp7+OdLK3SqHr/Y5avdx6G1PfKpiZ970
wXGQpikrqWYRrCu6/oa2b8F8OskUVVrsbIDiW6ykErvJRTbTOPU=
=Ma4i
-----END PGP SIGNATURE-----

--J4XPiPrVK1ev6Sgr--
