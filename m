Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5811123C963
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Aug 2020 11:40:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727808AbgHEJja (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Aug 2020 05:39:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:36126 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726954AbgHEJj0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 5 Aug 2020 05:39:26 -0400
Received: from localhost (router.4pisysteme.de [80.79.225.122])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E22002075A;
        Wed,  5 Aug 2020 09:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596620366;
        bh=RIKJ7S9fw9O70aUBDXMNNO2mggVWTXReQ5mlFek/Dz8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jpjzs4HzM1Z6XYHbifYK2prin3a143IBXS/+PjfaB0bZEoYyBTad96twfRNEDSDQ/
         TcOnYL5Rea0J7NWF108G4CGH3WvefNla+ji1CS2JwokMha4gckbqyCpDMGGu8s8oR7
         pozn5PCux+WgE4n5/4ohSm6hvq+rUWk7tU1yAmMg=
Date:   Wed, 5 Aug 2020 11:39:24 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Seth Heasley <seth.heasley@intel.com>,
        Neil Horman <nhorman@tuxdriver.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v1] i2c: ismt: Add support for Intel Emmitsburg PCH
Message-ID: <20200805093924.GP1229@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Seth Heasley <seth.heasley@intel.com>,
        Neil Horman <nhorman@tuxdriver.com>, linux-i2c@vger.kernel.org
References: <20200615161001.12817-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="WYfJCIN5rqlfy3K0"
Content-Disposition: inline
In-Reply-To: <20200615161001.12817-1-andriy.shevchenko@linux.intel.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--WYfJCIN5rqlfy3K0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2020 at 07:10:01PM +0300, Andy Shevchenko wrote:
> Add PCI ID for the Intel Emmitsburg PCH iSMT SMBus controller.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Seth, Neil?

>  drivers/i2c/busses/i2c-ismt.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/i2c/busses/i2c-ismt.c b/drivers/i2c/busses/i2c-ismt.c
> index 2f95e25a10f7..cdba77f9ecb1 100644
> --- a/drivers/i2c/busses/i2c-ismt.c
> +++ b/drivers/i2c/busses/i2c-ismt.c
> @@ -77,6 +77,7 @@
>  #define PCI_DEVICE_ID_INTEL_S1200_SMT1	0x0c5a
>  #define PCI_DEVICE_ID_INTEL_CDF_SMT	0x18ac
>  #define PCI_DEVICE_ID_INTEL_DNV_SMT	0x19ac
> +#define PCI_DEVICE_ID_INTEL_EBG_SMT	0x1bff
>  #define PCI_DEVICE_ID_INTEL_AVOTON_SMT	0x1f15
> =20
>  #define ISMT_DESC_ENTRIES	2	/* number of descriptor entries */
> @@ -184,6 +185,7 @@ static const struct pci_device_id ismt_ids[] =3D {
>  	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_S1200_SMT1) },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_CDF_SMT) },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_DNV_SMT) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_EBG_SMT) },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_AVOTON_SMT) },
>  	{ 0, }
>  };
> --=20
> 2.27.0.rc2
>=20

--WYfJCIN5rqlfy3K0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8qfkwACgkQFA3kzBSg
KbbK8Q//f35PG5sS02CGeIde7E4BDJry1rKteSrUQl29mHTJ2WA2TdcW0en2Xt+l
ARaYuIlJXWztWJ8R5VQCSPWRtj6GZYFaYP0ngbxvkKVY8q4VBxlaqDi9z3XJ3Ldj
yMcBwUOK1uWybCd0dFX4HtOco6W7upv4Ho6h4KhD+oizKD//ZNGdaMT7sabZ9I7x
sGMky89hQzqYAYibK8QdNtT44J01v/Ky0QotVg7AicrE6GLHU9YmR3uOM+Hm/OY3
cRni6xFr1mxP/PJpWI3LHa0XU58c0IxVRuZ/kq/FzWTRphtWARpm51UOUpuWjYNS
6Hy9BrDB3u/8JDWDgsLEjGurMZglKS7TQEE40hmVutRUbnHkwZyDeu4WlKISE+oW
BRzFhtY+hMqVMjApkgIvWB8DVfoPo4S4an8CKqzYktHxmEH+Fy2JzLMlC6k0gRAX
NAVe4T5/5ZllQKb516JsSlUeJC4+oklUU3W63Qprf9B8rMyNMdVagTA/t7n5zfrx
Uhi9lmKw9rdQGALobyFSr2gOasjcSiR97ALNJaeQWnds0Xnc2aQ93x/o1i/igS6y
o1SeTKeSOw+XwuoTjS9kQtjKsLSn36d2dky57hNHEd/wSxhlII3dH2TSaCfewYac
5aORRFYNXEWdGysnknEHpDCgY4J1ojFWw8RNDDwupkaRHgpjX7k=
=tGZb
-----END PGP SIGNATURE-----

--WYfJCIN5rqlfy3K0--
