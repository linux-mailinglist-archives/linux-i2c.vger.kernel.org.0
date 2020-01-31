Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38EAC14E934
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Jan 2020 08:45:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728089AbgAaHpi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 31 Jan 2020 02:45:38 -0500
Received: from sauhun.de ([88.99.104.3]:57164 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728027AbgAaHpi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 31 Jan 2020 02:45:38 -0500
Received: from localhost (p54B333AF.dip0.t-ipconnect.de [84.179.51.175])
        by pokefinder.org (Postfix) with ESMTPSA id D7CD82C0830;
        Fri, 31 Jan 2020 08:45:35 +0100 (CET)
Date:   Fri, 31 Jan 2020 08:45:35 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Akshu Agrawal <akshu.agrawal@amd.com>
Cc:     rrangel@chromium.org, Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: i2c-cros-ec-tunnel: Fix slave device enumeration
Message-ID: <20200131074535.GC1028@ninjato>
References: <20191121090620.75569-1-akshu.agrawal@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ctP54qlpMx3WjD+/"
Content-Disposition: inline
In-Reply-To: <20191121090620.75569-1-akshu.agrawal@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ctP54qlpMx3WjD+/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 21, 2019 at 02:36:17PM +0530, Akshu Agrawal wrote:
> During adding of the adapter the slave device registration
> use to fail as the acpi companion field was not populated.
>=20
> Signed-off-by: Akshu Agrawal <akshu.agrawal@amd.com>

Applied to for-next (v5.6) with Fixes tag added, thanks!


--ctP54qlpMx3WjD+/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4z2xsACgkQFA3kzBSg
KbbKFxAAgpMonUfxyVUY5DY80CPc0VG6rP1A3Y56J94PLSYgvG5TkzVahjZ8IHQA
CunGV7/qKeG9VpIt33LyPKyJ04aMmN8HL3XWZFTWM63l42Mkba8n4O+2q0CsgmA2
Q//FTE5YJKPnEIfBe7UWcs52SHoLRJEEyTtb26QYreXjRD2gHzFNcpfLWO9ddLET
CX0JjZvAWpUFojLg3vNo04HfHWtFsZX/fJM45tog/LSSa9/MIXudWSegH4prR4/M
cW1QNea4shXiUFXv9qwCtsv9iocV5EKMUZrIgjK/HY0rl1r4iPFMeLOR/bOy+VZz
3IG6bxAWjQIL80hEofZdjdSpAyeMfydruW/4FcNvlebKuidHR7SSG3qbRQG/3h4Z
SbJaJK7sjq358yQPU8QNiDRuufbZFtA+Q6/fWm9uL7XKV9jB32YWfO9l+JGmKNid
V0lJPyU4maw6OIz9g1zATnQwUlub/ot7XQnwPY4gkk78Ln22/u739XoXw7CgmeyP
mrxIhN9auDY0UJ3AlecIURRbFJGm/XZ8X0qEgI0tAlSvK7OHP5Rmtcri8U6o4cvA
9Vswrp5bIwMKwfxl8Idorg2IR2/xuV/AF2M17TK57Pu5Ynq9jBOgIcb1ttxx/pzO
NJJkmDeZ8n4PNwgNlgsho4UQR8XaNSo9T9SNoYVQrw1L+JZHC5Y=
=t3se
-----END PGP SIGNATURE-----

--ctP54qlpMx3WjD+/--
