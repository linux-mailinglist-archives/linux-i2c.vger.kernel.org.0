Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2615C20029F
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Jun 2020 09:21:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730342AbgFSHVY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Jun 2020 03:21:24 -0400
Received: from www.zeus03.de ([194.117.254.33]:34386 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730104AbgFSHVY (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 19 Jun 2020 03:21:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=Tx1HKfhcOXw7ejBWKidFnCtFoaUu
        r9y0RAg5uUGEalE=; b=OrBsnhQJjJUlLKpVyJLvgJDRgFo6cVeSKwNw5whAk1AS
        duWZ4NZ9Ch+3QWEsGdZREuHzzRqPWAfkp64Av2jnS/dA2KVd6SzqUUm7NBVOyIVj
        GkNDuReFg/5jGv2PZfkYPbR8qhANBWxMzw9SkNK6sXj38epcHqUXGxog472xQc8=
Received: (qmail 2435058 invoked from network); 19 Jun 2020 09:21:20 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Jun 2020 09:21:20 +0200
X-UD-Smtp-Session: l3s3148p1@FpZVvWqoYMdQT+F6
Date:   Fri, 19 Jun 2020 09:21:19 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH 0/6] remove deprecated i2c_new_device API
Message-ID: <20200619072119.GB1705@kunai>
References: <20200615075816.2848-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LpQ9ahxlCli8rRTG"
Content-Disposition: inline
In-Reply-To: <20200615075816.2848-1-wsa+renesas@sang-engineering.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--LpQ9ahxlCli8rRTG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2020 at 09:58:09AM +0200, Wolfram Sang wrote:
> I want to remove the above API this cycle, and just a few patches have
> not made it into 5.8-rc1. They have been reviewed and most had been
> promised to get into linux-next, but well, things happen. So, I hope it
> is okay for everyone to collect them like this and push them via I2C for
> 5.8-rc2.
>=20
> One minor exception is the media documentation patch which I simply have
> missed so far, but it is trivial.
>=20
> And then, finally, there is the removal of the old API as the final
> patch. Phew, that's been a long ride.
>=20
> I am open for comments, of course.

Applied to for-current, thanks!


--LpQ9ahxlCli8rRTG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7sZ2sACgkQFA3kzBSg
KbZVtBAAjxj8/yCiqHPP8gPXOpd8hStQqYaqlvw6NW5ddjUNy8nDaA/ztSbvpdDv
RKtamlqk9b6JKoOgP0Fxe6xQfysX5qdg9DOKGlAS+atbNTQNydlCovfYbUARyJtz
RoiP0jzxCquuoLcSWAtGWzBhG350v33bysM+zVe4yakWp2ILF8Y1y5l+7/tgXFZB
HbVGxYihsGm76WPlXRRACWrKB1HsieEPVUXDCzG9BLMicuy1Ly7en7UdhkiJnzpz
+Pk1OVCXpDHoKewKv2uK8sbf+TSy9hdesPCO40TZC1Oe1hB2fJGPOV3XsR0CZ7iS
mC7vRPd3rNw62m4zMDxIX0Le5QlCQCpwiW8uSNj7IuadxM5p34b2J6cqTeQBEz5K
y33mJTVybc2yClSvrFDnXNj1Zagz1M4vMVpDLGTBX45rzxmShlzl2inG9hVZblw8
EMSYAefZUHfgc7HptbdTQsTQkjlS1Q5wg9lHXWXGdtFE/oEhOV/DGQOLQwlBH6jD
shVnrzLQcr7mUgJCq2+x8dTs73TnupyVCcRIDh2iTXPmd6UGByIAUN5yTC5GkUIf
wmtRQyJfYHNEvtdFC+jehCarVj0zO0JmzDX434FUDJMFvXa9a2vqJLORds5ASJl7
3K+Xupy+eSX6trVDd7StjIQYraYbn2rFko60famD5ePLbfpGuDE=
=kh1x
-----END PGP SIGNATURE-----

--LpQ9ahxlCli8rRTG--
