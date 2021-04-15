Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64C06361375
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Apr 2021 22:27:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234803AbhDOU1h (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Apr 2021 16:27:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:38444 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234662AbhDOU1h (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 15 Apr 2021 16:27:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1888661131;
        Thu, 15 Apr 2021 20:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618518433;
        bh=hHZQHWAp0xMvWuyhXlfN6MYFzZjJSRkAsasb2DlD4+c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=I3MiD7ijecbM7oMPrj2wOCn0fp612Qqhf8YMOIhBtQLTn8OI7H5YPOS5nb5wUFcMY
         OctttbNVWvCpwAr5C+ZpXo1Ew188eulK3nVU/xDdURfFB36e/jEC/jbNgZ9C/JYRt1
         XNPnIBAlUElSVlt8lOMQ+A+InNwGG4DzGk4if3fhee1ibWKd81/U0IMIIjDGsDux6B
         FmUtaC9+4O3yLqlqHO1vnfhLCjClXAJ+Let7Fjb7U/rJ3rfHc1hAsPxuvcZCJkDR/o
         tT0PZObdXGGPYtnX3ne+nOkTLjGF/oWAQzyub6dESGxbjkxNnO5iuwpUVjRw22fM82
         0Xn+28jiClHvw==
Date:   Thu, 15 Apr 2021 22:27:11 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Tian Tao <tiantao6@hisilicon.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH drivers/i2c 3/3] i2c: nomadik: Fix space errors
Message-ID: <20210415202711.GC6471@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Tian Tao <tiantao6@hisilicon.com>, linux-i2c@vger.kernel.org
References: <1617613430-11921-1-git-send-email-tiantao6@hisilicon.com>
 <1617613430-11921-4-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2JFBq9zoW8cOFH7v"
Content-Disposition: inline
In-Reply-To: <1617613430-11921-4-git-send-email-tiantao6@hisilicon.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--2JFBq9zoW8cOFH7v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 05, 2021 at 05:03:50PM +0800, Tian Tao wrote:
> Fix the following checkpatch errors:
>=20
>   ERROR: space prohibited before that ',' (ctx:WxW)
>   #280: FILE: drivers/i2c/busses/i2c-nomadik.c:280:
>   +	i2c_clr_bit(dev->virtbase + I2C_CR , I2C_CR_PE);
>   	                                   ^
>   ERROR: space prohibited before that ',' (ctx:WxW)
>   #528: FILE: drivers/i2c/busses/i2c-nomadik.c:528:
>   +	i2c_set_bit(dev->virtbase + I2C_CR , I2C_CR_PE);
>  	                                   ^
>=20
> No functional changes.
>=20
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> Signed-off-by: Zihao Tang <tangzihao1@hisilicon.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>

Applied to for-next, thanks!


--2JFBq9zoW8cOFH7v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmB4oZ4ACgkQFA3kzBSg
KbYLSxAAm1vV+lgL4VoqiYYyDyC4yIqKkJzT/09Q1oNVUcsxuvMTWkrUuZvx0mIH
Cp7sGe23Y17DUELn5OxbM8QA+D1omyquZ0rVCbJnDVhhtJSdhBSwu3mMJziLBoIV
xA5oJZVTLjC+YUcyB6mkrEgWGLPUw1KgyOtdcPAkLiNdk9bzISXM3dyMiPn8kehZ
0glHHEV0V3JQ6TNo7PynAF2DsurvfIukSubaXGJNpNoRfNpDFAEWua/1MwFSeDtX
CkDGetJE8zKsdRi4ucEPkEV+NMeRMxYlMT35aYjxtMo5pgFr1m7bERq0ivANtPns
UpkTPxvJvPi3EczhlpHIY5pc23nmX36wUnDAshtpEs9A1KZzTvk8H4KyVm6VuAcH
/kOZXPQ3PsmN+oGKaCbvicliJaLgb6mHM82plVj9Lb5wsMoTpRG5YrnrtrnvDOiY
cARl2xsgKpqZzvj9GIGgzwZBxB706Df5TqDLvi7F03IwNHkxp01/yLN3BArQ9D4q
6pW56SLqxlrCbP+sOnrxJ7l1FpkJRmAQe10vlhFjNpjna7BADCF8P3gc1Y6mRMCw
bMomuwjiNA6Qvcma5mgkb6Tq7VMAsvN8pBCSlDU/26yvGFYEvf06tMpElU+pWMLn
3pbniMd9YklSxD9jNLUrf2tyINLeVi7Db3S5+KzPf14pe1yG+gw=
=PEmj
-----END PGP SIGNATURE-----

--2JFBq9zoW8cOFH7v--
