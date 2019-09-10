Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1250AEA3D
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2019 14:23:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388238AbfIJMWh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Sep 2019 08:22:37 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:43394 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726841AbfIJMWh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 Sep 2019 08:22:37 -0400
Received: by mail-wr1-f67.google.com with SMTP id q17so15082047wrx.10;
        Tue, 10 Sep 2019 05:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0C/DGTNAt/pxMbfWShWSjnQBCZsM1Gq2DZ026OeEeEM=;
        b=gn3jTLva7gqm10XLzZP+1zgIyvlnmeQxkjC5x0FhBvTsLZfzQUbv577MFC3ej61qkk
         QUcHeyWAUQbDIq5yWKSmbVRY0MA2LCbQtWWlOaSWWR8zE3CX3e1fnfOl+iorBVTWak3Q
         ynUXATF9cdyRp5feFGyarKGjYuVmABNH2J+4h8qiJ2y2Gjs//9Tm2Pl4xNnN/Ik99P7c
         lz3PDzSrup6Ogajcd57S4+QwS5MaAzgxOWehuvA9JLELfyChSHfhyghE/Wb1lCKCk75A
         cyvTpzeOgAGSajMFeHQlfKfcA3/eTUApjsPMtIyvNcsw+Zqxf+MwIPqeg2zQ2plIKEs0
         THLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0C/DGTNAt/pxMbfWShWSjnQBCZsM1Gq2DZ026OeEeEM=;
        b=iNyD8oUFHklTattERf8Fjva7KMtE6zqZxFTxXnol5/e4YqauejTT4g/XAbDoOMBKuq
         RjEY/n+hoReFHa393aOidJJzMOJeGzj8zNKD4nsh1keytxI7ROy7Quc3X8vokjY/JtU0
         2otl6f4A0Wq/JQioGGAZGOdQCSZWqrWUp4jYaXbVNKfHrMSmKZyVJVtkG+IMcI0kkQ3W
         7oPBTQ7MlCbdjwEDpFymyy6uG6PjTwoq8ETkdUIWpaDB7tv2xtJf0Xg09TXS5ux1Fjqy
         J2cubelXORGVkk3MTmS3l8DQs8U1om3wVXEQjefDpdxgSgHd1mUwGreyhBg3AYEHgbD4
         /VZg==
X-Gm-Message-State: APjAAAWYmBE5YGZeLDm4NLEgwpW1cRvhAAFLTTQl9P9YnQREjAH8+Ysa
        xTfXG/p4IQVmyL6UKuuOWRI=
X-Google-Smtp-Source: APXvYqzrP226hnJB14Wxbg7Q4vyexELHAI0eUZnIlbBnvBmRDWSClSwHZc9T4yvxpK3AaSF8gY/d3w==
X-Received: by 2002:a5d:560e:: with SMTP id l14mr3161232wrv.257.1568118153842;
        Tue, 10 Sep 2019 05:22:33 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id u18sm2503981wmj.11.2019.09.10.05.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2019 05:22:32 -0700 (PDT)
