Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A2207DC02
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Aug 2019 14:59:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731519AbfHAM7H (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Aug 2019 08:59:07 -0400
Received: from sauhun.de ([88.99.104.3]:52786 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729084AbfHAM7G (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 1 Aug 2019 08:59:06 -0400
Received: from localhost (p54B333D2.dip0.t-ipconnect.de [84.179.51.210])
        by pokefinder.org (Postfix) with ESMTPSA id 4A5832C2817;
        Thu,  1 Aug 2019 14:59:05 +0200 (CEST)
Date:   Thu, 1 Aug 2019 14:59:04 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org,
        Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH] i2c: designware: make use of devm_gpiod_get_optional
Message-ID: <20190801125904.GN1659@ninjato>
References: <20190725202136.19423-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="E0h0CbphJD8hN+Gf"
Content-Disposition: inline
In-Reply-To: <20190725202136.19423-1-uwe@kleine-koenig.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--E0h0CbphJD8hN+Gf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2019 at 10:21:36PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> There is a semantical change: if devm_gpiod_get_optional returns -ENOSYS
> this is passed as error to the caller. This effectively reverts commit
> d1fa74520dcd ("i2c: designware: Consider SCL GPIO optional") which
> shouldn't be necessary any more since gpiod_get_optional doesn't return
> -ENOSYS any more with GPIOLIB=3Dn.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.org>

Applied to for-next, thanks!


--E0h0CbphJD8hN+Gf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1C4hgACgkQFA3kzBSg
Kbb1/A/6Am3kkhBpkXoQQchjfROhiKzpKloJw1/3WhE6homFFZL95w/TZmO0/gzB
l0zoN7rtZ4z3BRNj8OAWqBm5x+NfZTuaNKpsOvpSNUlo7NDcp19OPKSKEAGXzk90
/WEXQPgT4tP35PuAXVcV79nfcaPgMPe9Pm7CFpfMY49g2BRrhoGwKCqs6KBmGRak
w+nECazE4r2hVc11cV59adQMtV9i+r7G/r3K6pgO4qV9fsr3dlfAK0vxwHiX3eU0
O+i1dNd40xbldYClPYbUrhQ5GmxK44j1Z1v7/yFRA6vt3VNzmQk3XdO8ePSLoCX9
xjWDg7FWJWiUFtozuuprZwlnEjJm+f6rjpC2pzL8p1XGI9p6hub0njsbscOvkIRX
wvpvbTmY8m+tOImQhPFLQ6lz+VOJYBWzqf+g8S7u2BtsW4nyHSTpVVkTureI5hSV
r7Hyo2WMQIY341DIhPhZKuWiA1nS0mbwtBiddcdvWfQDjybtxk3Ivlb4rjRAnJZq
qV7ZB/rv9P9XHKuyeGY5A0cb/iW/XRL5YpRqCp3NHENfyYbJlRdw3RD361HArm+Q
yzul8JCvVBx0x0u9eM+XiaAksWGqLgxYa51lIg6jqbOfy3ClinhUJdvZsHGEsFJu
ubflTmLSA613SfYjzeLyHdU+OKp9dLbVXxc8inqAXP3faWJ4nVM=
=Kp0x
-----END PGP SIGNATURE-----

--E0h0CbphJD8hN+Gf--
