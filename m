Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74A322CC197
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Dec 2020 17:04:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730641AbgLBQCb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Dec 2020 11:02:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:40292 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730555AbgLBQCa (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 2 Dec 2020 11:02:30 -0500
Date:   Wed, 2 Dec 2020 17:01:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606924910;
        bh=9y0LlxmEF1cHONU8uCHjPKLxbT3A337K5gUaFRHe1aY=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=ltPsscUqZGVDy54nfKVts0kaQ/+TvCapB9Ql+ZhbZZlng9igkua0WFGVdvuRpHpQP
         Wf/vQyfyFTcI0bw0yPitJ4g5DVB2IzITtU5K7vWsExa52N0fnvncpDfXUvBJ+rukqM
         pM2bkFzMhoh9hlJPCJS1hZZL5v8vLcsW6fR4N8kM=
From:   Wolfram Sang <wsa@kernel.org>
To:     Youling Tang <tangyouling@loongson.cn>
Cc:     Seth Heasley <seth.heasley@intel.com>,
        Neil Horman <nhorman@tuxdriver.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: busses: Use dma_set_mask_and_coherent
Message-ID: <20201202160147.GG13425@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Youling Tang <tangyouling@loongson.cn>,
        Seth Heasley <seth.heasley@intel.com>,
        Neil Horman <nhorman@tuxdriver.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1606223315-13390-1-git-send-email-tangyouling@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4eRLI4hEmsdu6Npr"
Content-Disposition: inline
In-Reply-To: <1606223315-13390-1-git-send-email-tangyouling@loongson.cn>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--4eRLI4hEmsdu6Npr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2020 at 09:08:35PM +0800, Youling Tang wrote:
> 'pci_set_dma_mask()' + 'pci_set_consistent_dma_mask()' can be replaced by
> an equivalent 'dma_set_mask_and_coherent()' which is much less verbose.
>=20
> Signed-off-by: Youling Tang <tangyouling@loongson.cn>

Please use "i2c: ismt:", so driver maintainers know that the patch is
relevant to them.

> ---
>  drivers/i2c/busses/i2c-ismt.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-ismt.c b/drivers/i2c/busses/i2c-ismt.c
> index a35a27c..5f49830 100644
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
> +	if (dma_set_mask_and_coherent(pdev, DMA_BIT_MASK(64)) !=3D 0)
> +		if (dma_set_mask_and_coherent(pdev, DMA_BIT_MASK(32)) !=3D 0) {
>  			dev_err(&pdev->dev, "pci_set_dma_mask fail %p\n",
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

--4eRLI4hEmsdu6Npr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/HumsACgkQFA3kzBSg
KbYDxQ//eZHrOlo9+24Xoy/VSVKvsQWLUtaRtOUxqsorG83Qe9tUSm9z9hmm76Wi
FVirv8rj1CwIXDhWIxth/eibIcReBt+6ndMkaqvGKpRS5+SuJMrDRkOFCS0IGrw6
qqtWk+9+DuV4vStR2HaZ2oY0oCBMF7SATvcyk8CdB5bKHvkv+GZLywWyjPnnWwoT
c3j1DTPF2ieaknl6tAkRpgAlpENhiqNnNschkVY7uEBOh2DajaGkqT4QseR8hx7t
/hCp69RgX/kLaZAI97Ri6J0B4OTMu7K0s0CyrD3kyfmxKsCf7GTnUY+Q7AWh+VdR
N/+wcnFjH6teifVg2S2pQksjBQ9tQ1GVZjcm+TTW8eSv6YT/uKD2h45F8E+2FxKv
ZVyEUUWssplT7x70ueZ6ZEtK0r3bh3hVvb1pAb4m+kMcZuse2WSVxRhCVUB8xG6i
SnxErerPask2DT3BZqv0f1kyTPJMqBmFABuqFHf+6OeJlwJEeMJ0b2MYYcF1pxeQ
/c5Ltf4XvBdChesVYpPgnqQ/K9KFQLP5H40CFMDbZqoq35cWtVcJ0k41bE69z4I8
yvZZGBWU+m+gLTmxj7OJGBdu7md4Bx8nWTRP2YpeoB7YtxwBepfe2NXqbvnJU4lb
EEwZJjROEHaX8L6wK3zW09Vy+8GTz6KXPDaQEc3cYAWwX400Fpc=
=9Dws
-----END PGP SIGNATURE-----

--4eRLI4hEmsdu6Npr--
