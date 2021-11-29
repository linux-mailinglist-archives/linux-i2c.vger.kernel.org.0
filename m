Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1344946109A
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Nov 2021 09:54:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241794AbhK2I55 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Nov 2021 03:57:57 -0500
Received: from www.zeus03.de ([194.117.254.33]:53860 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241866AbhK2Iz4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 29 Nov 2021 03:55:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=fpJOoPyYg6hVeCltHSGQUkvTfFK6
        Nebl1nhZTFpK1Y0=; b=xBXyfwopLDKU9Nz61wh1Z3YPhKGuLbpnSmlSxJcnWoPk
        5ejlgV15oVvdoAx2kru1fvoBv8dV/i1GeeX6NTxQ8DizqJcCI4s4VHZcxANY76AF
        FxZ51F503VSebovNyYTdpmBTorh9ZpLbSalsg1irYUUSClGBF8TyzyLQz8m6V8Y=
Received: (qmail 3328153 invoked from network); 29 Nov 2021 09:52:36 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Nov 2021 09:52:36 +0100
X-UD-Smtp-Session: l3s3148p1@Z3zuj+nRRoMgAwDPXwQPANVKnN07LEVW
Date:   Mon, 29 Nov 2021 09:52:35 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Aaro Koskinen <aaro.koskinen@iki.fi>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH] i2c: cbus-gpio: set atomic transfer callback
Message-ID: <YaSU0xY8T1o/YVjg@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tony Lindgren <tony@atomide.com>
References: <20211127194214.26785-1-aaro.koskinen@iki.fi>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="b9GrKyQY5gnt784g"
Content-Disposition: inline
In-Reply-To: <20211127194214.26785-1-aaro.koskinen@iki.fi>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--b9GrKyQY5gnt784g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 27, 2021 at 09:42:14PM +0200, Aaro Koskinen wrote:
> CBUS transfers have always been atomic, but after commit 63b96983a5dd
> ("i2c: core: introduce callbacks for atomic transfers") we started to see
> warnings during e.g. poweroff as the atomic callback is not explicitly se=
t.
> Fix that.
>=20
> Fixes the following WARNING seen during Nokia N810 power down:
>=20
> [  786.570617] reboot: Power down

Applied to for-current, thanks!


--b9GrKyQY5gnt784g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGklNMACgkQFA3kzBSg
KbapBw/9HhenVd+RT99tr8OCMp334qKvAw/UqZvMESRj2kCh/6QvLjiOwbczI/J5
3lxBhviiM1/n3IU+FtO78ng/X1FX8MaRmgb3h5b9oyjI7ojsQRiI+WzWMb5UMulF
bSHCm8drSPa0HAl4snt7YpHKwqJYKsZ9fvajS+I+DnYGVy/iliHLB1rFppnN6Hmt
V9Ugzy1t6EUXc1tzG1VC7Q02/PI5+ru/WjiVToF9mFCqYnC9yFffC5TPa80lEHhq
tQUY78of6AJa8wg64yL2tiFzmmedHI46gpEKItZYfpvh3xWc2uJJeyyi8My7kBN4
502r6808ZeQ+KZFGSi8+uTGVFSxq/MCnmV14CNIqTmsNe46+JDoL2Pk+5qu153MK
MEkkLKGOEA5IK+K+gInZN1PktExqdBrS4XB5P9iuntpCK5i3qneP5x4BmaYcVAsh
zPXWrdaY8u3mrh9i79pF/XwkU/6o8zt4z18PWlYzbSLvs2HOa+KElf8X4VeRx52B
FyP8qPWhjtnXnt/oH1pOPwZ8C3LPvVZWzGyqJfSSagHhgDfTqHICMiv8PYvT+wtI
UoWG1eCt5NXBR4ibDmy3NCipJcShzLm7HfsbE42h8eK8WxiFicG05UeZaqerMgQ0
2/31FiUCcCV+pf8XgsaYbgy0MpdGC6Yp3lWmJeZ+pQx6EI9tBE8=
=jYSH
-----END PGP SIGNATURE-----

--b9GrKyQY5gnt784g--
