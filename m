Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05D5E41FA5A
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Oct 2021 09:51:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232603AbhJBHxG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 2 Oct 2021 03:53:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:44392 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232457AbhJBHxG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 2 Oct 2021 03:53:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7538361AEB;
        Sat,  2 Oct 2021 07:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633161081;
        bh=sIvSK2EP7/bNxMt0lT3kxzdAfTGoeSBeihandePxDMQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cuYHoEfgKt/8PymKwrVtdRwsJzfOuwM0HUbS/NXUtK45abnWgrIGV+rH1kTw5ZQkO
         TN69OYHpL3GxUgtS/ZqQdB1F/Z0kewWzCu/yD6jRL+92l843L6ykBSCjlOgGhNpkFl
         p/4UDVxFuu53Kb5uOzDLcul7K5Ir0MjKWAbXPWO5boIzlHHS+pARssk7oZaT0Tn0Fu
         cSw/7QGrWl5lAvUcl3G0yrqhS5oVRAsMJmxS7zsf1l5xPihpvFnKN0JONiuHguQ+b1
         c7lVL2ILIYyomYp9fo30vcr5x1os6FN5OmES6HJRvS2z9NUt0kn0yZs8/XF6dP2nCM
         jgvgN1Bsl7qzg==
Date:   Sat, 2 Oct 2021 09:51:18 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     syniurge@gmail.com, nehal-bakulchandra.shah@amd.com,
        shyam-sundar.s-k@amd.com, seth.heasley@intel.com,
        nhorman@tuxdriver.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] i2c: switch from 'pci_' to 'dma_' API
Message-ID: <YVgPdvwOGJrEqghZ@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        syniurge@gmail.com, nehal-bakulchandra.shah@amd.com,
        shyam-sundar.s-k@amd.com, seth.heasley@intel.com,
        nhorman@tuxdriver.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <fad542b558afc45496f7a7ba581593cd46e68f7c.1629660967.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="uXHfLlTznz6LvNSF"
