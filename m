Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A37B2CDFA8
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Dec 2020 21:23:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725987AbgLCUWP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Dec 2020 15:22:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:42382 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725885AbgLCUWP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 3 Dec 2020 15:22:15 -0500
Date:   Thu, 3 Dec 2020 21:21:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607026894;
        bh=p8omIdsR+uEpeIJLjxq2emAiDmOZwdWdISdpTG4Dpi0=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=KAhJaUiV8FRfFjAYADFwpw64mJvDkv9u7eBm/8DZKjh5tbk3QI1kAwFDaksLl/Ry6
         Sl88FnJX3xNoU2+ZItDQ7uAilYaImlx2glj3h+WvyzNDjhG68jHPGS7iaJ+QYZxtxA
         ice9SZoJKzOtpY+QSBjMkBD3JUc+jlOjhUNQ6bpeGtmUuvwouxnOh+wF7gggEPOm1W
         TfUXM+bbZgvZ3dILE3epLg8EP1yF/YPh4F286PFzV2aVr01M2PgM6cscVBdSRpm/sF
         9JxbaF9LUG7daID8RwImICNqt2aoOwnw4nH5xLSfl2u75JZa0BF8lRscT/AeEK4nCU
         931rMQ/IocDLw==
From:   Wolfram Sang <wsa@kernel.org>
To:     Seth Heasley <seth.heasley@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Neil Horman <nhorman@tuxdriver.com>, linux-i2c@vger.kernel.org,
        mario.posso.escobar@intel.com, seth.heasley@intel.com
Subject: Re: [PATCH v1] i2c: ismt: Adding support for
 I2C_SMBUS_BLOCK_PROC_CALL
Message-ID: <20201203202131.GD3585@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Seth Heasley <seth.heasley@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Neil Horman <nhorman@tuxdriver.com>, linux-i2c@vger.kernel.org,
        mario.posso.escobar@intel.com, seth.heasley@intel.com
References: <989a41d4e72610c8ddf36372e9a84de48f27c246.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="76DTJ5CE0DCVQemd"
Content-Disposition: inline
In-Reply-To: <989a41d4e72610c8ddf36372e9a84de48f27c246.camel@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--76DTJ5CE0DCVQemd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 03, 2020 at 12:51:02AM -0800, Seth Heasley wrote:
> On Mon, 2020-11-16 at 15:32 +0000, Andy Shevchenko wrote:
> > From: Mario Alejandro Posso Escobar <mario.posso.escobar@intel.com>
> >=20
> > Expand the driver to support I2C_SMBUS_BLOCK_PROC_CALL since
> > HW supports it already.
> >=20
> > Co-developed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Signed-off-by: Mario Alejandro Posso Escobar=20
> > mario.posso.escobar@intel.com>
>  Reviewed-by: Seth Heasley <seth.heasley@linux.intel.com>

Thanks! Applied to for-next again, not changing the tags this time.


--76DTJ5CE0DCVQemd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/JSMsACgkQFA3kzBSg
KbaKURAAmGoxczTkE3uHZpNuuNm+qsDoUPkL9B/yFqHecWNuK8EwtlTOwfBDLDwY
uflJpKvrbZzdq1qzg+nBtKZuudMnV8qwnwUAxygRI+yXor0Z1tVosgeLbKQn3Wy4
jYkMvt8fI0oTF+z9nK/Dbdd/EonO1ypJHfsI+gdZM0wglFS4I7mpt708mZrTsGjm
fVsdRnqpGOl863CfCtcsSdZuOZLWTzrUxxQ4K31AN/oTknaFODwO1BMcU3DyRO7F
+YvziOm5E3dzs6KDiYGtPf57N0IHGchLo1Zqm0yMT8CfOyXUCW21JWQED5BDJa1H
JNKpfdi4/WVeOEmDqfETAYnPSHA+v1Y61NOTWloNLAx3firm0EsWhffVbMPBMLw2
LJeHE0KjXfUmAqefTR3rJs97tfDFpux9OWBsW9SUOE9ijJCCcuG7tV1fblMKafCl
rYhgmc2zZkwMWmtSx1rs+2xDBwlDfKLgnAX0UbrcxBBRVr6LFgWwqo+JVhodY+/K
/+/BFtgut9hxq7oShu8i98yCGeF2aXlyRf+fKwuCZ8JQLZzDFmZ2BLljGs4Tlwgy
jVjinelTcfkm1hJ5gvPkk/yGEpYiC7q1pkBUoBc6ZNLZgAUKTPzB1B+GZFJJK7O+
01bpIJJsQ0Au8b52tsnLamfEY8UuUcMg22LMmkZ1nC7Prr8NW/8=
=EYv+
-----END PGP SIGNATURE-----

--76DTJ5CE0DCVQemd--
