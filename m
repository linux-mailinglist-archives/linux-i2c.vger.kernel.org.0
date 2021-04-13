Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB16F35DE8C
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Apr 2021 14:20:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239758AbhDMMUn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Apr 2021 08:20:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:44770 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230025AbhDMMUn (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 13 Apr 2021 08:20:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 26F4561278;
        Tue, 13 Apr 2021 12:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618316423;
        bh=kQt1/77hrtC2oWRd/jaewcxy+R5bvHz3HUuBuKiUon4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tk1rf+5/CnbN2rYE1qYYHGChd/TfCiOLNY2E1jDyNbPrR8xFSHWVL9vaUJZ9xF7/D
         zK893c+adrloy0tN4Jh5nBR4ngzsW/ccBWEokFstDX4P2gDO0i8kj7LWZIPAtF40Pg
         LazrNELPdcSBnk38xh4+Mb6B7BUVjsZiXPzsE9Wb++gg+Cb8DDMLtcJeMmqtw06Rce
         YopWGOdRfE8xNl8IGQYd902112Nz5vUoQYX1vr8pqLhEiYtkB3AO4I5K5BZFM9yj6h
         yZdm9ghMEaifj2Cje9Rjv7A1wsLiepG5SYTfimad90q86dZ/Bf281v9kVKnNEicS/L
         x2KWDDGM2M/9Q==
Date:   Tue, 13 Apr 2021 14:20:16 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Chris Packham <chris.packham@alliedtelesis.co.nz>,
        linux-i2c@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next] i2c: mpc: drop release for resource allocated with
 devm_*
Message-ID: <20210413122016.GA1553@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Wei Yongjun <weiyongjun1@huawei.com>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        linux-i2c@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Hulk Robot <hulkci@huawei.com>
References: <20210412160026.194423-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="HcAYCG3uE/tztfnV"
Content-Disposition: inline
In-Reply-To: <20210412160026.194423-1-weiyongjun1@huawei.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 12, 2021 at 04:00:26PM +0000, Wei Yongjun wrote:
> It's not necessary to release resource which allocated with devm_*
> and those release may leads to a double free. And also remove useless
> irq_dispose_mapping() call since mapping not created.
>=20
> Fixes: 09aab7add7bf ("i2c: mpc: use device managed APIs")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied to for-next, thanks!


--HcAYCG3uE/tztfnV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmB1jHsACgkQFA3kzBSg
KbYBZQ/+IF8gQoU6LIMTmgJnKXG2dhuGSETUh3ep6oER2VBzeLE9iliIaJEAnzIL
hKD3QTCDgWb+qvVMleMqX0q2FXf7y6lpvxiP/RGueLTFJgDinpCMQmw630Q0Suhy
GICB3NCEIpInIKDnEA3wfYivR9HbfPLjDji4/oJELS1klK3EO1zqqYYLxgpjD6iC
2Ni2sOwcvuVYnr3HgAuJstHa5QkSwlnSCsaUWE0BAix2XGvBp7Ki/w7qTdkthr0y
y/LbG9hisxg91BpkvhYnjLgceUVD51jAFV6GhaXMTx4PmGAmpxfnsr87CxYhqVXb
9k7K4ccLnSuY/CLLaeawN14VoJfYpbQ3LCVWIEqnhNGyWojz7mr8280uWja5dAty
kGfi7AG/QOLEMb7x9DI0ryJggzVEN2+YPi/0u+AcmeFy5M95dHItJ3rSYiHbfD9P
HIJarF6L6c76O5p2VQZVWIW6C0zh9LQEEYmMoZp0zFCyWiUHeN0Z8fwfVC+VP880
UW1jAzDuXWblnIDQHPM1sEwBMfEa05N3Q+MQbX+yQvpiBUD4eYvpDOEwmSAIzssN
Hh3kFkmBLYeKBAcu/F4w4P98KhnAVBFht69Mf1moev9BRyp9kpUmlttyZlG0pCjF
EQdhIDvYSMJvTjYpMCMAsOf/ZTylrasxt6T6vu0EdzZwS5ib06A=
=eULB
-----END PGP SIGNATURE-----

--HcAYCG3uE/tztfnV--
