Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 750E12E9CF6
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Jan 2021 19:24:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726098AbhADSYl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Jan 2021 13:24:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:44078 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725921AbhADSYl (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 4 Jan 2021 13:24:41 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B4F2A2075E;
        Mon,  4 Jan 2021 18:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609784640;
        bh=NAKxZ9YnloUxJG1/XOwUsi/jqwedI1lLgEr+AjEZo6E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ShT8eomC+84fgWvh5TxvREgoTjBzW8NV4ZmcIftJ2xVtWdEEGXVzeSqLf+68TB/M/
         CKv83qu3MR8d1YJeZjfMbLAZuqEz+efB+NUZgh5EcvCpYRxcqICDq0piOM9jnonu95
         NUdMg5WbAWlnPID0AVvuNKLknp69DeoGY/uSEMSv+GJRf4MPccLEA7CT7eVpPWfdx2
         /JZKuvAe98Zb7tQtarOtOpe9avnXz3feWFkOXkbSynND9mLRwPyoMCnfmPJvCsEu4C
         Ba9otCn60XAKKIJPUjqxheiLdMdDxNLVH4gjqOrOyoCNu7Rm/q7eEXD3yiy9vEvbB5
         wLp+o0mvCSteg==
Date:   Mon, 4 Jan 2021 19:23:53 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Chunyan Zhang <zhang.lyra@gmail.com>
Cc:     Baolin Wang <baolin.wang7@gmail.com>,
        Orson Zhai <orsonzhai@gmail.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chunyan Zhang <chunyan.zhang@unisoc.com>,
        Linhua Xu <linhua.xu@unisoc.com>
Subject: Re: [PATCH v2] i2c: sprd: use a specific timeout to avoid system
 hang up issue
Message-ID: <20210104182353.GA935@ninjato>
References: <20201214045850.1026293-1-zhang.lyra@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gBBFr7Ir9EOA20Yy"
Content-Disposition: inline
In-Reply-To: <20201214045850.1026293-1-zhang.lyra@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--gBBFr7Ir9EOA20Yy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 14, 2020 at 12:58:50PM +0800, Chunyan Zhang wrote:
> From: Chunyan Zhang <chunyan.zhang@unisoc.com>
>=20
> If the i2c device SCL bus being pulled up due to some exception before
> message transfer done, the system cannot receive the completing interrupt
> signal any more, it would not exit waiting loop until MAX_SCHEDULE_TIMEOUT
> jiffies eclipse, that would make the system seemed hang up. To avoid that
> happen, this patch adds a specific timeout for message transfer.
>=20
> Fixes: 8b9ec0719834 ("i2c: Add Spreadtrum I2C controller driver")
> Signed-off-by: Linhua Xu <linhua.xu@unisoc.com>
> Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>

Took the liberty to change the errno to ETIMEDOUT and applied to
for-current, thanks!


--gBBFr7Ir9EOA20Yy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/zXTUACgkQFA3kzBSg
KbY/rA/8DbuMASXfe9xJXZupUwx5e8DPkcJIKgFnK4gZqGHUoRLtrlZpt9nRZGE6
iifRqpFj54Phh0UDpq/T0XktIWARfudUseotNr09rUqVSWXf/zYb6C4+kxdfLdyV
LmD74F7ZoOv/OnHgNOlHH0K+8dyKq+jE+gz/8nhsvMSG2itOZivMMvUBjzlXtXYJ
q9kbB6qjdr9z4chI3pN5ue7c/RKdTBv3f1l8Y9dYQlq9zUszoBJFfnefn1bNwtye
ksai1KHLLVYkmEVHKQvONaqYUcQv0CEeBNuCbk2ef7ioM6djvogSRKadV38K7IVT
LYyQrhpirxHMeMZg1PiSc4W6/dkw5Yn224NGA6M78rkdNzOGpq325+LG0jsLUkjV
yM+lZnmrAXqtaezifc2z5urgSuf8bq9FEgotBiQ80KFt0sPwnMWfalLO71rCos6E
p8sXmo8wb3H4tKKd7r2xbZ5sTVxQwFDnzWnMoXElEgVQljVKzE7Tx0YNJrTkRl23
EaGoB9XU7RjDxg2JiZi9EBoqvYlSKVebTef/Gf89U0CYbzzt23TZM2uUnsRLm97q
STW5ea7BGWfIq/4+MzzCFX2hraq/DFL3bkczbX/j8hw3xEXkMliKnsIu6FkbSPCt
C+EGxSB5BI0XKXxgS9iS+/fQZaOM82/1AZH7syWKZezYDjYbE/8=
=QOXt
-----END PGP SIGNATURE-----

--gBBFr7Ir9EOA20Yy--
