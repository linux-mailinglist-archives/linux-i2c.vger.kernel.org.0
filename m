Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70327307FF6
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Jan 2021 21:56:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231310AbhA1Uyf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Jan 2021 15:54:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:56000 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231239AbhA1Ux5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 28 Jan 2021 15:53:57 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 096D064DD6;
        Thu, 28 Jan 2021 20:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611867194;
        bh=LGnTk744nU516gZx8KhhGV5jHOG5uHAvhzd/Z/xuYPg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BWany1+j2Mc0h743Bdk+VDYpBo3m8KhgnOrY1CDQ6/DZwm6xS5fTeV4058f1OHKsu
         MH3PsF/dsY/FZyWxpb2ttFgCyo8M68gLjK9sWktLY9UF4IwlR7QVvMppTUq2CkHT8i
         uqjXIJQBz1BWPoMmzKY6HerinFBDNCh7fdPfeKD2zB7aE7jI5GVPuE0XX46d6CxV6D
         gdcC29ZrJhENlk4ML6N+v6B/aKHm3KultXxL4bkW27waA04mMg5MFU/ZRTGMTh7Qw6
         h5QPwu/ciVRpgN6xmxb7z0DkAtiyCl+kUBip1R+qvwvAPVmXV9SNNVoixQEPyt3mHy
         TXQ8sdXas4ihw==
Date:   Thu, 28 Jan 2021 21:53:11 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     "Jonas Mark (BT-FIR/ENG1-Grb)" <Mark.Jonas@de.bosch.com>
Cc:     Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Support Opensource <Support.Opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
        "RUAN Tingquan (BT-FIR/ENG1-Zhu)" <Tingquan.Ruan@cn.bosch.com>,
        "Streidl Hubert (BT-FIR/ENG1-Grb)" <Hubert.Streidl@de.bosch.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>,
        "anson.huang@nxp.com" <anson.huang@nxp.com>
Subject: Re: [PATCH 1/1] mfd: da9063: Support SMBus and I2C mode
Message-ID: <20210128205311.GB3094@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        "Jonas Mark (BT-FIR/ENG1-Grb)" <Mark.Jonas@de.bosch.com>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Support Opensource <Support.Opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
        "RUAN Tingquan (BT-FIR/ENG1-Zhu)" <Tingquan.Ruan@cn.bosch.com>,
        "Streidl Hubert (BT-FIR/ENG1-Grb)" <Hubert.Streidl@de.bosch.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>,
        "anson.huang@nxp.com" <anson.huang@nxp.com>
References: <20210125125458.1302525-1-mark.jonas@de.bosch.com>
 <20210125125458.1302525-2-mark.jonas@de.bosch.com>
 <PR3PR10MB41420E24A1303DA91175593E80BA9@PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM>
 <df52d5e7069541e78b8b01ddc54a6777@de.bosch.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="U+BazGySraz5kW0T"
Content-Disposition: inline
In-Reply-To: <df52d5e7069541e78b8b01ddc54a6777@de.bosch.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--U+BazGySraz5kW0T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

> None of that seems to model the inability to perform atomic transactions
> within the SMBus timeout. This is either a bug of this specific driver
> or maybe the expressiveness of I2C_FUNC_* is not sufficient.
>=20
> https://elixir.bootlin.com/linux/latest/source/include/uapi/linux/i2c.h#L=
88
>=20
> What flag do you think we could check to find out whether the bus is
> able to obey the SMBus timeout or not?

While not perfect, you can reasonably assume that the bus cannot obey to
SMBus timings when I2C_FUNC_I2C is set. Because in the vast majority of
all cases with I2C_FUNC_I2C, SMBus commands are emulated which is prone
to the latency you described. You'd need a native SMBus controller to
avoid that which usually has not I2C_FUNC_I2C set.

Happy hacking,

   Wolfram


--U+BazGySraz5kW0T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmATJDcACgkQFA3kzBSg
KbZCRg/9GSZmsg5q/FvpBCuFZMaBWnlT3qnN23x945KUIWMJ9IFuJ+uXPFyA6efm
T72toJzHh45I/vK7uMClC+UIbySOFA25aWeJlKO2k0i/pS8qMLr4RP7uJC6p3TM2
84+jFYtmUbeWBhMO/ZbPxDTBgOXsgUoAsSj5hu3YRbFmy2v+d8D8vQvt6lgZBMwa
s6ckAuCYHojbn0RqEwdDco6yHE2cUOYPKZruoP6Wpaz/aGusVuVW3aa8T8mqSo6C
zdREpwE1XV8PKtpfJpTPh+J1yBUAr4GdXqkTsvgdfUNc6quFwiiHl6G6DQAZ/H7x
pZXMuAtdSj4Yet37R6TawPrwrozYrz/xU3Gk0Bp+/shJ+9L41A+hLnSabzv783N4
TdWpJyQk9b9K3/X44TyP1GuLy6tvD9pXLypusUT/9H7wzMyUu019l0bc9/zvYfY5
r14Wo9hMwwDa9Juu2z17x1yxlipj/pQHVpMz6dXhDFIhElSg5MCJB7TEbXYn7BoN
xf0iyUpFm8lLS7gYXfS4Y2iZOoZaW0FzMCJI3Bt8z75pByYoClMccxBsW6nPb793
2C7dWHp6gK7XKBfkb9Wf+fDNmGGEV9hy+qXq280Exd4DNyXgtBqta/e1RFg4fp4T
sdl35OyhUv8+RrasM+VMHHnimKq58xPfgFTpVoD3PacRkAPPXM0=
=vwmG
-----END PGP SIGNATURE-----

--U+BazGySraz5kW0T--
