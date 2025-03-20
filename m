Return-Path: <linux-i2c+bounces-9962-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3A6A6B053
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 23:09:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C1B49806DA
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 22:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1793E227BAA;
	Thu, 20 Mar 2025 22:08:59 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3AD1F7074;
	Thu, 20 Mar 2025 22:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742508538; cv=none; b=MZPZoqNZ9NPUgenHh/S9AYE2HdUY5IKacGRP5g/VbtRbCmx1OB9Opb5TwrvgqOUr3/6qaKmySy6LAbz6inFd9iiSZs1ZpHJFFRmQM/LXLduxrjpFAB+lFZc66FRAQpJAHxirGafxY9Cy6fg4AMzv8eJlgF2PY6PvHc9YHhaRhxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742508538; c=relaxed/simple;
	bh=0Dq9fex02CnH6rMJ1/Io1ojtqHjWpFBoYXLPrd2nXws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tUjuYxaLDZWyBEwNf9Jc9XpY4U8BCFN3loBxsyqj3abAVPUTmBHy72SVsUzy1XNmCHzXlP38ZglgG/kGnJR8bSITNVVAMwJ4ce+vMr1lzcXKZ1gunkwfXvzJSnpDOIYbI82zKJIsnO/V7AwOevnxfIGjx4ZPHMsoSw0CZJRd55A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98)
	(envelope-from <daniel@makrotopia.org>)
	id 1tvO4D-000000004Q0-2b5q;
	Thu, 20 Mar 2025 22:08:45 +0000
Date: Thu, 20 Mar 2025 22:08:42 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Zoie Lin <zoie.lin@mediatek.com>, Qii Wang <qii.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, teddy.chen@mediatek.com,
	joseph-cc.chang@mediatek.com, leilk.liu@mediatek.com,
	John Crispin <john@phrozen.org>
Subject: Re: [PATCH v5 1/1] i2c: mediatek: add runtime PM operations and bus
 regulator control
Message-ID: <Z9yR6pyg1mtqKynh@makrotopia.org>
References: <20250314145407.2900190-1-zoie.lin@mediatek.com>
 <fqicrglyug7gmkmysok7hilhmkyhxmnkztzv4iffgry6xce6t3@2i6b2ihfu4rb>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fqicrglyug7gmkmysok7hilhmkyhxmnkztzv4iffgry6xce6t3@2i6b2ihfu4rb>

Hi Andi,
Hi Zoie,

On Wed, Mar 19, 2025 at 12:34:53AM +0100, Andi Shyti wrote:
> Hi Zoie,
> 
> On Fri, Mar 14, 2025 at 10:53:43PM +0800, Zoie Lin wrote:
> > Introduce support for runtime PM operations in
> > the I2C driver, enabling runtime suspend and resume functionality.
> > 
> > Although in most platforms, the bus power of i2c is always
> > on, some platforms disable the i2c bus power in order to meet
> > low power request.
> > 
> > This implementation includes bus regulator control to facilitate
> > proper handling of the bus power based on platform requirements.
> > 
> > Signed-off-by: Zoie Lin <zoie.lin@mediatek.com>
> 
> merged to i2c/i2c-host.

the change causes a crash during boot on MT7988 which typically uses
one of its I2C busses to connect a Richtek RT5190A PMIC.

