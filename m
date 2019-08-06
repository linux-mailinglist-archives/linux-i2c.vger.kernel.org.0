Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02AC783A77
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Aug 2019 22:41:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726837AbfHFUlQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Aug 2019 16:41:16 -0400
Received: from sauhun.de ([88.99.104.3]:36640 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726016AbfHFUlP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 6 Aug 2019 16:41:15 -0400
Received: from localhost (p54B3324E.dip0.t-ipconnect.de [84.179.50.78])
        by pokefinder.org (Postfix) with ESMTPSA id 2E40A2C290E;
        Tue,  6 Aug 2019 22:41:14 +0200 (CEST)
Date:   Tue, 6 Aug 2019 22:41:13 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Baolin Wang <baolin.wang@linaro.org>
Cc:     wsa+renesas@sang-engineering.com, orsonzhai@gmail.com,
        zhang.lyra@gmail.com, vincent.guittot@linaro.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] i2c: sprd: Validate the return value of clock
 initialization
Message-ID: <20190806204113.GF911@ninjato>
References: <c9e2c50b54577e4b5cb7cc424f4c6de5f116cf60.1564041157.git.baolin.wang@linaro.org>
 <5f64dc0eedb348b15442f31f2f22f5bded7cd6ef.1564041157.git.baolin.wang@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/QKKmeG/X/bPShih"
Content-Disposition: inline
In-Reply-To: <5f64dc0eedb348b15442f31f2f22f5bded7cd6ef.1564041157.git.baolin.wang@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--/QKKmeG/X/bPShih
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2019 at 03:56:18PM +0800, Baolin Wang wrote:
> The 'enable' clock of I2C master is required, we should return an error
> if failed to get the 'enable' clock, to make sure the I2C driver can be
> defer probe if the clock resource is not ready.
>=20
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>

Applied to for-next, thanks!


--/QKKmeG/X/bPShih
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1J5ekACgkQFA3kzBSg
KbbKlQ/8DwrpeCTeauqKc96AvZbkjglv0XQwp7Fa2sjInYjc6fIKDvp/V7me4srf
0pim0VtRiLcnp3G84v7FfAJXvR+0qqh+dQZUMCXcguAL2R5hJ0sad5Jx8Rmo0Kkv
rvfzi7C3N/oEhTT6GFubZUKX+ptVCySl6LGo1xZj+mqYOVVlgy7VC4mb9GM3bFEU
tc8lNTyBQf80YtUfLrrGKkHK6lgj6Mfl26CkTB6NhsV3APXASfVSr7aXv4v/wF1h
CKQEnMbts0CJhTSyh5JGycwocVMXlBlUAyqg1T1NCRhdLuItlN/rOUqBBq5X9s6s
IbqTaY9eROnSKG+x/8TlONF2ZnzLTsOn/3N/zv3IsHuDsyYf1y8yLigej19UZVEo
u7R0LRcbRz7IMnXOx5MxJ56+phcyurg5kYv7Ngdl6V1UmPXEpAnjnHg7ZO4imV8w
eobW+vRtqU7pIkX/YbxnUdj1PgtnpVkf5HbPj7EGv30v+5DxBMT0V4/JGf85fzZu
yjkHr3LSc90SJOoH5UViqyUzEiOwh+n1g6iWNTr9FcWf1tSH037WCSG70aUIkN7s
5/0IJwilXE21uQfvakiglA0xGJs+vufZg1+uN5zloFUcS+QGLb30nS25tUdnK9Xb
4ENZntrcSDR8fuNbyORcCNxpB2iMsgloTlxpULkXQoTQZzYEyAY=
=uc1V
-----END PGP SIGNATURE-----

--/QKKmeG/X/bPShih--
