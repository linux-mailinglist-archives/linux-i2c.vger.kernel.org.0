Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43B5D1A9606
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Apr 2020 10:17:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2635754AbgDOIQ7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Apr 2020 04:16:59 -0400
Received: from sauhun.de ([88.99.104.3]:48970 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2635665AbgDOIQ5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Apr 2020 04:16:57 -0400
Received: from localhost (p54B33507.dip0.t-ipconnect.de [84.179.53.7])
        by pokefinder.org (Postfix) with ESMTPSA id 023F92C1F58;
        Wed, 15 Apr 2020 10:16:54 +0200 (CEST)
Date:   Wed, 15 Apr 2020 10:16:54 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-i3c@lists.infradead.org,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh@kernel.org>
Subject: Re: [RFC PATCH v2 2/6] i2c: allow DT nodes without 'compatible'
Message-ID: <20200415081654.GC1141@ninjato>
References: <20200318150059.21714-1-wsa+renesas@sang-engineering.com>
 <20200318150059.21714-3-wsa+renesas@sang-engineering.com>
 <11ca7487-ac07-f714-8573-20d1a0040212@lucaceresoli.net>
 <20200415075911.GA1141@ninjato>
 <8937e466-fe3f-3686-98a9-8013990bc3f9@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="E/DnYTRukya0zdZ1"
Content-Disposition: inline
In-Reply-To: <8937e466-fe3f-3686-98a9-8013990bc3f9@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--E/DnYTRukya0zdZ1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Aha, is it easy enough to distinguish that difference in user-space so
> that we can present a specific character to indicate this in i2cdetect?
> Or is that not so easy?

I thought about it shortly but have not come up with a way of doing
that. This is the code in i2cdetect:

	/* Set slave address */
	if (ioctl(file, I2C_SLAVE, i+j) < 0) {
		if (errno == EBUSY) {
			printf("UU ");
			continue;
		} else {
			fprintf(stderr, "Error: Could not set "
				"address to 0x%02x: %s\n", i+j,
				strerror(errno));
			return -1;
		}
	}

So, if we chose to use another errno to indicate 'reserved' and update
i2cdetect, all old versions of i2cdetect will have ugly error messages.
And adding another IOCTL just for printing reserved addresses neither
sounds great.


--E/DnYTRukya0zdZ1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6WwvYACgkQFA3kzBSg
KbZfTw//TrCAhfJ/znCZ5SkE/evodYpzpW+VCDNvh7VfXv1OKWhQwRPxUWhfOIbo
l0H1DNk1swBMUICCbWCs0/jJ146amGzUsY/fp8fE8bVtUN9JMg3xuXeMnL5m4dYW
b+6l7hm8sbHqs+ED6BgRd5fPBJATNVTldukoImwfTsYHpBMTayNgPDeECkdEHfrc
LBZJwbarG+jvIV4AoDpakG5qg4Gp6D0j5V0lDfEW87DEqtn+/HwZI3QqJ4G2HKqS
ywhxTHiehdg0ScVk7uijgqXuyJ6uAmRAw5sBehUcTRDO3V5Hqmt2yE2gaGO/VlKj
JIcdUJjDFVAQJo3VbiwFViFYerxCECvAifRvJmwDwFB5KtsgBmEmBuYolEjXgi0N
h3mWF+wGZKyRC8ErSahWgAk8QqKjLRlYMSCdddZxOZcd+1NwdyP7PrfL3wvRzZFw
c/8VNnvFual/M1o/aYViqqAPbiVtj2MfKLm8ZViTKptZg+KUvZjATTv+jac1llo+
J4rjYwrhJANcmgVFTRlpQwI2iIFprtwO6+PF0HK/MTA6LsbTSNit4IFzWwwgeb+7
ALJQZMEGGFHx3H0cBaNEs3AY4jE24X1l//0k2QhfadTK3wUwqoZ+i7Mw/gZhtM/O
tBOu6IgKqeMcmw2e7IvAcMWM8ZCTaoDFF4gt66h4f48LOuVMeG4=
=964D
-----END PGP SIGNATURE-----

--E/DnYTRukya0zdZ1--
