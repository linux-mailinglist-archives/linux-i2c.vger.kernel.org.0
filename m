Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FD91131419
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jan 2020 15:52:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbgAFOwh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Jan 2020 09:52:37 -0500
Received: from sauhun.de ([88.99.104.3]:39606 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726422AbgAFOwg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 6 Jan 2020 09:52:36 -0500
Received: from localhost (p54B338AC.dip0.t-ipconnect.de [84.179.56.172])
        by pokefinder.org (Postfix) with ESMTPSA id A2A812C0686;
        Mon,  6 Jan 2020 15:52:34 +0100 (CET)
Date:   Mon, 6 Jan 2020 15:52:34 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Stefan Wahren <wahrenst@gmx.net>
Cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH] i2c: bcm2835: Store pointer to bus clock
Message-ID: <20200106145234.GK1290@ninjato>
References: <1578150800-8284-1-git-send-email-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="HBg0C3yr6HVa1ZCc"
Content-Disposition: inline
In-Reply-To: <1578150800-8284-1-git-send-email-wahrenst@gmx.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--HBg0C3yr6HVa1ZCc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 04, 2020 at 04:13:20PM +0100, Stefan Wahren wrote:
> The commit bebff81fb8b9 ("i2c: bcm2835: Model Divider in CCF") introduced
> a NULL pointer dereference on driver unload. It seems that we can't fetch
> the bus clock via devm_clk_get in bcm2835_i2c_remove. As an alternative
> approach store a pointer to the bus clock in the private driver structure.
>=20
> Fixes: bebff81fb8b9 ("i2c: bcm2835: Model Divider in CCF")
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Applied to for-current, thanks!


--HBg0C3yr6HVa1ZCc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4TSbIACgkQFA3kzBSg
KbaxWw//WW0ZnyXB1Lcp1LObsRnDob5upLCtOBfS+j2zAWlFKsQc66oz/3q84bn7
jwv+pQ7HkLcgDiSy92VdUDvUxeAi/jxP3lg6oIWbuQFMAmw5+aZymPnUZBe/Jh2x
4/8iQtBLSP8BH9sNbBJrwFkagGCXQbz3crj7nLRMua+/JbAsqLzv7P26IpRHSxQb
32p5Yf4ktRX1WVta3N/vPC/cH4bNURXm+QfHDO45FeN8BWNyGGoL/G6l4Mik3gYm
z0s+Xjmq19hVqB9XGeq+k5wlP1yC/TMWCTL2XkiqXmZE3qpl506BU1y7aEfu8n2P
a2dDsqNg26qQsKh4ZO8dkjCk3uYJOOXYjwqtaBVsZKu5gBNVo8rhkbZlFYOJFVU7
SCR9hWwwmIHDB58NMeLfoXx53KXnwf+H7ChK9aZmI65fh4IqiFvnioRGr16xRjEs
I42Mtpf6cNBzLGKXQOILS3glNQ9X42BmC4c7O+TIe4Q/iT3Ssz06BKnEu30d+nM3
3Guvk1AYKRPch5MwJlguJPOQG0N2lCFajnqyuJyy9mX0225XlT6QamMLSNpbeUnO
km/mECaTFd0q3uCWuZBs8vjuTuv9O0CNsv4ACpGt/UbzzaPTpi0CvqLJPwTAbNHG
XLDPWBT8LjymYAqfppwgjSZd/NWXfCpPEiIu/rQg8k7m1nxUAXY=
=Ixd3
-----END PGP SIGNATURE-----

--HBg0C3yr6HVa1ZCc--
