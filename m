Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 018A7134401
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jan 2020 14:38:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbgAHNiu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Jan 2020 08:38:50 -0500
Received: from sauhun.de ([88.99.104.3]:35240 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726144AbgAHNiu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 8 Jan 2020 08:38:50 -0500
Received: from localhost (p54B332C6.dip0.t-ipconnect.de [84.179.50.198])
        by pokefinder.org (Postfix) with ESMTPSA id 7D61C2C05CE;
        Wed,  8 Jan 2020 14:38:48 +0100 (CET)
Date:   Wed, 8 Jan 2020 14:38:48 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran@ksquared.org.uk>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [RFC PATCH 3/5] i2c: core: add function to request an alias
Message-ID: <20200108133848.GE834@kunai>
References: <20191231161400.1688-4-wsa+renesas@sang-engineering.com>
 <20200101165515.GC6226@pendragon.ideasonboard.com>
 <e008939f-531d-f7dc-4c3c-937476213030@lucaceresoli.net>
 <20200102211327.GB1030@kunai>
 <cc2a10ab-9f05-2c61-3a37-0e5e0184e379@lucaceresoli.net>
 <20200103001056.GJ4843@pendragon.ideasonboard.com>
 <b9394a6c-1268-7cf8-6c00-e914735bc268@lucaceresoli.net>
 <20200107171357.GO4871@pendragon.ideasonboard.com>
 <20200108132708.GC834@kunai>
 <20200108133153.GB4884@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="u5E4XgoOPWr4PD9E"
Content-Disposition: inline
In-Reply-To: <20200108133153.GB4884@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--u5E4XgoOPWr4PD9E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Currently, there is no paradigm that all I2C busses must be fully
> > described. Enforcing it now all of a sudden is not too user-friendly,
> > or?
>=20
> We're only enforcing it for systems that want to make use of this new
> API, so it's not breaking backward compatibility.

Well, even new systems might need to update old DTSIs which they
include.

> > Especially since calling read_byte once is not necessarily "great
> > length" in my book. If you have 8 cameras on a 400kHz bus, the 8 * 18
> > bits should take 360us if I am not mistaken?
>=20
> That's assuming the first scanned address is free. There could also be
> I2C-controller I2C muxes or gates in front of the bus. Things can
> quickly get more expensive.

Not on a fully described bus, or? The first address will always be free.


--u5E4XgoOPWr4PD9E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4V22gACgkQFA3kzBSg
KbZLFQ/9GpXNnz0qcNsDZBGp6yxzHDdlmj3QeAhzeF5MLv5a57Lf3KlEHEjq3OV4
gQ+F9Y6/Gu4N0vrz7u+QPTABY5JwsY7fT9MjIWeMwWxL1GdeaEzCVtXYAnA7Aklz
fvJVr+KljKtC1WIXnHgjfTf1FdOPYHMUNAPHAfszanLQnytIL0a+fb+IjkvZ7/Tw
B9/XHl7I9gGo7ZvXp3XFrkQzSKx8DBbTSYC7pp6XZ3WZhs3GIU3lOvzOl7Hkr25e
8A8LGJYfln+XzYUC7LioMKkqliKhCynYrDvM6/OAls3Q65UKA775aMOWg8oUnsVc
fWi0nNtJZ2ZbUxJRRl/vqfBp4U7z3WqLUbDP4GSjgKpxYGM74T/Tc96NPW0E0Qt2
S18Ldx4Buq7e8ugblYOAwNv1wNXGIJPDf0xiUk5cExQfBu3LCpZj8xEgQhJiGYru
qKUkIQ4lZ9iBZKqjbAIi4C4QctWwray/Etq96QzM1f1jYzXjTOYWBtE0oYv17Gc3
lNTHE8EFlVzrny1qmbBn+eM6HCH+cZBsOKsrt4nB0nmDCI+mJVxfE+IJmToy5nHZ
OQ7IJ6XlA9B/xkFxR2RD2XjjA1P0nQRf4rthlzKSMU1i0mFucAhnRZPKJmdvOiUB
gxoGruxsCLzGRNggUgIl6TfnzNUDgsy0YIWJMo2GKYdjalUnjeY=
=KyCL
-----END PGP SIGNATURE-----

--u5E4XgoOPWr4PD9E--
