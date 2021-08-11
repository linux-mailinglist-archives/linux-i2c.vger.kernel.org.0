Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA4D13E93CC
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Aug 2021 16:42:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232438AbhHKOnT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Aug 2021 10:43:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:34204 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232364AbhHKOnS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 11 Aug 2021 10:43:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 63B9B60C40;
        Wed, 11 Aug 2021 14:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628692975;
        bh=f/AVoeAgOQsi7jtVb4jpRLKXKdBrhsXQTZF78EVwSzA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QT3owfR5lYN7ObwCiAL5hulFbFrgoLqq8Fc/CSyuTqFyd3pQkTcmN+XHT8KJt7e44
         TRVYYIkscctTo4rf7kut3qwA5XWe+HeMWTK5b+xV1hjwReMvlSQ89tnTjaG0Z/cfAs
         YF3aWs0dZnh7erOx98JkjfM+nkFC3jgRzX4bdrhgaD8y7DMnot4KdqNZVj6qu/D8hP
         WufXqtxAZlSEG0a6XPwvDWNnPn72aG9x3fS5Br9FNzjdMLnzcGWdlrUUD6ipR0xSM1
         ozWoWFalq6JLKdoPYnEf4U4uK+tqZt+s+SerG2V/HedVIQOWWgWP9HVZBwA7JVBWtm
         KIPmDdK5gAp0g==
Date:   Wed, 11 Aug 2021 16:42:51 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v3 1/3] units: Add SI metric prefix definitions
Message-ID: <YRPh60yHab3q0mVo@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20210712142027.22900-1-andriy.shevchenko@linux.intel.com>
 <YRPBEMVzQK7AbrSL@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="DURPq4zVU7c15iyL"
Content-Disposition: inline
In-Reply-To: <YRPBEMVzQK7AbrSL@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--DURPq4zVU7c15iyL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 11, 2021 at 03:22:40PM +0300, Andy Shevchenko wrote:
> On Mon, Jul 12, 2021 at 05:20:25PM +0300, Andy Shevchenko wrote:
> > Sometimes it's useful to have well-defined SI metric prefix to be used
> > to self-describe the formulas or equations.
> >=20
> > List most popular ones in the units.h.
>=20
> Wolfram, can we have this applied or commented? It seems we are going to =
have
> more users of these definitions (I have recently reviewed one of IIO driv=
er
> where two of them are in use).

Okay, seems there won't be one to ack the units.h changes. Doesn't
really matter, I think. Will apply now.


--DURPq4zVU7c15iyL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmET4ecACgkQFA3kzBSg
KbbyRQ/+PaWjrR6kRg46GHm7g8EgLe/ezpT6FelhOt9WMTC9HJL1q+0U7TYETX7L
wPHX960YAFL3pjLZjPA5FojE4PlFhKOaAuOqYznRQCjVR1zjoGjXlnUxY/aBYjsW
2v5z5Rmp3I5bvS1m33x7V5qZlS7AyqqlQEeN+A4U/+Fy/U48Qjl+rb2tBJmcqgz6
m/6+XcWYFKRzrJCeSN8MW+wbzh59lf47lMuhmmSs2kGGhjbVxs9ms3e81e8lCi9N
RrWbWc25J3mmT0hoCB55M7FzHEE88xYcBuFNO9uTRTwPkhaIAU+DKjnDMUgOsGAJ
z5mk9iICyNwBu+GfuobyYpv6PVtQEERhL8crf++9y8XHoN7GUpUAIidW4r80AIhU
wR9MjCdhbBxn1gP/M1/sp4nXhKhM8GohYkeksf4r15vjz/BUIXrLM3W6fg3QW5eQ
K0ThYH2/HdBs6BMbEAIvTNPbgR4jVxrBQ5Qzq7bxzr3f//RwqotlnbPQYwTnpyuI
4WomPesFUKr6PAMA0Flmdee/tw7au6C0Tsf92oNibK7wKSYYTrT615O5nOX6C7Xv
tKdx7vmOo2WzvRJt+da4eZ/TdrlRde4mNe4IClGckvwHLkxNJ0XlteVKbZpb0UK4
4k5lC1YoaqL+f5s/Nn8MxX2Ug4XAQOgy+Fdf+PukCRmkdWERDsQ=
=NxIx
-----END PGP SIGNATURE-----

--DURPq4zVU7c15iyL--
