Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1832271F67
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 11:57:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726341AbgIUJ5J (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 05:57:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:35462 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726333AbgIUJ5J (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 21 Sep 2020 05:57:09 -0400
Received: from localhost (p5486cf2a.dip0.t-ipconnect.de [84.134.207.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 23C0C207BC;
        Mon, 21 Sep 2020 09:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600682228;
        bh=n/PGm49Tz9asrI2DPCUCIxPfO2u8WQpKIFxyYjKXcV8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eZWYaTOJiUUW+KyAnXloFE9I5dQSdFEfo9CXy0dX4H97OHk4U9nlz3eLysC3Vab0t
         PgOXPOXBv6GaNUocaRHPMLYqyAc+9U/W0ZHRhXM7IW0FICJwRrC/fIIYIuH+FWyHWu
         glFQtX6ybidlYVWUMYEGvB9se+hYNTGt6LL8VrKE=
Date:   Mon, 21 Sep 2020 11:57:05 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Seth Heasley <seth.heasley@intel.com>,
        Neil Horman <nhorman@tuxdriver.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v1] i2c: ismt: Describe parameters in kernel doc
Message-ID: <20200921095705.GO1840@ninjato>
References: <20200722134355.46098-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="RHdRtM27np9fZUoh"
Content-Disposition: inline
In-Reply-To: <20200722134355.46098-1-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--RHdRtM27np9fZUoh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2020 at 04:43:55PM +0300, Andy Shevchenko wrote:
> Kernel doc validation script complains:
>=20
>   CHECK   .../drivers/i2c/busses/i2c-ismt.c
> .../i2c-ismt.c:182: warning: cannot understand function prototype: 'const=
 struct pci_device_id ismt_ids[] =3D '
> .../i2c-ismt.c:202: warning: Function parameter or member 'dev' not descr=
ibed in '__ismt_desc_dump'
> .../i2c-ismt.c:202: warning: Function parameter or member 'desc' not desc=
ribed in '__ismt_desc_dump'
> .../i2c-ismt.c:649: warning: cannot understand function prototype: 'const=
 struct i2c_algorithm smbus_algorithm =3D '
>=20
> Fix corresponding descriptions to make reader and kernel doc validator ha=
ppy.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to for-next, thanks!


--RHdRtM27np9fZUoh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9oePEACgkQFA3kzBSg
Kbbcxw/+PHt0vbzCFGyB04QYpkXbNN3G6zP1U2LvGgTagNzYfrLcsud09gK66LW2
ckLr1ju3tZPXjtnPhEutg8HEWWIwFAnTXosWwnR3haZdTe+/CGq3C7DNVoF2eZXU
ei22V1He0yaXBndgEQn+9Us2QZS4kAJBEVhaWmua6aQnd1JPiuMkp7eWwfXQQU7G
yTrcHecSCrFXIB8afzJwkj5caIWnUVTnvImsSUG0Ix7QOmsb67bkC3jMSRcwM5it
+EdUp19o1DICfgcaG9fUgkDJXfx3wVQkCPBRWNDIM4d/LIP3bBS3xzySSjyY+9dJ
npnzMOktMWm8iGt9uYqprZrODFw4ClYDNuclI/hFNJ7XXve4QA5ns1H3oae2AB3y
GHL40WlLBk1bh9sQIQ9JdAtb5aRPe3Bx3BjaTulFrgNBIu3cbLcwAf/foG/chMzU
NpPLcuePlgLrA5GlXgmAs434eSJtnvenWhFJT8G3QUdSmAU2NzegnnQvVuWNUclN
7SCF7+5ZM05Cr9eFHtnDxokZxEIVmk7P1cTusmer5sIVKUoxBtgFgeHsUMdSXxum
DsECKFVe/jE/4gSJi8T9sIDhGqmBnzXt8PCfQieaGKrLf3Emka/9rkEVe1DhjdIq
XDqG5AMTFQBTyiNET4dCuTLtXQKvawuMKR0hMbvWgEQnhFMsy9w=
=F3VZ
-----END PGP SIGNATURE-----

--RHdRtM27np9fZUoh--
