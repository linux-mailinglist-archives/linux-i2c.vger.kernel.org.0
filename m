Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF781C11B5
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Sep 2019 20:12:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728569AbfI1SMv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 28 Sep 2019 14:12:51 -0400
Received: from sauhun.de ([88.99.104.3]:36506 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726026AbfI1SMv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 28 Sep 2019 14:12:51 -0400
Received: from localhost (unknown [46.183.103.17])
        by pokefinder.org (Postfix) with ESMTPSA id AEB8C2C0489;
        Sat, 28 Sep 2019 20:12:48 +0200 (CEST)
Date:   Sat, 28 Sep 2019 20:12:45 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Alexander Sverdlin <alexander.sverdlin@nokia.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] i2c: i801: Bring back Block Process Call support for
 certain platforms
Message-ID: <20190928181244.GA12219@kunai>
References: <20190927110911.23045-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lrZ03NoBR/3+SXJZ"
Content-Disposition: inline
In-Reply-To: <20190927110911.23045-1-jarkko.nikula@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2019 at 02:09:11PM +0300, Jarkko Nikula wrote:
> Commit b84398d6d7f9 ("i2c: i801: Use iTCO version 6 in Cannon Lake PCH
> and beyond") looks like to drop by accident Block Write-Block Read Process
> Call support for Intel Sunrisepoint, Lewisburg, Denverton and Kaby Lake.
>=20
> That support was added for above and newer platforms by the commit
> 315cd67c9453 ("i2c: i801: Add Block Write-Block Read Process Call
> support") so bring it back for above platforms.
>=20
> Fixes: b84398d6d7f9 ("i2c: i801: Use iTCO version 6 in Cannon Lake PCH an=
d beyond")
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Applied to for-current, thanks!


--lrZ03NoBR/3+SXJZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl2PopwACgkQFA3kzBSg
KbaRwQ//TJS6J6//LjxEJZM6rnVIGEtves1qbySx6L60VFHZF/VET7WNO279RdaH
QUIcj9EgynQD+qeIxmuHSH4qguDXPRi59G6MCbdQFeQmCRTl1HCK70JFEt7du57X
DQCqr/9kJgcsoE3NDEk1aaGY580sb1xt174dWX11V43fh8/f87SW17Rtx4wKYAdE
HFhqfQEyCkCFU71ylxtSzlNqh7ngJkr9DYM2tNugTqJLlnDe1gRLrfS8weXqiGM7
WYTDukMxfWs2CDcgxYTPzC1WxPJaH9smsScm7rovYGOaqcIEXG+qMfY8RTgRmlrJ
65DuTIodeBG4UI/QP9Ex32acqMGE3Xe/4Rl9VaB8E4uFQP7kEuRYe5gZne6skKes
wPmwBRDL3jzOU8qO1bf6Qtbs8U6fhVLQSg7DrddZn7VKcB1cyr7efkczYutF3UO/
TQQMv4GmkKDdWTHoLWcyhY8jsXzIU7UfVAlfIIUqs0N1UeJrbr5cVfH4isDjcs32
jyXsRUbQl2Xs5WOICxCs8GWDYs5a+iM50kOMGZ0i/yd80/PQzHzAAaJHc6gJCq3h
r8uTGkM6ty+AFqTWFtiRDqwnhg0WLxWGzqyhzHaxzls7BdGSP6gttNjhFLWxYtGr
IZsg9cGyRwzC4WpdD/v8NoPyqhiCo9v6vmfhJOwnJVAm/Ahm3+M=
=cTBk
-----END PGP SIGNATURE-----

--lrZ03NoBR/3+SXJZ--
