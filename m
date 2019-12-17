Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 090D71230DD
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Dec 2019 16:52:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727695AbfLQPv7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Dec 2019 10:51:59 -0500
Received: from sauhun.de ([88.99.104.3]:54110 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726858AbfLQPv7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 17 Dec 2019 10:51:59 -0500
Received: from localhost (p54B330AA.dip0.t-ipconnect.de [84.179.48.170])
        by pokefinder.org (Postfix) with ESMTPSA id 9DF412C06A5;
        Tue, 17 Dec 2019 16:51:56 +0100 (CET)
Date:   Tue, 17 Dec 2019 16:51:56 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: remove unneeded 'extern' from function declatations
Message-ID: <20191217155156.GA14061@ninjato>
References: <20191204122936.20101-1-luca@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Kj7319i9nmIyA2yE"
Content-Disposition: inline
In-Reply-To: <20191204122936.20101-1-luca@lucaceresoli.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Kj7319i9nmIyA2yE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 04, 2019 at 01:29:36PM +0100, Luca Ceresoli wrote:
> According to coding-style.rst, extern should not be specified for
> exported functions.
>=20
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

Applied to for-next, many thanks!


--Kj7319i9nmIyA2yE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl34+ZgACgkQFA3kzBSg
KbYm4A/409q81k5frUU1QqSgP35XqcN80k1YBogz8gWs4vAl/H2SfxMKUsfUUaZn
+/rZh3t11fM5kzVWRudYo+O0Brdf4LuUE1qPcKCGhSSBwCFZeDL0vDX6wvIXswf0
n0FfIZ+Sd0eo3NRdISY1WbLZHGQpTme7C3IM1/UHB0c2CeRhGiSmKCc9izzgJXJM
JPPFjDmRLYxuDR/nTRu8EXzqSjJrz93cPkcym0BvJ6OAcdS5z/6Lj5T+jINzEiAv
B6EC6HR+S2HMJ4e80o1oTwHAT6tnKzrLlfE+C/nyLFAT02Yif8C/mXCCibzGReZL
JMDL20Kc5uTMoJTT7JUboyJI9a9tfRcnE4hBFg3Yv4WItbeMWTWUZF+dQ85bC+e7
dh+TCnUIvEXo/zbAkFvUoNrFc30G/mYlLY++wVNM0ZAvWNQ9kVdM5l68cMF7vNqi
hjpCOHTvxyU4gNSCdHemECEPDuXKOnXIVcLZf8mGdVsKlmeoREmf+MLuryZWHo+t
tPzriLOrdgAsmO1EPUcir8uoJzezcWhUkfwNADwkD+cmJRI0AC5GDmEk3ZerK0Ky
hc/sS0PtOGPtI91Nrt1Yfawamu5+5nihiEny0jsjVjckXDRrXHWWeSOaGz5bdjzq
reIcKUn9OdmTEtQxDmBlh9iEyW4WpbAF0g+5jTQbwWgJF6t1FA==
=2Cf7
-----END PGP SIGNATURE-----

--Kj7319i9nmIyA2yE--
