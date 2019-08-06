Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60C0A83A3C
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Aug 2019 22:27:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726301AbfHFU1M (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Aug 2019 16:27:12 -0400
Received: from sauhun.de ([88.99.104.3]:36476 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725948AbfHFU1M (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 6 Aug 2019 16:27:12 -0400
Received: from localhost (p54B3324E.dip0.t-ipconnect.de [84.179.50.78])
        by pokefinder.org (Postfix) with ESMTPSA id 9D8162C290E;
        Tue,  6 Aug 2019 22:27:09 +0200 (CEST)
Date:   Tue, 6 Aug 2019 22:27:06 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Shaokun Zhang <zhangshaokun@hisilicon.com>
Cc:     linux-i2c@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Subject: Re: [PATCH -next] i2c: designware: Fix unused variable warning
Message-ID: <20190806202705.GA911@ninjato>
References: <1564997468-48538-1-git-send-email-zhangshaokun@hisilicon.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
Content-Disposition: inline
In-Reply-To: <1564997468-48538-1-git-send-email-zhangshaokun@hisilicon.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--gKMricLos+KVdGMg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 05, 2019 at 05:31:08PM +0800, Shaokun Zhang wrote:
> drivers/i2c/busses/i2c-designware-master.c: In function =E2=80=98i2c_dw_i=
nit_recovery_info=E2=80=99:
> drivers/i2c/busses/i2c-designware-master.c:658:6: warning: unused variabl=
e =E2=80=98r=E2=80=99 [-Wunused-variable]
>   int r;
>       ^
> Fixes: 33eb09a02e8d ("i2c: designware: make use of devm_gpiod_get_optiona=
l")
> Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>=20
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>=20
> Cc: Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.org>
> Signed-off-by: Shaokun Zhang <zhangshaokun@hisilicon.com>

Applied to for-next, thanks!

And let's all (me included) try harder to pay attention to build issues
when reviewing.


--gKMricLos+KVdGMg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1J4pUACgkQFA3kzBSg
KbZkLQ//YTJBbEbuAoeXVwFcXYKoF5V2ufZYQGHqyBlEybNkDzTI/KzsWifWtyTx
xQXos1A6+Myb6qbvfMOKGtg1cuVmIaliPZyKhVuXO4TW1VH4RWadP7IbOT2MGOMN
pXzhkKw8RyqBXUY6eqWcwter86BAdM5kLpC8vkah2r+BObzVQ/xPgls6UIlPdP9Y
1JWXLnoljS08liB0RXWK3jCDBc2JAJnP9LpFwxwzaJ0c+vrXvesLM0Eq/1gO+mO7
1NzwezYtFhiS4ByGfQhNiTnfaYyIR9Ei3ra1K4/l2DMI2ELrDDUSrWTvwliIY5hm
yxolLItMBTbnC/IKbMZP9PtBhRG3U/9vMi8CfRQ2wQVOixGXwXj8qcmSKnCjkjll
7y0P2cL0DBiUbi52YhXBjGNdMIZ615znfziYcXCn7XJW3OnaqypmflBz9OqmCgZg
+PifeWBLpXcMdG+Z0kgLnC+WfLYQsWcjUi9nQPbmv24Y2wY3bh7ky0cQzkZzmN6Q
/qQrw9CjQLVv1Px1YGi6VKDVvLEbTqnxBEPtI49Uku7jGS/cPBGeazthAVA3zWWI
AJ6pnvL5UUFeb4G8C0qLhz9H3bZeQtEmHFtpLdgrQRhUz2UWaiGro+nDPPK9qY5G
dXPgDCbw9eMDxOXogdKr/RU19TY11dflj0Gf4eVlKcTbhLIGHJg=
=R/RX
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--
