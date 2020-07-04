Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7973521444A
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Jul 2020 08:17:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbgGDGRL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 4 Jul 2020 02:17:11 -0400
Received: from www.zeus03.de ([194.117.254.33]:56786 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725843AbgGDGRL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 4 Jul 2020 02:17:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=ZwxpgYBZZ3FK889sOToGoOny+Rw/
        KnHsG9+lGhVoT4c=; b=D426eOo94g5c60j9n2hylGXRktcKM39XeMw2V0i1GKMa
        3kZFWIiBy7pyxlKky1F8usvrTtcjyTqeLWpfu/sbOvFIU2RBn3Yxs/h1/dGL6Wk5
        zIRNNIWsJr3IyXmIbqhL5WWmKXzEozhwA9Qe/VLZbnsPfD1oaiC/4zOrhP8fUs0=
Received: (qmail 1447946 invoked from network); 4 Jul 2020 08:17:09 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Jul 2020 08:17:09 +0200
X-UD-Smtp-Session: l3s3148p1@6pFyl5epzqcgAwDPXx1yAKkmpyXOLnhi
Date:   Sat, 4 Jul 2020 08:17:09 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] i2c: slave-eeprom: update documentation
Message-ID: <20200704061709.GD1041@kunai>
References: <20200628185426.5733-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="d01dLTUuW90fS44H"
Content-Disposition: inline
In-Reply-To: <20200628185426.5733-1-wsa+renesas@sang-engineering.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--d01dLTUuW90fS44H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 28, 2020 at 08:54:26PM +0200, Wolfram Sang wrote:
> Add more details which have either been missing ever since or describe
> recent additions.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-current, thanks!


--d01dLTUuW90fS44H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8AHuUACgkQFA3kzBSg
KbZPnQ//QwHfhk0/iekIo5QXi04U98idMLG54BY0qLntfEHF8ohjN+Bzw7vjKqlv
S+F9aYlIBb7gJogErJEp4O9WPVo9athfkAF/DFL33nVIabSfVZkwoF3bnlUzkFMy
McZB1oEZYinkwUUQdYUs5d8nQo7xkjF1JPpA3rNfgfBqRsPcT/3yrh975g3KxxX7
20SxRX5wmrACaW25EfYxRQWEDCnAxlq5jPmAssupBiEUrDJCnRJYHz0RRy7zN1iO
+qyaBlWxV/Ikwz8mq95vlfo1QAkpRKK0MiE9YPkHIQzbCdzDi/E5y8BL3sfjv0Fo
lKviMTXRE6WMovtW+t+Xr0WywuwCYiwz05l7b8KXDj9JkhYd5YRtSOMQ2tLFrDXJ
bdTGG8lmFqY8yHdMjNFZtzHYlLXFP1Mvg9GUsjGgvGGyT7y+GjsyxmCbsLOdFxnO
TopVNyDX+yTvpYKYoQ++RlzefgFNtCU+0QjmxKfRcmpMs7MXjC8nBEwGSsT1YxAt
FveadfrtNJeUpmazVYPK+8RbwlVSQJNZXu183tlZM894Ko39ghYf3J3rPRWcr9Sp
72Kz7KQBPGtezFu0UdEOeV8x0eziEPVfb6Dg5rpmdiGZjnhrN4u3DyvoNVTQRkdc
31LbGKubklFwjRDjOnKwic6pCigjgw+pKoFBoen6t6AyWHd7mbs=
=6NUz
-----END PGP SIGNATURE-----

--d01dLTUuW90fS44H--
