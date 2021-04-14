Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C30535EFAD
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Apr 2021 10:46:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230500AbhDNIbs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Apr 2021 04:31:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:47232 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230373AbhDNIbs (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 14 Apr 2021 04:31:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 76E47613C0;
        Wed, 14 Apr 2021 08:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618389087;
        bh=oP4zzryECD7J5pXO9mtg7ISNTzP4sd+9qxOtZGNrTV4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Z9+kalaPKeJSXeTxGEENllh21coepFwzcMEbSgE+piv4YMxZVP09y5XQvJkqPN4+B
         5xmobS0RTmYKtfMgtRqeaVKHkt68dvvXWkt5M/SxFAgrsuvHYTKi2A9QYyFOAX2mFg
         GY990c7SV461K8BtgZUxYzomuRk3RhLhSPLHhQA3BJY0Gz22G2K0Vq2QHpoH39yVo0
         f3S/CFT360yHzJlVAPTvqdpfY5mPOYKdgtoxaOm4HsJ2uSPnbBSYrcIiHmC1Qw7FvQ
         tOydQSN7s+pzmRRZBJONo8pr+xaSa5AKl8+uNdXZ00eS5iBmRs24BgkC5ZbFBOXzlr
         3/R3HyXeir3bg==
Date:   Wed, 14 Apr 2021 10:31:24 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     "tiantao (H)" <tiantao6@huawei.com>
Cc:     Tian Tao <tiantao6@hisilicon.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH drivers/i2c 1/3] i2c: amd8111: Fix coding style issues
Message-ID: <20210414083124.GL2180@ninjato>
References: <1617613430-11921-1-git-send-email-tiantao6@hisilicon.com>
 <1617613430-11921-2-git-send-email-tiantao6@hisilicon.com>
 <20210413202503.GD2751@kunai>
 <4aeba72c-46bd-35be-a1e8-2739f1825d92@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="SqfawxHnX56H7Ukl"
Content-Disposition: inline
In-Reply-To: <4aeba72c-46bd-35be-a1e8-2739f1825d92@huawei.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--SqfawxHnX56H7Ukl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Is the binary after the patch applied equal to the binary before your
> > patch? Same question for patch 2.
>=20
> The MD5 value of binary is the same before and after the patch is
> merged=EF=BC=8Cthe log is as below=EF=BC=9A

Thanks for checking! What about patch 2?


--SqfawxHnX56H7Ukl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmB2qFwACgkQFA3kzBSg
KbYOqxAAmPNdd+lglasSeBK7hoSlOu2uxXZxnbW3ePGtnd2Evurv7tGtPiO/Fa/Z
0f1Lbe0/fxT4f83TuLxBZD4oS45lMReeNiAgipbwzb0Zrpjg+Uvvva8AoDRqtonp
VFDl1fQZHVf1fOVRP53Auoz7uXkTh2pVf0ex6owSIlpJrAy2E1bA+giV2/9CdYUH
lWbWSBSXzo7JNN+3bK0JGhTSAwi9TkOHL6mR9OINAbzdqu2HFRjfRYmkcgFo1oXv
jjc87qLb4GMWHsLi+y9QUln5zDvNmJIEVXmbILYJP0qXR9eS1KB1CZGtDPM9afdX
PiWFDEonUsVmot7iUXoSxZucTI71MnLW+Kvg0b90r4aBNtIBLKye2twgSCvB2mOP
QTtl0hmpIVJsRUykF00Az9pMlvTi1k6INotVuxmn9toA6KQlAxg5aiBRLR1sR3dM
DIPmg3bT6FRuIMsitljO2zcNSkCsCeMDQWsmncklqRrMuxBeCNXQl21P1VvWeM2j
Juy3Y2Ae090vX3aWWcv0iyJnYF2QHimEd46P7kx7x3ule/QXPGagQ/Qar1RcxDvC
83urO7lsKGWZ685JTyDkHB6Lua60eXhlu/16TFmAK77pZ+b7x1CKyJJKU2DKhPJf
L+KvPe3OuI39nPzUFV1Za5HiCQaH1rNhzrh+w007V45+APBTeu8=
=RAeJ
-----END PGP SIGNATURE-----

--SqfawxHnX56H7Ukl--
