Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4F9D87840
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2019 13:11:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727063AbfHILLZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Aug 2019 07:11:25 -0400
Received: from sauhun.de ([88.99.104.3]:36486 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726037AbfHILLZ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 9 Aug 2019 07:11:25 -0400
Received: from localhost (p54B333D4.dip0.t-ipconnect.de [84.179.51.212])
        by pokefinder.org (Postfix) with ESMTPSA id DE8E32C3014;
        Fri,  9 Aug 2019 13:11:23 +0200 (CEST)
Date:   Fri, 9 Aug 2019 13:11:23 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH RFT] i2c: emev2: avoid race when unregistering slave
 client
Message-ID: <20190809111123.GB1143@ninjato>
References: <20190808195417.13482-1-wsa+renesas@sang-engineering.com>
 <20190809104016.GC25406@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="0ntfKIWw70PvrIHh"
Content-Disposition: inline
In-Reply-To: <20190809104016.GC25406@localhost.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--0ntfKIWw70PvrIHh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I don't see how this could influence the standard I2C communication at
> all. If change in em_i2c_unreg_slave() is excluded, all that was changed
> is moving irq number from local variable to the em_i2c_device struct
> which is also not used outside of the em_i2c_unreg_slave() appart from
> logging :)

I agree. Still, I do have brown-paper-bag experiences caused by wrong
assumptions like "this cannot fail". And we are changing the way
interrupts are acquired. So, if it is not too hard, I'd prefer to have
patches tested, too. I'd still apply the patch if it turns out to be too
complicated to test (given the reviews raise the trust). Yet, also on
the pro-side, it doesn't hurt to test a newer kernel on a packed-away
system once in a while.

Thanks for the reviews!


--0ntfKIWw70PvrIHh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1NVNsACgkQFA3kzBSg
KbabTw/+KkLIW/BoUGVlyJ9CgURdm4aUF1NtSctEVLgA42YRYR4xWjbmmuKxqx4S
oWRZOQk2+R4h8vZxSmLfRv4OoGEcRUtlCNsmWMXWZJCvY0I2yqmMu1y1OAFKpVSY
9wZ0nvE4MOds/13DrTtCC3Wpzc4gtB1UcWk+GBw/b+vB2qKUkdO9X0AB54TWBcnj
Fzeg6adkazIuHKrG11bCnSvdisdmzoBYC9EVMpzsUPmlkR5bWHGerPsIYbJZhPHj
TO8w8lPrF1PAVeeFIFO2WleMKraG5KjsLQ2oUKhslJHZKZgQK01Ao81m8J3fIGxA
4EvuZeJ1P6nVwkPiRCNsJdUP852LPWVr4L89/qR5Q4Q+IRmPkvWKOU1iT5FzByLZ
yOSOq5BM2sMkabVB6EMpb6SmkzLsLlxypHuY0KGlwoWjK7kRwnDgRka2xfYMTANj
ou4BsNFiLohVJWTidUNEhIKscZCZLXwwSRx6vMfAjc90j7aN3lMBQG+4uot3a2Co
sD52Rpn6CPlq5vCTc//mwps/NuHM1I2Gj3SjUsQxCYhs6cJW5btRxil7UnCfpT2M
/DpJYkvi0lHMu/mGiTRkpHx5SsWzgJXD9uf6GJrvBmU0sJIMKzOsoDIsABs3xcwg
6IofvPKGt6KK6O5z0MNea+fPgT02J/TnQ8RPKmKDAnFgXKzst58=
=+VyL
-----END PGP SIGNATURE-----

--0ntfKIWw70PvrIHh--
