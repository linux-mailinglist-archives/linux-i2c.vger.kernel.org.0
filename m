Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3639612063
	for <lists+linux-i2c@lfdr.de>; Thu,  2 May 2019 18:39:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbfEBQjs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 May 2019 12:39:48 -0400
Received: from sauhun.de ([88.99.104.3]:55742 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726386AbfEBQjs (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 2 May 2019 12:39:48 -0400
Received: from localhost (p5486CF77.dip0.t-ipconnect.de [84.134.207.119])
        by pokefinder.org (Postfix) with ESMTPSA id 450E82CF690;
        Thu,  2 May 2019 18:39:46 +0200 (CEST)
Date:   Thu, 2 May 2019 18:39:46 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc:     linux-i2c@vger.kernel.org, masahisa.kojima@linaro.org
Subject: Re: [PATCH] i2c: synquacer: fix enumeration of slave devices
Message-ID: <20190502163945.GD11535@kunai>
References: <20190430094734.21414-1-ard.biesheuvel@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="W5WqUoFLvi1M7tJE"
Content-Disposition: inline
In-Reply-To: <20190430094734.21414-1-ard.biesheuvel@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--W5WqUoFLvi1M7tJE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 30, 2019 at 11:47:34AM +0200, Ard Biesheuvel wrote:
> The I2C host driver for SynQuacer fails to populate the of_node and
> ACPI companion fields of the struct i2c_adapter it instantiates,
> resulting in enumeration of the subordinate I2C bus to fail.
>=20
> Fixes: 0d676a6c4390 ("i2c: add support for Socionext SynQuacer I2C contro=
ller")
> Cc: <stable@vger.kernel.org> # v4.19+
> Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>

Applied to for-current-next, thanks!


--W5WqUoFLvi1M7tJE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzLHVEACgkQFA3kzBSg
KbahIA/+PRmzMU+K0PVzMGVM/7DoomkGUVeEPpT3ufnbhKAWpzfGp24nQxxiaGZb
eTH61RbYJrikp1mRdoOe7DOIXIGNsK6QmymWSeqVq59P79BjQ9F90ndY7mNjktCi
XFwvzu1Eq061TXCjY+cXGbbqXUnQHglfZz9kK6ZIz0CSYeibYvVmgjn6/PGHi0aV
/RXUUgBJSeBEGIJuw5hBbDjPQmqAYxVGS6JJzn6t2If1geufDayt5Ht7zj4tLzCl
Kf9KnNw/EvQArDrsaRWSB5L2MEZzqIkk2dKfQf036TuhuFJAOatrP/J7J2XtTGmj
3D1MwO8A+pYVihii/+SKbKKEFP+jxaVQ+UY1dXUoIIY6lf+nfFANJ6sf8H78uyA1
2u+QmBKveXbiWXAsoEAbWJ/KjdqedyHPe4ofdkk6Ygbv4F9xL3ggDtXbIZU7p7o3
iIwvFOzuxB43DKf6ko5y2zCIiZW3Tm4ns0YNr3DjlHfj0LokgXL2dOHwCcVIpI1W
Rtmj/luy6K2z10FV5utTfeEPHG5ncSJug/IlphTnTVHnGAWnjT+ylD6I76swFcxu
sIhUQat5WhlA0YABHfG6xeh3+esBOUo+iWF6P9UZ3k4YJz1W/pAc/cwXC1vCE4di
NHtKE89nCHr8T7j9WaoNJp3GCPhmxSybdbOZu0OwhYToPdkwMKE=
=hjXX
-----END PGP SIGNATURE-----

--W5WqUoFLvi1M7tJE--
