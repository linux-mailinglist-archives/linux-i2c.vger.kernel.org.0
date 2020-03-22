Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B775618E961
	for <lists+linux-i2c@lfdr.de>; Sun, 22 Mar 2020 15:30:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726809AbgCVOaH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 22 Mar 2020 10:30:07 -0400
Received: from sauhun.de ([88.99.104.3]:50556 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725785AbgCVOaH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 22 Mar 2020 10:30:07 -0400
Received: from localhost (p54B33042.dip0.t-ipconnect.de [84.179.48.66])
        by pokefinder.org (Postfix) with ESMTPSA id 226352C0064;
        Sun, 22 Mar 2020 15:30:05 +0100 (CET)
Date:   Sun, 22 Mar 2020 15:30:04 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Ludovic Desroches <ludovic.desroches@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Stefan Lengfeld <contact@stefanchrist.eu>,
        Marco Felsch <m.felsch@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] i2c: at91: support atomic write xfer
Message-ID: <20200322143004.GB1091@ninjato>
References: <55613934b7d14ae4122b648c20351b63b03a1385.1584851536.git.mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Pd0ReVV5GZGQvF3a"
Content-Disposition: inline
In-Reply-To: <55613934b7d14ae4122b648c20351b63b03a1385.1584851536.git.mirq-linux@rere.qmqm.pl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Pd0ReVV5GZGQvF3a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +	/* FIXME: only single write request supported to 7-bit addr */

Hmm, this is quite limited. Would it be very hard to support multiple
messages? Or reads? 10 bits don't matter.

> +	if (!dev->pdata->has_alt_cmd)
> +		return -EOPNOTSUPP;

We should handle this in probe(), I think:

	if (dev->pdata->has_alt_cmd)
		at91_twi_algorithm.master_xfer_atomic = at91_twi_xfer_atomic;


--Pd0ReVV5GZGQvF3a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl53dmgACgkQFA3kzBSg
KbY95g//dGarTg6cS+mlOrvC92nc9FsPDk4ovBNx5QEc5w7VYirESZJCs6+OTJEs
t0zYn9dzEAo1UVyYUzUetdM2Ma88oB40HCF4lS4A1d2sKzmvxX8niF9YUttD290A
A3gZIqr3hio6jeXPzFhaDv7IwpnTDDP4pVgQdVnLZdBPeObTIYNzyM+NKmBAivoG
VFKwRKONuhb1hL29jtqmQeSQCEUWLUKu8d4sEVK72/ONqHUX70M6Is5Xv32nVkb1
nPZkKMnUr3X0oX1Fa6S33Q7vqLx5eHNlUaD8hAcodhTJluiLw+wVKZdmNl99o8Hm
7HtEpGFo2jcyTDejstloWX5iPHcPjXIJgtRGwP3PlVWsgWqhTPolM8r025bjJt5E
FL46Bf656Gfisd6j7xNWQY6JwXw7kzhqPQCbUb0DZddXuYqtuFUswtLBg2/QQ99K
FdykWp76hOHTqCXFW3V6H7jZRW+J98upcsSQFNyHhjO2hYZ48A3yZ/A4W10R0VAe
J0fTuK5xLLi7PZn3Q/e/Z56jgoKdmucqcrE7jfBfW5nXtWIWgdcrJO35yBBDU00C
BGksiCA4Rpi0SHf0UCqqOfu/6bAXGVD9LxPzRc6O+l0qzD6rm7i21ZoXTkOMZQuF
B2TQW2Z/V8bN8zje+tZC6yvjBi5C9osHCeTMOHTIKpEqPhF3zio=
=Upnv
-----END PGP SIGNATURE-----

--Pd0ReVV5GZGQvF3a--
