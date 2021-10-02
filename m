Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 525C541FA57
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Oct 2021 09:51:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232540AbhJBHww (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 2 Oct 2021 03:52:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:44240 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232457AbhJBHww (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 2 Oct 2021 03:52:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0E44761AAC;
        Sat,  2 Oct 2021 07:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633161066;
        bh=MwPjezR9kh3YnUIid+XJgsrLavX6tfp1IzsXZHdX+Ew=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KrQKXzespV6f7WFqwny87FNmRIEmLTa+HWnY6ZRTbxUuDhQ/DtnYF4c8SyRotRxlQ
         vc9MNC6PNhY/R4GUNPkRj2+7OM1buLIda89oEU2e9FVq9lQjgT8eFLcth6IS/ZQeUf
         UjeBFZ1IWP6C9CWhwg7tAmLaGty5XrEvs3TDnz1AYhg/ifIIyIXVsDBwipmakEdsJJ
         YswPoWgbX0pUO1KGM5PgF4q4bA+sad+sy7Hhq/ZJy+DBxpHURIk96S47jvuc9Om4lR
         PYzMp8QF7deg9/qR09TjKLeuCxlIhNtyHF5YNS+JZNrprD/qH23s8ghe03mFsIHcuM
         hBa5UXlveHoqA==
Date:   Sat, 2 Oct 2021 09:51:03 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Qing Wang <wangqing@vivo.com>
Cc:     Seth Heasley <seth.heasley@intel.com>,
        Neil Horman <nhorman@tuxdriver.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] i2c: busses: switch from 'pci_' to 'dma_' API
Message-ID: <YVgPZxNZm3fPqxbb@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Qing Wang <wangqing@vivo.com>,
        Seth Heasley <seth.heasley@intel.com>,
        Neil Horman <nhorman@tuxdriver.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1632800519-108430-1-git-send-email-wangqing@vivo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="F3o/S5cEAXbTt/uY"
Content-Disposition: inline
In-Reply-To: <1632800519-108430-1-git-send-email-wangqing@vivo.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--F3o/S5cEAXbTt/uY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 27, 2021 at 08:41:56PM -0700, Qing Wang wrote:
> The wrappers in include/linux/pci-dma-compat.h should go away.
>=20
> The patch has been generated with the coccinelle script below.
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
> While at it, some 'dma_set_mask()/dma_set_coherent_mask()' have been
> updated to a much less verbose 'dma_set_mask_and_coherent()'.
>=20
> Signed-off-by: Qing Wang <wangqing@vivo.com>

I applied this one instead

http://patchwork.ozlabs.org/project/linux-i2c/patch/fad542b558afc45496f7a7b=
a581593cd46e68f7c.1629660967.git.christophe.jaillet@wanadoo.fr/

because it was earlier and more complete. Still, thank you for the
effort!


--F3o/S5cEAXbTt/uY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFYD2cACgkQFA3kzBSg
KbZRJA/+Odw8AiMc3m3eoihOoBRJkU4Z9PQdPDqG6pmsBz0b7aqsxIknW7Hl7ul/
MFpvZR3vuWjZyuGBqXLSJU2Yz00ykNeNVQl/K6zYuCEE6YsvwxUjwgpkgcZB8J0I
qW+TMoq6ZNbRNQ+ZNELP7NveT0wiq6RLIA7K6GoUGloBSBJFxgje8m6pUxU/2gbE
Xi6hsh6gu8mlAx/OpfpvQvIMoQ2cK4eaAu9x6U8zzCXAZ4tyJSxLL2f/LSsWRJyx
j9IK0VSwPOKxFDX1P+SiagjFjIl4e1dfsiN7A72iAfgdgVMI4OgsrVjyaOGOFeaU
0LNaUf7X6zML+7vE1pL0zjWIpiZySqZiLT8jlq734smWsOk9sAN3Qqf23B57W66f
394lFMw5Hq4HjaW3w7re7x0PPOMsIQjc0xwFhCg8y0Qq55Hv6qB9t6dGQyOuFCiR
eAAtZTs1zGRlfVTyZ2eGNDBWHcUKQ/tPoGjlpH4OtQ+ptJyKvLA9pGt2ackh9nwa
3ykLH+0gblXAm5/XRlIT/79aJ/Xm+SDPpE86RSj8Kutz3pDmsimnlCht6Af/YFtV
d20tbboDhRThXQxIWNP86anyyfQTl4GzSL3F4o1MfOoe+lEW1WerDhzYY5JtYlRT
fXzoAAiN6xKwoZtW5QrlfpHq+3sr7qhbVuMgWQGGQmOc7yj8gTo=
=WX1j
-----END PGP SIGNATURE-----

--F3o/S5cEAXbTt/uY--
