Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82A30B21B3
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2019 16:18:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728767AbfIMOSo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Sep 2019 10:18:44 -0400
Received: from sauhun.de ([88.99.104.3]:35986 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727412AbfIMOSo (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 13 Sep 2019 10:18:44 -0400
Received: from localhost (234.77.63.94.rev.vodafone.pt [94.63.77.234])
        by pokefinder.org (Postfix) with ESMTPSA id AB6CA2C3115;
        Fri, 13 Sep 2019 16:18:41 +0200 (CEST)
Date:   Fri, 13 Sep 2019 15:18:41 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: tegra: Move suspend handling to NOIRQ phase
Message-ID: <20190913141841.GC1022@kunai>
References: <20190910092917.29901-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="69pVuxX8awAiJ7fD"
Content-Disposition: inline
In-Reply-To: <20190910092917.29901-1-jonathanh@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--69pVuxX8awAiJ7fD
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

Applied to for-next, thanks!


--69pVuxX8awAiJ7fD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl17pUAACgkQFA3kzBSg
KbYHuhAAlvTw4F2YkaELJucgf10FnYx+rri3f8bXFgPngE/Hm0Fa/zqFqvexSCjn
P1dqa0GVptFu68JHSz64wbxnynZ/tTN9hcy0TxJA1Ob2Yd9zGz3UWkZMyQlYFMBE
SoMDsGrTzoDm3Yh7ENATNJRZew0/Wr2+oe/z1IdBAYKiFh+p2bUVhVvwtHUydznT
Q02/xe5BMPRRPZ4DY2gpO4OkttJbZz6qXFnJM5VCwLqBaUBYp6mIsmMOlOrBNc5F
4ROfkmKhXn3fL3sRND+2P00BYVyaStHP6U7Jm7SZ+2fJncLlcF674CCMdm2r6H7C
RB2XMAgP3YsPx/SFy0WDtMhKrHx32MUUwnJ329Vxj4xQ5GZH7lmEQKei1IOcdNdI
AwAuBf+B68PRIdm5aL3tHWcrBklxKhwCD0XERjwl862C5/ugsuSb1UYzz/BIA/nv
G52PYq70iD/ZBUswmkzzDd3/ehSFqyoD/XUlz5hrjRhADHJJN7Yt9y2ypPLEfsL6
5na67Xf91L9sKRDIsI9CDD0hh6mjXdDVob993NUM0TVe/pmnmlPrneWV+kUrb1Du
n7kVfQh6yN8+yigjA3heXBjs1WbaMSgZB9cwCpEVHFVSTCMvXVJCVtONjQfaiXyC
aWb9EyCiNxvso6K2Y5M3M7QQU1DhrwcizvSeucNgp+B3mcqixjU=
=ic6W
-----END PGP SIGNATURE-----

--69pVuxX8awAiJ7fD--
