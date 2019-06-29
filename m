Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 082AD5AA54
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Jun 2019 13:06:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726906AbfF2LGw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 29 Jun 2019 07:06:52 -0400
Received: from sauhun.de ([88.99.104.3]:60796 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726874AbfF2LGw (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 29 Jun 2019 07:06:52 -0400
Received: from localhost (p5486CA23.dip0.t-ipconnect.de [84.134.202.35])
        by pokefinder.org (Postfix) with ESMTPSA id 179423E43C6;
        Sat, 29 Jun 2019 13:06:50 +0200 (CEST)
Date:   Sat, 29 Jun 2019 13:06:49 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Peter Rosin <peda@axentia.se>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PULL REQUEST] i2c-mux for 5.3-rc1
Message-ID: <20190629110649.GC1685@kunai>
References: <c1769ae2-8e44-c54e-e8cb-dcca5d3b0a2a@axentia.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+xNpyl7Qekk2NvDX"
Content-Disposition: inline
In-Reply-To: <c1769ae2-8e44-c54e-e8cb-dcca5d3b0a2a@axentia.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--+xNpyl7Qekk2NvDX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I realize that there are changes in drivers/i2c/busses/i2c-i801.c that strictly
> speaking don't belong here, but I hope you don't mind. These changes are all
> about the interaction with the i2c-mux-gpio code, and I did a test-merge a few
> days ago w/o conflicts.

All fine.

> Anyway, the GPIO-work from Linus Walleij (with help from Serge Semin) in the
> i2c-mux-gpio and i2c-arb-gpio-challenge drivers is the main feature.

Applied to for-next, thanks!


--+xNpyl7Qekk2NvDX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0XRkkACgkQFA3kzBSg
KbZx5g/8CGOGtRt4YTUtLzjxXcmN4Us0S21MoncppAOLwlaMU8+SNtQXihuxH/4A
dAnqZKUl5GP+GJW2ymCPIrTEdWm7E+poJg+QChEJTzBZvguIIxT8NdTwfyvVHchF
gOL7U93YOi1/VTtfYwW3gj+zJtQiPdhFNHDlKkD5zkVrKApTqoXs3Fb5tkoUOwZv
3QBBauJYXlT19KHLrR93Zi00pRecfJj7ZsWf3O2BtkWPg7RSXSr77LnsohlF9hsS
FsH/j2PcLtlZwhG5cF3DIY346WzvanQIwHGFo7W9OVvkPFw+/JsG7J4v5KP0/8Es
VR9qd88xtnOWtxAvvWCsWIN37xOEn4IiFLAocgQUSK88dZfHlUSbZaXLOBqUUOwF
V4xfFJtQufn6Z24H5puOqEGcZCWeW7l6apJz1EJqPLO9Y4zy1WsNk3K9vHzbBTYg
j1aCQwuDV9jVSb4V5RXYScizr2Eux6cKkvO4SiDSqE9tMK7OQ7UxlGE3LpXOdsdR
U3jpnOd+/M/DosteyLXulE0Ff2UwpBcoLfKldYZ2rfaWvtFNfio8M0Bt0cslV194
rrcJ56pVgmGx8g651yRRnorHhKxyr0uL/TJfozMtj4G7DjnSC6O3Of/ObEJIiVLT
jACpwbyGUytgGJtq0rFiFUwRWZmUvEVVvB3IlWGCaWQ2xMYDLi4=
=GcxW
-----END PGP SIGNATURE-----

--+xNpyl7Qekk2NvDX--
