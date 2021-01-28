Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A73C30722D
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Jan 2021 10:02:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231501AbhA1I7C (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Jan 2021 03:59:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:49206 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231500AbhA1I7B (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 28 Jan 2021 03:59:01 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 45D1864D92;
        Thu, 28 Jan 2021 08:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611824385;
        bh=xUNu87wCMjH0CDUYay46yGiklVlrLPUVdAWqPYEwilE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iB0AoMJk4U0NvL9O8bc9i2U63rp/+oQC/iNYlkIWRHBaqMTBgDU2LQaJE/an6TtyS
         899AHTszNULZHRJnkfEmgOBR4h2g1WH6SvliIVD9RMgaUaVM0RPOEwdMh6WWTxEl8o
         MrYQWBRVDl5Rjj6VT8ivNBXGq4zAJXniOE6Ti2uu5walRHL8Uw0vc2cl/G4e8C4Jtt
         MlEf3OxhmYBUu21nwpth7KYkjlULqjj8oqzQVqLSdn/4fsVt4v2JHc9fHDSXi/372i
         GOuVgDYZmfZrqrvyaieizKg1vKv0SAvih1TnQAw9rdKarTAtWf3+WRNlOtZuy4/BGU
         Qq3kCrkaiIXpA==
Date:   Thu, 28 Jan 2021 09:59:43 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Jean Delvare <jdelvare@suse.de>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: i801: Add support for Intel Alder Lake PCH-P
Message-ID: <20210128085943.GD963@ninjato>
References: <20210114143811.1820137-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="u65IjBhB3TIa72Vp"
Content-Disposition: inline
In-Reply-To: <20210114143811.1820137-1-jarkko.nikula@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--u65IjBhB3TIa72Vp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 14, 2021 at 04:38:11PM +0200, Jarkko Nikula wrote:
> Add PCI ID of SMBus controller on Intel Alder Lake PCH-P.
>=20
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Do we still update Documentation/i2c/busses/i2c-i801.rst?

And maybe we should add Jarkko as i801 maintainer because Jean is usually
fine with such changes?

> ---
>  drivers/i2c/busses/i2c-i801.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 4435e5fdc75e..b931b629b457 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -73,6 +73,7 @@
>   * Jasper Lake (SOC)		0x4da3	32	hard	yes	yes	yes
>   * Comet Lake-V (PCH)		0xa3a3	32	hard	yes	yes	yes
>   * Alder Lake-S (PCH)		0x7aa3	32	hard	yes	yes	yes
> + * Alder Lake-P (PCH)		0x51a3	32	hard	yes	yes	yes
>   *
>   * Features supported by this driver:
>   * Software PEC				no
> @@ -230,6 +231,7 @@
>  #define PCI_DEVICE_ID_INTEL_TIGERLAKE_H_SMBUS		0x43a3
>  #define PCI_DEVICE_ID_INTEL_ELKHART_LAKE_SMBUS		0x4b23
>  #define PCI_DEVICE_ID_INTEL_JASPER_LAKE_SMBUS		0x4da3
> +#define PCI_DEVICE_ID_INTEL_ALDER_LAKE_P_SMBUS		0x51a3
>  #define PCI_DEVICE_ID_INTEL_BROXTON_SMBUS		0x5ad4
>  #define PCI_DEVICE_ID_INTEL_ALDER_LAKE_S_SMBUS		0x7aa3
>  #define PCI_DEVICE_ID_INTEL_LYNXPOINT_SMBUS		0x8c22
> @@ -1087,6 +1089,7 @@ static const struct pci_device_id i801_ids[] =3D {
>  	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_TIGERLAKE_H_SMBUS=
) },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_JASPER_LAKE_SMBUS=
) },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ALDER_LAKE_S_SMBU=
S) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ALDER_LAKE_P_SMBU=
S) },
>  	{ 0, }
>  };
> =20
> @@ -1776,6 +1779,7 @@ static int i801_probe(struct pci_dev *dev, const st=
ruct pci_device_id *id)
>  	case PCI_DEVICE_ID_INTEL_JASPER_LAKE_SMBUS:
>  	case PCI_DEVICE_ID_INTEL_EBG_SMBUS:
>  	case PCI_DEVICE_ID_INTEL_ALDER_LAKE_S_SMBUS:
> +	case PCI_DEVICE_ID_INTEL_ALDER_LAKE_P_SMBUS:
>  		priv->features |=3D FEATURE_BLOCK_PROC;
>  		priv->features |=3D FEATURE_I2C_BLOCK_READ;
>  		priv->features |=3D FEATURE_IRQ;
> --=20
> 2.29.2
>=20

--u65IjBhB3TIa72Vp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmASfP8ACgkQFA3kzBSg
KbZXiQ//dF5rsqC/o1rdt2VYnocxMIhKPq6Jnj0ZUpKMugWXcf6bSBwCszvoDT7X
3XpBGDN1ImDHXv9ttllMGpbGdGgOj1ZWzoMRe340GpynNKK/oO6EaHCFc8fC0aHI
0cfVgCql9oyk+XnYp9sf0B/4XDaVFIIfZ4J2giLaX78oTH/PJkVB+vSkEPdMyWtj
nKAULp56Hfbegpe0fU10QfNgu4qzNcPGFW+isocBJ5gGitiYt2YKQwsnE1z1UzGf
wfLWBWWoaZ6rxBZ9g0KmL5chF4DKZPNe6uyAeTj9Q1NUCziVD1f9MHEyTa2iZuwS
2hAd5JtWlOTHnBrDfpx9/Dwv241iitI1+RfbDNvvJ87RWiyGL8zcxQ73KiKhWb80
taQhs/BHeiWAcAGlIUU7azZ4iNog+160DgCpKODqZjI9dAfHSra3J98mZ5AYPVQu
De+bYqWX2uUFE8u5BYO34gE9l8AbMYK6/H06Lbk9HL5tGabJaf5bAFurcWqpYuMw
pFeiUFEZ+dqnjf4GBPNvea/PbdUbxvY0Bp4DCvArx5mk93z/VBQTqKrWezhDPES1
Ld1Ri+tLUH1jFUiBzCVJu591afZewppl5MXiAZAt2e+4AOoIJsNSwhYgYdbQf2DS
vsmDc1x7FOQzcrTEgvpDCtAx9UqWFS/4KDoFB355KfrLN3s0Qno=
=l6YP
-----END PGP SIGNATURE-----

--u65IjBhB3TIa72Vp--
