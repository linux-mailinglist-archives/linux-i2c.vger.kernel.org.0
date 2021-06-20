Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2231C3AE077
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Jun 2021 22:55:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229897AbhFTU5q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 20 Jun 2021 16:57:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:59664 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229845AbhFTU5q (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 20 Jun 2021 16:57:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E88C7610A3;
        Sun, 20 Jun 2021 20:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624222533;
        bh=59LUUr6nErsBsaU2fmG3vG8o5YV7k9K6QtvNmnF3STQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BlVqj01Z2UbEYiW9wbROagge+jkPslOGNdLJnEMTa+v7vg6yAK/aYjZL7mwwi+Sqn
         e0tzIqo4wdQsigACfqI/NvdrYo2z35r7eyv4GFL7ioF9yelo/Ox9mSkhdsClEsxlnG
         Jr+50YJ+D9gvyGXsw79c751QxWBGFQ0OAVKjM8VjxjUmnUBIbs7ByyhA9r07EhlY1w
         aLTnO1yBujF5NcbPQRWZGrpoivrRXrqP35+uTASyJDgR9zV/kG0AgnNwjYQYhgNGBd
         Spqppyb9MCbMbe77+zX+hdH7zStoCPN8o0uF+uRtgufSAraQuHYDtbqt58NoCkzami
         g1jXGlXhq2OIw==
Date:   Sun, 20 Jun 2021 22:55:30 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c: i801: Use driver name constant instead of function
 dev_driver_string
Message-ID: <YM+rQgnxOiS3CZer@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <089c47ad-1519-947e-ac31-290da37159d7@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="L+HcRBztMCfXGWaI"
Content-Disposition: inline
In-Reply-To: <089c47ad-1519-947e-ac31-290da37159d7@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--L+HcRBztMCfXGWaI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 25, 2021 at 10:04:23PM +0200, Heiner Kallweit wrote:
> We are the driver, so we can use the driver name directly instead of
> retrieving it by calling dev_driver_string().
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied to for-next, thanks!


--L+HcRBztMCfXGWaI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDPq0IACgkQFA3kzBSg
KbZlwQ//SoADMF943WhKjjGMx5vCqKcEiwsa4fqZbR0B3gsS4t6Nmxtwn06cQFQa
3ejEtlPw2jz8JRj//d5C0v2+uyU+ze3HjqzTVY/TymzG5q35v88yHbiRUYDU93u2
S+Z8l8FUTeT3aR8BOUsb4hVX5S23Kbg6nOHTUgxhiOOwhL6XXi5Q7eKY+sS6MwyN
SJGFzDVCRm1p6sHK7Voj0/OTYDfBL8RdLH/kaHpqI0kxu0cLs/WbhF9bFmlkjKnE
A7mWp7xfufW/ZPXZscoreRAD+oHXwE4637HvKPnjJEASds2CH6D6xOx/Urvz832s
J1SDVh4tJddqU1qsGIPl1C/KV7m0hgFoRZZKqTgcfut8fjHR24WJUSVwODsQAjoO
nZ/sFuEqsbiqT0tIbtlnSndDlZAzRD2OyvGS9tfCXGFTX717Nqd0KS8U0vzNoutT
zBtEglf+8Fm31qZmj4XaQ5JfvbyMaMoQjwn2TKDkojggNMxxEFrN/X9ln1fX/XeT
A6ok5/Hggs2zZHpK+kNplcPf0TFEat97gHscWhKEbKSsyj9TOtz+B4xiGKIcBPYW
kvorIGgQaOsxuBSLGwzqXgzUSzShiwtPWOcCRIHtwEWhnjfQdWQ4HY0v0+Ut5mfx
hW5ZODc84TBzMp9cXQcS9rlbDGZXa87f4EgeNKJUq+65T6gyJJo=
=GdvN
-----END PGP SIGNATURE-----

--L+HcRBztMCfXGWaI--
