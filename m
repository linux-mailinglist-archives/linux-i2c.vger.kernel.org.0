Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B725168EF6
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Feb 2020 13:53:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727368AbgBVMxu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Feb 2020 07:53:50 -0500
Received: from sauhun.de ([88.99.104.3]:53856 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726839AbgBVMxu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 22 Feb 2020 07:53:50 -0500
Received: from localhost (p5486C6B7.dip0.t-ipconnect.de [84.134.198.183])
        by pokefinder.org (Postfix) with ESMTPSA id 938972C1EC7;
        Sat, 22 Feb 2020 13:53:48 +0100 (CET)
Date:   Sat, 22 Feb 2020 13:53:48 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Prashant Malani <pmalani@chromium.org>
Cc:     linux-kernel@vger.kernel.org, Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Gwendal Grignou <gwendal@chromium.org>,
        Lee Jones <lee.jones@linaro.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Akshu Agrawal <akshu.agrawal@amd.com>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2 16/17] i2c: cros-ec-tunnel: Use cros_ec_cmd()
Message-ID: <20200222125348.GL1716@kunai>
References: <20200205192253.187649-1-pmalani@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="L1EIGrW/+75u5Nmw"
Content-Disposition: inline
In-Reply-To: <20200205192253.187649-1-pmalani@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--L1EIGrW/+75u5Nmw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 05, 2020 at 11:22:51AM -0800, Prashant Malani wrote:
> Replace cros_ec_cmd_xfer_status() calls with the new function
> cros_ec_cmd() which takes care of the EC message struct setup and
> subsequent cleanup (which is a common pattern among users of
> cros_ec_cmd_xfer_status).
>=20
> Signed-off-by: Prashant Malani <pmalani@chromium.org>

I guess the plan is that this series goes upstream as a whole via some
chrome-tree? In that case:

Acked-by: Wolfram Sang <wsa@the-dreams.de>


--L1EIGrW/+75u5Nmw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5RJFwACgkQFA3kzBSg
KbZAJhAAno9ex5acdPq9wkA/gSWspLKV9G+6WYa+E0+XcX+w1es1q/X4i1L2+S0k
ddGemIHCYEgHHxcozQbl64RRnerEUsIyplyc6MFIQ5bv/R38pGpliuL3Y9YcsqLl
FDxUzUbyTWb8KbkbTFBKuVZDFB8vv7n7ZWJdLbZQ2rf8TZFahbE1lYLVZKHWRQC8
aizZdg6+bCLRxUyQMWg4NcXTrudmpq6GUzLONWzp0vgzS8OHVWMKUxoSesDDF9Ua
nAYi5kVPuldgEBO/4oFmAG9cxhSE0t1ZS2fByxBmFuILInszPur5cIPdgBRzISUQ
iNZZW3Hr58Q5i7eM7G9I7MiaDboYFlc9Xpd8Ltw79ONNR221pgoSQbI4PWJ57NVB
3+6aT+ivbr32N2t3kb7rcCBWlVGUTRKh67avE5mIkQKfirLs9FqcJZYhI/uLNyyf
y58QIXp2ghXKV/34hCOwHtg0Sea8qbmiSWkfsyXTKVO7Cjx3Es+A5YB67APzRHtE
M9HYFETj+FVhYguzWtLMa+yDdYqdHJg6b7JpB8tPT5O74puzkHkQy0gqoELgw+ZK
HUclo4HHtwLj540miXbGpsRVffGXfQXdVrJZIi9PfdOptE6SFv5qjZdgMX8RkbFT
JaVa5MKDfUW+vuG4zvP/X9kORxMeWD6/S1FGPlKjvybB/RD/Hp8=
=scB2
-----END PGP SIGNATURE-----

--L1EIGrW/+75u5Nmw--
