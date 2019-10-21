Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FFFDDF69E
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Oct 2019 22:20:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729388AbfJUUUr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Oct 2019 16:20:47 -0400
Received: from sauhun.de ([88.99.104.3]:50660 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728914AbfJUUUq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 21 Oct 2019 16:20:46 -0400
Received: from localhost (x4dbffd67.dyn.telefonica.de [77.191.253.103])
        by pokefinder.org (Postfix) with ESMTPSA id A85552C0076;
        Mon, 21 Oct 2019 22:20:44 +0200 (CEST)
Date:   Mon, 21 Oct 2019 22:20:44 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Kamel Bouhara <kamel.bouhara@bootlin.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 2/4] i2c: at91: implement i2c bus recovery
Message-ID: <20191021202044.GB3607@kunai>
References: <20191002144658.7718-1-kamel.bouhara@bootlin.com>
 <20191002144658.7718-3-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="O5XBE6gyVG5Rl6Rj"
Content-Disposition: inline
In-Reply-To: <20191002144658.7718-3-kamel.bouhara@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--O5XBE6gyVG5Rl6Rj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 02, 2019 at 04:46:56PM +0200, Kamel Bouhara wrote:
> Implement i2c bus recovery when slaves devices might hold SDA low.
> In this case re-assign SCL/SDA to gpios and issue 9 dummy clock pulses
> until the slave release SDA.
>=20
> Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>

Setting up the bus_recovery looks OK. However, I don't see any call to
i2c_recover_bus(), so the bus_recovery is never used. Did you test this
and see an effect?

Also, I think we should merge this patch "[PATCH v3] i2c: at91: Send bus
clear command if SCL or SDA is down" into this series. The crucial thing
for both is when to apply the recovery (at the beginning of a
transfer!). The rest is "just" that some HW needs a bus_recovery_info
for pinctrl/GPIO handling (from this patch), while other HW needs a
bus_recovery_info with a custom recover_bus callback.

Opinions?


--O5XBE6gyVG5Rl6Rj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl2uExwACgkQFA3kzBSg
KbYuXQ//eD/q+8apdlyXS/GXAnuUdAWmgKPeAuIOLg3HVjQ9WJ9MRaCMy2l6Luxy
c8qEFZH5jKzOlqfppnV8t6ff2psZ9uyd48gQdkSKuIGYJNi0WJacBFwL9/2RJUW5
4Y2LnEBtZ3Y6GdSlipjUsUbxZ0/HJPsbnof5Fx89Qewirua0oSX6m+T13vHlnQnu
LFL5Y+0sbXxQLjsGLIM9nMqJcvedb9yrK6tOLHhfUD6p5RPWImi9LThJCo+Zx5vt
GbrpYaqqF4sOz2a//K4sqqJky3l/qBlALjGKaFQfgG4f6Fv8GTSkJYchIViV8wM3
v7hurVSrejGx0wQF9tlOKLgYeHlUHaEa1JCT+tCx8/Za6Tznej/dwzRcXNdYuF0M
utpronoEy2pP1KRfmBImI+kbKmmmiwYbscFL/ZihCHdFrrKNw1cBSGZmlL3GPjPb
RC4ltTteew9D6mQkBmF8jqLvtSM3UFkblqq5vtfKL8Ol/GE2f175tULtpySZiNYQ
/yelkPgCalYOAWgGQE3YmR7uO4X37U0kebPz47KUaXQjJib4q7AiX3bLzB8eiyzb
l/UQoR0ZTIFrnBXh5EjAe6MV6ZqlyIIzUTwR18wlN39tcU7dk+htQ7l7K3brGDqG
iF4Erc1yMFWUMJUTQmgFoV8oSvYE1BxMJVURE5b/Wlv6vk4/U8g=
=c7Kn
-----END PGP SIGNATURE-----

--O5XBE6gyVG5Rl6Rj--
