Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51A7A2BA82
	for <lists+linux-i2c@lfdr.de>; Mon, 27 May 2019 21:06:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727120AbfE0TGU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 May 2019 15:06:20 -0400
Received: from sauhun.de ([88.99.104.3]:35954 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726931AbfE0TGU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 27 May 2019 15:06:20 -0400
Received: from localhost (p5486CF59.dip0.t-ipconnect.de [84.134.207.89])
        by pokefinder.org (Postfix) with ESMTPSA id E71772C04C2;
        Mon, 27 May 2019 21:06:17 +0200 (CEST)
Date:   Mon, 27 May 2019 21:06:17 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Anson Huang <anson.huang@nxp.com>
Cc:     "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
        "eha@deif.com" <eha@deif.com>,
        "linux@rempel-privat.de" <linux@rempel-privat.de>,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>,
        "peda@axentia.se" <peda@axentia.se>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH] i2c: imx: Use __maybe_unused instead of #if CONFIG_PM
Message-ID: <20190527190617.GC8808@kunai>
References: <1557026820-29428-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LwW0XdcUbUexiWVK"
Content-Disposition: inline
In-Reply-To: <1557026820-29428-1-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--LwW0XdcUbUexiWVK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 05, 2019 at 03:31:55AM +0000, Anson Huang wrote:
> Use __maybe_unused for runtime PM related functions instead
> of #if CONFIG_PM to simply the code.
>=20
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Applied to for-next, thanks!


--LwW0XdcUbUexiWVK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzsNSkACgkQFA3kzBSg
KbYqkQ//bc++1BsW2mcNsRYs3x+wn7q33xEltFS/Z+l6e7RdQVqrbo6J9choQYao
8P7UHRFbYv8P/DtFXQIG4kiVtq0ERHpzQu6FAn6UX3QaKhgk86/AEoYIsq6CwLKD
w57KoElNhrBz3uLl6/jjRVwRM7xUZ2A3c2QCBu1J+J0Pe6iPDvU59EuoS71bv4Ye
w+w/1bMmL/RuZQ2zCB1rnyzTGjUHSIhNpsbQnZ8xeRXeFfmuMy5V6jE5sXE5Dbkg
jTAiEkH/l9hAOnSWLFJSSkNpWO42dRBdSRiTbEM9ToMX9DBzCpaqeZyFXRHKrfXQ
TTLbIZfn/5Eek3kg2WtaZp7y85M6sjR84eURdcKfOSmmIEGSWjubXoSoaLzZdPfM
SJReS6LxzeQDHNSZmbavdylmke1Cru8wH7E6bqShililnycrAe1TwBG9Gh/HEYu5
uSiqtPsURs+Lg8IOy1hbMoexCWFstG7y7FgzzVwLB6Pwe6WLlVRRdN1kDb1lnnYJ
tna9+IFQdpY22udjjjv/+a/L/PgT1lby1/zhVvBKu8tLhLclh6m9jm05ov9OaE49
TkM5052NAD+uDrMamDOkKXQX33dinDehP/WmVyItEbgIWbe0HvGXaH+HBVlVKvrs
Skipi7i5xJUIOINUg0kjZa9+w1BVMfXFqQJNHbP14NAcbcPzZz0=
=BAhy
-----END PGP SIGNATURE-----

--LwW0XdcUbUexiWVK--
