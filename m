Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C91201A95DE
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Apr 2020 10:12:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393804AbgDOIKj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Apr 2020 04:10:39 -0400
Received: from sauhun.de ([88.99.104.3]:48806 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727933AbgDOIKi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Apr 2020 04:10:38 -0400
Received: from localhost (p54B33507.dip0.t-ipconnect.de [84.179.53.7])
        by pokefinder.org (Postfix) with ESMTPSA id E7DA52C1F58;
        Wed, 15 Apr 2020 10:10:35 +0200 (CEST)
Date:   Wed, 15 Apr 2020 10:10:35 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-i3c@lists.infradead.org,
        Kieran Bingham <kieran@ksquared.org.uk>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vladimir Zapolskiy <vz@mleia.com>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 5/6] i2c: of: mark a whole array of regs as
 reserved
Message-ID: <20200415081035.GB1141@ninjato>
References: <20200318150059.21714-1-wsa+renesas@sang-engineering.com>
 <20200318150059.21714-6-wsa+renesas@sang-engineering.com>
 <c4e41b0a-4b9a-0db9-94dc-bbbc2f013133@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="s/l3CgOIzMHHjg/5"
Content-Disposition: inline
In-Reply-To: <c4e41b0a-4b9a-0db9-94dc-bbbc2f013133@lucaceresoli.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--s/l3CgOIzMHHjg/5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > -int of_i2c_get_board_info(struct device_node *node, struct i2c_board_i=
nfo *info)
> > +static void of_i2c_decode_board_info(struct device_node *node, u32 add=
r,
> > +				     bool first_addr, struct i2c_board_info *info)
>=20
> While I confirm the patch looks generally OK, let me add the name of
> this function is not quite self-explaining. The difference between "get"
> and "decode" has nothing to do with the different actions these
> functions do, i.e. the new function gets (or: decodes) info about  a
> single address that is passed, the old "get" function gets the info for
> the first address.
>
> I'd suggest the new function be named of_i2c_get_board_info_one_addr or
> similar. Not super nice, a bit long, but self-explanatory.

I view them a bit differently, I think. of_i2c_decode_board_info() is a
helper function to retrieve "some" addr. It is used by
of_i2c_get_board_info() which has the special case of getting the first
address. of_i2c_register_device() is the other user with the case of
getting each address specified. So, I wouldn't put this helper function
on the same level as the users of this helper.

Yet, no strong opinion here, I will think about it...


--s/l3CgOIzMHHjg/5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6WwXsACgkQFA3kzBSg
KbZmFQ/+IKAYZ44eKk5sxMfMCZYEKX5V6zDP8yGqCfmjnxTOrq4DLKZVUnlOV28t
kwwh/lF53CM4/PPXUTjvv11yNRO1dvRJeQvz/O8incejc0VvjAKRIBYWSFG2GvXa
sGH0vupmYyyqc5Vfx2UjrUBpFbLnrhOzCwOOacTDoiwbCcDDIhpVgB+ZbIaHR+Ep
m2BCa6u3+c/4gNgIweYZzhEd6YkgDkEdjYefCrhhwpkr8aGs+wYiCzjipTreDtYf
mIc4irogCauwpaCGX8tmzQj2/o6P4iT4pEIscO9wcHQMcOJmthK/8HcFt+x7Dfrw
7SvCBr8l5QmsyAR3Smbn8zrfw1YjSUvfu4tjRGbHQx8UuDfVeiyWy8+AHHJ7ApoF
X/4lBTVf5JPdG8ZnypVlb+s5SDcfOuJ7F7QTIrWGope4rdihHXyjX2ulukHsEZ9j
kYt759X+70ZfNaslgUdkZG2HGbCOlRUz/n2kV5moW0u18UZnFypvV1av2Z2kq8B2
7IC409rd5GVvi+V15JouiVRuRvWFTczjeuFfErjo3KiyVU3ZvPkfem0XhFDSrIUP
lQNSMIiyu8Cp3Oz4T3SXAPV3Hn3YwyqcWiEItWrtw8Ttu6mfuGmwOjbdGSg4ANGG
Qkx23jFosDHtthO02SgOED1J+GAj1BUqwienkWfN0+PbvKzoTQE=
=DyfA
-----END PGP SIGNATURE-----

--s/l3CgOIzMHHjg/5--
