Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7535C11A0
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Sep 2019 19:48:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728640AbfI1Rsk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 28 Sep 2019 13:48:40 -0400
Received: from sauhun.de ([88.99.104.3]:36250 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725965AbfI1Rsk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 28 Sep 2019 13:48:40 -0400
Received: from localhost (unknown [46.183.103.17])
        by pokefinder.org (Postfix) with ESMTPSA id B52AB2C0489;
        Sat, 28 Sep 2019 19:48:26 +0200 (CEST)
Date:   Sat, 28 Sep 2019 19:48:08 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     alokc@codeaurora.org, agross@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, bjorn.andersson@linaro.org, vkoul@kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [RESEND v3 1/1] i2c: qcom-geni: Disable DMA processing on the
 Lenovo Yoga C630
Message-ID: <20190928174801.GA2196@kunai>
References: <20190905192412.23116-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jRHKVT23PllUwdXP"
Content-Disposition: inline
In-Reply-To: <20190905192412.23116-1-lee.jones@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 05, 2019 at 08:24:12PM +0100, Lee Jones wrote:
> We have a production-level laptop (Lenovo Yoga C630) which is exhibiting
> a rather horrific bug.  When I2C HID devices are being scanned for at
> boot-time the QCom Geni based I2C (Serial Engine) attempts to use DMA.
> When it does, the laptop reboots and the user never sees the OS.
>=20
> Attempts are being made to debug the reason for the spontaneous reboot.
> No luck so far, hence the requirement for this hot-fix.  This workaround
> will be removed once we have a viable fix.
>=20
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Applied to for-current, thanks!


--jRHKVT23PllUwdXP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl2PnM0ACgkQFA3kzBSg
KbZ89w//RAjbjnkY/ZBQx8eGD0B0WRlQ/Yu+vD3JZxj+76bqaqqvw0Y/uidr6l9T
nGCdfBF7lGcxgO2tmfUVLNLVCmjcBi44XuVDeDbruWPqwpAoGLJ5rw+vzczavdE1
l39g8hyiwCMZcvjAbdM03AlY/ARdt2a5noIvkKn22gtu1m/66+7BUEGc2YlpoBiO
9SuFmlSHS2xG6SvJFeMid+CIAagC5Bz6gFo6us3oI54Wr+qZ/cOfIuVZwSzeY1RC
Bcn0SkLYH0SmCEJzam5lDufEXW8tgvSB/Jr8FGX2AU+kNLAa2/EEfgf4WLc2adyF
WiMzCrLX88KIEQc3XTCKTV7mHLuOzD+l7rskpIxbt2Rauk8OB1Wf9N4A0XUd5+zs
IjLmKmJ/KfmYiZnXkaRAfybx2z+TNfdPm3/wr9eJrWDuM5KJsjc8y/V5haUnRr1q
eg+Gt7QMz0TGgwAT8OBoSFugaQqrLw+XbMR57leVkhQGkJ4BZgQIUj4q8tI6eevt
t0KlF/S8VEHLbhWmwUR1A8iz493/GAQnBbXqOMKRauX4IsIcLa2y3nFsBkVRbqyE
4anx/8psj9PsyOpa6hyyJNVY2GXOIvudeWze81sHJq7scz5l8T7VkiCYCp8s1Td1
lEa7CgP0PIg2dXpA6n+iQqBYP+B3S2WZbHqiel3sQYZ6GzkafVA=
=0des
-----END PGP SIGNATURE-----

--jRHKVT23PllUwdXP--
