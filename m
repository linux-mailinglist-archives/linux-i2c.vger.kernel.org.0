Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80149A2659
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2019 20:47:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727780AbfH2SrN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Aug 2019 14:47:13 -0400
Received: from sauhun.de ([88.99.104.3]:42050 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726518AbfH2SrN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 29 Aug 2019 14:47:13 -0400
Received: from localhost (p54B33070.dip0.t-ipconnect.de [84.179.48.112])
        by pokefinder.org (Postfix) with ESMTPSA id B7BC62C001C;
        Thu, 29 Aug 2019 20:47:11 +0200 (CEST)
Date:   Thu, 29 Aug 2019 20:47:11 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org,
        Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>,
        Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH v1] i2c: i801: Avoid memory leak in
 check_acpi_smo88xx_device()
Message-ID: <20190829184711.GB3740@ninjato>
References: <20190816131705.77750-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Y7xTucakfITjPcLV"
Content-Disposition: inline
In-Reply-To: <20190816131705.77750-1-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Y7xTucakfITjPcLV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 16, 2019 at 04:17:05PM +0300, Andy Shevchenko wrote:
> check_acpi_smo88xx_device() utilizes acpi_get_object_info() which in its =
turn
> allocates a buffer. User is responsible to clean allocated resources. The=
 last
> has been missed in the original code. Fix it here.
>=20
> While here, replace !ACPI_SUCCESS() with ACPI_FAILURE().
>=20
> Fixes: 19b07cb4a187 ("i2c: i801: Register optional lis3lv02d I2C device o=
n Dell machines")
> Cc: Pali Roh=C3=A1r <pali.rohar@gmail.com>
> Cc: Jean Delvare <jdelvare@suse.de>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to for-current, thanks!


--Y7xTucakfITjPcLV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1oHa8ACgkQFA3kzBSg
KbaZEhAAjbwCvYxX5mVZvZg+p4hgA0uoLZVdiaCKP6rvWG4jNcvB2XjQrYo3tnQp
JG97cWTtx+IAivqoVi2eWVW1mGKNXOmaqJpGR9iQ4JzRYjWcmhTa6TTapXZQ4ppw
AhFbC1jBDTrKLlUesNFH+s+e60VHkW2b//1Q5f13uSMR7+j5B7Lp9tIJC/uDBb1a
0pyJ0dn5i3a9afz0zKGcwwwQY8A2/b3w+aA4701i+CLXFasx2B2aOrlC/aSKNWlZ
Z1dGeOEHCLXM5IYcOVGvQrljpQpMzy0UPntsuYYsUeI51/I2kRNrTkiU2xGdkeO2
iSmikAXlo9QcfynrQ08Y5NsNZnpot7xKQmtqU6oYk0IDfc6/umY7uyNFsuYTqfwl
0JEdDvhZPUfQ4UFESJrkOcFRu/S3HdZ7rjU9+QfTNxFJ5KcY/kfdHzWPFSmhgFN/
W6wwUPVZ0w9qWT4qhYs3BK9w/vbAWb0pJAiTHyNYW3ybql+emRciGqYj9/a0nagg
ng/tPu9ngIBM3AO49HOxTIlGDdHoMONBAnAcyhrc0UYt+5sTDep/pZF/m8J5bZ8C
mdABdh+xg87SEGC/2PP0QI7J07UEXAmMJgC3X9aZr8gfzgNEPBzJ+f/GDvQAHOzr
FzHU5Cf6Hj17a2XULCc7u4JAXWpRS2vONONEHW9RiwoUekqRPJQ=
=qEeJ
-----END PGP SIGNATURE-----

--Y7xTucakfITjPcLV--
