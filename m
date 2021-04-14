Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B13D35EEC7
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Apr 2021 09:53:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232528AbhDNHv4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Apr 2021 03:51:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:36870 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1348092AbhDNHvx (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 14 Apr 2021 03:51:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0C7B1601FE;
        Wed, 14 Apr 2021 07:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618386692;
        bh=zojRrA+SEVZVplxBJb0vmN6/7XHw2L494AoVKdAZjdo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YjXZBIfzmd7krID9ftFF5zj6n3QXwljc5UVtlmUIp1qczKposRteSwRn1SCkkSB79
         xXDGH2kHe1xw88jPPcIKqX/aQL/sEOupEL0rHQV3jBcXXswbsCU+L/kGFhuHeir97M
         5A5IjzfNLtrRAh6PR6VqgTW+LxljS986sk1epPKBI8cB1o9VwzIEV+Bt3Nxl0G8T+L
         LLvqn0bGE46cJtctKu9AZHUWOrZd/7AcXJocdzWCXBOD3EvBVCwglCq2qz9UIMuKw5
         omyLVHoSitohTApoN36vTizS4duxBYm5B5NTV9plqWGVBVmzZS+s2txkDtQUxc7JKa
         jq5jPwKzpLyrg==
Date:   Wed, 14 Apr 2021 09:51:27 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Qinglang Miao <miaoqinglang@huawei.com>
Cc:     Michal Simek <michal.simek@xilinx.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Vignesh R <vigneshr@ti.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Tony Lindgren <tony@atomide.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/8] i2c: fix reference leak when pm_runtime_get_sync
 fails
Message-ID: <20210414075127.GA2180@ninjato>
References: <20201201092924.112461-1-miaoqinglang@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="opJtzjQTFsWo+cga"
Content-Disposition: inline
In-Reply-To: <20201201092924.112461-1-miaoqinglang@huawei.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 01, 2020 at 05:29:24PM +0800, Qinglang Miao wrote:
> pm_runtime_get_sync will increment the PM reference count
> even failed. Forgetting to putting operation will result
> in a reference leak here.=20
>=20
> Replace it with pm_runtime_resume_and_get to keep usage
> counter balanced.=20
>=20
> BTW, pm_runtime_resume_and_get is introduced in v5.10-rc5 as
> dd8088d5a896 ("PM: runtime: Add  pm_runtime_resume_and_get
> to dealwith usage counter")
>=20
> Qinglang Miao (8):
>   i2c: cadence: fix reference leak when pm_runtime_get_sync fails
>   i2c: img-scb: fix reference leak when pm_runtime_get_sync fails
>   i2c: imx-lpi2c: fix reference leak when pm_runtime_get_sync fails
>   i2c: imx: fix reference leak when pm_runtime_get_sync fails
>   i2c: omap: fix reference leak when pm_runtime_get_sync fails
>   i2c: sprd: fix reference leak when pm_runtime_get_sync fails
>   i2c: stm32f7: fix reference leak when pm_runtime_get_sync fails
>   i2c: xiic: fix reference leak when pm_runtime_get_sync fails

I applied this series now to for-next, thanks!


--opJtzjQTFsWo+cga
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmB2nvsACgkQFA3kzBSg
KbbCtw/+NcMmI6QKvhWoRpGzsqS4JR3ve8xPWFEaYBcBABOFAJ3OtQeYoeFXyFv5
xJVaL0EqvTsppo22meJ8HGSDgp8cnGupdpwZhIWUxEAdwV2XPabWGQM0IOhq5fIo
EXDs+bWvDeo0FqHi/fnc3ykUYXeEo2eh2te+rdhrQy8/l9HdzeFJhx7zOvu2bl/y
F5sindz+A6+JxmDGrv5ocmCKDV0/ESIQG4QKadxtRrvNM55hkR7HLBo/XC3iwZx/
XSAJwJNwTxCLhIE2YHhSvO0vnMbXD/rcia9nJ+KcNRSDzNRu/KnECzM1r5HZ4k/8
iWKGyC5eZDfeBMDGDtBs3puS5lktt5bdeBJevXHkSch5Vjaa30fojPbAwHo7paHk
v5ojLq1mXX38TkeVvofFBjF7XVyiNuiUwxcIFPHiu38AeSQdkAPRLczyRuU+1yNU
uZ7fRS7UPZYy3twjnvgiAdSqiZXa3Z30pgD/bULDwZA39fsXiqg47/vh8pVUI9A6
fz/I3LOyn7qwxxGrLxvErdyAJXazGvEF+pouaAF0XKNgB7iokFV3t1YGTV7IZoWd
Cg29vCPjjUsFTnaj1HNIjN0KDYD7kDjqzeYRQzzfPStheExujd2I5qtyZVhOKRal
+AkE/oTuRAlxrmNH6/N3pgLdayySwS70gZ4mOGSO8bE/xV/bL+Q=
=dXOi
-----END PGP SIGNATURE-----

--opJtzjQTFsWo+cga--
