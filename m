Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C440823C964
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Aug 2020 11:40:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726891AbgHEJkE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Aug 2020 05:40:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:36306 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726954AbgHEJjv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 5 Aug 2020 05:39:51 -0400
Received: from localhost (router.4pisysteme.de [80.79.225.122])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BC6712067C;
        Wed,  5 Aug 2020 09:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596620391;
        bh=KkUFyLRKGJFctEkmY/cm4CNKFSS0WWqUtpW67BRe54c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Z0bm2pbOaPFtJP2HEb/3dZu9/Sy6Gi8TTSbxFG/0Gci+7VA81IlqcNg6Izscf1zWY
         FWxDUsuIZYYmim90moRiBbRX07xo9KNc27qZVsb0d+VCOYjRDLurUsMi2Qy/woUyFB
         W6nNGotTlYHRFwnidHlxj1ImkvMrRJ5L1ncPKrI4=
Date:   Wed, 5 Aug 2020 11:39:49 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Seth Heasley <seth.heasley@intel.com>,
        Neil Horman <nhorman@tuxdriver.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v1] i2c: ismt: Describe parameters in kernel doc
Message-ID: <20200805093949.GQ1229@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Seth Heasley <seth.heasley@intel.com>,
        Neil Horman <nhorman@tuxdriver.com>, linux-i2c@vger.kernel.org
References: <20200722134355.46098-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xiprIVX1FSGBv8kC"
Content-Disposition: inline
In-Reply-To: <20200722134355.46098-1-andriy.shevchenko@linux.intel.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--xiprIVX1FSGBv8kC
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
> ---

Seth, Neil?

>  drivers/i2c/busses/i2c-ismt.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-ismt.c b/drivers/i2c/busses/i2c-ismt.c
> index 6ba91d4a4ce4..078e01799c83 100644
> --- a/drivers/i2c/busses/i2c-ismt.c
> +++ b/drivers/i2c/busses/i2c-ismt.c
> @@ -176,9 +176,6 @@ struct ismt_priv {
>  	u8 buffer[I2C_SMBUS_BLOCK_MAX + 16];	/* temp R/W data buffer */
>  };
> =20
> -/**
> - * ismt_ids - PCI device IDs supported by this driver
> - */
>  static const struct pci_device_id ismt_ids[] =3D {
>  	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_S1200_SMT0) },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_S1200_SMT1) },
> @@ -197,6 +194,8 @@ MODULE_PARM_DESC(bus_speed, "Bus Speed in kHz (0 =3D =
BIOS default)");
> =20
>  /**
>   * __ismt_desc_dump() - dump the contents of a specific descriptor
> + * @dev: the iSMT device
> + * @desc: the iSMT hardware descriptor
>   */
>  static void __ismt_desc_dump(struct device *dev, const struct ismt_desc =
*desc)
>  {
> @@ -642,11 +641,6 @@ static u32 ismt_func(struct i2c_adapter *adap)
>  	       I2C_FUNC_SMBUS_PEC;
>  }
> =20
> -/**
> - * smbus_algorithm - the adapter algorithm and supported functionality
> - * @smbus_xfer: the adapter algorithm
> - * @functionality: functionality supported by the adapter
> - */
>  static const struct i2c_algorithm smbus_algorithm =3D {
>  	.smbus_xfer	=3D ismt_access,
>  	.functionality	=3D ismt_func,
> --=20
> 2.27.0
>=20

--xiprIVX1FSGBv8kC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8qfmUACgkQFA3kzBSg
KbYnGQ//VnMRbqHTRfj3VcdHRAXERVOIb9TVISWDbYFvrdUkx1MOpitVpkMQWPNS
OgSxlvsHxKgLCjdi1HO+b8MPH1bBxill998pNLqQFMA9cNYUA4Wny+KLeVWOh/YF
yMc3UayDf+ch3BmRtknMw9jamtMDsuQ10YDMGs3q3aEAOZf2TEQzx7jgQrM5jPEl
NUxrvc4IuJQaKTn/BtGtpwIz2nGB72pAJk5SqX60h7KjmPbc1iKkTi0Fy6uYBw8z
fJb6CBSwb853gCL4j14CPBAN8LSLuyaUVsAkJ1DPhPJV8lDs4n48wL7YubDxsaXG
xwrHLJ8TKAbeLkZXP+UK/jC7ttQg8rl3GMZbGpLgrxLiO2uUnOQSO5EB5XPtuYEZ
2vM0D2l9vkBs6m49jtoLdcH+H/KHYYrb6TFm5Xfv+lZ3yGQJ123iLOoTthlZWKxa
BQenI9hZOn7+fXBFVDtRhPknKlTDNuY3vlw16yIBYP2fuhkylhBEtj5LDjsTYe9k
bNBhWzxilzy8amYmQiszTXOjO5aCYLUylRcXOXvNvANctaL+o0avteg3zG+SmCUQ
uKvqlopcuselkvWgmg9C2wzBksaTzbTeCx8XZm3PyCutc4j5W9FOje0/J/oIsYuA
Bc1Z87LtoboKGf5NPNU8ZkI6zXiK6fSdl+P443ZfmciGcjJCMPA=
=++VI
-----END PGP SIGNATURE-----

--xiprIVX1FSGBv8kC--
