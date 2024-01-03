Return-Path: <linux-i2c+bounces-1088-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F187482307B
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jan 2024 16:25:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5F171F2483A
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jan 2024 15:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B50EE1B26F;
	Wed,  3 Jan 2024 15:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lOP+rSO+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC99D1B268;
	Wed,  3 Jan 2024 15:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704295521; x=1735831521;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=lLvRN6Vgg9jzrWkSLBTHIGTCs88oK3ZBLYQBbiDRE9M=;
  b=lOP+rSO+xauMRKgd3gQXa9Sa3gppGFPTOiUBiQPrJWcVqfneyILwzE+L
   b1YDAgGi3TsDFzZESbqDUFjLQIVvG4SHFwR9EuNuVJo/vjFQ+dScWR2ow
   f5lQfslug9+WrqncLDNskAT+30N+KFZeYCWnli6BqY2zqsT10RaqLM2Rt
   hF7Pv0gL07bjQ/zH8MGHdp0xN3q0bcIJX2rnObGjBGau0V8CIeZn5v4sh
   j4QU5IutQOduldyG5sp41OOKQtxrEhZK8QRfmYtdCEKJLCZx9INm0U0qM
   4009paf3qWDZfi1oIkSRfe/oTo17qZL8fHQl2volS7CmuqE6KJ+uJr8NA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="377177058"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; 
   d="scan'208";a="377177058"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2024 07:25:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="923575360"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; 
   d="scan'208";a="923575360"
Received: from unknown (HELO [10.237.72.158]) ([10.237.72.158])
  by fmsmga001.fm.intel.com with ESMTP; 03 Jan 2024 07:25:18 -0800
Message-ID: <888da30a-c1ed-4fb0-af81-787fd868ce20@linux.intel.com>
Date: Wed, 3 Jan 2024 17:25:17 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: i2c-designware: NULL ptr at RIP: 0010:regmap_read+0x12/0x70
Content-Language: en-US
To: "V, Narasimhan" <Narasimhan.V@amd.com>, Borislav Petkov <bp@alien8.de>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Cc: lkml <linux-kernel@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 "Limonciello, Mario" <Mario.Limonciello@amd.com>
References: <20231229120820.GCZY62tM7z4v2XmOAZ@fat_crate.local>
 <8169d773-f9ec-4092-b036-9e4fd59966c3@linux.intel.com>
 <DM4PR12MB508654DF49FE079D6C283D658961A@DM4PR12MB5086.namprd12.prod.outlook.com>
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <DM4PR12MB508654DF49FE079D6C283D658961A@DM4PR12MB5086.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/2/24 17:47, V, Narasimhan wrote:
> [AMD Official Use Only - General]
> 
> 
> No, we don't see this issue on linus' tree or on linux-next in the till 
> the previous week
> 
Thanks, this indeed shows it's a regression coming from recent Andy's 
patchset. Notes and questions below:

> [    6.245173] i2c_designware AMDI0010:00: Unknown Synopsys component type: 0xffffffff

This made me scratching my head since driver probing will fail in this 
case with -ENODEV and I could not trigger runtime PM activity in such 
case but perhaps this is timing specific which happens to happen in your 
case.

Out of curiosity do you see this same "i2c_designware AMDI0010:00: 
Unknown Synopsys component type: 0xffffffff" error on Vanilla or is it 
also regression in linux-next?

> [    6.252683] BUG: kernel NULL pointer dereference, address: 00000000000001fc
> [    6.256551] #PF: supervisor read access in kernel mode
> [    6.256551] #PF: error_code(0x0000) - not-present page
> [    6.256551] PGD 0 
> [    6.256551] Oops: 0000 [#1] PREEMPT SMP NOPTI
> [    6.256551] CPU: 32 PID: 211 Comm: kworker/32:0 Not tainted 6.7.0-rc6-next-20231222-1703820640818 #1
> [    6.256551] Workqueue: pm pm_runtime_work
> [    6.256551] RIP: 0010:regmap_read+0x12/0x70
> [    6.256551] Code: 00 00 00 00 0f 1f 40 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 0f 1f 44 00 00 55 48 89 e5 41 55 41 54 53 <8b> 87 fc 01 00 00 83 e8 01 85 f0 75 42 48 89 fb 41 89 f4 49 89 d5
> [    6.256551] RSP: 0018:ff7fa5c740bcbc98 EFLAGS: 00010246
> [    6.256551] RAX: 0000000000000000 RBX: ff38ff5c159f1028 RCX: 0000000000000008
> [    6.256551] RDX: ff7fa5c740bcbcc4 RSI: 0000000000000034 RDI: 0000000000000000
> [    6.256551] RBP: ff7fa5c740bcbcb0 R08: ff38ff5c02ceb8b0 R09: ff38ff5c002a4500
> [    6.256551] R10: 0000000000000003 R11: 0000000000000003 R12: ff38ff5c159f1028
> [    6.256551] R13: 0000000000000000 R14: 0000000000000000 R15: ff38ff5c159ed8f4
> [    6.256551] FS:  0000000000000000(0000) GS:ff38ff6b0d200000(0000) knlGS:0000000000000000
> [    6.256551] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    6.256551] CR2: 00000000000001fc CR3: 000000007403c001 CR4: 0000000000771ef0
> [    6.256551] PKRU: 55555554
> [    6.256551] Call Trace:
> [    6.256551]  <TASK>
> [    6.256551]  ? show_regs+0x6d/0x80
> [    6.256551]  ? __die+0x29/0x70
> [    6.256551]  ? page_fault_oops+0x153/0x4a0
> [    6.256551]  ? do_user_addr_fault+0x30f/0x6c0
> [    6.256551]  ? exc_page_fault+0x7c/0x190
> [    6.256551]  ? asm_exc_page_fault+0x2b/0x30
> [    6.256551]  ? regmap_read+0x12/0x70
> [    6.256551]  ? update_load_avg+0x82/0x7d0
> [    6.256551]  __i2c_dw_disable+0x38/0x180
> [    6.256551]  i2c_dw_disable+0x3f/0xb0
> [    6.256551]  i2c_dw_runtime_suspend+0x33/0x50

I think this Oops comes because of the first commit in the patchset:

bd466a892612 ("i2c: designware: Fix PM calls order in dw_i2c_plat_probe()"

Do you see the issue if you test at that commit?

Before that commit when the i2c_dw_probe() path fails we explicitly 
disable the runtime PM before returning but now let the managed calls to 
do it. Perhaps there is some time window that runtime suspending occurs 
in parallel while drivers base is executing post probe code?

dw_i2c_plat_probe
	i2c_dw_probe
		i2c_dw_probe_master
			i2c_dw_init_regmap
				-> failure and thus dev->map is not set

i2c_dw_runtime_suspend
	i2c_dw_disable
		__i2c_dw_disable
			regmap_read(dev->map, ...)
				-> Oops because dev->map is NULL

Other PM related commit in the patchset is commit 2347b8dc0d2e ("i2c: 
designware: Consolidate PM ops") but I don't think that is the reason.