[    1.465158] SError Interrupt on CPU3, code 0x00000000bf000002 -- SError
[    1.465170] CPU: 3 UID: 0 PID: 40 Comm: kworker/u16:1 Not tainted 6.14.0-rc7-next-20250320+ #0 NONE 
[    1.465178] Hardware name: SmartRG SDG-9000 (DT)
[    1.465180] Workqueue: async async_run_entry_fn
[    1.465194] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    1.465199] pc : mtk_i2c_transfer+0x27c/0x1108
[    1.465208] lr : mtk_i2c_transfer+0x224/0x1108
[    1.465212] sp : ffffffc0821538e0
[    1.465213] x29: ffffffc0821538e0 x28: 0000000000000000 x27: ffffffc082153a00
[    1.465220] x26: 00000000ffff8b62 x25: ffffffc080f3b000 x24: 0000000000000000
[    1.465225] x23: 0000000000000001 x22: ffffff80c0ba7810 x21: 000000000000000f
[    1.465230] x20: ffffffc082153a10 x19: ffffff80c9620080 x18: 0000000000000014
[    1.465236] x17: 000000005f52c058 x16: 00000000c071d659 x15: 0000000013b9e9aa
[    1.465241] x14: 00000000305bde35 x13: ffffff80c5f222e8 x12: ffffff80c5f222b0
[    1.465246] x11: 0000000000001e20 x10: ffffffc0811097d8 x9 : 0000000000000001
[    1.465251] x8 : ffffffc082153830 x7 : ffffffc0821538a0 x6 : ffffffc082153840
[    1.465256] x5 : 000000000000ffed x4 : 0000000000000003 x3 : ffffffc080b798b0
[    1.465260] x2 : 0000000000000000 x1 : ffffffc080b797d8 x0 : 0000000000000064
[    1.465267] Kernel panic - not syncing: Asynchronous SError Interrupt
[    1.465269] SMP: stopping secondary CPUs
[    1.465281] Kernel Offset: disabled
[    1.465282] CPU features: 0x0000,00000040,00000000,8200400b
[    1.465286] Memory Limit: none
[    1.466353] 
[    1.466355] ================================
[    1.466356] WARNING: inconsistent lock state
[    1.466357] 6.14.0-rc7-next-20250320+ #0 Not tainted
[    1.466360] --------------------------------
[    1.466361] inconsistent {INITIAL USE} -> {IN-NMI} usage.
[    1.466364] kworker/u16:1/40 [HC1[1]:SC0[0]:HE0:SE1] takes:
[    1.466369] ffffff80c0357940 (&prz->buffer_lock){....}-{2:2}, at: buffer_size_add+0x68/0x84
[    1.466384] {INITIAL USE} state was registered at:
[    1.466386]   lock_acquire+0xf4/0x2d8
[    1.466391]   _raw_spin_lock_irqsave+0x5c/0x80
[    1.466399]   buffer_size_add+0x68/0x84
[    1.466404]   persistent_ram_write+0x44/0x11c
[    1.466410]   ramoops_pstore_write+0x150/0x1c4
[    1.466415]   pstore_console_write+0x4c/0x5c
[    1.466420]   console_flush_all+0x2ac/0x490
[    1.466425]   console_unlock+0x68/0x144
[    1.466430]   vprintk_emit+0x168/0x3ac
[    1.466434]   vprintk_default+0x34/0x3c
[    1.466439]   vprintk+0x24/0x2c
[    1.466444]   _printk+0x48/0x50
[    1.466448]   register_console+0x370/0x4c4
[    1.466453]   pstore_register+0x18c/0x37c
[    1.466457]   ramoops_probe+0x2e8/0x5c4
[    1.466461]   platform_probe+0x64/0xbc
[    1.466467]   really_probe+0xbc/0x388
[    1.466470]   __driver_probe_device+0x78/0x154
[    1.466474]   driver_probe_device+0x3c/0xd4
[    1.466477]   __device_attach_driver+0xb0/0x144
[    1.466480]   bus_for_each_drv+0x6c/0xb0
[    1.466486]   __device_attach+0x9c/0x19c
[    1.466489]   device_initial_probe+0x10/0x18
[    1.466493]   bus_probe_device+0xa8/0xac
[    1.466495]   device_add+0x58c/0x790
[    1.466500]   of_device_add+0x4c/0x58
[    1.466507]   of_platform_device_create_pdata+0x9c/0x118
[    1.466512]   of_platform_default_populate_init+0x4c/0xf0
[    1.466519]   do_one_initcall+0x64/0x324
[    1.466524]   kernel_init_freeable+0x298/0x4f0
[    1.466530]   kernel_init+0x1c/0x1c8
[    1.466534]   ret_from_fork+0x10/0x20
[    1.466538] irq event stamp: 3498
[    1.466539] hardirqs last  enabled at (3497): [<ffffffc080ac0b78>] _raw_spin_unlock_irqrestore+0x54/0x74
[    1.466546] hardirqs last disabled at (3498): [<ffffffc080ab43c4>] el1h_64_error_handler+0x20/0x48
[    1.466551] softirqs last  enabled at (3392): [<ffffffc08004af28>] handle_softirqs+0x46c/0x484
[    1.466558] softirqs last disabled at (3381): [<ffffffc080010170>] __do_softirq+0x10/0x18
[    1.466562] 
[    1.466562] other info that might help us debug this:
[    1.466564]  Possible unsafe locking scenario:
[    1.466564] 
[    1.466565]        CPU0
[    1.466566]        ----
[    1.466567]   lock(&prz->buffer_lock);
[    1.466570]   <Interrupt>
[    1.466571]     lock(&prz->buffer_lock);
[    1.466573] 
[    1.466573]  *** DEADLOCK ***
[    1.466573] 
[    1.466575] 5 locks held by kworker/u16:1/40:
[    1.466578]  #0: ffffff80c01b2148 ((wq_completion)async){+.+.}-{0:0}, at: process_one_work+0x1a8/0x610
[    1.466588]  #1: ffffffc082153dd8 ((work_completion)(&entry->work)){+.+.}-{0:0}, at: process_one_work+0x1d0/0x610
[    1.466598]  #2: ffffff80c7b3f908 (&dev->mutex){....}-{4:4}, at: __device_attach_async_helper+0x28/0xec
[    1.466606]  #3: ffffff80c5f22068 (rt5190a_regulator:443:(&rt5190a_regmap_config)->lock){+.+.}-{4:4}, at: regmap_lock_mutex+0x10/0x18
[    1.466617]  #4: ffffff80c9620100 (i2c_register_adapter){+.+.}-{4:4}, at: i2c_adapter_lock_bus+0x20/0x2c
[    1.466629] 
[    1.466629] stack backtrace:
[    1.466630] CPU: 3 UID: 0 PID: 40 Comm: kworker/u16:1 Not tainted 6.14.0-rc7-next-20250320+ #0 NONE 
[    1.466635] Hardware name: SmartRG SDG-9000 (DT)
[    1.466637] Workqueue: async async_run_entry_fn
[    1.466643] Call trace:
[    1.466645]  show_stack+0x14/0x1c (C)
[    1.466653]  dump_stack_lvl+0x30/0xc0
[    1.466657]  dump_stack+0x14/0x1c
[    1.466661]  print_usage_bug.part.0+0x26c/0x318
[    1.466665]  lock_acquire+0x280/0x2d8
[    1.466669]  _raw_spin_lock_irqsave+0x5c/0x80
[    1.466676]  buffer_size_add+0x68/0x84
[    1.466681]  persistent_ram_write+0x44/0x11c
[    1.466687]  ramoops_pstore_write+0xc8/0x1c4
[    1.466692]  pstore_dump+0x16c/0x300
[    1.466697]  kmsg_dump_desc+0xc0/0x194
[    1.466703]  panic+0x170/0x38c
[    1.466708]  nmi_panic+0x50/0x64
[    1.466712]  arm64_serror_panic+0x60/0x70
[    1.466715]  do_serror+0x38/0x68
[    1.466719]  el1h_64_error_handler+0x34/0x48
[    1.466723]  el1h_64_error+0x70/0x74
[    1.466727]  mtk_i2c_transfer+0x27c/0x1108 (P)
[    1.466732]  __i2c_transfer+0x1f8/0x948
[    1.466736]  i2c_transfer+0x90/0xe8
[    1.466739]  regmap_i2c_read+0x48/0x70
[    1.466744]  _regmap_raw_read+0x110/0x328
[    1.466750]  regmap_raw_read+0x130/0x240
[    1.466755]  rt5190a_probe+0x88/0x53c
[    1.466761]  i2c_device_probe+0x154/0x2ec
[    1.466764]  really_probe+0xbc/0x388
[    1.466768]  __driver_probe_device+0x78/0x154
[    1.466772]  driver_probe_device+0x3c/0xd4
[    1.466776]  __device_attach_driver+0xb0/0x144
[    1.466780]  bus_for_each_drv+0x6c/0xb0
[    1.466785]  __device_attach_async_helper+0x80/0xec
[    1.466790]  async_run_entry_fn+0x34/0x17c
[    1.466794]  process_one_work+0x224/0x610
[    1.466799]  worker_thread+0x1b4/0x348
[    1.466804]  kthread+0x108/0x1d4
[    1.466808]  ret_from_fork+0x10/0x20

Reverting commit 4b60b1b58696 (i2c: mediatek: add runtime PM operations
and bus regulator control") fixes the issue.

