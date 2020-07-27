Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07D3F22F794
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jul 2020 20:18:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728954AbgG0SSO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Jul 2020 14:18:14 -0400
Received: from www.zeus03.de ([194.117.254.33]:47050 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728815AbgG0SSO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 27 Jul 2020 14:18:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=MZnF27xgoiqCx5BvIJBjRSsq7ma9
        iGshrdV8Bss50Vo=; b=qIcu1ZCvrHfcZsJZjiLXV9mAxWzEMNm97jXlkUQAloGD
        5Iqw8wleoUQzVzS/5gFlOJ3zF9/KREX2Wb2m2hw5N7WX6NNLmMQM6Lywcxo9fn2N
        tX3mBZxuOE2fhxXkX7rm+Zovl1AZ5N1WNACjXZ+AsFw6kdvACn8SugaHY2RHIUk=
Received: (qmail 408821 invoked from network); 27 Jul 2020 20:18:12 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Jul 2020 20:18:12 +0200
X-UD-Smtp-Session: l3s3148p1@vulzWHCr+qkgAwDPXwZZAEO3WtL+/yzQ
Date:   Mon, 27 Jul 2020 20:18:11 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH] i2c: also convert placeholder function to return errno
Message-ID: <20200727181811.GB1034@ninjato>
References: <20200725140736.3629-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="TRYliJ5NKNqkz5bu"
Content-Disposition: inline
In-Reply-To: <20200725140736.3629-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--TRYliJ5NKNqkz5bu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 25, 2020 at 04:07:36PM +0200, Wolfram Sang wrote:
> All i2c_new_device-alike functions return ERR_PTR these days, but this
> fallback function was missed.
>=20
> Fixes: 2dea645ffc21 ("i2c: acpi: Return error pointers from i2c_acpi_new_=
device()")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Changed to ENODEV (because of checkpatch warning) and applied to
for-current, thanks!


--TRYliJ5NKNqkz5bu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8fGmMACgkQFA3kzBSg
KbY3Nw/6A6xWwhF6esvwmmZjaBNbILOpCdvKW0vF8j6vHryFdGp2sn2ndQQF/p9K
4pNKQsTIo6gPJJa0HHTCXaRdY68F2wUoIDAahR8T91CJ1zu84WGyUgAsd3bS02eF
T7r2p/Ixob/aeg36AaNX4/JFz0pUGe3v9iH7cGcMmxYxQMPPWBAcnp/w7hgW83Js
SJoe/VoJReYqTd2SkK7JVs62Wzhg/IqElIY7zDTd8gjdb78D/b6/uPBS/z52S7Lw
tM5MuOa0HucD8F8jZvTophWMyWhCBHWeNPXwYhY+ebcKvYN1WvzZGGV0QOaqcjbm
KW0/jYiiSlW5WAK1t64Hjq+TLi3fM5KhWmkCWPr89HEw/E94Q4gw4uu/84/4GDvL
3nz3xsABE8XqeRb5/n5m3oztiquv9/9W06IO6FMDUZzfIzkz+QBEGcsPenqXq4nc
H/gmHHu+T8J/oOciyS/2PEuSKzphywWsitoAJ7OnzrZ9aIUvPG+BSBpJkDT2mf8u
LhHDGa2TuKikdqwVu91WiHkOCDh1R2fvX0QVX8wY1zhbD4oAwjsVghcECdjMSd7Y
qaFZNj1V3OLr/I/GLxCMUa0u9QYth9Cq9Z4rzNG2mc0iINEgM+cY3Vtwj3Y9X5FG
lokiy2Y28Q9t9R1tldcsoAh0RDYyGDIBJu1b2t5iUr/ERki6x/s=
=L8ZH
-----END PGP SIGNATURE-----

--TRYliJ5NKNqkz5bu--
