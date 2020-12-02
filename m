Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3A122CC108
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Dec 2020 16:38:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728468AbgLBPiE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Dec 2020 10:38:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:34160 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728261AbgLBPiD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 2 Dec 2020 10:38:03 -0500
Date:   Wed, 2 Dec 2020 16:37:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606923442;
        bh=E6fIwILl2e0HNaWGJyoZp/0i4fdzS2r/sFb/C35V3wc=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=G79SWBizUamCAsssWjGTJjr2ehkbIvrMuFUVx2AyTlVqml6seWGnOaXHasGqMzDLV
         grPSr3CmK+6u57W2+5jcftHqhXzR5oFeIKBqrL1zMnWNpL5dLXg1w8jbC+Ie7+xexV
         luSQKLZdXr04ex6hQLtEmIrCpC8so6EKKRIAtApM=
From:   Wolfram Sang <wsa@kernel.org>
To:     Wang Xiaojun <wangxiaojun11@huawei.com>
Cc:     kblaiech@nvidia.com, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: mlxbf: Fix the return check of devm_ioremapm and
 ioremap
Message-ID: <20201202153719.GH874@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Wang Xiaojun <wangxiaojun11@huawei.com>, kblaiech@nvidia.com,
        linux-i2c@vger.kernel.org
References: <20201111032726.3675159-1-wangxiaojun11@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="z9ECzHErBrwFF8sy"
Content-Disposition: inline
In-Reply-To: <20201111032726.3675159-1-wangxiaojun11@huawei.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--z9ECzHErBrwFF8sy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2020 at 11:27:26AM +0800, Wang Xiaojun wrote:
> devm_ioremapm and ioremap may return NULL which cannot be checked
> by IS_ERR.
>=20
> Signed-off-by: Wang Xiaojun <wangxiaojun11@huawei.com>
> Reported-by: Hulk Robot <hulkci@huawei.com>

Please fix the typo found by Khalil and resend.


--z9ECzHErBrwFF8sy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/HtK8ACgkQFA3kzBSg
KbYMhg/9HjM/672kvSX7vkcGBNxpwovWmdKd7taVAC9ajRTsWeJsW75KdLRwxfCM
dLrKec77hrxKFsAI1zkA126+Z/iqJNU7Hv4dZoUHODG0NZeduNBcTG+havx51o2f
VKnzfJ8Yw6VNDIdvV/+RTn70AAQLvkum5YGkdb6bbYFV8Z+uNrsjvjRlZH5Ug5/0
g99TUgsJpYmAM3CeoRrlAE4CnP7amwFnWQhrY159WLgZtMqU4fvUaJKUv/pP+Eik
qZd1uXyYthprK3klxoDAhWDXPNNDxIzTKZ357DJef0WPEVPmf9zqA/26vRdAhIy0
2bEtmmFsbkYuc50L/pjHqo+ZJF9TRsfIFPBetZobDYE/fanrf6HbEJ+Ntr+KUofJ
QE1a3JOwmZeL5oOf0cQbRDpblXGqInIioFiiS5hyNMv7KKewO6MnZprPbJd6Zffj
1AqIJVusvkduAJ1vIKC4EJOxQXZU3wrttR2Xk2M0LPUIwvNn3bfnyQBoOvqLgxWn
ZTc2mDRiBpXzPiK/YooBu3Wqwv5D1Y1witVKRsAyWxLKT19TuLYkLj3cO8gEAuzJ
L//wJM4fVgrgBfU5RSiZ64Si/uhSKpmkXBL/xJebnC5YP/ghO/gLbl9ngWC02sMp
+b88MWmlybUtnsu882AVjDIxAfp3ZQK2pKQV0TeyishAo6rXoTo=
=5GiH
-----END PGP SIGNATURE-----

--z9ECzHErBrwFF8sy--
