Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41F751313E4
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jan 2020 15:42:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726427AbgAFOmE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Jan 2020 09:42:04 -0500
Received: from sauhun.de ([88.99.104.3]:39380 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726303AbgAFOmE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 6 Jan 2020 09:42:04 -0500
Received: from localhost (p54B338AC.dip0.t-ipconnect.de [84.179.56.172])
        by pokefinder.org (Postfix) with ESMTPSA id 475342C0686;
        Mon,  6 Jan 2020 15:42:03 +0100 (CET)
Date:   Mon, 6 Jan 2020 15:42:02 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     christoph.muellner@theobroma-systems.com
Cc:     Till Harbaum <till@harbaum.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: tiny-usb: Correct I2C fault codes.
Message-ID: <20200106144202.GH1290@ninjato>
References: <20191211233905.84056-1-christoph.muellner@theobroma-systems.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xQR6quUbZ63TTuTU"
Content-Disposition: inline
In-Reply-To: <20191211233905.84056-1-christoph.muellner@theobroma-systems.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--xQR6quUbZ63TTuTU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 12, 2019 at 12:39:05AM +0100, christoph.muellner@theobroma-syst=
ems.com wrote:
> From: Christoph M=C3=BCllner <christoph.muellner@theobroma-systems.com>
>=20
> This patch changes the I2C fault codes according to the specified
> values in Documentation/i2c/fault-codes.
>=20
> Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@theobroma-syste=
ms.com>

Applied to for-next, thanks!


--xQR6quUbZ63TTuTU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4TRzoACgkQFA3kzBSg
KbbL2Q//Qb5v3P7mJ+ddIC3rR3s0ooCZpQheB+HTI7HZlwSp9E29Ij5LrDROZ5jy
N80qNdMSOdEHxAlyaKJ41ZtJXj9nT+EQryimd+9TXpXcT89n5kdt5h/W068MNCw0
9LTbCxm6gs6A7zAXMidNhF/xVMtE3/lxNSkiH+DXkmlnBZy6YO0yuaQlSvO8zi9X
j95W/b25tUJfWDy0qTL5Iu/09ZM1s9H97o1Al+fM0fJ/I8kYOQRQEx8BYigz7xMc
MK/qSyEMyGHWi1It27yt45wnbiJ+X+LrOx+6VhMF9DAgUs/j/IgBSURCCWU3f4m1
m/sugJYRPA95UpafdIb0+LAe4O4wP8SgkWm/2/KxYd5Oi2L3vrAALT/pnLowST7N
weXNWj3WUk61soOwuqYEmsMEghmhkuyzOQwVi3UaWcIGFQA2jeqpWtgoez++hfbG
girKQ72aJS0Tf0S7sVEzfK8zGQ4vJIiMiHbCEcqwXZyvPLB12blIBaJqv7wmmG4N
1M7W9VVdBxnZTvliUGnE46Xt1fDUETUUp+d969/fHxReeHQzSJXIzYkpk9ABAfC6
xY3Y+9mqVrDiX8kxG4igJfyrVIPKuiZPCY5OWyl05n4T1E4CHILMu7gyOkSYBOUR
1SlEseEbxg7LAY2hySlD3V2dtC5qLY5qvIz49/aBcJzH/1y8Das=
=ulEv
-----END PGP SIGNATURE-----

--xQR6quUbZ63TTuTU--
