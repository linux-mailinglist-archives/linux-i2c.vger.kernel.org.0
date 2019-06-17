Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6C6447F40
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jun 2019 12:06:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728059AbfFQKGN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Jun 2019 06:06:13 -0400
Received: from sauhun.de ([88.99.104.3]:55484 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727989AbfFQKGN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 17 Jun 2019 06:06:13 -0400
Received: from localhost (p5486CE69.dip0.t-ipconnect.de [84.134.206.105])
        by pokefinder.org (Postfix) with ESMTPSA id 8A67A2C35BF;
        Mon, 17 Jun 2019 12:06:11 +0200 (CEST)
Date:   Mon, 17 Jun 2019 12:06:11 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Suzuki K Poulose <suzuki.poulose@arm.com>
Cc:     linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
        rafael@kernel.org, atull@kernel.org, andrew@lunn.ch,
        daniel@ffwll.ch, airlied@linux.ie, davem@davemloft.net,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        f.fainelli@gmail.com, frowand.list@gmail.com, hkallweit1@gmail.com,
        jslaby@suse.com, jonathanh@nvidia.com, lee.jones@linaro.org,
        lgirdwood@gmail.com, linux-fpga@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        maarten.lankhorst@linux.intel.com, broonie@kernel.org,
        mathieu.poirier@linaro.org, maxime.ripard@bootlin.com,
        mdf@kernel.org, peda@axentia.se, robh+dt@kernel.org,
        srinivas.kandagatla@linaro.org, thierry.reding@gmail.com,
        thor.thayer@linux.intel.com, ulf.hansson@linaro.org,
        joe@perches.com
Subject: Re: [PATCH v2 06/28] drivers: Add generic helper to match by of_node
Message-ID: <20190617100611.GB3502@kunai>
References: <1560534863-15115-1-git-send-email-suzuki.poulose@arm.com>
 <1560534863-15115-7-git-send-email-suzuki.poulose@arm.com>
 <20190614203144.GB7991@kunai>
 <d050ae69-52ee-b32d-2bc0-708b408f3bd4@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7ZAtKRhVyVSsbBD2"
Content-Disposition: inline
In-Reply-To: <d050ae69-52ee-b32d-2bc0-708b408f3bd4@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--7ZAtKRhVyVSsbBD2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Is it an option to 'static inline' this simple function in the header,
> > saving the EXPORT?
> >=20
>=20
> No.

OK, thanks for the explanation!


--7ZAtKRhVyVSsbBD2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0HZhMACgkQFA3kzBSg
Kbbl3A/+LFTwA3gh8PCif9bJi4Ywry/gCg7cCVuGAw1ZhH5h29SAhoONggyXvO8N
XvGR09Q0NYX1CpAogNTRqTtpOKSudrSozBdFRxKlNCuACTghf1AdboPKq+pM2Zos
+Q75BJMykwO00W+5ghmbztldccufXFjjwXzDwdBq5zNjtVf3yne4h1wWAubXItsQ
LMaf+2X6WrAPfIPVvBbtV33cG/1f8l7GemdTJj02Z+5+u1NH4L1e00WP+rxqj0Q7
nYMFIFYfjfqHBkhAltu6bx/gqqORuDfQ6DQ/vl/qyXVHY6WcYIzUde/NpnVSjAX/
e6d3JrHaEHw7qBEH+39w54dQr4fRii9mUOF9keTO7OSfQnAAva1QQyERtAhPj7EA
I2X/qEU6ncbQJK91mxlelKLbD+WuJUcqahDM0tQ07nQ2lz6zwVpBQzn3VNZiXxh1
KAJFCCaWJRGp0P1JZMwnVbmMSeFoPWJx5fXweNoQXdgz/4yy2VpTh7AdvWFCOl9+
u5N+YWIn6gygP5kUJuDevsLDTzyodTVxi3zvYaaFM+2eIF2nT8a0AI2HPzmR3G1R
xlNjF3xnwWLlW/0g11vgj9PPAnKgNazMZflNXIbPSRZjHZzh6+C/GYnxlDXf5N3V
tFjRbBS861rgNrq+zJv9HqLqlF7opQ3x7jAh8LwHdpF/Z95yDW0=
=hDM+
-----END PGP SIGNATURE-----

--7ZAtKRhVyVSsbBD2--
