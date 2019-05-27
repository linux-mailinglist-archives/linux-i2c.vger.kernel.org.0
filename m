Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 636C42BAAB
	for <lists+linux-i2c@lfdr.de>; Mon, 27 May 2019 21:25:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727368AbfE0TZq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 May 2019 15:25:46 -0400
Received: from sauhun.de ([88.99.104.3]:36198 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726484AbfE0TZq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 27 May 2019 15:25:46 -0400
Received: from localhost (p5486CF59.dip0.t-ipconnect.de [84.134.207.89])
        by pokefinder.org (Postfix) with ESMTPSA id 155E12C7C9F;
        Mon, 27 May 2019 21:25:45 +0200 (CEST)
Date:   Mon, 27 May 2019 21:25:44 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Vadim Pasternak <vadimp@mellanox.com>
Cc:     linux-i2c@vger.kernel.org, michaels@mellanox.com
Subject: Re: [PATCH v1 i2c] i2c: mlxcpld: Fix wrong initialization order in
 probe
Message-ID: <20190527192544.GG8808@kunai>
References: <20190516171541.7760-1-vadimp@mellanox.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="df+09Je9rNq3P+GE"
Content-Disposition: inline
In-Reply-To: <20190516171541.7760-1-vadimp@mellanox.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--df+09Je9rNq3P+GE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2019 at 05:15:41PM +0000, Vadim Pasternak wrote:
> Fix wrong order in probing routine initialization - field `base_addr'
> is used before it's initialized. Move assignment of 'priv->base_addr`
> to the beginning, prior the call to mlxcpld_i2c_read_comm().
> Wrong order caused the first read of capability register to be executed
> at wrong offset 0x0 instead of 0x2000. By chance it was a "good
> garbage" at 0x0 offset.
>=20
> Fixes: 313ce648b5a4 ("i2c: mlxcpld: Add support for extended transaction =
length for i2c-mlxcpld")
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>

Applied to for-current and added a stable tag, thanks!


--df+09Je9rNq3P+GE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzsObgACgkQFA3kzBSg
KbbSJg/8D32wIeyPK97PVBUaEdooaHc5krotdll02IDHwR2BZzleQ6ug2vO2zDFC
LgMgVpH5uYysllYastKjsqukXyQImdFFI1TA2D2dyK4zC/j5YmuerZTBakcN/Msx
gjWBaIlQqepHx79BVp/3hWiaKq0DUSJu/y20xfB6NCUS5dzOtteopRanJ6sW6B/p
QNoyyhQV1doOXmq7ISA8Jg8XE03PCypWwwW9+jn+/vEPCp7C2nhXJEDorn+GxcZu
K1QZ0nQfGpPKRu7rnzdCp2n+x8JnIcr8jz/dxOwd1BlCc46oPQxMeBLkjS9jH6J9
og5/5XGku0KErDOiHKOrXF5wIQ7lUFTq2cJ2bw0G5PDBtcjenO26v185rlHtoQE3
KVJr1F9GuUPvRdAnql5yIeBXxMXRX6p0sRxQTCaLbXlf5MYhcWKONRyau471pvta
7jddn+1qOvEFHnnQwtonxoZ9Qta2hpEserHy2UnW6bHmIGafd4cpNA7C9i0fHbB4
3BGsm5NGMslnghHNN6tTvllPl/IpKyKr2sfUgK5aoAguaPb14A0xffVjTs26+4Fg
bmDt+aPtlf/EB9AHIBMgsLYK4twB/PMvQ0c4e6+OA79kJVzWql5dIhktvvvIxzsB
9u958bNgCGsaLz8g4IaD5eJy94JSkj6c9Xt9mgSuOWxe+vGBfZs=
=CvrW
-----END PGP SIGNATURE-----

--df+09Je9rNq3P+GE--
