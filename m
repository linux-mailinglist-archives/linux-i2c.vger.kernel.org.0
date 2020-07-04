Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27175214442
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Jul 2020 08:08:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725911AbgGDGIg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 4 Jul 2020 02:08:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:55832 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725822AbgGDGIf (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 4 Jul 2020 02:08:35 -0400
Received: from localhost (p54b3324c.dip0.t-ipconnect.de [84.179.50.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0DD98206B7;
        Sat,  4 Jul 2020 06:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593842915;
        bh=1mWzN6LWVzmJ1umDMKG4NzPj+ioyUmr3psSY9CIv4Qs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=t0HDCV9ag7G8qpfHUTMtvZhSfuHySlf7RRD2cR0DWPIjW+nN+mxFpcJb0OeMD6Xsi
         Jsc/TnZWA4OiwT4VYkviAK/11wraqbTCtLvt5j3gIwd5ALGe9lNeqPz6wB5QMUm+a1
         HwIcL5ARLGXs2bOCaJUNiz/1/xtoF4x315S3XwjE=
Date:   Sat, 4 Jul 2020 08:08:33 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH v1] i2c: eg20t: Load module automatically if ID matches
Message-ID: <20200704060833.GB1041@kunai>
References: <20200702101527.10285-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GRPZ8SYKNexpdSJ7"
Content-Disposition: inline
In-Reply-To: <20200702101527.10285-1-andriy.shevchenko@linux.intel.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--GRPZ8SYKNexpdSJ7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 02, 2020 at 01:15:27PM +0300, Andy Shevchenko wrote:
> The driver can't be loaded automatically because it misses
> module alias to be provided. Add corresponding MODULE_DEVICE_TABLE()
> call to the driver.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to for-current, thanks!


--GRPZ8SYKNexpdSJ7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8AHOEACgkQFA3kzBSg
KbZCfQ//ZnBFon3+ZgOD8aA7O7Hv9z8y4fSVe0lAt+ck5g6HsLpgXqt+qOAJ+RHj
RPMOfh2FSOm5rc5ynGzEvFSX8E9ugnZgqUktgClMJmRA89QlU8z8HkVQwcbzRBIk
5zuc4Cl0140Rke+sKlEExnw7EEg4RP5Mfo+bVKRyFi3bweNt63ZTrCjYYqurv2ws
5eavKTKnnouclPGkHtwQkhjW1DJ9G6VldoNTP575wrwFDGYGLwtq2U62sICZJ+JU
O3b5j0iC5bApRlL0YZWoWYdf0qAu5bYq50zrP0TCgfD3FhUEIPGsCUHewJIo1HLB
B2If9K/EMFmRuA5/FU989yBx3jJSTvoE7vOAisdi5VvLRIyPoU2esrB9QJamoDLB
RFl+kb+AyS4gkPJi5pzSuOL2qGdnyRgvliJXDvK/rchdt+lVV1e3r3sThn9PEOLJ
X5u6j3kogbGHOjzh7Ak9q9g+LSKv8QMpwOACRj2RiU61fYFR6DjNbu98m429HRri
LkFRliDbFZmwL7LTQ3vPLMLrVg3x/oRgcARsqGDYa/5GQO75gyuu5nPEt+dqi2FI
0bC8SsHiuOhJLJsJLXmJdS6n/guDzXR1vXsW5gfwUaim+NmltvkFdCCbs1SmeF+h
Rc8sgkQxN7YJTlezP1/bhTh0zGtimxA7Uy5/iew5UoCenbq81fs=
=i7cq
-----END PGP SIGNATURE-----

--GRPZ8SYKNexpdSJ7--
