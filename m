Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02AA1A6B0B
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2019 16:16:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728854AbfICOQo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Sep 2019 10:16:44 -0400
Received: from sauhun.de ([88.99.104.3]:54462 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727107AbfICOQo (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 3 Sep 2019 10:16:44 -0400
Received: from localhost (p54B3348D.dip0.t-ipconnect.de [84.179.52.141])
        by pokefinder.org (Postfix) with ESMTPSA id B2EF72C4F2F;
        Tue,  3 Sep 2019 16:16:40 +0200 (CEST)
Date:   Tue, 3 Sep 2019 16:16:40 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     linux-media@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Peter Rosin <peda@axentia.se>
Subject: Re: [RFC,v2 3/6] media: dt-bindings: add DS90UB954-Q1 video
 deserializer
Message-ID: <20190903141640.GA6718@kunai>
References: <20190723203723.11730-1-luca@lucaceresoli.net>
 <20190723203723.11730-4-luca@lucaceresoli.net>
 <20190902204841.GB7253@kunai>
 <63d99d6d-ecdd-7dd8-0dcb-126bfd89b258@lucaceresoli.net>
 <20190903093455.GD1020@kunai>
 <f3640020-0291-f837-8639-c3ba39800ead@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3MwIy2ne0vdjdPXF"
Content-Disposition: inline
In-Reply-To: <f3640020-0291-f837-8639-c3ba39800ead@lucaceresoli.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--3MwIy2ne0vdjdPXF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Luca,

> Now I got what you mean: the aliases in a pool are reserved to an ATR
> and not available to another ATR. What about hoisting the pool one level
> up in DT, to the adapter where the ATRs are connected?

Frankly, it sounds error prone to keep them in sync.

> As I understand it, we are referring to the same use case:
>=20
> .---------------.       .-----.   .-------------------.
> | adapter (SoC) |---+---| ATR |---| remote slave 0x10 |
> '---------------'   |   '-----'   '-------------------'
>                     |
>               .----------.
>               | device X |
>               '----------'
>=20
> Here device X with hard-coded address 0x20 is plugged in at runtime.

Yes. For the generic case, it doesn't even need to be plugged at
runtime. A baseboard can have various additional modules with various
requirements. Hot-plugging (not a favourite topic for I2C) adds to it.

> As you say it, if 0x20 is in the ATR pool we have a problem.

Right.

> But even without an explicit pool, initially 0x20 is unused and the ATR
> can use it for remote slave 0x10. Then at some point device X is
> connected, and suddenly 0x20 conflicts.

I haven't considered hot-plugging so far, but you are right here.

> To a limited extend the explicit pool could help if the list of possible
> addons is known: one can put in the pool only address that will never
> appear in addons.

And this is why I kinda accepted the all-unoccupied-addresses-are-free
approach. For a generic solution, the list of possible add-ons is
unknown and we should expect "the worst".

> Hey, wait, the no-pool solution could have a way to handle this
> conflict. When device X is connected, the adapter can look for a new
> alias (0x21), call the i2c_atr_deconfigure_hw() and i2c_atr_setup_hw()
> callbacks to stop using 0x20 and start using 0x21. Doesn't look very
> lovely, but may be worth considering.

Thanks for also thinking about the other approach! Everything combining
I2C and hot-plugging is likely to not be lovely, so this may be OK given
it really works in practice.

Another note: I was hoping we could keep the number of callbacks to one.
E.g. if i2c_atr_setup_hw() has the same values for 'address' and 'alias'
(or one of them is zero), then we unregister an alias, otherwise we
register. Not sure if this will work out in the end, but only one
callback is what I'd like to have. (It could be put into the
i2c_algorithm struct maybe)


> Definitely.  And having a list of use cases would help a lot IMO. I had
> never considered the use case described above, for example.

Yes. I hope to see some new faces in the room giving us their cases.

Kind regards,

   Wolfram


--3MwIy2ne0vdjdPXF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1udcQACgkQFA3kzBSg
KbZpAg/9Gh9b/97cajkwIM4pDZ/Ydmmg/fCcK5W881WBEIGo+/koAd7kK+tPvGqp
XXgxCbaDnhVoQ2PmX/gHXajbUAmDV87onHjpH8e48bukT+TYs2kbdXPtCmbfNVkr
JlNFU2PWVBVjxfNmTZFFnAxHrRLErHoxVtuPklt9Kn3FuWjnt7LqAqIoH0J0MTmf
I/vpan16szG29cbC2rraahfkidYHjeJuZno63fdnBH/3hcajorY0xknznG9AB74t
EmCUAMYJUe/9NGTm3I9Xdsa166dx+nW6xmNxxHz6qo7uT9lkUG0iQOk6W/yedVlX
cJ2P9/2G2Q4d/bnb9AFXBNiI/sYkmOcKjeN9iMpN8aZ6ZI2AeP9M+73zhHE1OXIw
a7sGFiwyTVY4YWK/FH82HGgCmMwu4YXTDuUxXIfbwSUPDJx1pcICl9UECl/c0WGp
8NSVrLr/avYRHHU3fB0Hs4kl//DZRX1PcFn9Lqc68zIVwWUb/es1VXoyeUnRBBXv
oZF9V0rDr/EPBLl7yayABh3Y4fFrBz9WCcLBcrUw46NPZwgDlU0rSYRodcCXQ+It
SguamGKS7cb1WP21kC+K6UR7WoDtap9Tddx4DwwQpu/SjTs2M24B46E7lVnM2HkF
pL8LHxSX74qE4a7sqA5kQX6fTY3z1oLOBXM/Z2W1wUnmthQXXmM=
=1p1g
-----END PGP SIGNATURE-----

--3MwIy2ne0vdjdPXF--
