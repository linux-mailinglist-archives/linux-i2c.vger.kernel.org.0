Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38B6D119C42
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2019 23:20:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727059AbfLJWUZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Dec 2019 17:20:25 -0500
Received: from sauhun.de ([88.99.104.3]:42738 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726874AbfLJWUZ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 10 Dec 2019 17:20:25 -0500
Received: from localhost (p54B330BE.dip0.t-ipconnect.de [84.179.48.190])
        by pokefinder.org (Postfix) with ESMTPSA id E385C2C2D3F;
        Tue, 10 Dec 2019 23:20:23 +0100 (CET)
Date:   Tue, 10 Dec 2019 23:20:23 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c: fix header file kernel-doc warning
Message-ID: <20191210222023.GB8683@kunai>
References: <38dde454-d00d-f9b2-18b4-590a2697b368@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GID0FwUMdk1T2AWN"
Content-Disposition: inline
In-Reply-To: <38dde454-d00d-f9b2-18b4-590a2697b368@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--GID0FwUMdk1T2AWN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 08, 2019 at 08:35:38PM -0800, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
>=20
> Fix kernel-doc warning in <linux/i2c.h>.
>=20
> ../include/linux/i2c.h:337: warning: Function parameter or member 'init_i=
rq' not described in 'i2c_client'
>=20
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Cc: linux-i2c@vger.kernel.org

Applied to for-current, thanks!


--GID0FwUMdk1T2AWN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl3wGicACgkQFA3kzBSg
KbaABA/9F47NO54UcK/oj7DAszc0UiMVDcg/IM/VNDQd82MmB4LIXz72qGd1mZ81
L0pUCRuGsesDI6ZM3k8uzvw5BUWrHhI82yLd12S2dXtaR1X8wOoygabo/rAUn2Sy
ApyB/X6FC2Wr/cTOdjhx8XHL+DnDdKT3H0tD5RlwCCG7m3DvVebhqiKGCIXrjgTU
3CxPEV+dgOyVQ02oUnq+EB1jL/9VCsYNMnjn3LFqIByebGKp9NUvuOCPo1wHjqOs
bR+FrB68DxYdneJSnbrinvKBnsG85UZ0AluWUGQRMxC26d9gj4kPJC7YBfXVyIcT
Cew/OKlQdNKzPxMxh8UjgFkS+jpvbb2R0bZgecvfIfxxBb1B46ud+2hzz+Gn90fU
zCScUB96ORxqUceJ31zqHGGlM3TNjKlsItmawOsxmSjG3e5E15xJ3YCdkQhNhLTK
dcdd5FeWOyqVQ1lvRCP5cHgtHKG71jp6XIEMMWmiXFPWfErDVCXv1qIFGusRpRlo
B1RHoM9+HSli6umS9A1Dg0BN6udAE3OxBw+cXwtEM04pjSf+JUBPSdnM+O8QA/uV
AvOVM7R4bfbEKtURlV9OD82NIC9Q1MWw08VNn+R8bYIT5vQ05a7vSHDP3WXEzWv3
Qvm160uxx0JUehQ3fyVXz53qfiYWaG2sbpNV7jp+yp5fJSXoKfo=
=pHIK
-----END PGP SIGNATURE-----

--GID0FwUMdk1T2AWN--
