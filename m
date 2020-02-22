Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBA9B168E9E
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Feb 2020 12:55:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727030AbgBVLzf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Feb 2020 06:55:35 -0500
Received: from sauhun.de ([88.99.104.3]:53266 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726839AbgBVLze (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 22 Feb 2020 06:55:34 -0500
Received: from localhost (p5486C6B7.dip0.t-ipconnect.de [84.134.198.183])
        by pokefinder.org (Postfix) with ESMTPSA id D139E2C07F9;
        Sat, 22 Feb 2020 12:55:32 +0100 (CET)
Date:   Sat, 22 Feb 2020 12:55:32 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     linux@rempel-privat.de, kernel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        stefan@agner.ch, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Stefan Lengfeld <contact@stefanchrist.eu>,
        Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH] i2c: imx: implement master_xfer_atomic callback
Message-ID: <20200222115532.GE1716@kunai>
References: <20200120093650.12911-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="FN+gV9K+162wdwwF"
Content-Disposition: inline
In-Reply-To: <20200120093650.12911-1-m.felsch@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--FN+gV9K+162wdwwF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 20, 2020 at 10:36:50AM +0100, Marco Felsch wrote:
> From: Stefan Lengfeld <contact@stefanchrist.eu>
>=20
> Rework the read and write code paths in the driver to support operation
> in atomic contexts. To achieve this, the driver must not rely on IRQs
> and not call schedule(), e.g. via a sleep routine, in these cases.
>=20
> With this patch the driver supports normal operation, DMA transfers and
> now the polling mode or also called sleep-free or IRQ-less operation. It
> makes the code not simpler or easier to read, but atomic I2C transfers
> are needed on some hardware configurations, e.g. to trigger reboots on
> an external PMIC chip.
>=20
> Signed-off-by: Stefan Lengfeld <contact@stefanchrist.eu>
> [m.felsch@pengutronix.de: integrate https://patchwork.ozlabs.org/patch/10=
85943/ review feedback]
> [m.felsch@pengutronix.de: adapt commit message]
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>

Applied to for-next, thanks!


--FN+gV9K+162wdwwF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5RFrQACgkQFA3kzBSg
KbYPkw/9Hi3Vx9RCtmCXXbRYJxXGiQbNjKeAxC3gOUFsMyMWGOOaM8QJTA3MgnV4
R8FBuv9oZ/aKU0kyIiphAEcSAYM4z7Il/vT/5T7Ko4fnhm9r2iuiKMC9jlgBrRrs
R6lIS/GnZMLomeTR1kPoVLLpq9Gq5Isj345ElhfdM5sEpb0ap7Elt6a1/QYoG8OQ
8xA9VyD2V5sfzbBbukESbScyfGmOpQzSP3SHZSuib5FBUAlrQNhWMhVLLR7Si+36
svVMjx1FbHLA3JX8gGhmA+XC+b/Yd3uVoRje1I3RtFEKiwJANKjKgyD6PR2wPlZS
jVCJ+3SBmv8Uclubnt7aDgXbewZpYnxzkTWtN3oDP2/UooCWS63TaIlCpbsJb/iu
HzDGIrpl6YGa1hcXCvkTEFZ9v/z81a3mzgDE0ZXyfr1Rb296Nw10TBXp1xA8ZKXV
kNvd/3JmcEpspaWrvtfmXSpJOecB02MgvLGeX+l4c0juHlZViUa7YDvbBb6Y9bIP
sgLPucEEPQ/jyfhXwrAIgoRJDjuVMxfRCTB8xtAJ4dgmwcqphCIJfSu1gdPN2P+j
biqjULPVFHoCVNDi4wev4PcKH3+ynG3ElTfh7syU4XOO4xT/3SbifUQM+OgZkP6b
14W1oKXeVPg7B6/64+8wxPpJ9LujjWtGSilsoqxglSMDEVXsRys=
=u/DY
-----END PGP SIGNATURE-----

--FN+gV9K+162wdwwF--
