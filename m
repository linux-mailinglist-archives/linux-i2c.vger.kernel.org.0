Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEC752F9236
	for <lists+linux-i2c@lfdr.de>; Sun, 17 Jan 2021 13:03:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728669AbhAQMCr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 17 Jan 2021 07:02:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:39716 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728271AbhAQMCq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 17 Jan 2021 07:02:46 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2E7242225E;
        Sun, 17 Jan 2021 12:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610884925;
        bh=O/tnSDMDCRVRjI8g8t3rleyjgCCQyMvi79QgJsgDNuk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cprZR91SodrC5oVvkPHjN6Y0cWAKxQetzdSOryV78BNXQrPFGSs08a96+gSF4JNUb
         XPG5gv44lceepJXtJQLCVx1kj1gFAkwZqmcFG1W2f9lXwLgZLv0GgoBAG4oYP1AJ5R
         zjH/aXlZilTZfbOz4KKVDJSNHlnB/rxXOfRG1FXwMShdbjYP34zXRcO0wLmMBHdqoD
         ZWDNfwCGgJriFjQg4L7NRh3D7gSrLilrh4nicSn7rv2WN+1FRFYw1i2/NjTV4Id0Px
         ONoXAZfQjOBeqPB0W4LJ06i1Rq194nc+vM9LpBIwmdj3uazRK3w62Q8YNrDzNBgnWV
         CecfkQRx+UPHA==
Date:   Sun, 17 Jan 2021 13:02:02 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     trix@redhat.com
Cc:     jdelvare@suse.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: stub: remove definition of DEBUG
Message-ID: <20210117120202.GI1983@ninjato>
References: <20210114024456.1752286-1-trix@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mhOzvPhkurUs4vA9"
Content-Disposition: inline
In-Reply-To: <20210114024456.1752286-1-trix@redhat.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--mhOzvPhkurUs4vA9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 13, 2021 at 06:44:56PM -0800, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
>=20
> Defining DEBUG should only be done in development.
> So remove DEBUG.
>=20
> Signed-off-by: Tom Rix <trix@redhat.com>

Yes, we can still enable them easily with the Kconfg debug option for
I2C core. Applied to for-next, thanks!


--mhOzvPhkurUs4vA9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAEJzoACgkQFA3kzBSg
KbbqDA/8CiGu1KlfKUZL6hGBozOTWcWQRuBoG+bUiVwP4TWK7w1U9f5PHRdMFzpo
kdtDKDsu1+xjDt4oCBkNvn7xaBsFZc8liJCKiRelEzTzpdxsTtrncthCH1UfSMlk
hh8T/TkNFGiEk/YyiqlJWBcLAYIBGsCvnVR9h0CQH9eJCaOs+D8nUgrV1aJS8tRe
kDhjSFPKn1ZZLLqiDsTs6zpI88FpeXXvBXiGNgkuI4YMvwkXeudPxKI8DYvrt0cT
wmqcdzVSUpjbbeJp+0pJsjjFAd9tXuxbl77vvUWieNtPLurECS7zgQttooMeUO/0
aYLJnSSGZRD9mlBH6Bg/DQOvn8YDsn72+lCpp6ZPL27jajNIRO205/z60ud/tdWR
v3j1eaEfdVWsOy51jLQJwr+Tkp8kjhQdttcl8hbLfY6g56iArhx4q1UqSLcvwjFl
lwQsQm6G8s2p6yyt4IBWjZQgtqJ04rXcB9Up1sf5F/drXy/6c0qhoRhUlgkUUiA7
utRm0QAyy9zi7KffC4aBCFtZ3obqVpq6ZNeIi+rUHXkM1AQlCnYOdBSqHZYffvL9
Ffge73E3VY7AIOZatf/NzM5xuoP0JQcdMEZQQXD3C+WnNM9HfX52zLKbgrB/8xQU
gijeweyCg4cRyKFbvLzYzTiBWzDojhesA/rJO6qylmIJuUh+hrI=
=DWbI
-----END PGP SIGNATURE-----

--mhOzvPhkurUs4vA9--
