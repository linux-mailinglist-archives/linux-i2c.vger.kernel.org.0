Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06876132386
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2020 11:26:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727763AbgAGK0E (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jan 2020 05:26:04 -0500
Received: from sauhun.de ([88.99.104.3]:49204 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727589AbgAGK0E (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 7 Jan 2020 05:26:04 -0500
Received: from localhost (p5486CF8B.dip0.t-ipconnect.de [84.134.207.139])
        by pokefinder.org (Postfix) with ESMTPSA id 9D7892C05BA;
        Tue,  7 Jan 2020 11:26:01 +0100 (CET)
Date:   Tue, 7 Jan 2020 11:25:57 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Kieran Bingham <kieran@ksquared.org.uk>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [RFC PATCH 1/5] i2c: core: refactor scanning for a client
Message-ID: <20200107102557.GA1135@ninjato>
References: <20191231161400.1688-1-wsa+renesas@sang-engineering.com>
 <20191231161400.1688-2-wsa+renesas@sang-engineering.com>
 <bf17ebe6-550e-dcd2-c5c4-ff669519ef79@bingham.xyz>
 <CAMuHMdXVxeF0bCV8tNMr_0D-HudXBMXycs=LXCxJX=wKzjQZgw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ibTvN161/egqYuK8"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXVxeF0bCV8tNMr_0D-HudXBMXycs=LXCxJX=wKzjQZgw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ibTvN161/egqYuK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Quoting GregKH:
> | We really do not want WARN_ON() anywhere, as that causes systems with
> | panic-on-warn to reboot.
>=20
> https://lore.kernel.org/lkml/20191121135743.GA552517@kroah.com/

Huh? This renders WARN completely useless, or? If somebody wants panic
on warn, this person should get it?

If we don't add a stack trace, we only know that *someone* registered an
invalid address. Finding out who can be annoying. Kieran spotted this
correctly.


--ibTvN161/egqYuK8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4UXLEACgkQFA3kzBSg
KbYedA//SigGzthoXC+gbuyMlbGnjDk13JXHEdxbB1snhT7SvURVBieMPB4n3amT
IV9v5VB+Fxust2R6Zho0hJGIJ7XXYwfQJONWj8Ftqp71C53TpQrSJWVbLynbtJOy
AP+6FbxspsygaJjrofhr/R8tO+0LLslGY7nUnvv0epB0VsdAX1Zlu11jnx/49H6Z
TM89VhCLIxG1eMPhpgr+0BKji/7h7Sp8c4RTfFN0xfgdcpRccMwC2b1h8HORWbe2
FgMqlChH8MfVyUDVpHYEpMrzj7oNSXsVsh1V5ZVsN2Bqxwk4NGQvQGmP6wWeE6E3
EjSKSiaqde2zjfdg4x843EvyIb7obpI0unHB+VvUZOfD9CaN1LOd/eCgGSzw5Bq2
Ya0lm5t0ik7Kpxg1wsvcjI+SbvVJZ/5gjOVuUiCQpezjirc+WxrWH/u4d6dO2Frm
85BhbqcQPotnFTeCrT8Op3KEAPg3aSO0KtyMcTEZHJI6aZvtZ0T8V+Nd8TfpSGnn
1fgLrJ844SHVHYzrV/KH6ZbPrZT6h5CXjo5jHNP9GwVM+uABa+3v8KeNvvxgD4Kg
c1h9d7SNoNW53APTYNMfayOQY38+ZS0WstaTBxXj9mwEVtY3PF9FAIqty5vhSsEr
/tTTmFSBk4jZ10DTBmB4Vg1pS1UvB6PjKKcwzOuz3Tcsk7y6+e4=
=gfMH
-----END PGP SIGNATURE-----

--ibTvN161/egqYuK8--
