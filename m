Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1C3C459F64
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Nov 2021 10:40:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231250AbhKWJnb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Nov 2021 04:43:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:60236 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231246AbhKWJnb (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 23 Nov 2021 04:43:31 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C897C60F51;
        Tue, 23 Nov 2021 09:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637660423;
        bh=FB+HyVss+I1hDMO6RF3wCs4472qFOdCgUtX9AKs97wI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NGmed/XNEybFTvSq9BfzyAqr8W259wWhYjTWl2sfQBSZMnJSeEp8PWLA662AVrAck
         Nmen9ICsyL7/MzrFGI42V1M3YpMpTZ4QMa01guWLyiISEhbvUjbi46SC14Byb89Wn7
         2+JSMZkojowZPTHO+vcpeYjSEVeSOwyEf1fpMTNjEW/qxde8p8Dj7eRXTCo8ykO9tT
         AjUR0xBeFUsin7eLEiVQnCwUE+GnCRfGnrMK2mlBHprc14hfSW+44kDWzOFoA32fox
         8cjuT1Dwx0BGgqNfnoJA3TfzJe3w+Wv4pXdJQEiPR9rB7W1Wvu3g2QAvttv39M5T79
         wW+G5D3W2wMkA==
Date:   Tue, 23 Nov 2021 10:40:19 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        ck+kernelbugzilla@bl4ckb0x.de, stephane.poignant@protonmail.com
Subject: Re: [PATCH v4] i2c: i801: Fix interrupt storm from SMB_ALERT signal
Message-ID: <YZy3A/2AXxRYjeN6@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        ck+kernelbugzilla@bl4ckb0x.de, stephane.poignant@protonmail.com
References: <20211117094509.433463-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="cmUOQPFfkIrKcjFx"
Content-Disposition: inline
In-Reply-To: <20211117094509.433463-1-jarkko.nikula@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--cmUOQPFfkIrKcjFx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 17, 2021 at 11:45:09AM +0200, Jarkko Nikula wrote:
> Currently interrupt storm will occur from i2c-i801 after first
> transaction if SMB_ALERT signal is enabled and ever asserted. It is
> enough if the signal is asserted once even before the driver is loaded
> and does not recover because that interrupt is not acknowledged.
>=20
> This fix aims to fix it by two ways:
> - Add acknowledging for the SMB_ALERT interrupt status
> - Disable the SMB_ALERT interrupt on platforms where possible since the
>   driver currently does not make use for it
>=20
> Acknowledging resets the SMB_ALERT interrupt status on all platforms and
> also should help to avoid interrupt storm on older platforms where the
> SMB_ALERT interrupt disabling is not available.
>=20
> For simplicity this fix reuses the host notify feature for disabling and
> restoring original register value.
>=20
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D177311
> Reported-by: ck+kernelbugzilla@bl4ckb0x.de
> Reported-by: stephane.poignant@protonmail.com
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Applied to for-current, thanks!


--cmUOQPFfkIrKcjFx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGctv8ACgkQFA3kzBSg
Kbb2SRAAlcLQs4nonOcR/u+pmUePqDmDbZjpEnukDgLN3WAxf6R0/NfgbndZXmgY
Kx7Hymes0Hc6xbdMCW7iajS6FNDUk6RF8JmH7bFM5MoqapeBe0EQFGgBHOavpNVg
oT34wuUtDXlCULW/ORMpcETzr/h6PTcFMGksn8oR9pvKi0Gn1kc5hcek5noSCAwK
M/79/v0BOEnRsBlmyqD2xAnvvlDDqfU5YMiDD8/KQ/afi5C5bsn8nRpJ31vaq0m/
5iLjmwtROttK+yiU5j07FEQn7dMaGqc+BOiuhkNTZ4mPdQ2qK0D7YC4ZyOayYPTy
3tYEuEwvFIZ7ykf/BXSdTkhlk+C/fSx6Nffk3U5j4pvy/9JNH0Gm4FSL/pd1aq66
/DpQnVYdNkjyRTcVUYCRB9DRSwmw1IgwThUq41SumqG98+6f2/N0jjcoRs+WhSB+
ksD+pFA1UmFxOxUus+nEN6cUHOw4QejyW8qxhfFpjtUwVK8syAmsD2JxbyJiKzV9
7eMOFESwBuXUPUZKrX2Uv1PeTHbTo6rtCgK/b4YYl6wFcPqZ30XsnpJKx57U51B4
05Jp34SRMa/lwOzNsljf5Cny49sCICPqM4+XSgQcHyULVTLxT0qrTlaI7DlSe6X9
Z+6yWvqL8FEF9B67s0CeVmpqtJ4SJ4HnE2yLjmkBYJqIVQ20npY=
=Javz
-----END PGP SIGNATURE-----

--cmUOQPFfkIrKcjFx--
