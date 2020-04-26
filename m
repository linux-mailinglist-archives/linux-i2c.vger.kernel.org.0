Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B8901B8DB5
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Apr 2020 09:58:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbgDZH6R (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Apr 2020 03:58:17 -0400
Received: from sauhun.de ([88.99.104.3]:43036 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726112AbgDZH6R (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 26 Apr 2020 03:58:17 -0400
Received: from localhost (p54B33954.dip0.t-ipconnect.de [84.179.57.84])
        by pokefinder.org (Postfix) with ESMTPSA id 72E5C2C01E8;
        Sun, 26 Apr 2020 09:58:15 +0200 (CEST)
Date:   Sun, 26 Apr 2020 09:58:15 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] i2c: regroup documentation of bindings
Message-ID: <20200426075815.GF1262@kunai>
References: <20200415105100.11164-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="JSkcQAAxhB1h8DcT"
Content-Disposition: inline
In-Reply-To: <20200415105100.11164-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--JSkcQAAxhB1h8DcT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2020 at 12:51:00PM +0200, Wolfram Sang wrote:
> Some bindings are for the bus master, some are for the slaves.
> Regroup them and give them seperate headings to make it clear.
> Also, remove references to "generic names" which is for nodes and not
> for compatibles.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--JSkcQAAxhB1h8DcT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6lPxcACgkQFA3kzBSg
KbbzEw//b011CCsVEWxM16fzoCH08LVViQaKWallOV8vlx8skWIyWKoBORKRKqI3
Yyl4kRvbaQGY1a25JWoyvSV/r5iQoTUang6WkYzu5gAxkMg/9hwTZGE2sDV6URdf
JMKAa20oGxsReSZoVSuIemEpCN07O31rahmATPsdJMS+YfnEGFA8WS23hofj9ySt
JlFSMhaT9idybC9Ga7a7u4YLVjasCRPrITBcSm5WzLxJWacmTH98v/BoPmk6X8XU
wJw02SboOr9pSvXueHlR0EMz/usdIEiuQFEUPLTPrLdI+EYwVz7hA9y4Yx0lirAa
EIAWmq6mEH2TvQNxhDisuAg4iN8uFfGYhYjVZdCzY8RdbDY7ePbPk8sgBbEzR8BZ
5mdUng8s0xQibXFO1IbDVGqCrZ/vT/VuUgR4HVa3eBYGCHD9lxevJJ/81tUDMxdT
jfhLKlLorNq/KB6V4sXnn3X4fsekkCcx//m2beZs8PTIxkEq6ZhkML3B/LtjqfHI
BvFDKIUtfUxPk8vVWj1bIQqmLc7uLQixJfG6eh7jIZ2Cq+nuKj8CWsoWG9Yba4ew
Ch9FX1A1WqEqq5KiVnGrQBzvtF0sJ1/bneEhxSKNrpG28o+0rqDwo8cp6dxY3Eh/
vAerkgtVJH9Carair3EvSAiLJ6mJ96Mu4XWm3PpVgm38iLcb5Os=
=l/hP
-----END PGP SIGNATURE-----

--JSkcQAAxhB1h8DcT--