Content-Disposition: inline
In-Reply-To: <fad542b558afc45496f7a7ba581593cd46e68f7c.1629660967.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--uXHfLlTznz6LvNSF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 22, 2021 at 09:38:12PM +0200, Christophe JAILLET wrote:
> The wrappers in include/linux/pci-dma-compat.h should go away.
>=20
> The patch has been generated with the coccinelle script below.
>=20
> It has been hand modified to use 'dma_set_mask_and_coherent()' instead of
> 'pci_set_dma_mask()/pci_set_consistent_dma_mask()' when applicable.
> This is less verbose.
>=20
> While at it a 'dev_err()' message has been slightly simplified.
>=20
> It has been compile tested.
>=20
>=20
> @@
> @@
> -    PCI_DMA_BIDIRECTIONAL
> +    DMA_BIDIRECTIONAL
>=20
> @@
> @@
> -    PCI_DMA_TODEVICE
> +    DMA_TO_DEVICE
>=20
> @@
> @@
> -    PCI_DMA_FROMDEVICE
> +    DMA_FROM_DEVICE
>=20
> @@
> @@
> -    PCI_DMA_NONE
> +    DMA_NONE
>=20
> @@
> expression e1, e2, e3;
> @@
> -    pci_alloc_consistent(e1, e2, e3)
> +    dma_alloc_coherent(&e1->dev, e2, e3, GFP_)
>=20
> @@
> expression e1, e2, e3;
> @@
> -    pci_zalloc_consistent(e1, e2, e3)
> +    dma_alloc_coherent(&e1->dev, e2, e3, GFP_)
>=20
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_free_consistent(e1, e2, e3, e4)
> +    dma_free_coherent(&e1->dev, e2, e3, e4)
>=20
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_map_single(e1, e2, e3, e4)
> +    dma_map_single(&e1->dev, e2, e3, e4)
>=20
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_unmap_single(e1, e2, e3, e4)
> +    dma_unmap_single(&e1->dev, e2, e3, e4)
>=20
> @@
> expression e1, e2, e3, e4, e5;
> @@
> -    pci_map_page(e1, e2, e3, e4, e5)
> +    dma_map_page(&e1->dev, e2, e3, e4, e5)
>=20
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_unmap_page(e1, e2, e3, e4)
> +    dma_unmap_page(&e1->dev, e2, e3, e4)
>=20
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_map_sg(e1, e2, e3, e4)
> +    dma_map_sg(&e1->dev, e2, e3, e4)
>=20
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_unmap_sg(e1, e2, e3, e4)
> +    dma_unmap_sg(&e1->dev, e2, e3, e4)
>=20
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_dma_sync_single_for_cpu(e1, e2, e3, e4)
> +    dma_sync_single_for_cpu(&e1->dev, e2, e3, e4)
>=20
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_dma_sync_single_for_device(e1, e2, e3, e4)
> +    dma_sync_single_for_device(&e1->dev, e2, e3, e4)
>=20
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_dma_sync_sg_for_cpu(e1, e2, e3, e4)
> +    dma_sync_sg_for_cpu(&e1->dev, e2, e3, e4)
>=20
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_dma_sync_sg_for_device(e1, e2, e3, e4)
> +    dma_sync_sg_for_device(&e1->dev, e2, e3, e4)
>=20
> @@
> expression e1, e2;
> @@
> -    pci_dma_mapping_error(e1, e2)
> +    dma_mapping_error(&e1->dev, e2)
>=20
> @@
> expression e1, e2;
> @@
> -    pci_set_dma_mask(e1, e2)
> +    dma_set_mask(&e1->dev, e2)
>=20
> @@
> expression e1, e2;
> @@
> -    pci_set_consistent_dma_mask(e1, e2)
> +    dma_set_coherent_mask(&e1->dev, e2)
>=20
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied to for-next, thanks!


--uXHfLlTznz6LvNSF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFYD3YACgkQFA3kzBSg
KbYu0Q/+PtIEYynAEiJoePONop4qyjpKf7cFhQ+JIZRHdWoOo4WMNQTMPHAtWEGB
6GZHNfDB+v/P/LHGEbnDAzD0pfDwMTi8A9ad4MNGILUPeCGxvc6RQwz8OZOW/SuS
8Tics4yhwDAmqlzLpo7i0xc8jPbaqkvGl+fOK++dTykPtXvRqZq+DbEteo6YAQtP
v2KpTTEZ+cuQa0tJ/gx3HwbnlgiMHst9N8ttsbsvtP3+Bm1Q8BtpXwkDqGdfqS/b
t0cj8P5qTYhIX0XR7+sepBpmAfO5YiO5kthv90SOrJKfUPWlsZxYzTsWg2TEUTKN
2pG7G4KZH7Qmp1tuBTnd2I0S/aDDklzca5Mx1c4WQkTcoXtF8fP+bWVshAEgaZEh
rUsSPkesnrxEDUS7bKvJtBZ1+zGr5pL9MPvVDvJ/aI5xcpVLFaojI2qHoSpi/nkc
gkxMJvqXtbMyFlDPh3215Hthuhl14LwdfXQEV6PKbPhO4Mu8jOEA/z3FkQKwIlut
Kw9OjDt1oX1Kbeq1m6T8VBoYscB+CLuZ3zd4YzDAd2v4IZeAPYLQdd9Ug0hN+xEA
kHq9MFoHCS/3qNELjCVsHlQ+GwK/Mdjwe8RoG428iwmjFGe17eioWVgm3BXMGPD0
etFhicXjZ8F2pwvWpIxNZmfy/dfBoVB1vZUSPQYhnIJxXaL4A/8=
=PHaG
-----END PGP SIGNATURE-----

--uXHfLlTznz6LvNSF--
