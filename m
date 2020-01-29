Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 969AD14D21E
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Jan 2020 21:52:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726259AbgA2UwO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jan 2020 15:52:14 -0500
Received: from sauhun.de ([88.99.104.3]:41528 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726708AbgA2UwO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 29 Jan 2020 15:52:14 -0500
Received: from localhost (p5486CF2C.dip0.t-ipconnect.de [84.134.207.44])
        by pokefinder.org (Postfix) with ESMTPSA id 9840A2C06AB;
        Wed, 29 Jan 2020 21:52:11 +0100 (CET)
Date:   Wed, 29 Jan 2020 21:52:11 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Colin King <colin.king@canonical.com>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: parport: fix spelling mistake: "Atmost" -> "At most"
Message-ID: <20200129205211.GA7586@ninjato>
References: <20200125202020.12861-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LQksG6bCIzRHxTLp"
Content-Disposition: inline
In-Reply-To: <20200125202020.12861-1-colin.king@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--LQksG6bCIzRHxTLp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 25, 2020 at 08:20:20PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> There is a spelling mistake in a module parameter description.
> Fix it.
>=20
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to for-next, thanks!


--LQksG6bCIzRHxTLp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4x8HcACgkQFA3kzBSg
KbYpPw//b0fRja5Omd9dQyuGA50jUD9ErFfzBopDwUdwGfOCdoaQfS+Dn4OJQxG8
vtu94uKnUXLDq/gXBJJFJ9MgQrf6gM+pQd/oA4ae0Yh6rj3VlAdOKj0AQ+DDAnZ2
Gtp3hYpzNX61IUjJ1LTx37tZ1kOJmGRfPTVuTQrmPk+8St4+OhT7gfOA6ORSM7np
yduIyq5BKqMicFJK2iCpIUDxC94qRTEbGEkVCP9OUU3BM8erXnDleawdsmbZzGTc
1S3+s/NlRuRqVbnrjE77VncNXKcDAV91TpZIgupVgIdyGfA5UVQtrNbcbE6Rgs31
Ky/8qDYpkP1votujcc7DPZQ92lIol3C10o2S7WYzsGU5Vf5HZiNEW/UTJMi/GLd2
yV0zBfE8GqNu478ibJz9eKIFb+7RLjhi/r6tGV4Jdbw/9i0Mr0PkwAGmIsjN8qqO
1UkZ5/no9qDg3uIzeFcXjmuklmxQhglGV4Vs3uWhcdjMJQTEaFPZ8xAjw+keMmMq
ECSaw29sus3QwEZPoOUdV2aqRU+ntUYE5RNCVDFjDgGfuwYEvY4LuesM5WCfFVWD
VqYfLP9x4wqfkBQNe7S5oGuKOFVnEMOCeRZZYsewitqzzAMWePjN22QCr3Q9dV/m
9YMcG0SxRqqH0nq4lbkL6yDzUJmCiCszqhOeb7iwInSh1MRlTz0=
=RItn
-----END PGP SIGNATURE-----

--LQksG6bCIzRHxTLp--
