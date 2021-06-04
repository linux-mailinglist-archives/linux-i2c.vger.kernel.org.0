Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBFEB39C158
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jun 2021 22:29:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231363AbhFDUbO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Jun 2021 16:31:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:34934 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229982AbhFDUbO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 4 Jun 2021 16:31:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1F86A613D8;
        Fri,  4 Jun 2021 20:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622838567;
        bh=qnzSacT15nQlHs+WP3CvQZcAvYJW2aDiphcqTcOrOps=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SFsa27IJlvYI15OzZ78hiUJRSKpx4pZNoXw0B/rmgHvLTueTUq3JmoNz/1COfjEgA
         3zY6DN5zlVw6+jDDE8yrdA+6euNgv9G4rR5A9zUusO0iXWOny76yQMMXdh11bMCNTW
         5BkriR39nfHovgz97S5flEdjDApNKKBJ/Ygqoom1oOvqNnSnE8vqVxgu6LZRIn2P69
         jnZNhREcShltHqRceJWZouTRsssjq7guUhfTJBR13Iw/5mG3ihcKvGwe6vqzZ8I2Wi
         nsi7wv6XmpcqFvZQ5XOOgBdEZof2FJCPQxadiTlZ1g3EuOgDkGUdVWSk+141lTXa5T
         8XGcSZCMK5c3Q==
Date:   Fri, 4 Jun 2021 22:29:24 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Vignesh Raghavendra <vigneshr@ti.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Nishanth Menon <nm@ti.com>,
        Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH v3] dt-bindings: i2c: Move i2c-omap.txt to YAML format
Message-ID: <YLqNJLK7jylURwcP@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Nishanth Menon <nm@ti.com>, Andreas Kemnade <andreas@kemnade.info>
References: <20210526100412.484-1-vigneshr@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="0UX+kpr+/tK4vv8M"
Content-Disposition: inline
In-Reply-To: <20210526100412.484-1-vigneshr@ti.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--0UX+kpr+/tK4vv8M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 26, 2021 at 03:34:12PM +0530, Vignesh Raghavendra wrote:
> Convert i2c-omap.txt to YAML schema for better checks and documentation.
>=20
> Following properties were used in DT but were not documented in txt
> bindings and has been included in YAML schema:
> 1. Include ti,am4372-i2c compatible
> 2. Document clocks property
>=20
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>

Applied to for-next, thanks!


--0UX+kpr+/tK4vv8M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmC6jSQACgkQFA3kzBSg
KbYQUg//XT3Ihccz7UK/XxV6lnn4SW5r7+ESHYDVvhYh0rSO46aPEhM+5PEiDu/F
SvYUXcCSM4Cl0v/7j7xVdW8ycHsKrFfS+9abQRHD3Ehc0vu1FgD/7vXi1IwdRJBG
mSxmuHIXos086PCF3NIpOPAiFuQn0O6Z3H1yIAUnv2gf3lGZ7RYovK1MrwqChlOE
Jr5IIOWrIXqZZvUGSQoQK2ByLRYM/wKix9A88TA8b3kDojTzWlNhjrZK0dEutt/8
Wx0fMEZfVAb3Hchnz0Qe9piXHL/5NicvNHvFXf5N2D5neCeiUvH6nBCZFYAysJu9
LrwxvsvM/tSoW9YagfApMg5smNymH7ChaoSliiblK7+7orvfdO9HmoE3Rx6W7oaE
W1eaqjvZOj6lPlf9N6GBaqwIx6k6UCjdfiLoruQfhTDM+etrW3qkSqBK6X+0n61K
/vUQpZzggL3SFFpdVd6uGU58kXfbZNthD9aBb6mL7/5GxbseSKfzjakje50PssPL
NwQgMFGNOzve56fmzx8UYoV6OQBVTVqGlPBkTxxTi0oQqyRA1ghcGX2uQnZlfc08
5Qxh3AsinIvGkBBP0b8dq5T00PQr8fsyVgLkyMVAqYCYNgr7j4llHIYtU2GpHDYt
FLqDxp/eNPgdufm6ov2ndfDdYOk/RASicWYQ09W5ku8Sasgnuuo=
=CzDI
-----END PGP SIGNATURE-----

--0UX+kpr+/tK4vv8M--
