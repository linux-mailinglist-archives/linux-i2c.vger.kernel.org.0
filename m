Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAC8C109068
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2019 15:51:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728358AbfKYOvM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 Nov 2019 09:51:12 -0500
Received: from sauhun.de ([88.99.104.3]:54970 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728078AbfKYOvM (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 25 Nov 2019 09:51:12 -0500
Received: from localhost (x4e37056e.dyn.telefonica.de [78.55.5.110])
        by pokefinder.org (Postfix) with ESMTPSA id AED5E2C0456;
        Mon, 25 Nov 2019 15:51:10 +0100 (CET)
Date:   Mon, 25 Nov 2019 15:51:10 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Alain Volmat <alain.volmat@st.com>
Cc:     pierre-yves.mordret@st.com, alexandre.torgue@st.com,
        linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@st.com
Subject: Re: [PATCH] i2c: i2c-stm32f7: fix 10-bits check in slave free id
 search loop
Message-ID: <20191125145110.GB2412@kunai>
References: <1573546784-28182-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="EuxKj2iCbKjpUGkD"
Content-Disposition: inline
In-Reply-To: <1573546784-28182-1-git-send-email-alain.volmat@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--EuxKj2iCbKjpUGkD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 12, 2019 at 09:19:44AM +0100, Alain Volmat wrote:
> Fix a typo in the free slave id search loop. Instead of I2C_CLIENT_PEC,
> it should have been I2C_CLIENT_TEN. The slave id 1 can only handle 7-bit
> addresses and thus is not eligible in case of 10-bit addresses.
> As a matter of fact none of the slave id support I2C_CLIENT_PEC, overall
> check is performed at the beginning of the stm32f7_i2c_reg_slave function.
>=20
> Fixes: 60d609f30de2 ("i2c: i2c-stm32f7: Add slave support")
>=20
> Signed-off-by: Alain Volmat <alain.volmat@st.com>

Applied to for-next (i.e. for 5.5.), thanks!


--EuxKj2iCbKjpUGkD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl3b6l4ACgkQFA3kzBSg
KbbUUQ//XkHOnT0T9vDE7Y8UovQXc5YR15+7wcv4op1hXnAEnmpmlaTBwWPjHtWB
QQYri2zbtXiGGY9qrbe1l0fPNdDYJ3U2VpFbYZhpEMfjQoMgFaEykk5GTtkhlDnS
mOrQaHcQSMAznRqMUHT5LE0AnBDyflctVv85ZNgi2Ri/FXvrzq4CIMQlE6OL3VeT
Vi4cNJhPYJ2Wa0gdDBAqTiNF+mKN46aRGiIhP+ldQx2YWAwC5id1+ENaw8gQR+jk
koyxGKQppQ7aHHQvHm+0amaKULeWTG8Gh1K3h2NmwrQt6NxIIJRFKT0XE9FVZvIn
GKIrTea2r9FJrA+s3js5moVyT0cjBBXKOqWBAoLmm0ULe5y2WHXzz3J/uE2qQFBU
TAqz8irHuZquvVyvU9YVfFI+Wkoi67oRS1URjLdiAmbOgkOpQgRQzHmHvLWfveZg
k2Y9QkYfoT0fGzH7CJfBjbWrsCb19Vo7lP6JvY7+yJy7IP5J7Icrosnv5n5o4IhJ
2pobV+n1ziuZvDOAibeLBsGfXt2qjcFjkGjXeKSudsDuRSf0x0qpdH2l6zGfHKcv
WdsTM2+Eu8vXrBzhC6/Xj2IrTVcDA/7aONu7QSkPOLV2fo1nEZWfL8Ecm/lvYiXT
eKTKaGtlJIiLt7VIierHt7/xL3oDaseO7hFbGl5+h60aejhg1ys=
=SNme
-----END PGP SIGNATURE-----

--EuxKj2iCbKjpUGkD--
