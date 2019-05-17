Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C828721C8F
	for <lists+linux-i2c@lfdr.de>; Fri, 17 May 2019 19:35:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728451AbfEQRfU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 May 2019 13:35:20 -0400
Received: from sauhun.de ([88.99.104.3]:54494 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727769AbfEQRfU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 17 May 2019 13:35:20 -0400
Received: from localhost (p54B33248.dip0.t-ipconnect.de [84.179.50.72])
        by pokefinder.org (Postfix) with ESMTPSA id A91052C047A;
        Fri, 17 May 2019 19:35:17 +0200 (CEST)
Date:   Fri, 17 May 2019 19:35:17 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Peter Rosin <peda@axentia.se>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Kieran Bingham <kieran@ksquared.org.uk>
Subject: Re: [PATCH v8 1/3] i2c: core: improve return value handling of
 i2c_new_device and i2c_new_dummy
Message-ID: <20190517173517.GA11396@kunai>
References: <20190516211310.22277-1-wsa+renesas@sang-engineering.com>
 <20190516211310.22277-2-wsa+renesas@sang-engineering.com>
 <5cdbe188-6c0b-1ba9-d4a1-2d836c1e9652@axentia.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="VbJkn9YxBvnuCH5J"
Content-Disposition: inline
In-Reply-To: <5cdbe188-6c0b-1ba9-d4a1-2d836c1e9652@axentia.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> The only nit I can find is that you could perhaps sweep the patches
> with sed 's/i2c /I2C /'. But that is indeed a nit, so if you're in
> a hurry...

Valid point. I'd like to fix it as a seperate patch, though. One reason
is that it is needed in far more places in this file, too. The main
reason is that I don't want to introduce some stupid last minute typo
after all these reviews.

> Reviewed-by: Peter Rosin <peda@axentia.se>

Thanks!


--VbJkn9YxBvnuCH5J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlze8NEACgkQFA3kzBSg
KbYctg/+MAKXjXe1wi3qF2Zpu4B8Lcut6YSTUyP/EtDR4x0u7euOX1r0KhcXyMUT
sJ0ueRef3IG/8NKZI3ygS8TiXt7XdsEpO+EUjhu+Z2EtKAREESysEV2k5Fv9JM6x
DYxXIp0xoIAtesYs1nbTGMf/dQfp3RGyzuDRi1EuWS4Sa9QYxppd6C8SDp6HWWVf
4IWnnuGVlSiHLWpSaqCYMVBX1DdSQJubmlkCKbGKWU1PJBfhFiGcJxFUD68DtMTZ
fffT5P7nujgWFYU3iexzYBllXtJQf/2jG7NVFiATnkK2uL2MW5LGi7Ny6fo4MmFR
jGXYzx16zrltU7MwxQBuqATzYgLudbeOltre90uDXisHqgXsYx40QlzT2rSTaPbE
uxNSbi2qPfwWMG1qra6qHANX9J7JKmak9o64RH19qS8tMA0SoFDguYg8js9f8lDX
ua+g+GDjeFgzhlNBf7VzZSjwx/U3GmyGRRIbWOJ1phbU00IegsYgusZ3BxCkow4v
vQfXD2eP74UlzMiuIBFrxCeJc7V2W7RHw3GUfQgAZc8nvGtatebU2eGTl3zxUJGI
KECQGABYf494Xf/dNklWTXLPF78KqZQ+ShZBBInbb0CP2CYkcybSsghhlsFiY6Uv
j0wkNKDNKB0X58Ux36sMcsQUR7EhEPQAfzIwbX72fdfncjwbjpY=
=hRm/
-----END PGP SIGNATURE-----

--VbJkn9YxBvnuCH5J--
