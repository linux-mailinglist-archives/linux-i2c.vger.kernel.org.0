Return-Path: <linux-i2c+bounces-1076-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B38A821E41
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Jan 2024 16:04:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CFCA1C22420
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Jan 2024 15:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F7C3134DD;
	Tue,  2 Jan 2024 15:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bgzhe2H3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B3F12E69;
	Tue,  2 Jan 2024 15:03:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEAE8C433C7;
	Tue,  2 Jan 2024 15:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704207838;
	bh=aAclt0B+OSjENNYBjj9U19v0PFhS/aJa+mB6Qz5/pfY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Bgzhe2H3J4eljcl+IJ8gS2QwDzge1N+6/3/KTfrX7nT2XFEZiGdHYyUwjZ5j28MbP
	 mUCpqPJBc68LBW2UdMeVl/rrrG+ytlf0sBv28Hvy927HBFnSYQSeyobrdzjySZRi4h
	 eB6QH7Gd6zlpcs/J2chdu+1XoOFeCggI8bO9LM9z2jL59wxCKCDkTD6hcgfXt590Pr
	 DSltxYFLQOUOpQAeBymvie+c7Ewky3a0uDpDMfOe8brn9M4PZjGiew6R7ByFxL1fz3
	 T8G636rdv+SFU2d8LdhQOk7/U76UQNUsv5Aq0uYx4LHr+wEaxVICONizhpJX91/fYg
	 RAyXuZqAbGhDA==
From: Michael Walle <mwalle@kernel.org>
To: bbara93@gmail.com
Cc: benjamin.bara@skidata.com,
	dmitry.osipenko@collabora.com,
	jonathanh@nvidia.com,
	lee@kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	nm@ti.com,
	peterz@infradead.org,
	rafael.j.wysocki@intel.com,
	richard.leitner@linux.dev,
	stable@vger.kernel.org,
	treding@nvidia.com,
	wsa+renesas@sang-engineering.com,
	wsa@kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH v7 2/5] Re: i2c: core: run atomic i2c xfer when !preemptible
Date: Tue,  2 Jan 2024 16:03:50 +0100
Message-Id: <20240102150350.3180741-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327-tegra-pmic-reboot-v7-2-18699d5dcd76@skidata.com>
References: <20230327-tegra-pmic-reboot-v7-2-18699d5dcd76@skidata.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

