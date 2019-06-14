Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6935146B6F
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jun 2019 22:59:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727032AbfFNU6s (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Jun 2019 16:58:48 -0400
Received: from sauhun.de ([88.99.104.3]:57000 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727009AbfFNU6s (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 14 Jun 2019 16:58:48 -0400
Received: from localhost (p5486CF81.dip0.t-ipconnect.de [84.134.207.129])
        by pokefinder.org (Postfix) with ESMTPSA id 887D14A2022;
        Fri, 14 Jun 2019 22:58:46 +0200 (CEST)
Date:   Fri, 14 Jun 2019 22:58:46 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, peter@korsgaard.com,
        andrew@lunn.ch, palmer@sifive.com, paul.walmsley@sifive.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH REPOST v8 2/3] i2c-ocores: sifive: add support for i2c
 device on FU540-c000 SoC.
Message-ID: <20190614205846.GD17899@ninjato>
References: <1559369475-15374-1-git-send-email-sagar.kadam@sifive.com>
 <1559369475-15374-3-git-send-email-sagar.kadam@sifive.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wULyF7TL5taEdwHz"
Content-Disposition: inline
In-Reply-To: <1559369475-15374-3-git-send-email-sagar.kadam@sifive.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--wULyF7TL5taEdwHz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 01, 2019 at 11:41:14AM +0530, Sagar Shrikant Kadam wrote:
> Update device id table for Opencore's I2C master based re-implementation
> used in FU540-c000 chipset on HiFive Unleashed platform.
>=20
> Device ID's include Sifive, soc-specific device for chip specific tweaks
> and sifive IP block specific device for generic programming model.
>=20
> Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>

Applied to for-next, thanks!


--wULyF7TL5taEdwHz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0ECoYACgkQFA3kzBSg
KbZncA//eWbyOsRWDI1ivLjGr5LHGf287LZ5FaaXD5xse31wxiWmSniRKi7NDK10
wypljEvTKDvbG10DllABXn8XgyxRtBNRAzdLqFFTOmX6dpIds8Rqmd+J4sS0lQKV
00TCpBCKYNI519/eGwNWFHIYM+HuBdM6xX9yNJKygvLfz8zD7vJPoSlabA3iKY4o
+iWwOAxrVtEUMseiUUXXlpuFy/aPdJesxo4tzaj1bTV+yAh2jqrog7RoQebbNKe+
rrb35JxIJmJtOcys5dTymk7eQzbQMqWnwMslRnwkPBR+Mmjb6ldLGC2IWdHTUkJt
JO6sf/trxQVmoZkO9GGMZBAZHrLlvY8HMMAtzf7KUdqK7eaGmDNujbND2QUaSebB
HKMRVVv2tOzOvtCAiP1YgozZoOm4a51su0GkMxzyoNLu0bBN2TY0pfBPaTjrfVep
IJ/DYy4eN3FORffr5iBrJQMhFAD1KxXOKbxqW23ibGXjnLb8I2sp4N0zbi6808XM
atKpgpqMJMXGrg1MEFrkv0JWM9XIWCgMRrwKcNGnsRBEaG6pMuwv+zKU51M2oYyW
6I3gy4/REKWhyJF6v09GxGeASLMzbjaa/T1VFxIL4SDcM2OsUXAIFKL6+st8YbUL
tBAE8nnK0uRngRDEaCesK+RK4hUhzRDJnHj2hJiH82PSO5XIb3A=
=AX75
-----END PGP SIGNATURE-----

--wULyF7TL5taEdwHz--
