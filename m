Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4A2C1DEB77
	for <lists+linux-i2c@lfdr.de>; Fri, 22 May 2020 17:07:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730096AbgEVPHl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 May 2020 11:07:41 -0400
Received: from sauhun.de ([88.99.104.3]:33376 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729931AbgEVPHl (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 22 May 2020 11:07:41 -0400
Received: from localhost (p5486cea4.dip0.t-ipconnect.de [84.134.206.164])
        by pokefinder.org (Postfix) with ESMTPSA id 5B27A2C2071;
        Fri, 22 May 2020 17:07:39 +0200 (CEST)
Date:   Fri, 22 May 2020 17:07:39 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Tang Bin <tangbin@cmss.chinamobile.com>
Cc:     o.rempel@pengutronix.de, u.kleine-koenig@pengutronix.de,
        ardb@kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Shengju Zhang <zhangshengju@cmss.chinamobile.com>
Subject: Re: [PATCH] i2c: drivers: Avoid unnecessary check in
 efm32_i2c_probe()
Message-ID: <20200522150738.GH5670@ninjato>
References: <20200415140640.19948-1-tangbin@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="pfTAc8Cvt8L6I27a"
Content-Disposition: inline
In-Reply-To: <20200415140640.19948-1-tangbin@cmss.chinamobile.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--pfTAc8Cvt8L6I27a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2020 at 10:06:40PM +0800, Tang Bin wrote:
> The function efm32_i2c_probe() is only called with an
> openfirmware platform device.Therefore there is no need
> to check that it has an openfirmware node.
>=20
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
> Signed-off-by: Shengju Zhang <zhangshengju@cmss.chinamobile.com>

Applied to for-next, thanks! I agree the driver will need additions for
non-DT platforms anyhow, so greeting with an OOPS is kinda suitable, too
;)


--pfTAc8Cvt8L6I27a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7H6roACgkQFA3kzBSg
KbYkIw/7BqnJb/EWR5Blh3d4vpx3rtS8kwGxEIY4UbtTq1uWotMuzrDKdwyDMIXV
i6nooV/NJ0Eib6pVtQQLz6VVquUA1s0SVHR6vwN2CTZIZIHtntwHUflDkE7ViR1M
o7eGs9UUmEUvedljeQFcl+t5Qbx54i5kHSqP6x1KoHJJCQzmz8f6dAfSVR82B859
byP1J7Nb8TzilTSKdfl3eV0jXomazoHUvxYUvIeM8t9Lm8GL6k/6NMIWKXfGQiff
55kuYKhRaFfX+A5ZigPA4gmvP4hdGAomLr0aQePMwlQljWUoJVvyLF5olRONAhB9
TkMUsC6xLbOh10hfknqsdJD1krFHvX+AM8EpsZ6E0dnsGxq4Ns2JTSod5rs8S0Qq
dGf4pb62qWAy7xY/Gc6wrxwG+mdniZMXxCtw9arDdgRTebm3+bBVSNB7V4LrC88w
hLsjWC/X3KGvXWOiNx3hVLn/+sXzZum2vk/M0UMW3mItW9yozI0z+BxT8Rcqd/7+
iHcxarj8nHn2TYnqoN6lRe1mliqkPA3OmTUvgRQF99W+0xFhD9h7sVEr+Ri3gJfw
+arI0O1tKeTidUDXLazDPM94NQR4wLaBmee/Q8kUKCoIbYeYpSU3AKQlZHJkrSpQ
FKFgszHQaQS2aCh27SDp0/cvSlrQwokVi5S2ri5lZc4XLylgltw=
=JDIx
-----END PGP SIGNATURE-----

--pfTAc8Cvt8L6I27a--
