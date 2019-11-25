Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA15F1091AC
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2019 17:14:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728799AbfKYQO4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 Nov 2019 11:14:56 -0500
Received: from sauhun.de ([88.99.104.3]:55750 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728660AbfKYQO4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 25 Nov 2019 11:14:56 -0500
Received: from localhost (x4e37056e.dyn.telefonica.de [78.55.5.110])
        by pokefinder.org (Postfix) with ESMTPSA id EFCF92C0456;
        Mon, 25 Nov 2019 17:14:54 +0100 (CET)
Date:   Mon, 25 Nov 2019 17:14:54 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Peter Rosin <peda@axentia.se>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2] i2c: Fix Kconfig indentation
Message-ID: <20191125161454.GH2412@kunai>
References: <1574306363-29424-1-git-send-email-krzk@kernel.org>
 <20191125145849.GD2412@kunai>
 <63e3fe9d-93c5-1e82-5a4e-c8b7cc6ff301@axentia.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Q6STzHxy03qt/hK9"
Content-Disposition: inline
In-Reply-To: <63e3fe9d-93c5-1e82-5a4e-c8b7cc6ff301@axentia.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Q6STzHxy03qt/hK9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Peter, I'd like to apply this for 5.5. so we don't have to deal with
> > whitespace conflicts during the next cycle. Are you fine with me picking
> > it up for muxes?
>=20
> Absolutely!

Cool, thanks!


--Q6STzHxy03qt/hK9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl3b/f4ACgkQFA3kzBSg
KbY55Q/+PbGfmc7Pd4a4q1xAs1hwoutRkIBELe2bIsBGByXpPGrcALNcYw2jr9G/
LAeVrOmeI2eljaIrGdJAdgEKl9tzHRlpWw+5ujRkYDYPycZGNpnYCOPywzWsY2Ie
UuyYWGdc3OF/GCNJDfZSsXX50sZ7oNbvju8zqT/Bad0T2ScmzzCJCBHn0dGyehdS
F/L8iXXjNcbSOF52XrKT3aaFHXyFJ7y24DnZ3avNeBFkqak8NxnaGr80hQB5ovOa
g2ToWMLXU8pH3K3D1mTdyNwaAocm6NiLMpK1D9VmkJ50vueTRs565YSocp5kKAfm
GPgrjHTcgFXKKE3t+ic+ScpTF1RbuFSC0a5C4vln0NQF1L/h6HBzcodgvaaNfn/m
CAERUul0w9XZO1hF2ymsUrG2TCPATgvoDJysMs5reTMVRxBRn7jGkPKOM9RhS3/n
F4aHhya9UJVS2K6foYdepGgvIIpsi68CnkgM2Yqy99wsMBt0bNYkG4ckbfMMS7Up
RkBUtkNMZF4myylBJlN09BODgZzAkKVUR7kI82agO0StwZH2rU1m4rT9qVm6eYNB
f18RgN9wogsh8W+FQDOSYKz6ULYxNF6FthLhr3441hR/Z8ZoY2Te1wyzm6BG/2Ye
l2VXc/KbkmwGx4VAatIvgU08ebbJIJhqtXzNt7qMW4kGJAdis9I=
=NSlZ
-----END PGP SIGNATURE-----

--Q6STzHxy03qt/hK9--
