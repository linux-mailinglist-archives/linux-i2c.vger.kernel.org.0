Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E754156A79
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2019 15:31:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726104AbfFZNbS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jun 2019 09:31:18 -0400
Received: from sauhun.de ([88.99.104.3]:56206 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727323AbfFZNbS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 26 Jun 2019 09:31:18 -0400
Received: from localhost (p54B330AF.dip0.t-ipconnect.de [84.179.48.175])
        by pokefinder.org (Postfix) with ESMTPSA id 9A4DC2C0114;
        Wed, 26 Jun 2019 15:31:16 +0200 (CEST)
Date:   Wed, 26 Jun 2019 15:31:16 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Gregory Clement <gregory.clement@bootlin.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/2] dt-bindings: i2c: mv64xxx: Add YAML schemas
Message-ID: <20190626133116.GJ801@ninjato>
References: <20190611090309.7930-1-maxime.ripard@bootlin.com>
 <20190611090309.7930-2-maxime.ripard@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ZG+WKzXzVby2T9Ro"
Content-Disposition: inline
In-Reply-To: <20190611090309.7930-2-maxime.ripard@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ZG+WKzXzVby2T9Ro
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2019 at 11:03:09AM +0200, Maxime Ripard wrote:
> Switch the DT binding to a YAML schema to enable the DT validation.
>=20
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>=20

Applied to for-next, thanks!


--ZG+WKzXzVby2T9Ro
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0Tc6QACgkQFA3kzBSg
KbYHgA/9F8nLcTx2NE4YvEyysDBH0L3/XFU39GvfNfR00Uu3Js8xbbyCmj/GYwLr
fPMNWfOtjF5ROVZOnhKc8BVhk9ps9qzOVDjn11VgnScxpWym2IuvpFfY1yXfT0H6
9arS6XHnikWTkLUpZIAWSA4yHByNptL+ZRmcJ2gcabBn/8rCrfwe2JvxfLNyLAsI
rL+ynFioJZqhZOEXrag9AwPPzIH8UnItUbt/yFgNdurRynJUDmKM2eZ/xwf8mgga
WXVGHIVHjSJFp0kool7FJagDUqJ5nVTMDBkUePCxUihg6CSse2YDQtONGKY2fxmY
2aSpGhNYUj+jRTOtJSHPjGfCFJ7t6k6nhuk0Psqz5rOV3fxy+Hldi23MJa5D6GWb
jbclbxhwIKKuBsCx694ESa2yUoKXdPkIukw1IDTynpFUgF5/Gm9cafxcCGK5wNrd
aIzPaDVP/9JGdXx/i7kkVTFtPO+J3ToXqA/UHhbz/JoX8ORlun18NBrcgfpl26p3
TST6uEr15dx+SR46ebz7r5RdnirxWyBD2kn4iMnj7YmUi9ONSPXttjN+4/Mnq1wk
9wnM4tic6utMMEQN5oHCnViFi1ZS4/FqEQ0CTZlb1+DG5UwRTSUAgN4v+fWffM/2
k4Mnmq4JmdQaFsFmcM282vpYVQAm7UwU5wQYZOd1Be/tWe+Tsxg=
=RozK
-----END PGP SIGNATURE-----

--ZG+WKzXzVby2T9Ro--
