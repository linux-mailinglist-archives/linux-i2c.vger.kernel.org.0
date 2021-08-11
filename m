Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 858623E93DB
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Aug 2021 16:44:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232674AbhHKOoq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Aug 2021 10:44:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:35370 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232670AbhHKOoq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 11 Aug 2021 10:44:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2845260FC0;
        Wed, 11 Aug 2021 14:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628693062;
        bh=iENCmTAChxUcUyoZctIcCtQxghcYxqK+DMT40qf2nxE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bl4g9AZ+yHqwZD45P793DtE4EzwaufEPT5rHqMtZNSlgim2eHADZFLcNnIlc4ZQ2o
         aUB4GhUVRwGByqDzwPKp2aeqcbfRcX/1caVOFp2vvZo+4zul693xSwyYAUKrI/1S8p
         1gTW+80i9nJ7wretpK8Ol/kDrGoGE2+DbymIuvAKtvI0LGn9CTcVU9PDXAybc2L3yx
         gZNuqndE55Ifst3KZ4kF4O0rw4g6ZvI0Df5jklGOuIJnryoLR25SYU56Y0DCKi5OUD
         Wj0o9k81Klo9RxoUncq/vzdWsBZGQsGt99UtXBoB3oHqtqwsOqhuj42xZajv+HWji/
         4CvUo71yBylzw==
Date:   Wed, 11 Aug 2021 16:44:20 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v3 3/3] i2c: designware: Fix indentation in the header
Message-ID: <YRPiRFqKOqWV4sUx@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20210712142027.22900-1-andriy.shevchenko@linux.intel.com>
 <20210712142027.22900-3-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="YEXLLkiSpIxP5IEq"
Content-Disposition: inline
In-Reply-To: <20210712142027.22900-3-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--YEXLLkiSpIxP5IEq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 12, 2021 at 05:20:27PM +0300, Andy Shevchenko wrote:
> In couple of places the indentation makes harder to read the code.
> Fix it to be sane.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to for-next, thanks!


--YEXLLkiSpIxP5IEq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmET4kMACgkQFA3kzBSg
KbbVgA//X4biMBtzKdSQzC1xp1l/x1Bg1zffWmb//b2cMcAluZ8iHQ/zj1sLJN7Q
NlNDftLuydTBNWkICX8R/a1WhIxz32covBXxO+dJLlQ2Pcxl3UmbiKOqP31imcAi
yZ2jQydNZGwqet08pCRUGj6y4B3DbnA9iBdiWnCg23JuonKKIL+NHu4T6xMv+ZeB
bfQwe//+q+el1Vj+dm+AX0PqI17o4zaxQVDPhd+H/0K1Pyw/c1oTXU1YIfH0RQGV
qUcolcOZ63s7rvZOYkR260lR5ihCQ1pbllYGuM+7alDhFu8EcvYkBxJXWkFUJMzP
KRzY7B4cHrrd/dK6Kth+f61Z8nbw78T2kT1HWrSwh180WP7bz99MWN6C4vemeDww
icGRoMXi+qAKoDMqGJ9xN0MCoZWbM5NoVYtN9OrnwYPcu1a7VtcWZFTEHOTy7LE8
exqKeF6T3uvoMcuEapKMF89IibmDSdcwHtqstGFyINQQgwMBW+AwbjwS9VixtOHi
1ZEC4S4zOGEXjm54xi67DcRrKyzAeWw5q1NGT9vGdjGUTZFsFrxZZ4E5mPrUzwb3
+dKUaneu2eq9pOGwuR2mNeelbsVrjhu0KR+R6vmkPDsA5OgnHP/m4mIIV1EAoycX
NHx2BrAnLVp3HFWv7Xava9+nnpyAnfuvyQwAeMdAxGMmb8kpoPk=
=dnIQ
-----END PGP SIGNATURE-----

--YEXLLkiSpIxP5IEq--
