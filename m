Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C1F21B1647
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Apr 2020 21:53:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725988AbgDTTxZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Apr 2020 15:53:25 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:16256 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728103AbgDTTxY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Apr 2020 15:53:24 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e9dfda70001>; Mon, 20 Apr 2020 12:53:11 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 20 Apr 2020 12:53:24 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 20 Apr 2020 12:53:24 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 20 Apr
 2020 19:53:23 +0000
Received: from [10.26.73.5] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 20 Apr
 2020 19:53:21 +0000
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        "Wolfram Sang" <wsa@the-dreams.de>
CC:     <linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20200324191217.1829-1-digetx@gmail.com>
 <20200324191217.1829-2-digetx@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <1e259e22-c300-663a-e537-18d854e0f478@nvidia.com>
Date:   Mon, 20 Apr 2020 20:53:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200324191217.1829-2-digetx@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1587412391; bh=MaHgc2Ud4bcX42r63WlzgALU6hIPj1jDmiN3kFRyBlE=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=SgiPSULiuZKZq5822JYASXn/xwkWCMj73Hyryd3GmcD5Dw9DAyaVmNchTNlSj5nMw
         lmxf/cjDYWHnI5JbDYq3uwMVkiV92UrD9Hyx9vaPIhCApPfkhfeQs34cXyniR1xS6y
         ChIveZNLCyju0EhBf5XMCn2c0E279EcSy+itG+x/Moqz3vvlMNxuhs5xmuZ0OSLseI
         rk4f5h4irdTlIEgLJJipT69v1s8qV0HaGrp/D7NMK9rIrcsmfjlyhsJSejjtSe+a9T
         lfUnfyNsuQ+oqwXJDkGhXRYQ/+Np4QdwHTuc5/kl6A/0LZ7QIylkY2VxU/QI7bUpgU
         MjW32gvYehw8Q==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Dmitry,

On 24/03/2020 19:12, Dmitry Osipenko wrote:
> Boot CPU0 always handle I2C interrupt and under some rare circumstances
> (like running KASAN + NFS root) it may stuck in uninterruptible state for
> a significant time. In this case we will get timeout if I2C transfer is
> running on a sibling CPU, despite of IRQ being raised. In order to handle
> this rare condition, the IRQ status needs to be checked after completion
> timeout.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 27 +++++++++++++++------------
>  1 file changed, 15 insertions(+), 12 deletions(-)


I have noticed a regression on tegra30-cardhu-a04 when testing system
suspend. Git bisect is pointing to this commit and reverting it fixes
the problem. In the below console log I2C fails to resume ...

[   40.888512] usb1_vbus: supplied by 5v0

[   40.892408] vddio_sdmmc,avdd_vdac: supplied by 5v0

[   40.897401] cam_1v8: disabling

[   40.900548] modem_3v3: disabling

[   40.903875] vdd_cam1_ldo: disabling

[   40.907501] vdd_cam2_ldo: disabling

[   40.911092] vdd_cam3_ldo: disabling

[   40.914714] vdd_fuse_3v3: disabling

[   40.918305] vddio_vid: disabling

[   40.921623] usb1_vbus: disabling

[   59.445032] PM: suspend entry (deep)

[   59.448852] Filesystems sync: 0.000 seconds

[   59.456161] Freezing user space processes ... (elapsed 0.001 seconds) done.

[   59.457645] OOM killer disabled.

[   59.457649] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.

[   59.764926] Disabling non-boot CPUs ...

[   59.769540] IRQ 18: no longer affine to CPU1

[   59.789070] IRQ 19: no longer affine to CPU2

[   59.808049] IRQ 20: no longer affine to CPU3

[   59.827113] Entering suspend state LP1

[   59.827163] Enabling non-boot CPUs ...

[   59.834797] CPU1 is up

[   59.840943] CPU2 is up

[   59.847378] CPU3 is up

[   59.850577] tegra-i2c 7000d000.i2c: runtime resume failed -13

[   59.856432] tegra-i2c 7000d000.i2c: runtime resume failed -13

[   59.862231] tegra-i2c 7000d000.i2c: runtime resume failed -13

[   59.868070] vdd_pexa,vdd_pexb: is_enabled() failed: -13

[   59.873334] tegra-i2c 7000d000.i2c: runtime resume failed -13

[   59.879143] vdd_pexa,vdd_pexb: is_enabled() failed: -13

[   59.884420] Failed to enable avdd-pex-pll: -13

[   59.888877] Failed to enable avdd-plle: -13

[   59.893061] Failed to enable avdd-pexb: -13

[   59.897279] Failed to enable vdd-pexb: -13

[   59.901383] tegra-pcie 3000.pcie: failed to enable regulators: -13

[   60.434185] clk_plle_training: timeout waiting for PLLE

[   60.439565] tegra-pcie 3000.pcie: failed to enable CML clock: -16

