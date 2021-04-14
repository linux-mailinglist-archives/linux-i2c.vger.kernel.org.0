Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4992935EEF8
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Apr 2021 10:07:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231678AbhDNIB2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Apr 2021 04:01:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:52606 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232940AbhDNIB1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 14 Apr 2021 04:01:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F0E2661168;
        Wed, 14 Apr 2021 08:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618387265;
        bh=GwWLpcZGyWLDjbrih4+uVVwPeys8tgp3fKge34NIQkA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KK0XnuUaXcKK5JG7VaK2yULBhPwLWlR3IPQHIFujhLbtaiE8vSfUf+2cdtYqrivGP
         MwXNt9qzK8koIAZoUJQDxEe+rdKMGaBWbHQOyWFEAVECbr5maKLG1c5C/auuazxoxf
         trw4y6iyO0Iv60M3+yJy2mvEyGIzoftlDvyCS3M43LVJovlHlx+c5LBuyLj5mZvXnN
         qlupDwLEKUyl9lIbsIVRVAyRdX+6CMltXP90AIL5SubRlIDZMfCJfTCSYpV5o5A3W4
         Vb0oDeBFjaHvTC4UzzsOQCm1Z0aGHWkly2GcRr4RpoimgXHnE3FsKQoWV76KMKB2Kj
         j10qWDHcbT2iA==
Date:   Wed, 14 Apr 2021 10:01:02 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Li Huafei <lihuafei1@huawei.com>
Cc:     orsonzhai@gmail.com, zhang.lyra@gmail.com, zhengdejin5@gmail.com,
        linhua.xu@unisoc.com, andriy.shevchenko@linux.intel.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        yangjihong1@huawei.com, zhangjinhao2@huawei.com
Subject: Re: [PATCH -next] i2c: sprd: Fix PM reference leak in
 sprd_i2c_master_xfer()
Message-ID: <20210414080038.GG2180@ninjato>
References: <20210408125915.137089-1-lihuafei1@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="0NB0lE7sNnW8+0qW"
Content-Disposition: inline
In-Reply-To: <20210408125915.137089-1-lihuafei1@huawei.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--0NB0lE7sNnW8+0qW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 08, 2021 at 08:59:15PM +0800, Li Huafei wrote:
> pm_runtime_get_sync will increment pm usage counter even it failed.
> Forgetting to putting operation will result in reference leak here. Fix
> it by replacing it with pm_runtime_resume_and_get to keep usage counter
> balanced.
>=20
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Li Huafei <lihuafei1@huawei.com>

Thanks, yet I applied this series now:

http://patchwork.ozlabs.org/project/linux-i2c/list/?series=3D217733&state=
=3D*


--0NB0lE7sNnW8+0qW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmB2oT4ACgkQFA3kzBSg
KbYggg/+IGZCroVVcKqN51uydiKUNldmSW5WawmE9zXDGwa7cLGwk7r2ptUU5pqx
EyyzWpsY6M3lcOQr0mgp+DAUu9DbCdbj+yUTXGbmdAtFLJT3VJlIZvRQfWQ6cJV7
1Zo2nVqrjp/K2YjAHMAODVAnwDOwf9gOZCNGLXBzwGbQx3jWyyRdBGUkmic0f5hB
tBum8RJmib9ojA1+G5Z/hZvtaxrux3CI75SSVK9uVu0bx6quxiqgc98BOFmpVNRs
Kp4U+wi+qTYRMWtJRLJd5Xw/K64W/xDNBESHVk7iMSo83p943/ZON0dvfXGO4YKk
4i5iPSpTz9GpixZS+XkFOckMPz5ZKn7uHLoLNSQKyG7zNqoZPtKaw8lqBW7qrKu1
lB2y5T561SzKoILfRsOX2AY3zAVqUFJbuJb79kPMq0/0ow2rJwALOpBpDrGroz++
UfYon8C6aIW12tDla3vsg/trT4PVacacI+Mlr9UQKlDOTD02BeR5GJmH13MNnIXC
pR0MASbMbp4x1gSuMsPL8tbgsg3rho+3JsUQmt375ujGorPS7iKKrXJGPTi/ysxg
Jd1U7/562jWEpiWvQkfYnEdZ3q0fd43IQLZVv4uRmg83TW2ZD7dNuyGux2qxu85y
SFPtCEPm9QHrkOFZsC2rxVDXFre4zQq9g34HZ6pKP1MmzdCX4wU=
=oIVh
-----END PGP SIGNATURE-----

--0NB0lE7sNnW8+0qW--
