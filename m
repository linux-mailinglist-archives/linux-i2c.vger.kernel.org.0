Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2AEEA5D2E
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2019 22:42:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727281AbfIBUmL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Sep 2019 16:42:11 -0400
Received: from sauhun.de ([88.99.104.3]:43936 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727183AbfIBUmL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 2 Sep 2019 16:42:11 -0400
Received: from localhost (p54B337C1.dip0.t-ipconnect.de [84.179.55.193])
        by pokefinder.org (Postfix) with ESMTPSA id 1120B2C0165;
        Mon,  2 Sep 2019 22:42:09 +0200 (CEST)
Date:   Mon, 2 Sep 2019 22:42:08 +0200
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
Message-ID: <20190902204208.GA7253@kunai>
References: <20190723203723.11730-1-luca@lucaceresoli.net>
 <20190723203723.11730-3-luca@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="SUOF0GtieIMvvwua"
Content-Disposition: inline
In-Reply-To: <20190723203723.11730-3-luca@lucaceresoli.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Luca,

> + * Topology:
> + *
> + *                       Slave X @ 0x10
> + *               .-----.   |
> + *   .-----.     |     |---+---- B
> + *   | CPU |--A--| ATR |
> + *   `-----'     |     |---+---- C
> + *               `-----'   |
> + *                       Slave Y @ 0x10
> + *
> + * Alias table:
> + *
> + *   Client  Alias
> + *   -------------
> + *      X    0x20
> + *      Y    0x30

Great that you already provided docs for this driver!

One huge drawback for me is the attach/detach callbacks. One year ago, I
removed a similar callback from the I2C core ("[PATCH 0/2] i2c: remove
deprecated attach_adapter callback") because some drivers did a lot of
crazy things there. It took years to remove all that.

What I could imagine here: the adapter (B and C each in the picture
above) gets a flag like NEEDS_ATR before registering to the core. The
flag means all clients on that bus will have their address translated.
The core will figure out a free alias when a device is registered. We
can then have an ATR specific callback with the original and translated
address as arguments, so one can setup the HW as needed.

Do you think that would work? Jacopo, does that meet GMSL as well?

Regards,

   Wolfram

--SUOF0GtieIMvvwua
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1tfpwACgkQFA3kzBSg
KbYMqw/7B+tsA9k6JQpEn3lIgySHVigNyDkBrhwtllVTPWmdTX67GS6UmzOu5vsN
JwVMAPeXvrB1/R8d3wudXYWwz9AL+b/GUmCcZiOpJShWtVZg7ynCbJT2LJq578zG
JS1D8HvawfMMRW2XcotIPKXZbxP8WoIV/wQP7qb7Cg1z196bPmiN96pHIPNUJKRu
MYvMC1RYwv8q54US8nX7HIU8KREEUKTcwNQeUWwQqGtqtMUchy9A8Qrb8HRugTy9
cym7RrnkJ43/nDaG/XocQ/h4finto7md9wkQ2y4WoblumpyY+xWIeQ1esAU66q89
BJbRQMDOEO3P0U8kdpo0rIRMCie/RAU4tNLTA8sW65oPi0OGWAk9DW/raJ2QD5yw
6co4sWJJKBFjWI6nSxdneBQhzPB0u1hiiCqkkHp8NZScXZzZ1X2uUN0qKIuXDQwS
GZwzF9Nq+8X5NJt0rofFtkR3hcpKBQgdWqRx/omsV58mPFJFC+XKGKAQgZpE+k4m
IZFWVfpmIh2N3Fcl2m34qKf6Ca2pbMhy2EnzkqQdIVrB8Y81cm8RdCLbz/KSmFPK
ZAxrdo1ohwezmkoSAzXuwy1TGsPgaNtyl8yZdEu3f+9C3jYnQJbUGc4qIJtvrQvD
0BrJHQRwJB+9v5CMLrNqAv6e5Cv/ZsuDswWM0ZajUz0mhUUnczA=
=hGfN
-----END PGP SIGNATURE-----

--SUOF0GtieIMvvwua--
