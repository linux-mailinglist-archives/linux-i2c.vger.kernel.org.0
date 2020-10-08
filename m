Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7032728721D
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Oct 2020 12:00:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725849AbgJHKAd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Oct 2020 06:00:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:45960 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728996AbgJHKAa (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 8 Oct 2020 06:00:30 -0400
Received: from localhost (p54b33b8c.dip0.t-ipconnect.de [84.179.59.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ED3502083B;
        Thu,  8 Oct 2020 10:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602151229;
        bh=O+NExOukB6rJTsEcD7c6dHp5AxSorYh0KSZfPRbkpso=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QsM38G1enUXW3RKJNm7mxPqlCJm1bDwVv0s+3oagkF42qf7jvuHB3jXQuNwC0HFaO
         LE1/4BW4zQhdgzG2Lum2nawMU45hLaCAsUC7AFP6C3da3zrd5kV9ybiEqT6aNNDC33
         yaekDu1CKn9ffczYxwLfb77ofcRoir4vmW7yZCzg=
Date:   Thu, 8 Oct 2020 12:00:25 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jerome Brunet <jbrunet@baylibre.com>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        Nicolas Belin <nbelin@baylibre.com>, linux-i2c@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] i2c: meson: keep peripheral clock enabled
Message-ID: <20201008100025.GD76290@ninjato>
References: <20201007080751.1259442-1-jbrunet@baylibre.com>
 <20201007080751.1259442-3-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xB0nW4MQa6jZONgY"
Content-Disposition: inline
In-Reply-To: <20201007080751.1259442-3-jbrunet@baylibre.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--xB0nW4MQa6jZONgY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 07, 2020 at 10:07:50AM +0200, Jerome Brunet wrote:
> SCL rate appears to be different than what is expected. For example,
> We get 164kHz on i2c3 of the vim3 when 400kHz is expected. This is
> partially due to the peripheral clock being disabled when the clock is
> set.
>=20
> Let's keep the peripheral clock on after probe to fix the problem. This
> does not affect the SCL output which is still gated when i2c is idle.
>=20
> Fixes: 09af1c2fa490 ("i2c: meson: set clock divider in probe instead of s=
etting it for each transfer")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Applied to for-current, thanks!


--xB0nW4MQa6jZONgY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9+4zkACgkQFA3kzBSg
KbbIyg/9EQZFJDgjjaxVrEUovBqv+sDGCPzDJzH19bCFWHrzhio33cBRQ3PR2YDC
zX+UMPjY3Zf/TPoT2V0FAn2NGwVKzd8Ivb8gVSzfg96NfzAyWHUtxhv8YC1UZfuA
BUoe48zq2gaU6YMkIlMv4Ne6orXt9kezcZkxnIqjtTQtHeYdihf4qSuxQ/N/cRkG
9QsMftsHuCGSX1gKxJBnIHTjbR4hAXlgN6hP/JKfugNl7+UWEAD9PDm038S3GwCd
PCkn+1BZ0jL8MV7S6kjSxI74R4gwj22Aoo6bva9R9zfOrKYHTpG6AQAwFmYaXyLz
o1CpW1iPnvBCYhvk4KJSv2bWnZ0IJHWEMTRDWdAIMYpujllKtO51l3UyLku+yn5H
JCK2w6AyzGaYb48TqES5XCDVpk/MYwCd3Fq3isJrmKIb0V7fNhd8Tt0/9P1SXVFB
APbz3vECxZGtL2DPVXpHUm9ZV89bmB8QFNPZNwuUcApz+BpDvKaBHnq9J0PtTo0M
+tD8BO5lu7CVWFugz5nonbVDM9M8zHRVXcm2gpA0ovRzWCAcm3khtYpR0JL/TVBk
d08SlUo8m6uJGcTl5BTos/Zmr3q1+bnbiRIDuV6n0pRDgBBy+NC7DzgZkDtvpP1i
tIG8L2hKN8ty3u+8uCgbJtfwNO3r2/nqSPFfNNIhtL9WMEYTfxw=
=PNDf
-----END PGP SIGNATURE-----

--xB0nW4MQa6jZONgY--
