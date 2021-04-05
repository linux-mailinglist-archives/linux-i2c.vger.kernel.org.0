Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB7F23547C2
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Apr 2021 22:45:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233370AbhDEUp3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Apr 2021 16:45:29 -0400
Received: from sauhun.de ([88.99.104.3]:44088 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232694AbhDEUp3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 5 Apr 2021 16:45:29 -0400
Received: from localhost (p54b33022.dip0.t-ipconnect.de [84.179.48.34])
        by pokefinder.org (Postfix) with ESMTPSA id 00E7F2C02FD;
        Mon,  5 Apr 2021 22:45:20 +0200 (CEST)
Date:   Mon, 5 Apr 2021 22:45:17 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Bence =?utf-8?B?Q3PDs2vDoXM=?= <bence98@sch.bme.hu>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] i2c: Add I2C_AQ_NO_REP_START adapter quirk
Message-ID: <20210405204517.GA3945@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Bence =?utf-8?B?Q3PDs2vDoXM=?= <bence98@sch.bme.hu>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210331191921.1066172-1-bence98@sch.bme.hu>
 <20210331191921.1066172-2-bence98@sch.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Content-Disposition: inline
In-Reply-To: <20210331191921.1066172-2-bence98@sch.bme.hu>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 31, 2021 at 07:19:20PM +0000, Bence Cs=C3=B3k=C3=A1s wrote:
> This quirk signifies that the adapter cannot do a repeated
> START, it always issues a STOP condition after transfers.
>=20
> Suggested-by: Wolfram Sang <wsa@the-dreams.de>
> Signed-off-by: Bence Cs=C3=B3k=C3=A1s <bence98@sch.bme.hu>

Applied to for-next, thanks!


--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBrdtkACgkQFA3kzBSg
KbagBQ//eMdL3Ke9iAzQo/7w7XlDU4DJkwVvhLwi0oPQxe4yNHN5EhBw3bCZG5NS
+hzLzxgVJ0JabUsdMSn8V6cRvEvefW3vipgEjMuPbYnBLOJ0OrVRlJLAbNLX5fgD
N4ZPorTEnPU9XiNkNb/7uwb1g7dD+m+sPzyopZbVo4/49hQN3QMMX29MfLTy8eaf
JLvP91cBdG7G8/n/6LYvylaOVyTH2lsFMkFtbQ9BxGEjFXiisSEC2dCZXaO5k2PR
J8kqxW4ZGTxcpyudy6yl15EJusBtdryhxQOpjldUTwA50xriJ430EaTKF0G/vpSE
SvP194a9/NCeuHIzEijbPEvmGRK7GC0NJEHdGghXxabHhDfsCANHyYBlc9JA14SX
0r9XUvQ/JsmxH8wdFmn/a8eyvDFKtPkkiS6khNcUybRc/R8dVV9jJNJ32NWvz+2b
yZe53LSGkvplnwEp+Z62FqmKYGPaKD8ic3Vax6fF0aapfYbaLEqsqOyrJCUL6hyX
OkEgKWeVZS7MTcvygV2E2NOJ7SPIw9LSVDMVTnuQSRYWevGQ/B15lCxX1qZQhlW7
RohEC6fy0TCnHZDQx5naBDPT76gtz2a+rL2PLigs6UdZ0mKFixks/MZBEXC22BXd
+CW/OyTLgIkuRzro8a51AB76Dx7/Xe0imq0wxbcBVM0cMM3FuEQ=
=T4+o
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--
