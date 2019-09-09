Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F263AD3A4
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2019 09:22:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731292AbfIIHWh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Sep 2019 03:22:37 -0400
Received: from sauhun.de ([88.99.104.3]:55138 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727546AbfIIHWg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 9 Sep 2019 03:22:36 -0400
Received: from localhost (234.77.63.94.rev.vodafone.pt [94.63.77.234])
        by pokefinder.org (Postfix) with ESMTPSA id 84C1E2C3112;
        Mon,  9 Sep 2019 09:22:33 +0200 (CEST)
Date:   Mon, 9 Sep 2019 08:22:32 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Vladimir Zapolskiy <vz@mleia.com>
Cc:     jacopo mondi <jacopo@jmondi.org>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Peter Rosin <peda@axentia.se>, linux-media@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [RFC,v2 2/6] i2c: add I2C Address Translator (ATR) support
Message-ID: <20190909072232.GA990@kunai>
References: <20190723203723.11730-1-luca@lucaceresoli.net>
 <20190723203723.11730-3-luca@lucaceresoli.net>
 <20190901143101.humomdehy5ee73sk@vino>
 <aedad45b-16d6-d189-b045-329727440ca5@mleia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="opJtzjQTFsWo+cga"
Content-Disposition: inline
In-Reply-To: <aedad45b-16d6-d189-b045-329727440ca5@mleia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vladimir,

> I won't attend the LPC, however I would appreciate if you book some

A pity. I would have liked to have you in the room. Let's see if we can
get enough input from you via mail here.

> time to review my original / alternative implementation of the TI
> DS90Ux9xx I2C bridge device driver.

We have only 45 minutes, this will not allow to review specific
implementations. I want to give an overview of existing implementations
with pros/cons...

> The reasons why my driver is better/more flexible/more functional are
> discussed earlier, please let me know, if you expect anything else
> from me to add, also I would be happy to get a summary of your offline
> discussion.

... and I'd appreciate support here from you, like your summary of the
back then discussion (from where I can dive deeper if needed).

Also, with Luca's new series we discussed some scenarios which can
happen WRT to I2C address conflicts. Maybe you could comment on them,
too? As I read the old thread, you have a hardcoded aliases using
"ti,i2c-bridge-maps". This means you can't have own DTSI files for e.g.
add-on modules, do I get this correctly?

Regards,

   Wolfram


--opJtzjQTFsWo+cga
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl11/bQACgkQFA3kzBSg
Kba0gw//SqXQP85w5Al3h5SpknTTtA58vH9+t7A1sh/8dQECAQiHyupLtYyIbo49
fkEgUsofN7z1QbGLjiz7YHw6HaIOya6wzAlEA6Usnk8fApS5vAnHiZU3DFnHlsW+
FOqvn2pwjyA3USz0+67ZSb1ioivrztQcNpd8lTVdTYLprIMNcAaiuMKRVEBX0xgW
Sx7l4Gy7gzxKxFdNCERshQsge3qcKGTc90oXYriTY/uPEyuL8TbP5wy2l95njk/L
CDxbIR+G+rrS4iCN+wK9bmmRog5tiP4T9voS1AgX0J2hW5GIfgLayR7cxCP9WRxR
0UgaQfVPHruESXcd5fcwkLiW97VHgIfV3eSlBeDtx1Xl8h+s9AxxDeCNGF+XJNrJ
2hmvGmv25qqcG5ZPb+Qj5iEDm8JIHtACnJEYb7GUyL8vwTFinLI9zpHhsXp2wIzc
2mBGaiY4mw83eomSOy1untwqFdVkLq4sm98oFEZQFwrNCi0uO+F7Azl8lUMQDWcM
GGsdtYxiQIhg5CvKCPDfJbJjF7mMTVrsIzHgfvD/oraN+52kDv6CFpkT0qDqBy+l
AZ1l2/zR2K2nPnUxXcyU9CSLwboBNxcuQ0CNiq2G0F7WC646MiALQXLkLpu4FdGb
4MaEUK7LHp9OPDhbjT3fGfbNw45zR1m3BSQgwL7unDYMhLZEUI4=
=33hh
-----END PGP SIGNATURE-----

--opJtzjQTFsWo+cga--
