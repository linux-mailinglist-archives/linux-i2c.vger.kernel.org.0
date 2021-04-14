Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 420F735EEEE
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Apr 2021 10:07:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348200AbhDNH66 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Apr 2021 03:58:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:46212 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231520AbhDNH65 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 14 Apr 2021 03:58:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1670A61168;
        Wed, 14 Apr 2021 07:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618387116;
        bh=GBOQvjMnIakbDlN6LQjrmCt1L6jSS4z/LcYXw4Xfzt0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RrCUQz8ggLOFlZInzHI8J5bW9xnKCVO24k5czRD33ZS1nmQFvC1Vl7xGB89uxmojY
         t4aySx6otYxuXCM9Qhht1VNtmz+JaN4N2+avsKGBhr64vfgAAjWbpQLAFr6p9Dw3CQ
         hjNzolCRDeeoRn2BE7HQtBO1InpcuyetqUk+FJ4uNEzZWIUggEkNly89qB5Awgfsqs
         1CCQc5MI7p/sOykTARFfSdPeuNR+fOq3UW+XuTiOJTM2qWT6x85hGi/PldRKy0VSH2
         HpA8ESPX0qlHujJtec19EWZvRmp9Icy9DcSiE7+BFFqcf8dNrKW8FD0SFb5KpLU2xb
         sWItPQejt1P+Q==
Date:   Wed, 14 Apr 2021 09:58:33 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Pu Lehui <pulehui@huawei.com>
Cc:     zhengdejin5@gmail.com, bjorn.andersson@linaro.org,
        andriy.shevchenko@linux.intel.com, bgolaszewski@baylibre.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] i2c: img-scb: fix PM reference leak in
 img_i2c_xfer()
Message-ID: <20210414075833.GE2180@ninjato>
References: <20210408112910.212873-1-pulehui@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="EXKGNeO8l0xGFBjy"
Content-Disposition: inline
In-Reply-To: <20210408112910.212873-1-pulehui@huawei.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--EXKGNeO8l0xGFBjy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 08, 2021 at 07:29:10PM +0800, Pu Lehui wrote:
> pm_runtime_get_sync() will increment pm usage counter even it failed.
> Forgetting to putting operation will result in reference leak here.
> Fix it by replacing it with pm_runtime_resume_and_get() to keep usage
> counter balanced.
>=20
> Signed-off-by: Pu Lehui <pulehui@huawei.com>

Thanks, yet I applied this series now:

http://patchwork.ozlabs.org/project/linux-i2c/list/?series=3D217733&state=
=3D*


--EXKGNeO8l0xGFBjy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmB2oKkACgkQFA3kzBSg
KbYkEBAAqWSV5EobKCOJbM4FnqPRuIYRyJso3QtNx/9+67tPQAmverYUzcQMCPP4
cS0W3nwipJsrA2l2Jm37Xhmkya7CPIBQtke5aUU+YyHbaBlVfVgGlFOqUaI4EpEg
zGxstVi5pto5c33gWpTOmxExGRayBqQDMgK7pucNCWuwReGRpBJM9VrffYQYEFhE
tNp1Q+VNAenSzJufemhRRjdHGdwGGLyi21sk5+xjokVMoWHvV/IKgZ1QpSvo8mXY
lu0anrkqNOEYZuKTVQczcygvJTBZZqfXqXRlQxGzHl5S45w3NcKl+MJKGCe4ejuh
Yx38AYCVKzKogRBldwf9eaRujaN3P9kMCQ5fTF637T+BM3Rem0yooFp0TNpGKSO8
GIxSRvrJ87I1WS0aBLGNv4uB+DJ/zg8MKqEqunfdQgQXFbFZCQ+wbHSopacWRgRx
qA+qTfXjU4aswKLRaKfeT2ZkO/CeQeavIrKf6KOwoyvDYG2ZkUcHi2pDvdTpYzX9
d7nWePbhMKzDV5RImCVRG9Yg8SCj1R4pMdEvTT/LzphLqsqbw1lOkYSUTSBezALQ
G6bz3GX6+0A2N5LNS40GGe483NWtoyz8ZBPuQnBouauW7VpumxbGa3sFUdAroFGY
p/Hal4kPDUKAZWKmc9zMfH2jxVWvQ/jMzha4PkpL+COVD1PMrpo=
=qgAi
-----END PGP SIGNATURE-----

--EXKGNeO8l0xGFBjy--