[   60.445700] ------------[ cut here ]------------

[   60.450346] WARNING: CPU: 0 PID: 653 at /home/jonathanh/workdir/tegra/mlt-linux_next/kernel/drivers/regulator/core.c:2603 _regulator_disable+0xb8/0x1b4

[   60.463959] unbalanced disables for vdd_pexa,vdd_pexb

[   60.469038] Modules linked in:

[   60.472107] CPU: 0 PID: 653 Comm: rtcwake Tainted: G        W         5.7.0-rc2-next-20200420 #2

[   60.480892] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)

[   60.487190] [<c0111b68>] (unwind_backtrace) from [<c010bc00>] (show_stack+0x10/0x14)

[   60.494951] [<c010bc00>] (show_stack) from [<c0480f14>] (dump_stack+0xc0/0xd4)

[   60.502189] [<c0480f14>] (dump_stack) from [<c01234a4>] (__warn+0xe0/0xf8)

[   60.509073] [<c01234a4>] (__warn) from [<c0123530>] (warn_slowpath_fmt+0x74/0xb8)

[   60.516568] [<c0123530>] (warn_slowpath_fmt) from [<c0516714>] (_regulator_disable+0xb8/0x1b4)

[   60.525191] [<c0516714>] (_regulator_disable) from [<c0516844>] (regulator_disable+0x34/0xd0)

[   60.533729] [<c0516844>] (regulator_disable) from [<c0518488>] (regulator_bulk_disable+0x28/0xb4)

[   60.542619] [<c0518488>] (regulator_bulk_disable) from [<c04dbc84>] (tegra_pcie_pm_resume+0xbb0/0x107c)

[   60.552032] [<c04dbc84>] (tegra_pcie_pm_resume) from [<c05f7e44>] (dpm_run_callback+0x38/0x1d4)

[   60.560741] [<c05f7e44>] (dpm_run_callback) from [<c05f8af8>] (device_resume_noirq+0x110/0x248)

[   60.569451] [<c05f8af8>] (device_resume_noirq) from [<c05f93e0>] (dpm_resume_noirq+0x10c/0x36c)

[   60.578162] [<c05f93e0>] (dpm_resume_noirq) from [<c017dd74>] (suspend_devices_and_enter+0x27c/0x9dc)

[   60.587393] [<c017dd74>] (suspend_devices_and_enter) from [<c017e7dc>] (pm_suspend+0x308/0x370)

[   60.596110] [<c017e7dc>] (pm_suspend) from [<c017cb30>] (state_store+0x6c/0xc8)

[   60.603440] [<c017cb30>] (state_store) from [<c03138e4>] (kernfs_fop_write+0xf8/0x210)

[   60.611379] [<c03138e4>] (kernfs_fop_write) from [<c0286c44>] (__vfs_write+0x2c/0x1c4)

[   60.619310] [<c0286c44>] (__vfs_write) from [<c02886e8>] (vfs_write+0xa4/0x188)

[   60.626632] [<c02886e8>] (vfs_write) from [<c028898c>] (ksys_write+0xa4/0xd4)

[   60.633778] [<c028898c>] (ksys_write) from [<c01000c0>] (ret_fast_syscall+0x0/0x54)

[   60.641437] Exception stack(0xeda91fa8 to 0xeda91ff0)

[   60.646497] 1fa0:                   0000006c 00498438 00000004 00498438 00000004 00000000

[   60.654683] 1fc0: 0000006c 00498438 00497228 00000004 00000004 00000004 0048478c 00497228

[   60.662866] 1fe0: 00000004 be9029b8 b6ec8c0b b6e53206

[   60.668007] ---[ end trace 5453317048e46ae9 ]---

[   60.672632] Failed to disable vdd-pexb: -5

[   60.676761] tegra-pcie 3000.pcie: tegra pcie power on fail: -16

[   60.682694] PM: dpm_run_callback(): tegra_pcie_pm_resume+0x0/0x107c returns -16

[   60.690035] PM: Device 3000.pcie failed to resume noirq: error -16

[   60.696859] tegra-mc 7000f000.memory-controller: fdcdwr2: write @0x877e8400: EMEM address decode error (SMMU translation error [--S])

[   60.708876] tegra-mc 7000f000.memory-controller: fdcdwr2: write @0x877e8400: Page fault (SMMU translation error [--S])

[   61.278965] OOM killer enabled.

[   61.288563] Restarting tasks ... done.

[   61.300508] PM: suspend exit

[   63.124813] asix 1-1:1.0 eth0: link up, 100Mbps, full-duplex, lpa 0xCDE1

[   63.740705] PM: suspend entry (deep)

[   63.744593] Filesystems sync: 0.000 seconds

[   63.749600] Freezing user space processes ... (elapsed 0.001 seconds) done.

[   63.751053] OOM killer disabled.

[   63.751057] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.


Have you seen this?

Cheers
Jon

-- 
nvpublic