> Since bae1d3a05a8b, i2c transfers are non-atomic if preemption is
> disabled. However, non-atomic i2c transfers require preemption (e.g. in
> wait_for_completion() while waiting for the DMA).
> 
> panic() calls preempt_disable_notrace() before calling
> emergency_restart(). Therefore, if an i2c device is used for the
> restart, the xfer should be atomic. This avoids warnings like:
> 
> [   12.667612] WARNING: CPU: 1 PID: 1 at kernel/rcu/tree_plugin.h:318 rcu_note_context_switch+0x33c/0x6b0
> [   12.676926] Voluntary context switch within RCU read-side critical section!
> ...
> [   12.742376]  schedule_timeout from wait_for_completion_timeout+0x90/0x114
> [   12.749179]  wait_for_completion_timeout from tegra_i2c_wait_completion+0x40/0x70
> ...
> [   12.994527]  atomic_notifier_call_chain from machine_restart+0x34/0x58
> [   13.001050]  machine_restart from panic+0x2a8/0x32c
> 
> Use !preemptible() instead, which is basically the same check as
> pre-v5.2.
> 
> Fixes: bae1d3a05a8b ("i2c: core: remove use of in_atomic()")
> Cc: stable@vger.kernel.org # v5.2+
> Suggested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Acked-by: Wolfram Sang <wsa@kernel.org>
> Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Tested-by: Nishanth Menon <nm@ti.com>
> Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
> ---
>  drivers/i2c/i2c-core.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/i2c-core.h b/drivers/i2c/i2c-core.h
> index 1247e6e6e975..05b8b8dfa9bd 100644
> --- a/drivers/i2c/i2c-core.h
> +++ b/drivers/i2c/i2c-core.h
> @@ -29,7 +29,7 @@ int i2c_dev_irq_from_resources(const struct resource *resources,
>   */
>  static inline bool i2c_in_atomic_xfer_mode(void)
>  {
> -	return system_state > SYSTEM_RUNNING && irqs_disabled();
> +	return system_state > SYSTEM_RUNNING && !preemptible();

With preemption disabled, this boils down to
  return system_state > SYSTEM_RUNNING (&& !0)

and will then generate a backtrace splash on each reboot on our
board:

# reboot -f
[   12.687169] No atomic I2C transfer handler for 'i2c-0'
[   12.692313] WARNING: CPU: 6 PID: 275 at drivers/i2c/i2c-core.h:40 i2c_smbus_xfer+0x100/0x118
[   12.700745] Modules linked in:
[   12.703788] CPU: 6 PID: 275 Comm: reboot Not tainted 6.7.0-rc6-next-20231222+ #2494
[   12.711431] Hardware name: Kontron 3.5"-SBC-i1200 (DT)
[   12.716555] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   12.723504] pc : i2c_smbus_xfer+0x100/0x118
[   12.727674] lr : i2c_smbus_xfer+0x100/0x118
[   12.731844] sp : ffff80008389b7c0
[   12.735146] x29: ffff80008389b7c0 x28: ffff0000c561b4c0 x27: ffff0000c2b06400
[   12.742268] x26: ffff0000c65aec4a x25: 000000000000000b x24: 0000000000000001
[   12.749389] x23: 0000000000000000 x22: 0000000000000064 x21: 0000000000000008
[   12.756510] x20: ffff80008389b836 x19: ffff0000c2dda080 x18: ffffffffffffffff
[   12.763631] x17: ffff800080813f48 x16: ffff80008081bd38 x15: 0730072d07630732
[   12.770752] x14: 0769072707200772 x13: 0730072d07630732 x12: 0769072707200772
[   12.777873] x11: 0720072007200720 x10: ffff8000827dc828 x9 : ffff80008012e154
[   12.784994] x8 : 00000000ffffefff x7 : ffff8000827dc828 x6 : 80000000fffff000
[   12.792116] x5 : 000000000000bff4 x4 : 0000000000000000 x3 : 0000000000000000
[   12.799236] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0000c561b4c0
[   12.806359] Call trace:
[   12.808793]  i2c_smbus_xfer+0x100/0x118
[   12.812616]  i2c_smbus_read_i2c_block_data+0x60/0xb0
[   12.817569]  mt6360_regmap_read+0xa4/0x1b8
[   12.821654]  _regmap_raw_read+0xfc/0x270
[   12.825566]  _regmap_bus_read+0x4c/0x90
[   12.829389]  _regmap_read+0x6c/0x168
[   12.832953]  _regmap_update_bits+0xf8/0x150
[   12.837124]  regmap_update_bits_base+0x6c/0xa8
[   12.841555]  regulator_disable_regmap+0x48/0x68
[   12.846073]  _regulator_do_disable+0x130/0x1e8
[   12.850504]  _regulator_disable+0x154/0x1d8
[   12.854676]  regulator_disable+0x44/0x90
[   12.858587]  mmc_regulator_set_ocr+0x8c/0x118
[   12.862933]  msdc_ops_set_ios+0x3f4/0x938
[   12.866932]  mmc_set_initial_state+0x90/0xa8
[   12.871191]  mmc_power_off+0x40/0x68
[   12.874754]  _mmc_sd_suspend+0x5c/0x190
[   12.878577]  mmc_sd_suspend+0x20/0x78
[   12.882227]  mmc_bus_shutdown+0x48/0x90
[   12.886051]  device_shutdown+0x134/0x298
[   12.889961]  kernel_restart+0x48/0xd0
[   12.893613]  __do_sys_reboot+0x1e0/0x278
[   12.897523]  __arm64_sys_reboot+0x2c/0x40
[   12.901519]  invoke_syscall+0x50/0x128
[   12.905257]  el0_svc_common.constprop.0+0x48/0xf0
[   12.909950]  do_el0_svc+0x24/0x38
[   12.913253]  el0_svc+0x38/0xd8
[   12.916296]  el0t_64_sync_handler+0x100/0x130
[   12.920639]  el0t_64_sync+0x1a4/0x1a8
[   12.924289] ---[ end trace 0000000000000000 ]---
...

I'm not sure if this is now the expected behavior or not. There will be
no backtraces, if I build a preemptible kernel, nor will there be
backtraces if I revert this patch.

OTOH, the driver I'm using (drivers/i2c/busses/i2c-mt65xx.c) has no
*_atomic(). So the warning is correct. There is also [1], which seems to
be the same issue I'm facing.

-michael

[1] https://lore.kernel.org/linux-i2c/13271b9b-4132-46ef-abf8-2c311967bb46@mailbox.org/

