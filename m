Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF8101BFDC9
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Apr 2020 16:20:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727790AbgD3OUA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Apr 2020 10:20:00 -0400
Received: from sauhun.de ([88.99.104.3]:40442 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726309AbgD3OUA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 30 Apr 2020 10:20:00 -0400
Received: from localhost (p5486CDDB.dip0.t-ipconnect.de [84.134.205.219])
        by pokefinder.org (Postfix) with ESMTPSA id 7109E2C08FC;
        Thu, 30 Apr 2020 16:19:58 +0200 (CEST)
Date:   Thu, 30 Apr 2020 16:19:58 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Jason Yan <yanaijie@huawei.com>
Cc:     mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
        linux-i2c@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: powermac: use true,false for bool variable
Message-ID: <20200430141958.GD3355@ninjato>
References: <20200426094228.23829-1-yanaijie@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="VV4b6MQE+OnNyhkM"
Content-Disposition: inline
In-Reply-To: <20200426094228.23829-1-yanaijie@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--VV4b6MQE+OnNyhkM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 26, 2020 at 05:42:28PM +0800, Jason Yan wrote:
> In i2c_powermac_register_devices(), variable 'found_onyx' is bool and
> assigned '0' and 'true' in different places. Use 'false' instead of '0'.
> This fixes the following coccicheck warning:
>=20
> drivers/i2c/busses/i2c-powermac.c:318:6-16: WARNING: Assignment of 0/1
> to bool variable
>=20
> Signed-off-by: Jason Yan <yanaijie@huawei.com>

Applied to for-next, thanks!


--VV4b6MQE+OnNyhkM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6q3o0ACgkQFA3kzBSg
KbZL7g/+Jx3DwuNXMIDZziy2bjDNXsNXe3zRIKEzNCL2nx1rvSJb8H4V+TeBXxvZ
CFVMrIqx0ZBSnhCPZiIJnQFdWp6EG7ai83+3e2JkJEE7decC3OT0ccwYPc/zb0VK
6/DSHsduSnybuID3uEAh4URl9rMo1R3pAW+BH4s9VKd3mFHiX/ut7YBXtp8WNF+u
QTrl17pTLJkUKZGziIVK20zcp38lmKXDpdlJuNqDFH8NLNofjujvCn9809T1MOgS
u6yr0hAUTeN6jEGwEMKM4mwyiImescsj6ZGCY7gUK38s0Cq4Cm4/T3nTMSyqscfP
GAmOJbqZ5uuwFaj0XClO+kNscv0cCrnK0wSGZDhrqI6pxyxpUGd6atz6HTCMCkB6
/tlsX+JiOIRPgetDoWBRvp6hAUPW7Fgu/SHMR/yw36q8vr4oJbLqq/CIv34tp340
tFrD4L0B0gynE+/wK1qTGS2kWhvuIU3m6ckO9hE/2Iz/S57UUJKt0aFq91uuWDOV
Jf0KsWTtJLHlKRPp9HlQDhQT1dIWIk9kaqqjgQU3oa6oCq3TvdvC5DfUPl1xzgxT
h9VIXW0Hy7x4JMGdmrqbHL5Wo0WPN/FzEp/7HYOrFlLKnLCncIujv/7oJSdQ43at
cQcR2BqBcwYKYyS0SQuhm66GIeYmZ4xO5fQ5dL3RTE0wCPP/WPQ=
=Hy2w
-----END PGP SIGNATURE-----

--VV4b6MQE+OnNyhkM--
