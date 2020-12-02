Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD68F2CC121
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Dec 2020 16:43:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387553AbgLBPnT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Dec 2020 10:43:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:35382 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726465AbgLBPnT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 2 Dec 2020 10:43:19 -0500
Date:   Wed, 2 Dec 2020 16:42:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606923758;
        bh=aUhNkuH56LOzxnKy8d+V6aU/Q/OZ8AX+U6/MUs5PM1o=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=WD0K9J57H+NE0nC5DJVX2hRHlL1KNIwbrRNwXchdb0UfE/1saZXIMxGRhEZXrKm3g
         h3Nn/9aH53asLvG/jmg/nodeqkQ7IAh8szN0Skl7Tp3+9EC2yCYFENuKvq+TLazH/j
         cFKJUL+f99BN6rfDjofdrAwjFT1rjM/wTXKnY3kQ=
From:   Wolfram Sang <wsa@kernel.org>
To:     Zhihao Cheng <chengzhihao1@huawei.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        sricharan@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        yi.zhang@huawei.com
Subject: Re: [PATCH] i2c: qup: Fix error return code in
 qup_i2c_bam_schedule_desc()
Message-ID: <20201202154235.GA13425@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Zhihao Cheng <chengzhihao1@huawei.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, sricharan@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, yi.zhang@huawei.com
References: <20201116141058.2365043-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ZPt4rx8FFjLCG7dd"
Content-Disposition: inline
In-Reply-To: <20201116141058.2365043-1-chengzhihao1@huawei.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2020 at 10:10:58PM +0800, Zhihao Cheng wrote:
> Fix to return the error code from qup_i2c_change_state()
> instaed of 0 in qup_i2c_bam_schedule_desc().
>=20
> Fixes: fbf9921f8b35d9b2 ("i2c: qup: Fix error handling")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>

Applied to for-current, thanks!


--ZPt4rx8FFjLCG7dd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/HteoACgkQFA3kzBSg
KbYUpw//aaOCAfpGYH0kZiqPABqobS+1lx9rRp3Vakdiv6JkFccrshdD6si9mlMU
zKa+yaxYYA7PQ4oczNcKk4Tl+IrcEEY+p9jVCbrXewd1TpYhTCMzJYWqChGKiTE2
oGI2oGzwCMu5VoRyWBfxe/cyZyGSJF3VlYBmmRPVSNN3KSK54dUArjzgK8Y/nWSn
lYU8cJ+XuroJBbsBsIrwxtneAH9IJ9w2jSXtze6xrwTbAdXtduelM7kEnUFPexoZ
3scF+PryMvynxZ+9yFY18njACCwTsJa3WFp8ZuVzwG7StLEs1Mnc6JGnBKVeHEoj
Z8IrUMCMnK/8tl0aXhYGLZma53hH5bapRWKJMObP4gAUao9shuBYbqmptpJB1hrU
zgqqxyWSwQ9Rp595QI2G7WHQVXm3k2k4ptWITp587CxBb6T4V5I/4IXnJ3w3mNKM
vt5Z/ih8x3mZaYOdrTOpXQJt52ZEbgSjyNl7hQhUrtCsH2bmHwtVbS3QY3QJZEFH
IWG79zjc7yQfWH7Al01VBX6GNyO6EWyL/MR8LP7uWRbDLTWmIgtrAcVpCJy8uK+w
/NjvDYlj7QbhiCbq2RpuRtuz/8Y8kqEMi1Id7nYrDLsQmUp1IqNhuH9lC3wte7KY
vuGfFf7rLTMzHEuHOOSSMKGLY9DEIEadYUyaP54+2Ep9sd/67hQ=
=9RPF
-----END PGP SIGNATURE-----

--ZPt4rx8FFjLCG7dd--
