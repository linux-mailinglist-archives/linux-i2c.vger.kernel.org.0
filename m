Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54E04300305
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Jan 2021 13:33:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727078AbhAVJ0P (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Jan 2021 04:26:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:59820 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727376AbhAVJRS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 22 Jan 2021 04:17:18 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 69725239D4;
        Fri, 22 Jan 2021 09:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611306461;
        bh=nV3I3ct6uOXZdsO/zAKfYmcrv4KNXm6gHX/iiv9UjrQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sYf3PzMCN3IkVyPRGtRZ0mFh/GfcyzepIlbb8ZQltNttPYuxIS2c86dvo2IiVHtYp
         Q+7SiTXu3Q1qkF4TgXOQPxX/a2Co/tACASDhAjYQyrwCISzoANRK6zfVtL6tVP62qR
         VSuEDT1VWcoLW0/S+SB7l2cnxK3RlEzD3MdiUz4RHUit3bAU6kl8O068qy6oxDjPZ+
         uXstxzunYM5+xhpZqcHzVzRuPJEonVwfsahme4d0x9xaF/wSIOtWvdQBAwkJREw7/J
         ELbT44JxOwU/kLiEKc07cGrgl7zV3uH1NeNl66Ux/8XfieyPgsOu+TIcgHJVrf11i8
         lQoQGc/CT5rBw==
Date:   Fri, 22 Jan 2021 10:07:37 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Youling Tang <tangyouling@loongson.cn>
Cc:     Seth Heasley <seth.heasley@intel.com>,
        Neil Horman <nhorman@tuxdriver.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] i2c: ismt: Use dma_set_mask_and_coherent
Message-ID: <20210122090737.GG858@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Youling Tang <tangyouling@loongson.cn>,
        Seth Heasley <seth.heasley@intel.com>,
        Neil Horman <nhorman@tuxdriver.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1606978252-26169-1-git-send-email-tangyouling@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qxfKREH7IwbezJ+T"
Content-Disposition: inline
In-Reply-To: <1606978252-26169-1-git-send-email-tangyouling@loongson.cn>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--qxfKREH7IwbezJ+T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 03, 2020 at 02:50:52PM +0800, Youling Tang wrote:
> 'pci_set_dma_mask()' + 'pci_set_consistent_dma_mask()' can be replaced by
> an equivalent 'dma_set_mask_and_coherent()' which is much less verbose.
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Youling Tang <tangyouling@loongson.cn>

Seth, Neil, are you OK with this patch?

> ---
>=20
> v3: Fix build errors of incompatible pointer types.
>=20
>  drivers/i2c/busses/i2c-ismt.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-ismt.c b/drivers/i2c/busses/i2c-ismt.c
> index a35a27c..88f6039 100644
> --- a/drivers/i2c/busses/i2c-ismt.c
> +++ b/drivers/i2c/busses/i2c-ismt.c
> @@ -903,16 +903,12 @@ ismt_probe(struct pci_dev *pdev, const struct pci_d=
evice_id *id)
>  		return -ENODEV;
>  	}
> =20
> -	if ((pci_set_dma_mask(pdev, DMA_BIT_MASK(64)) !=3D 0) ||
> -	    (pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(64)) !=3D 0)) {
> -		if ((pci_set_dma_mask(pdev, DMA_BIT_MASK(32)) !=3D 0) ||
> -		    (pci_set_consistent_dma_mask(pdev,
> -						 DMA_BIT_MASK(32)) !=3D 0)) {
> -			dev_err(&pdev->dev, "pci_set_dma_mask fail %p\n",
> +	if (dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64)) !=3D 0)
> +		if (dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32)) !=3D 0) {
> +			dev_err(&pdev->dev, "dma_set_mask_and_coherent fail %p\n",
>  				pdev);
>  			return -ENODEV;
>  		}
> -	}
> =20
>  	err =3D ismt_dev_init(priv);
>  	if (err)
> --=20
> 2.1.0
>=20

--qxfKREH7IwbezJ+T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAKldkACgkQFA3kzBSg
Kbb6hxAApGjfA14lG697L3sDX0kkV97wifgK3SOXUJuV+JgidPBfeQ6RG6oU5N07
u+Dfp9SD30HIoG0SxMQYRta6L+JgSZIOPdYqwCGrewCNoFT4qZK2B4P+mMMeGpaC
XX9br17j5XL5/EKkPTl2M0+1Zhs1+nA612LhrpCAOyUxcdLtvbEMjIkzRt8BXv8w
S8jzYaEk8NB+uFzW5JQb1GBAGri+VWk4SWOhm9e1HTtVvqcf2z4B/ekC1uGI0lXM
bRfLe5gnZ2+fy6411IvBaU8yJ8VFtOyQzswsMgerBJ6MYuwd9UtTfhpv74H9Dkjq
sUWjQLvwwKke8utghJKWiWHmeRQNC+Ihes9RjbFyujGWYrU0vMs2k82iyFElHrUq
vA9HQYkyuHUVmjT06iVIb8N8zPs+B8DQtLvC567roxYdY5kHRBCbgZDCegPVc3VJ
IIQLwEt4U4RpQHv0CqDVEp5cQnv+lWtcRkYFwZItw2F4+KTB0Ch+kEtYKZUqv+/k
nPCltlnpGkDSWloexme5twrs0poKW9GRJipQQezV8bP0kcv5JTitd0vEzLIl6mKf
gaBs/5qX5p7+ziXmGcMARMzNmPvVUCw7OmzLGddjnEKulECMa1GgdUQ8+6I3oVXT
moJE/m5qJ1v3DzErmoJtgofD06MeBw4bVYEAsnnpvXR8CUsZDZw=
=Due/
-----END PGP SIGNATURE-----

--qxfKREH7IwbezJ+T--