Date:   Tue, 10 Sep 2019 14:22:31 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: tegra: Move suspend handling to NOIRQ phase
Message-ID: <20190910122231.GA9897@ulmo>
References: <20190910092917.29901-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="82I3+IH0IqGh5yIs"
Content-Disposition: inline
In-Reply-To: <20190910092917.29901-1-jonathanh@nvidia.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 10, 2019 at 10:29:17AM +0100, Jon Hunter wrote:
> Commit acc8abcb2a9c ("i2c: tegra: Add suspend-resume support") added
> suspend support for the Tegra I2C driver and following this change on
> Tegra30 the following WARNING is seen on entering suspend ...
>=20
>  WARNING: CPU: 2 PID: 689 at /dvs/git/dirty/git-master_l4t-upstream/kerne=
l/drivers/i2c/i2c-core.h:54 __i2c_transfer+0x35c/0x70c
>  i2c i2c-4: Transfer while suspended
>  Modules linked in: brcmfmac brcmutil
>  CPU: 2 PID: 689 Comm: rtcwake Not tainted 5.3.0-rc7-g089cf7f6ecb2 #1
>  Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
>  [<c0112264>] (unwind_backtrace) from [<c010ca94>] (show_stack+0x10/0x14)
>  [<c010ca94>] (show_stack) from [<c0a77024>] (dump_stack+0xb4/0xc8)
>  [<c0a77024>] (dump_stack) from [<c0124198>] (__warn+0xe0/0xf8)
>  [<c0124198>] (__warn) from [<c01241f8>] (warn_slowpath_fmt+0x48/0x6c)
>  [<c01241f8>] (warn_slowpath_fmt) from [<c06f6c40>] (__i2c_transfer+0x35c=
/0x70c)
>  [<c06f6c40>] (__i2c_transfer) from [<c06f7048>] (i2c_transfer+0x58/0xf4)
>  [<c06f7048>] (i2c_transfer) from [<c06f7130>] (i2c_transfer_buffer_flags=
+0x4c/0x70)
>  [<c06f7130>] (i2c_transfer_buffer_flags) from [<c05bee78>] (regmap_i2c_w=
rite+0x14/0x30)
>  [<c05bee78>] (regmap_i2c_write) from [<c05b9cac>] (_regmap_raw_write_imp=
l+0x35c/0x868)
>  [<c05b9cac>] (_regmap_raw_write_impl) from [<c05b984c>] (_regmap_update_=
bits+0xe4/0xec)
>  [<c05b984c>] (_regmap_update_bits) from [<c05bad04>] (regmap_update_bits=
_base+0x50/0x74)
>  [<c05bad04>] (regmap_update_bits_base) from [<c04d453c>] (regulator_disa=
ble_regmap+0x44/0x54)
>  [<c04d453c>] (regulator_disable_regmap) from [<c04cf9d4>] (_regulator_do=
_disable+0xf8/0x268)
>  [<c04cf9d4>] (_regulator_do_disable) from [<c04d1694>] (_regulator_disab=
le+0xf4/0x19c)
>  [<c04d1694>] (_regulator_disable) from [<c04d1770>] (regulator_disable+0=
x34/0x64)
>  [<c04d1770>] (regulator_disable) from [<c04d2310>] (regulator_bulk_disab=
le+0x28/0xb4)
>  [<c04d2310>] (regulator_bulk_disable) from [<c0495cd4>] (tegra_pcie_powe=
r_off+0x64/0xa8)
>  [<c0495cd4>] (tegra_pcie_power_off) from [<c0495f74>] (tegra_pcie_pm_sus=
pend+0x25c/0x3f4)
>  [<c0495f74>] (tegra_pcie_pm_suspend) from [<c05af48c>] (dpm_run_callback=
+0x38/0x1d4)
>  [<c05af48c>] (dpm_run_callback) from [<c05afe30>] (__device_suspend_noir=
q+0xc0/0x2b8)
>  [<c05afe30>] (__device_suspend_noirq) from [<c05b1c24>] (dpm_noirq_suspe=
nd_devices+0x100/0x37c)
>  [<c05b1c24>] (dpm_noirq_suspend_devices) from [<c05b1ebc>] (dpm_suspend_=
noirq+0x1c/0x48)
>  [<c05b1ebc>] (dpm_suspend_noirq) from [<c017d2c0>] (suspend_devices_and_=
enter+0x1d0/0xa00)
>  [<c017d2c0>] (suspend_devices_and_enter) from [<c017dd10>] (pm_suspend+0=
x220/0x74c)
>  [<c017dd10>] (pm_suspend) from [<c017c2c8>] (state_store+0x6c/0xc8)
>  [<c017c2c8>] (state_store) from [<c02ef398>] (kernfs_fop_write+0xe8/0x1c=
4)
>  [<c02ef398>] (kernfs_fop_write) from [<c0271e38>] (__vfs_write+0x2c/0x1c=
4)
>  [<c0271e38>] (__vfs_write) from [<c02748dc>] (vfs_write+0xa4/0x184)
>  [<c02748dc>] (vfs_write) from [<c0274b7c>] (ksys_write+0x9c/0xdc)
>  [<c0274b7c>] (ksys_write) from [<c0101000>] (ret_fast_syscall+0x0/0x54)
>  Exception stack(0xe9f21fa8 to 0xe9f21ff0)
>  1fa0:                   0000006c 004b2438 00000004 004b2438 00000004 000=
00000
>  1fc0: 0000006c 004b2438 004b1228 00000004 00000004 00000004 0049e78c 004=
b1228
>  1fe0: 00000004 be9809b8 b6f0bc0b b6e96206
>=20
> The problem is that the Tegra PCIe driver indirectly uses I2C for
> controlling some regulators and the I2C driver is now being suspended
> before the PCIe driver causing the PCIe suspend to fail. The Tegra PCIe
> driver is suspended during the NOIRQ phase and this cannot be changed
> due to other dependencies. Therefore, we also need to move the suspend
> handling for the Tegra I2C driver to the NOIRQ phase as well.
>=20
> In order to move the I2C suspend handling to the NOIRQ phase we also
> need to avoid calling pm_runtime_get/put() because per commit
> 1e2ef05bb8cf ("PM: Limit race conditions between runtime PM and system
> sleep (v2)") these cannot be called early in resume. The function
> tegra_i2c_init(), called during resume, calls pm_runtime_get/put() and
> so move these calls outside of tegra_i2c_init(), so this function can
> be used during the NOIRQ resume phase.
>=20
> Fixes: acc8abcb2a9c ("i2c: tegra: Add suspend-resume support")
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 40 +++++++++++++++++++---------------
>  1 file changed, 22 insertions(+), 18 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--82I3+IH0IqGh5yIs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl13lYUACgkQ3SOs138+
s6GNIhAAr1wpfhG5Dempiu90U5owP50YjVPmaZPewQkYKLavbo7O6qsOI1UDmlhY
H2Iyz/H48Pnx3WzrdeEdFOKCHC654BdG/No4Dc0Y+/repnm6FATjclt0aEAd9MHv
nNvnCPut/9dn05JFmTWPSJTYcV8rBN7bAXFxrqhRuFbZXiKt+bF4RHUD7jDQa6/X
YF9Qw6D11VDci3PUwMsSILTQ/cgGG5GfTQTEEPKKlx5VZ1pBnHqtkbhH3b8EFTSN
JptAswAB80EgVt0e6MFugHjOWTQkyU5QmEu5qK620sKf7Gw92ZYUed29Rw8zZKFR
KjGxPM/kbbfkvtHuPrkd3SloBq8UApsYIq20Av0ZCrN/a4CAR2BKS1SgFF2cRRUd
2pbROKmOoq4d0WBrnQha2ZXCHHE5/mTgOb9Hmgn7rkSXjPBp89xRVFEcRGRo+Wxk
iCRljLwmJZcOpczQMFW/W3kktkB5q1BBRDK0Qt2kA70R/zdqs/MYFZaj8ly5rVrX
fF65CVBALJHJkpBka1220/cei1cgqyHTVxi6o2h73v29lRi7ueWb9up707g6n4Tb
MYcmAQKyhD32xPXN2/W4y6AJVvIdr3uDH7+xfX+HgzXm1Vom0Lmzxh0dhSz7bIWA
13U0feJQ5Ov1kKdiU3H3sv/CYuIx3E+PpvonIPOr9AxYlKkDdRs=
=wwod
-----END PGP SIGNATURE-----

--82I3+IH0IqGh5yIs--
