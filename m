Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4221746B65
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jun 2019 22:58:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbfFNU6o (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Jun 2019 16:58:44 -0400
Received: from sauhun.de ([88.99.104.3]:56984 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726028AbfFNU6o (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 14 Jun 2019 16:58:44 -0400
Received: from localhost (p5486CF81.dip0.t-ipconnect.de [84.134.207.129])
        by pokefinder.org (Postfix) with ESMTPSA id 0F1022CF690;
        Fri, 14 Jun 2019 22:58:42 +0200 (CEST)
Date:   Fri, 14 Jun 2019 22:58:41 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, peter@korsgaard.com,
        andrew@lunn.ch, palmer@sifive.com, paul.walmsley@sifive.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH REPOST v8 1/3] dt-bindings: i2c: extend existing opencore
 bindings.
Message-ID: <20190614205841.GC17899@ninjato>
References: <1559369475-15374-1-git-send-email-sagar.kadam@sifive.com>
 <1559369475-15374-2-git-send-email-sagar.kadam@sifive.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="QRj9sO5tAVLaXnSD"
Content-Disposition: inline
In-Reply-To: <1559369475-15374-2-git-send-email-sagar.kadam@sifive.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--QRj9sO5tAVLaXnSD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 01, 2019 at 11:41:13AM +0530, Sagar Shrikant Kadam wrote:
> Reformatted compatibility strings to one valid combination on
> each line.
> Add FU540-C000 specific device tree bindings to already available
> i2-ocores file. This device is available on
> HiFive Unleashed Rev A00 board. Move interrupt under optional
> property list as this can be optional.
>=20
> The FU540-C000 SoC from sifive, has an Opencore's I2C block
> reimplementation.
>=20
> The DT compatibility string for this IP is present in HDL and available a=
t.
> https://github.com/sifive/sifive-blocks/blob/master/src/main/scala/device=
s/i2c/I2C.scala#L73
>=20
> Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>

Applied to for-next, thanks!


--QRj9sO5tAVLaXnSD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0ECoAACgkQFA3kzBSg
Kbao1Q/7Bww4MUaBPH3+ZywBjlJ45ehCw3ulD5lfN/Avf0GJLLlm2qGIm/BSe9/x
V80NkEuQC1ythfVxiq+edDN+Wy5yFtsKLhkjbKzgwYTsoMBx0AbHTjXujIGo03+t
iIg2/9I/Arq+u/5g+HCDk0/4asDMVMBJVa3bniKbClWfuJ7ggWH/UbmOGXfelX7I
HpaokQT/+D8sdtibkIdt4/rgvos/3h8NC4h2CTFywsBu+A62xwiMGpORJ1yWubto
xfr6uu6Rme7if+pyvu5Oxy/FV+UJshX6+6qSI/wvJnrQx1gh/GcKr6Pz7OLk9Pvw
BNgMy5MCLRfMCUUScrCZgjFiGFkZ4vrebE2sJ1+DW7gGPnDrsSatN0oxpn/r4Abn
OI4HsSjxtFZWcBz54prvGIzXYc+9bJcACgyeJRPVEDdvVGZDX3Mg5teIgbJbt9iD
CHp8DMgfdThiIr1cYn9ORF2miTXCaWs735qjM/8QckH4Bfd6cfoDIn5KDjo/1Th5
E6aQBheFFaq85DV74R/sdXXbpRQhrVBj/Cz3SgXhgj66ooHtdVBpNdXeSDon54XG
5v+LQrcexKmF0NlEFlyqeaajxnaB0kJQnXBzz1iqeg5Tkk/Gho70zFFUYhw4OFUM
F4hXCxq7vwHamFM6W68gMEcY0vPh/QqpNNYiSjWoEKn+PR3ZTt0=
=fkzZ
-----END PGP SIGNATURE-----

--QRj9sO5tAVLaXnSD--
