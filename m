Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45A5D130A1
	for <lists+linux-i2c@lfdr.de>; Fri,  3 May 2019 16:45:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725809AbfECOpE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 May 2019 10:45:04 -0400
Received: from sauhun.de ([88.99.104.3]:34224 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725283AbfECOpE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 3 May 2019 10:45:04 -0400
Received: from localhost (p54B33153.dip0.t-ipconnect.de [84.179.49.83])
        by pokefinder.org (Postfix) with ESMTPSA id 249062C2868;
        Fri,  3 May 2019 16:45:02 +0200 (CEST)
Date:   Fri, 3 May 2019 16:45:01 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, Peter Rosin <peda@axentia.se>,
        linux-renesas-soc@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 1/2] i2c: core: ratelimit 'transfer when suspended'
 errors
Message-ID: <20190503144501.GC24385@kunai>
References: <20190425141948.29255-1-wsa+renesas@sang-engineering.com>
 <20190425141948.29255-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Pk6IbRAofICFmK5e"
Content-Disposition: inline
In-Reply-To: <20190425141948.29255-2-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Pk6IbRAofICFmK5e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 25, 2019 at 04:19:47PM +0200, Wolfram Sang wrote:
> There are two problems with WARN_ON() here. One: It is not ratelimited.
> Two: We don't see which adapter was used when trying to transfer
> something when already suspended. Implement a custom ratelimit once per
> adapter and use dev_WARN there. This fixes both issues. Drawback is that
> we don't see if multiple drivers are trying to transfer with the same
> adapter while suspended. They need to be discovered one after the other
> now. This is better than a high CPU load because a really broken driver
> might try to resend endlessly.
>=20
> Fixes: 9ac6cb5fbb17 ("i2c: add suspended flag and accessors for i2c adapt=
ers")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, with stable tag for 5.1.


--Pk6IbRAofICFmK5e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzMU+gACgkQFA3kzBSg
Kbb0tw/8Ct8Nacl2VVwH0HLsrqFxkapX8AqMiPO8leV6AaHW/sdK00tXbB6A78jt
OZIfAJTUyt9rRvlYJbK9BHuhvcRiqOQ3fmyl8V6k1mqxWUeqywTe3DJi9FsCVXIZ
f7+jm8OlZCFNOPVBVG/5qjTuP51hwHPSkfAOJSK0L0yhYhCKi+dGMXcOGp/5MnwL
HVxRDJHONXIlkosfeQq3VjyZk2j56PiBQu1RcYDc57hZmiHRtp+dtMHjKKFIxDPw
flvsj2/p2JN9Kj0FskBGS1CM25qUhblkHcIJCqZA9Z1xbF0c18MQTqOC8G+9X37k
7TriPWskXjNYRwViVKslwEVu389RWYtokBy7zvnLZ5b6uLuhy8vMsvZNabO5nzNG
/O9wfv9nYha0Wysb0M+eWSiqxTcQ6llYzx3zW+Tn9q/TpNaNTQnyxHZ03DJfrioP
N+VDr2Giy4aw8FHB5TRdgqq7Tj40Yb/5K88TZXVAS/gmJgh7sZpTJD3pmTriPtRa
hi5k8eP7uwfyim0eTydUCWr/corCEi+30LRVfULSbjc+MrWdqq7BoB+EOABrk7PF
KRQ2852MDAwwqqAGZheDwoFethFFk7ynS7zDsRmP2aVVWDqudkFQrz5/N+ZI1ku4
9GM6+RPQV5wEwInCEC0f7OlzHDJ4h2OIFJYngQmwSulbNJkANYc=
=hQK7
-----END PGP SIGNATURE-----

--Pk6IbRAofICFmK5e--
