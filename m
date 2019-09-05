Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98ED4AA4AB
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2019 15:38:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730065AbfIENhr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Sep 2019 09:37:47 -0400
Received: from sauhun.de ([88.99.104.3]:57244 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727143AbfIENhq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 5 Sep 2019 09:37:46 -0400
Received: from localhost (p54B335F6.dip0.t-ipconnect.de [84.179.53.246])
        by pokefinder.org (Postfix) with ESMTPSA id 31A312C00C0;
        Thu,  5 Sep 2019 15:37:44 +0200 (CEST)
Date:   Thu, 5 Sep 2019 15:37:43 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>, alokc@codeaurora.org,
        agross@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: qcom-geni: Provide an option to select FIFO
 processing
Message-ID: <20190905133743.GE1157@kunai>
References: <20190904113613.14997-1-lee.jones@linaro.org>
 <20190904203548.GC580@tuxbook-pro>
 <20190904212337.GF23608@ninjato>
 <20190905071103.GX26880@dell>
 <20190905091617.GC1157@kunai>
 <20190905093444.GE26880@dell>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gMR3gsNFwZpnI/Ts"
Content-Disposition: inline
In-Reply-To: <20190905093444.GE26880@dell>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--gMR3gsNFwZpnI/Ts
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > So, are there investigations running why this reboot happens?
>=20
> Yes, but they have been running for months, literally.

I see. This is good to know. Just so I also know where we are with this.

> > Which is a clear disadvantage of that solution. It won't fix older
> > kernels. My suggestion above should fix them, too.
>=20
> Not sure how this is possible.  Unless you mean LTS?

Why not? Using of_machine_is_compatible() makes the patch 100% self
contained (no extra binding needed). It will work wherever the machine
description fits.

> > Unless we know why the reboot happens on your platform, I'd be careful
> > with saying "work obviously well" on other platforms.
>=20
> Someone must have tested it?  Surely ... ;)

It seems to work mostly, I won't deny that. But we don't know if the
buggy situation can be triggered on these platforms as well by something
else later. We just don't know.

> > My suggestion:
> >=20
> > For 5.3, use of_machine_is_compatible() and we backport that. For later,
> > try to find out the root cause and fix it. If that can't be done, try to
> > set up a generic "disable-dma" property and use it.
> >=20
> > What do you think about that?
>=20
> Sounds okay to me.  Let me code that up.

Glad you like it.


--gMR3gsNFwZpnI/Ts
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1xD6MACgkQFA3kzBSg
KbbjbRAAoIoQeZCMH5wLWkFBosilnEpvLFsBKQ9e1UoyHCK9wZiPoKduvpoo2g4R
RLSwko3R49cuGKCMy3e7WeX+bOekY7xaP4M79/b/jOp7JBm3rhbKj2NjHNl7hz2b
GRgIR9rCK7LbzfT47jf2p8rYGXTa2e4285Z6LqLwncf3E2ZGIntEE7Trc9hZbn2c
MI+dMDgRvUUotGXQ0H5+XVRLjpPLi2p4MJhSE1wQpsAl1q2vD3sOdnG1ewpj2akI
O3H+tupA5EU3MEMeWLN2LLhTAllw5uopqX74r4TCwfFl8QYOYZ/7Z4UfTsKLiY9q
I/VbXn8NmghJTbnFogH8Ne6fm/omHZDPzO44bznJeDKtfAc2P+LKQOjAXpA0Iaof
Qv6zBX7P6eILRJtxr6IeYbrmvaV85wyVeAf2Kxucxo5BIq5HwulcjX3Qxu6GGal8
9zhmaOu8RmL9DYHWXr5IaG8+Lx88ftTspUHD4AiYxDbMWkRTbrENV7m6lLWtDTgZ
VQ5hDBtx7HZEFb9I/ToOTBkL8zwiHRCKvAhtRNfMTBHixl5q5Hy68RI77Jywp3+G
ku1M7uMksLAgH7u8UGxWtxkimxcEcYGAvXwaffbqfQnswOSPD7l3iL6k9uv5hYC8
ZKwMfYXGXIcWI6l7qWcFkoTpIVsb3Sflshc1I7iHAGJov017tSI=
=0if5
-----END PGP SIGNATURE-----

--gMR3gsNFwZpnI/Ts--
