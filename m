Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BD4E132687
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2020 13:39:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728054AbgAGMjI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jan 2020 07:39:08 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:11715 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727972AbgAGMjH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Jan 2020 07:39:07 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e147bd90000>; Tue, 07 Jan 2020 04:38:49 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 07 Jan 2020 04:39:06 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 07 Jan 2020 04:39:06 -0800
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 7 Jan
 2020 12:39:06 +0000
Received: from [192.168.22.23] (10.124.1.5) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 7 Jan 2020 12:39:04 +0000
From:   Thierry Reding <treding@nvidia.com>
To:     Dmitry Osipenko <digetx@gmail.com>
CC:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        "Mikko Perttunen" <cyndis@kapsi.fi>,
        Wolfram Sang <wsa@the-dreams.de>, <linux-i2c@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 4/9] i2c: tegra: Support atomic transfers
In-Reply-To: <20200106010423.5890-5-digetx@gmail.com>
References: <20200106010423.5890-5-digetx@gmail.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Message-ID: <bd38201cb9e742c295ed6d4f278289cc@HQMAIL105.nvidia.com>
Date:   Tue, 7 Jan 2020 12:39:04 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1578400729; bh=fDe8QF6Qd+pzpZ7Hq8X+ohanu9osoehQ71lHHEy7IBY=;
        h=X-PGP-Universal:From:To:CC:Subject:In-Reply-To:References:
         X-NVConfidentiality:MIME-Version:Message-ID:Date:Content-Type:
         Content-Transfer-Encoding;
        b=KH/8cGBdfXfaP+sQk1gX0er1A+4A+GfsXaYU2BjpIgE22SssZq1cVrtiey04eQj00
         vXbaU0qJLharsnA0MbeqpAAQn8t/pHAG1FBTgS9QDlYzVVYgS8jouR2wUxXyNOdPik
         GSQXc57vIouHOo8T6CTmn1HY6gqCV5OvzD7iuorP3wKB6SUfjKg9wtzgXCeAOO0QTy
         6fkRrQays/x8xnESaFkxb0hr3qbnEdMo1GIMTKk0oD+dGOcglVFA1hOlkWXmz5t8A6
         qgWEjW5EnjEz/slfjxeqZrfSrTnoKu6lsz+2R3BVjgipWv3aLycX06wspmboe5W+dD
         3jPbaLoGd4iGQ==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 06 Jan 2020 04:04:18 +0300, Dmitry Osipenko wrote:
> System shutdown may happen with interrupts being disabled and in this case
> I2C core rejects transfers if atomic transfer isn't supported by driver.
> 
> There were several occurrences where I found my Nexus 7 completely
> discharged despite of being turned off and then one day I spotted this in
> the log:
> 
>  reboot: Power down
>  ------------[ cut here ]------------
>  WARNING: CPU: 0 PID: 1 at drivers/i2c/i2c-core.h:40 i2c_transfer+0x95/0x9c
>  No atomic I2C transfer handler for 'i2c-1'
>  Modules linked in: tegra30_devfreq
>  CPU: 0 PID: 1 Comm: systemd-shutdow Not tainted 5.4.0-next-20191202-00120-gf7ecd80fb803-dirty #3195
>  Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
>  [<c010e4b5>] (unwind_backtrace) from [<c010a0fd>] (show_stack+0x11/0x14)
>  [<c010a0fd>] (show_stack) from [<c09995e5>] (dump_stack+0x85/0x94)
>  [<c09995e5>] (dump_stack) from [<c011f3d1>] (__warn+0xc1/0xc4)
>  [<c011f3d1>] (__warn) from [<c011f691>] (warn_slowpath_fmt+0x61/0x78)
>  [<c011f691>] (warn_slowpath_fmt) from [<c069a8dd>] (i2c_transfer+0x95/0x9c)
>  [<c069a8dd>] (i2c_transfer) from [<c05667f1>] (regmap_i2c_read+0x4d/0x6c)
>  [<c05667f1>] (regmap_i2c_read) from [<c0563601>] (_regmap_raw_read+0x99/0x1cc)
>  [<c0563601>] (_regmap_raw_read) from [<c0563757>] (_regmap_bus_read+0x23/0x38)
>  [<c0563757>] (_regmap_bus_read) from [<c056293d>] (_regmap_read+0x3d/0xfc)
>  [<c056293d>] (_regmap_read) from [<c0562d3b>] (_regmap_update_bits+0x87/0xc4)
>  [<c0562d3b>] (_regmap_update_bits) from [<c0563add>] (regmap_update_bits_base+0x39/0x50)
>  [<c0563add>] (regmap_update_bits_base) from [<c056fd39>] (max77620_pm_power_off+0x29/0x2c)
>  [<c056fd39>] (max77620_pm_power_off) from [<c013bbdd>] (__do_sys_reboot+0xe9/0x170)
>  [<c013bbdd>] (__do_sys_reboot) from [<c0101001>] (ret_fast_syscall+0x1/0x28)
>  Exception stack(0xde907fa8 to 0xde907ff0)
>  7fa0:                   00000000 00000000 fee1dead 28121969 4321fedc 00000000
>  7fc0: 00000000 00000000 00000000 00000058 00000000 00000000 00000000 00000000
>  7fe0: 0045adf0 bed9abb8 004444a0 b6c666d0
>  ---[ end trace bdd18f87595b1a5e ]---
> 
> The atomic transferring is implemented by enforcing PIO mode for the
> transfer and by polling interrupt status until transfer is completed or
> failed.
> 
> Now system shuts down properly every time.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 84 ++++++++++++++++++++++++++++------
>  1 file changed, 69 insertions(+), 15 deletions(-)

Tested-by: Thierry Reding <treding@nvidia.com>
