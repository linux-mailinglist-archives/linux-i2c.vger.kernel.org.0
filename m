Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B1281B8D95
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Apr 2020 09:44:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726113AbgDZHod (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Apr 2020 03:44:33 -0400
Received: from sauhun.de ([88.99.104.3]:42802 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726110AbgDZHoc (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 26 Apr 2020 03:44:32 -0400
Received: from localhost (p54B33954.dip0.t-ipconnect.de [84.179.57.84])
        by pokefinder.org (Postfix) with ESMTPSA id 80B422C01E8;
        Sun, 26 Apr 2020 09:44:30 +0200 (CEST)
Date:   Sun, 26 Apr 2020 09:44:30 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Eric Anholt <eric@anholt.net>, dri-devel@lists.freedesktop.org,
        linux-rpi-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Kamal Dasu <kdasu.kdev@gmail.com>, linux-i2c@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v2 01/91] i2c: brcmstb: Allow to compile it on BCM2835
Message-ID: <20200426074430.GB1262@kunai>
References: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
 <c8c666eb5c82dcb73621930b3fedf5814792bf1a.1587742492.git-series.maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/NkBOFFp2J2Af1nK"
Content-Disposition: inline
In-Reply-To: <c8c666eb5c82dcb73621930b3fedf5814792bf1a.1587742492.git-series.maxime@cerno.tech>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--/NkBOFFp2J2Af1nK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2020 at 05:33:42PM +0200, Maxime Ripard wrote:
> The BCM2711, supported by ARCH_BCM2835, also has a controller by the
> brcmstb driver so let's allow it to be compiled on that platform.
>=20
> Cc: Kamal Dasu <kdasu.kdev@gmail.com>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Cc: bcm-kernel-feedback-list@broadcom.com
> Cc: linux-i2c@vger.kernel.org
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

I reconsidered, and took it right away (as simple as it is). Applied to
for-next, thanks!


--/NkBOFFp2J2Af1nK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6lO94ACgkQFA3kzBSg
KbZFhBAAs2bJNAZObDsII7NU9/pSPz0KOAuFHG4QW6TOM16OZ4b/lTSXaSkQ1HcL
LbLMUVilemyw437H86PJ2dcPM3a/aLzXkaWm2TNYJ3E5JkxFraucv7X3+ym40aKM
RH26F0CLpOg/MoMmJ1rtTP94l6hkesilTxRvJJbzHjJ2+oFzkN8esTPbAWjzu5Vv
4cmgbM/soxX7SLyeelpmLC5H1Ys6k4OU3sQGfaj3WKRAMAKKLU7rfSS7Cr8SHf0Q
QFNIAoTjWWJV8RvSozk5dLhkQUmaorBYb8Ur1ejFNMxPnmkbHfPw0ufa9Y8FTvLg
ts4gRnvW3VcTNhQ3leJ+D6inGrEWDrsHQL4B5D4ILTwO9VQkeEuEvhD9Y/Y2YDbq
27wH9bZP/JC7h2PeXEBKa+gHeXECD9jtkG55cqomc/y7P0qwEEktrsX3bPmSeCjD
5HFRF43j4Wx6dSZk4CHm+wtIjIGPVEY/BvKQuXQ5lqP2/19FZcuK6xWNoOOoal+5
VDLPRgcLYXWshddjwX7Ib1n/Ce5WI9QxxOwXQ3dvaw1scvnDVos4FX3eZx7qffod
2nvoesD3jLeBIEH2gj2oZATWqW0kK/pAeNcp6uudL6RfwgFVrfFwelsSJC3BS3L5
9k0AsAS55tnve9Ogh+WLlXSyDw1P+1WWh5rxO1Hiw+hO0nZz/GM=
=6889
-----END PGP SIGNATURE-----

--/NkBOFFp2J2Af1nK--
