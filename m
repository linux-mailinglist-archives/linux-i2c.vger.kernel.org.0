Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69A81A64A6
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2019 11:06:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728146AbfICJGZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Sep 2019 05:06:25 -0400
Received: from sauhun.de ([88.99.104.3]:51006 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728128AbfICJGZ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 3 Sep 2019 05:06:25 -0400
Received: from localhost (p54B3348D.dip0.t-ipconnect.de [84.179.52.141])
        by pokefinder.org (Postfix) with ESMTPSA id 574B72C4F2F;
        Tue,  3 Sep 2019 11:06:22 +0200 (CEST)
Date:   Tue, 3 Sep 2019 11:06:22 +0200
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
Subject: Re: [RFC,v2 2/6] i2c: add I2C Address Translator (ATR) support
Message-ID: <20190903090621.GB1020@kunai>
References: <20190723203723.11730-1-luca@lucaceresoli.net>
 <20190723203723.11730-3-luca@lucaceresoli.net>
 <20190902204208.GA7253@kunai>
 <8482d1e2-b1d9-3da5-5b1f-b7e492a87368@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="v9Ux+11Zm5mwPlX6"
Content-Disposition: inline
In-Reply-To: <8482d1e2-b1d9-3da5-5b1f-b7e492a87368@lucaceresoli.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--v9Ux+11Zm5mwPlX6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > One huge drawback for me is the attach/detach callbacks. One year ago, I
> > removed a similar callback from the I2C core ("[PATCH 0/2] i2c: remove
> > deprecated attach_adapter callback") because some drivers did a lot of
> > crazy things there. It took years to remove all that.
>=20
> Oh dear, I was completely unaware, apologies! :-)

Oh, no need to apologize. You don't have to research the whole I2C history
before implementing something. Keeping the big picture is what I happily
provide.

> > What I could imagine here: the adapter (B and C each in the picture
> > above) gets a flag like NEEDS_ATR before registering to the core. The
> > flag means all clients on that bus will have their address translated.
> > The core will figure out a free alias when a device is registered. We
> > can then have an ATR specific callback with the original and translated
> > address as arguments, so one can setup the HW as needed.
>=20
> Do you mean moving the alias selection code from i2c-atr.c to the i2c
> core? And the rest of the ATR core too?

I hope for something like this in the I2C core (simplified, naming needs
to be improved etc.) in i2c_new_device:

	if (client->adapter->flag & NEEDS_ATR) {
		i2c_atr_get_alias_address();
		/* probably a wrapper around a callback */
		i2c_atr_setup_hw();
	}

with all the i2c_atr_* functions in a seperate file. It would be great
if that file could be a completely independent module, but if it turns
out that we need some simple helpers in the core, I am probably OK with
that, too.

> > Do you think that would work?
>=20
> Yes.

Cool!


--v9Ux+11Zm5mwPlX6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1uLQkACgkQFA3kzBSg
KbYlUg//QLHDG326il+ci8KTo6kaFt1uzUDGdfsvBHCrmjnaV9lyCqSbinKTaRrU
LanYdd7SOTNFpTsuxE3FfWCJwAxdOogPD3Eatfu5EWQmTse6AgqHdAOEzNu2NqFW
DpRfFpXvzYfbaQ2Y+AWqyvUAjE63ddHw0oi9LwS5XPPV0fSwqBQOU8135a6Qj9zd
Zdp40L4XDpglDOt5jTUKvqyVCLpHGD6Seciw/4oNhsrdK4ZhhaZtC3hj0fSy5AxV
2/2pkLxcNrEOnZl1q0+inRBZZOphH1VUwzHxS56O6leTlNo1CxLQ/Y71vURqIgwd
N3WM5FuTCnBoN5bFbTNGegyUsqsgiYzONmDjxcM7lxmE1XTJDw7L6k5m7hwoxLLd
BmZJAdCnpbQOixbg+iDKUrMkDklhfjXfmhvhWaedvc+y8iKfeUlvd+YVmJygqDgt
h2FV5OYQdWipo4TsOM+ORcfFFyFtFSziHxOdsEv0EpdVk8R+ROIp9FJldlQRwQZ/
iiCpEyXXLt0Yw3iq1gG3GE4WFxGgeUty9pECsXmT3BwRQhroUBeuiXR/j2AzpXkE
Alr5B6hXmPL0iACDHHK/lMn2svKcRQWG51Nno1VR3KOCGiWj9sjM0H6Y4WHmCQcG
6gB7hUyzLHI9+VuDBLBMVyLHmEtC5yLsPxrFZTDuNL0xBGPp1jo=
=5VsA
-----END PGP SIGNATURE-----

--v9Ux+11Zm5mwPlX6--
