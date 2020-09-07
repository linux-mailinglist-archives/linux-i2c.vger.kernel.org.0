Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C22C25FF36
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Sep 2020 18:29:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729885AbgIGO3a (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Sep 2020 10:29:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:51658 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729759AbgIGO2t (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 7 Sep 2020 10:28:49 -0400
Received: from localhost (p54b331dd.dip0.t-ipconnect.de [84.179.49.221])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1D6662064B;
        Mon,  7 Sep 2020 14:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599488928;
        bh=RNbfAwKg808EmwHCSsYfFUQo6wpnABBo6mgSy7XA3/I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SP3rwR+E0gxpKOpgZb3C1djsmkGs9uGPktSrF5RNVaapzUEwkhEKqAQ0+TpgJY8Gg
         viWpog1od5YDV0xoTD6OCoGMFCxrlueSyEytvm0LJzCV6NNfv/LceAnm1+V9AArfo+
         +SVG4u+j/mkHlRvYQEAk/n4/LKUeEyBM5DG6xFGg=
Date:   Mon, 7 Sep 2020 16:28:41 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     trix@redhat.com
Cc:     syniurge@gmail.com, nehal-bakulchandra.shah@amd.com,
        shyam-sundar.s-k@amd.com, natechancellor@gmail.com,
        ndesaulniers@google.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH] i2c: amd_mp2: handle num is 0 input for i2c_amd_xfer
Message-ID: <20200907142841.GA3931@ninjato>
References: <20200904180647.21080-1-trix@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Content-Disposition: inline
In-Reply-To: <20200904180647.21080-1-trix@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 04, 2020 at 11:06:47AM -0700, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
>=20
> clang static analyzer reports this problem
>=20
> i2c-amd-mp2-plat.c:174:9: warning: Branch condition evaluates
>   to a garbage value
>         return err ? err : num;
>                ^~~
>=20
> err is not initialized, it depends on the being set in the
> transfer loop which will not happen if num is 0.  Surveying
> other master_xfer() implementations show all handle a 0 num.
>=20
> Because returning 0 is expected, initialize err to 0.

Well, it is not expected. The core does:

2019         if (WARN_ON(!msgs || num < 1))
2020                 return -EINVAL;

Dunno if we should apply the patch nonetheless or add a comment that num
is guaranteed to be at least 1.

>=20
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/i2c/busses/i2c-amd-mp2-plat.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-amd-mp2-plat.c b/drivers/i2c/busses/i=
2c-amd-mp2-plat.c
> index 17df9e8845b6..506433bc0ff2 100644
> --- a/drivers/i2c/busses/i2c-amd-mp2-plat.c
> +++ b/drivers/i2c/busses/i2c-amd-mp2-plat.c
> @@ -155,7 +155,7 @@ static int i2c_amd_xfer(struct i2c_adapter *adap, str=
uct i2c_msg *msgs, int num)
>  	struct amd_i2c_dev *i2c_dev =3D i2c_get_adapdata(adap);
>  	int i;
>  	struct i2c_msg *pmsg;
> -	int err;
> +	int err =3D 0;
> =20
>  	/* the adapter might have been deleted while waiting for the bus lock */
>  	if (unlikely(!i2c_dev->common.mp2_dev))
> --=20
> 2.18.1
>=20

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9WQ5UACgkQFA3kzBSg
Kbb4lRAAqR+qYYGfBuYJNz9IlZD4fINTsBtP7KTjVgiMDIn11bUyT1xVHbld0Ut7
Mj0juR4/0NVyWKL59HW/zU5qxcRs5q0VYK3VBfYlTYRaGMTrDkRjr6dK1s3TksFp
3BF0nmwIL6H+UaBdWuh4nPuIJC8KOM6CpxfpukWoGlQlrgbDiDrnevA6QaA2i+br
D+UynwNQ4naOYJ2JDzWeAZZ/ca5OTbezVhKWb5MqSIFzs188pSopFJlHAAjJsWhz
2BBWibXh2syLzuTsFXgGaL0S5Bbs/reBG2Uit6H2kOSNp+EUZGWkE6ewAgV8Tm5d
e4Jfww+NmrzWm28rPW4asVz6xI9BZm3kgWZS/BqZiahVu0cTFvgUtQntxRRNxg2U
n3Xcxru2iMQn5/tE08Z6iKk8vsefAiC1MyoeRS4VqytAg8i/7Xjn61m/lC+X5XU0
VkV/im6BfMFZ1s+N5R8gZ+nPcxkbvzw8ZA5hNJImbyu2F1rKwiipjtLtd/nMw12+
C95ZqawbVsCKtYDPJFWYhyMeR0LpZd2gMskWzBHI6i5Um7Ba0lON4R9YbpAfc8X7
8TYHB/xVnsIe+c1Sd857ZOOAm0otamj/i9FilxGQbgYVqRs83Z8dvRCc4+ikiQJR
+7MGAu1AJkKaxm2xNW6BW/3iS06vBFTreKuSkDxV+JRedsq8Gjc=
=r3dn
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--
