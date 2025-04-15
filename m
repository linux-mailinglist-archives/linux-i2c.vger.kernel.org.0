Return-Path: <linux-i2c+bounces-10342-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E413DA89D16
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 14:03:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3072A1896221
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 12:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62F48292903;
	Tue, 15 Apr 2025 12:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d1OIF979"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DF22750F2;
	Tue, 15 Apr 2025 12:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744718613; cv=none; b=hnsSDMrDsApcmcL+yoQFsiArHlucqFhDSQErtKHBfprBAbyHdU/zXrb63WtQLtyrXppISRjBSh5z7Sjj+4Ad/XSLomzubKUdp3R6T28aZAzecE9sw1zvkqtJJi8rN6D8al7viAHE0taTmkB4QNpnZ4+Wiahqak3spDtW60dkZp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744718613; c=relaxed/simple;
	bh=hLHH1GH9RrzmD3Fhp2f/177HpgYsuGmU1wu62As+KKE=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=oqMbqfgkhCp4njVBpOyZqYn43dYcnx8rnwvTskDRBtU4O+Dfi0w9jj3Hu+8HUzKyUq6QFU0ferxxxdX8ZO8EEA+5z7Ewv6mG0PTW6p4WmM6y8nHRKAGJU0oDNYh8i5rAxBDS0T1wYi3KSL5YFDlu3kCuCs0tf6WPnuHlZvY79Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d1OIF979; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AE97C4CEDD;
	Tue, 15 Apr 2025 12:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744718611;
	bh=hLHH1GH9RrzmD3Fhp2f/177HpgYsuGmU1wu62As+KKE=;
	h=Date:To:Cc:From:Subject:From;
	b=d1OIF979gma51ugF1YMIEIctpbYCSpmrhd1Tkmdq1lXYZR4OS2aV6HldAMLaAYxyk
	 9qHRygJMzz3pL4f5Ns60He+/xUpfdWyIZKy0/5kiKFEs6eA4wcHPYUoHqwLgGF7oPX
	 M0YESr82P8itxX3OnE4oLLXp1oE1ww13XlomV2lbrLBZNz6IE1LaC9+ybodJJManDA
	 dEF9r/iljGa+e//enkffDn4hyyRo8Jlax668inhjpV1Q1IjgCuJ7cvSGGokV9Z4r+P
	 mgSshLDLgx0ncgHZPufAkTYWFfg/ke30kFZFLejK5scUtTp7GH/Wy38UyJMFd/Eebq
	 lYd/oYM98nOww==
Message-ID: <20c191d9-5f7a-4ec6-a663-dcc8d0b54c18@kernel.org>
Date: Tue, 15 Apr 2025 14:03:26 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Luis Oliveira <lolivei@synopsys.com>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 linux-i2c@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 kernel-team <kernel-team@cloudflare.com>
From: Jesper Dangaard Brouer <hawk@kernel.org>
Subject: Hitting WARN_ON_ONCE in i2c-designware-common.c
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Maintainers,

I'm hitting a WARN_ON_ONCE in drivers/i2c/busses/i2c-designware-common.c
when booting the kernel on our Gen12 hardware.

I'm using devel kernel net-next at commit 1a9239bb425 (merge tag 
'net-next-6.15').

I assume you want this report.

Maybe it is not a critical error(?)
... looking the comment in the function:

  u32 i2c_dw_clk_rate(struct dw_i2c_dev *dev)
  {
	/*
	 * Clock is not necessary if we got LCNT/HCNT values directly from
	 * the platform code.
	 */
	if (WARN_ON_ONCE(!dev->get_clk_rate_khz))
		return 0;
	return dev->get_clk_rate_khz(dev);
  }

--Jesper

Boot error:

[   10.062651] i2c_designware AMDI0010:00: Unknown Synopsys component 
type: 0xffffffff
[   10.073312] pps_core: LinuxPPS API ver. 1 registered
[   10.073372] piix4_smbus 0000:00:14.0: SMBus Host Controller at 0xb00, 
revision 0
[   10.075433] i2c_designware AMDI0010:01: Unknown Synopsys component 
type: 0xffffffff
[   10.077727] ------------[ cut here ]------------
[   10.077728] WARNING: CPU: 15 PID: 1402 at 
drivers/i2c/busses/i2c-designware-common.c:575 i2c_dw_clk_rate+0x13/0x20 
[i2c_designware_core]
[   10.077733] Modules linked in: i2c_piix4(+) pps_core(+) i2c_smbus 
i2c_designware_platform(+) i2c_designware_core iosf_mbi i2c_core
[   10.077739] CPU: 15 UID: 0 PID: 1402 Comm: (udev-worker) Not tainted 
6.14.0-net-next2+ #24 PREEMPT(full)
[   10.077742] Hardware name: Lenovo HR355M-V3-G12/HR355M_V3_HPM, BIOS 
HR355M_V3.G.026 10/13/2023
[   10.077743] RIP: 0010:i2c_dw_clk_rate+0x13/0x20 [i2c_designware_core]
[   10.077745] Code: 5e 73 6f df 0f 1f 00 90 90 90 90 90 90 90 90 90 90 
90 90 90 90 90 90 0f 1f 44 00 00 48 8b 47 68 48 85 c0 74 05 ff e0 cc 66 
90 <0f> 0b 31 c0 e9 2f 73 6f df 0f 1f 40 00 90 90 90 90 90 90 90 90 90
[   10.077747] RSP: 0018:ffffc90021ee7ba0 EFLAGS: 00010246
[   10.077749] RAX: 0000000000000000 RBX: ffff88a056c00028 RCX: 
0000000000ffffae
[   10.077750] RDX: ffffc90021ee7bac RSI: ffffc900082490f4 RDI: 
ffff88a056c00028
[   10.077751] RBP: 000000000000012c R08: ffffffff825eb647 R09: 
0000000000000008
[   10.077752] R10: ffffc90021ee79b8 R11: 0000000000000001 R12: 
000000000000012c
[   10.077753] R13: ffff889852a61410 R14: ffff88a0532e6428 R15: 
ffff8881006db020
[   10.077754] FS:  00007f4d0f3d28c0(0000) GS:ffff88a8ac065000(0000) 
knlGS:0000000000000000
[   10.077755] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   10.077756] CR2: 00007f4d0fc75028 CR3: 0000002056f98003 CR4: 
0000000000770ef0
[   10.077757] PKRU: 55555554
[   10.077757] Call Trace:
[   10.077759]  <TASK>
[   10.077761]  ? __warn+0x85/0x150
[   10.077765]  ? i2c_dw_clk_rate+0x13/0x20 [i2c_designware_core]
[   10.077768]  ? report_bug+0x160/0x190
[   10.077772]  ? i2c_dw_clk_rate+0x13/0x20 [i2c_designware_core]
[   10.077777]  ? i2c_dw_clk_rate+0x15/0x20 [i2c_designware_core]
[   10.077779]  ? handle_bug+0x10d/0x160
[   10.077783]  ? exc_invalid_op+0x13/0x60
[   10.077785]  ? asm_exc_invalid_op+0x16/0x20
[   10.077789]  ? i2c_dw_clk_rate+0x13/0x20 [i2c_designware_core]
[   10.077791]  i2c_dw_set_timings_master+0x91/0x3c0 [i2c_designware_core]
[   10.077794]  i2c_dw_probe_master+0x5e/0x330 [i2c_designware_core]
[   10.077796]  ? pm_runtime_enable+0x59/0xe0
[   10.077800]  dw_i2c_plat_probe+0x305/0x380 [i2c_designware_platform]
[   10.077803]  platform_probe+0x3d/0x90
[   10.077807]  really_probe+0xc1/0x390
[   10.077811]  ? __pfx___driver_attach+0x10/0x10
[   10.077812]  __driver_probe_device+0x78/0x150
[   10.077814]  driver_probe_device+0x1f/0x90
[   10.077816]  __driver_attach+0xce/0x1c0
[   10.077818]  bus_for_each_dev+0x60/0xa0
[   10.077821]  bus_add_driver+0x10e/0x240
[   10.077824]  driver_register+0x55/0x100
[   10.077826]  ? __pfx_dw_i2c_init_driver+0x10/0x10 
[i2c_designware_platform]
[   10.077829]  do_one_initcall+0x40/0x210
[   10.077831]  ? security_kernel_post_read_file+0x2f/0x70
[   10.077836]  do_init_module+0x60/0x260
[   10.077840]  init_module_from_file+0x75/0xa0
[   10.077845]  idempotent_init_module+0xed/0x2c0
[   10.077848]  __x64_sys_finit_module+0x5d/0xc0
[   10.077851]  do_syscall_64+0x47/0x110
[   10.077853]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   10.077855] RIP: 0033:0x7f4d0fae3799
[   10.077857] Code: 08 89 e8 5b 5d c3 66 2e 0f 1f 84 00 00 00 00 00 90 
48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 
05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 37 06 0d 00 f7 d8 64 89 01 48
[   10.077858] RSP: 002b:00007ffc1f421918 EFLAGS: 00000246 ORIG_RAX: 
0000000000000139
[   10.077860] RAX: ffffffffffffffda RBX: 00005606c614bcf0 RCX: 
00007f4d0fae3799
[   10.077861] RDX: 0000000000000000 RSI: 00007f4d0fc76efd RDI: 
000000000000000d
[   10.077862] RBP: 00007f4d0fc76efd R08: 0000000000000000 R09: 
00005606c6129bd0
[   10.077863] R10: 000000000000000d R11: 0000000000000246 R12: 
0000000000020000
[   10.077863] R13: 0000000000000000 R14: 00005606c614c1c0 R15: 
00007ffc1f421b50
[   10.077867]  </TASK>
[   10.077867] ---[ end trace 0000000000000000 ]---
[   10.078850] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 
Rodolfo Giometti <giometti@linux.it>
[   10.087132] workqueue: work_for_cpu_fn hogged CPU for >10000us 5 
times, consider switching to WQ_UNBOUND
[   10.099417] PTP clock support registered
[   10.104491] piix4_smbus 0000:00:14.0: Using register 0x02 for SMBus 
port selection
[   10.711607] ice: Intel(R) Ethernet Connection E800 Series Linux Driver
[   10.712839] piix4_smbus 0000:00:14.0: Auxiliary SMBus Host Controller 
at 0xb20

