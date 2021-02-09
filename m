Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50441314D5D
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Feb 2021 11:48:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231790AbhBIKow (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Feb 2021 05:44:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:40212 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231421AbhBIKlr (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 9 Feb 2021 05:41:47 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id F331A64E6F;
        Tue,  9 Feb 2021 10:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612867253;
        bh=YvkKyU23vYwdJtjO8ln/oqp7oMDgbK2SlLLuxFQCymE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=njJDoRQiZml8JfHAPzXbApAcsPfihX4HU6G6e8MDFp1Be826wWrmhTIB41ANDQeIv
         6hMilnT9aZ9Z0rGOmdledoTzJoKNko+G4tXirhl1AFDGttXnkll0kcm28y7vX0/Zze
         lbZrLMmjSMnHtxB5JdD9aEKkX/mIDNXsOS6gng0r7p1coCHOjeM6G2AN5awyPdXibg
         kAJ2Dt2qxHoa29Rz54yZxWVwnbMjsQTiIcrt4R5wu28W9K4X3LcIGIPmqvvAgE69fm
         GBnfWk03seW6vGPS8xnYuwxvrFBVo4RRYZmpkdC9BmamS15o8zoYyCr5sC11nLLQfP
         xK7m4nhay+BPA==
Date:   Tue, 9 Feb 2021 11:40:50 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Mark Jonas <mark.jonas@de.bosch.com>
Cc:     Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, Adam.Thomson.Opensource@diasemi.com,
        stwiss.opensource@diasemi.com, marek.vasut@gmail.com,
        tingquan.ruan@cn.bosch.com, hubert.streidl@de.bosch.com
Subject: Re: [PATCH v4] mfd: da9063: Support SMBus and I2C mode
Message-ID: <20210209104050.GB9698@ninjato>
References: <20210208152758.13093-1-mark.jonas@de.bosch.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6sX45UoQRIJXqkqR"
Content-Disposition: inline
In-Reply-To: <20210208152758.13093-1-mark.jonas@de.bosch.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--6sX45UoQRIJXqkqR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 08, 2021 at 04:27:58PM +0100, Mark Jonas wrote:
> From: Hubert Streidl <hubert.streidl@de.bosch.com>
>=20
> By default the PMIC DA9063 2-wire interface is SMBus compliant. This
> means the PMIC will automatically reset the interface when the clock
> signal ceases for more than the SMBus timeout of 35 ms.
>=20
> If the I2C driver / device is not capable of creating atomic I2C
> transactions, a context change can cause a ceasing of the clock signal.
> This can happen if for example a real-time thread is scheduled. Then
> the DA9063 in SMBus mode will reset the 2-wire interface. Subsequently
> a write message could end up in the wrong register. This could cause
> unpredictable system behavior.
>=20
> The DA9063 PMIC also supports an I2C compliant mode for the 2-wire
> interface. This mode does not reset the interface when the clock
> signal ceases. Thus the problem depicted above does not occur.
>=20
> This patch tests for the bus functionality "I2C_FUNC_I2C". It can
> reasonably be assumed that the bus cannot obey SMBus timings if
> this functionality is set. SMBus commands most probably are emulated
> in this case which is prone to the latency issue described above.
>=20
> This patch enables the I2C bus mode if I2C_FUNC_I2C is set or
> otherwise enables the SMBus mode for a native SMBus controller
> which doesn't have I2C_FUNC_I2C set.
>=20
> Signed-off-by: Hubert Streidl <hubert.streidl@de.bosch.com>
> Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>

=46rom I2C highlevel view, this looks good:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--6sX45UoQRIJXqkqR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAiZrIACgkQFA3kzBSg
KbatLQ//UULY14lvrfB6i/awuvHEqTSMXT/6zrn1xqndERDVy3I6szmAU9VUDPKJ
udtnv3Cam1sDZfjTYn1NpeOQ7DoQga9hkoT9j9LsyPLgE0CyA+c1p02unNUlawwQ
Wvi7B6+7tTFFk6Pw3EOTqt7qP40sLfmhu1wMsST/geeRKZxJ9QQp5PzC52F4byLj
VJLfZF/ZcV3nzKQK/cSMuwtSOu2c5TAEAi95kMO0GpfAzW9crvEuJNQ6tgWGKiey
vmW3k1LUyWAuHLzKrWPfXY1hRjCJVaGjSv7rgfbICoMLjWu9LT258zWTna1zZXIR
TRz7JrOjfXuiNS7tBuSsAkxGpSECGDq3dzZENxKSQZH24v79V3FnJTl6iiRUPPFj
P/7udPaIB0iu8alxy7o9r6U6uqCL9lg98lR0/IsiaGuCEmc0iD593Czzze/FyLHy
MjMONDo7VLJEyyuFv5eyW1NFTLz0W2fLmdx5HybrXrEjXD+0OUfbIhw9vWIVNiXE
m9yklaPV+AKKDOvZxnoC2XpnCPbWSnsbB45WLeYwFFHX41hz7iQJWkheUWA7wfay
pXd1RS0T8HIOh650Jds+oEMTMy3/XGV12Tw6NBxS6257YPzbznHnkVG8M/aAryXi
hy5XWIB+rC5/bhfVJ8zA0PCl1epH+7goQVWpGtonD0Cy62DJ5mw=
=FlX0
-----END PGP SIGNATURE-----

--6sX45UoQRIJXqkqR--
