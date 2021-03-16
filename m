Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5A4E33DA01
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Mar 2021 18:01:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237056AbhCPRA6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Mar 2021 13:00:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:49080 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236981AbhCPRAl (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 16 Mar 2021 13:00:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 476A465111;
        Tue, 16 Mar 2021 17:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615914036;
        bh=05U73IxY49l9mDFTBQgw9uRw0MCIPYqs1gdMaXeV3JE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=t+wbp/m2eh4KPu2YTm1+UO/RugfabPnV3zNooKcLOtWWFrZ1DY4R2kNcC7sSQkbRZ
         E1kS3fC8+F0NnxDPZHtlKBQPlWxUEWSEGA/ZVDobK9ZrsJzFr0nnr9GC9+jrFx2vzx
         5TmwQH7y/RTcSGpbgqt3jcBac48j+zS9yyCctIHXRTIa4kYwPvHML+D8Kk4DiqJKW/
         YvtWqUA9M35pwscRAi9XuoIL7gGZ2G9IDHJSVvAwZuXTBN8+wghW3jQaGtIQR+Fpty
         y+ffHaWc4juNyMDE+M6yO5t5cc7A1MGEG7HzbnTwmNlO8Of44XxNcTXLMcbtR+Zyfh
         YDVtlwyhC6N3A==
Date:   Tue, 16 Mar 2021 18:00:33 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Mark Jonas <mark.jonas@de.bosch.com>
Cc:     Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, Adam.Thomson.Opensource@diasemi.com,
        stwiss.opensource@diasemi.com, marek.vasut@gmail.com,
        tingquan.ruan@cn.bosch.com, hubert.streidl@de.bosch.com
Subject: Re: [PATCH v6 1/1] mfd: da9063: Support SMBus and I2C mode
Message-ID: <20210316170033.GB1110@ninjato>
References: <20210316162237.877436-1-mark.jonas@de.bosch.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="kVXhAStRUZ/+rrGn"
Content-Disposition: inline
In-Reply-To: <20210316162237.877436-1-mark.jonas@de.bosch.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--kVXhAStRUZ/+rrGn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 16, 2021 at 05:22:37PM +0100, Mark Jonas wrote:
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
> otherwise keeps the default SMBus mode.
>=20
> Signed-off-by: Hubert Streidl <hubert.streidl@de.bosch.com>
> Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--kVXhAStRUZ/+rrGn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBQ5DEACgkQFA3kzBSg
KbZSJw//WSvavoNZA3U9LAgm5FpQsMZCe/A5A74TjybIM89va6ZOyalu341WhEBz
DoTjedJYuiCzK2Dh8qHjLaxChrkTPlM8wYQ+hgA7irVb2rM16cCwttoBd1QDcJIK
lz6iNxZpRonfLCsqB14+LHTgvW+k1mRzjd9pIE1e04+fekb/258zabo5lvM6N8KQ
0TaYfBGVzIiG/9R7bNw59cE/FK+nwDjUYrEf8o+2hoWe97eCbJcGNkkSYv0hkgO4
q3HZ2TXZSSOaxVL9lPvk/sMYT7Y+eeHQZbpncKrprvuMSWFHtFDqMC78YJmCyujA
fXMM6B0QMslwXLBhuuChEiUBm+1Bz+4REDGI0UBpFd8oIN97WP6n19o4zoQXQEqA
Ld9I6K9hgeb40BHg6tyzr7HOR5pSu4gkipXqxIkPKqxtKBr7shrUzlSIojX9oI4N
3kpXQSiu9Lxweg6SFMSqbmF5xokYqVu/KpkxCDuI/B0eFJUSA2Enx92Y8PgF8NTT
C/ajwx/b1VQ8s29kwcSv5y4YivWSz2bbRQNgwe6QAUBgZCi2U2qIM1Q+LfV8E3le
pD+6V4PpFwveB0T44iCCxp8nSddP6mDsJtK2QC8gLibXAOf4aK7a9be9FBFH7bv7
ASnBOacxDRNSQJd5jMvG6TVD/N+MMKODVQQPkWW7LVVnY3sBJwI=
=FXQ3
-----END PGP SIGNATURE-----

--kVXhAStRUZ/+rrGn--
