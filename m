Return-Path: <linux-i2c+bounces-144-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 665BF7EAE4D
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Nov 2023 11:47:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 889B81C20A31
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Nov 2023 10:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB8A419BAB;
	Tue, 14 Nov 2023 10:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FpUiNx/o"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF78418E0B
	for <linux-i2c@vger.kernel.org>; Tue, 14 Nov 2023 10:47:19 +0000 (UTC)
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25178186;
	Tue, 14 Nov 2023 02:47:17 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-53e2308198eso8316382a12.1;
        Tue, 14 Nov 2023 02:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699958835; x=1700563635; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=46YOEQ0FNblUgO/h8wcHgKHcfFM5epdSzmHpnsspYvQ=;
        b=FpUiNx/oY0xzb9jSMtmehi3RKU+oP9u8GP6jjd0IlB9IMiEICNq5WoWuPrrj6WkCbw
         Icn5qVl0BOBhix5HrKJlTDg5U/1QHZWCOueEEtFrxJJrPcxUKDEo9mmYo/P0gRhrimQ0
         FS/wS+0z22g7CkBy1OBf+agi0HQgyfvSDjK/TKOIs/qdneWKpkXzSUqjyEaBcWsGVdlU
         Qdz5ko/gEWCz9ubQ4C8dUmGTQUryZ8h5GEguEHIxr8ZnMdtCDfZRaAebqujyzZYNv8SW
         RvlyaIEla+uYg8hr6IA6BnWaJDHiDkR+6pv3u+6BGPHhJ8AKVC38c++yOFVKXXLvmmve
         tozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699958835; x=1700563635;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=46YOEQ0FNblUgO/h8wcHgKHcfFM5epdSzmHpnsspYvQ=;
        b=gsMLbFM23vqYCMq9/TyJwD25wyR9wihWoIPXgzuBpfhRlPSy6K0DPhbIT3XPgE8bea
         1fU6l+wqI7ZvgxpuGxC46X/DJvezPTb7ffS/MDZRk4mWCo0ENffACHeXg8cWtZmHmINq
         A/oqqkZ4WxTKvC+KPLxFi4I7y3jTgDr4C9gp/bfDfpRfkPnDmk58ezyNffmsAhUXvzoi
         atiXjugPbpHWCJK3K5Lem83YkwKldGTisRdHCSW3s+XL0Ph6h5Hwevrg888NjIiZ0rmK
         eHITOWBBDzmiydfATvoqi92u+t9LImeo1oHV4QWFSDXrLhzviEiQ9mkCP1ey8AID/JN/
         +0YA==
X-Gm-Message-State: AOJu0YzJuOkJoK2vuAB6G7jnmV9O88ozqTvQpeBMGFX9GusX8M7P3xbC
	2dk+y6sVKGyXIVJemfC9niE=
X-Google-Smtp-Source: AGHT+IGZhzU7Qyk2MyoQf1Zp/5vnzrokW8QNcWOQ7Ev+4nIUCfVlBEGrqv1QErDIM+/2cBLRg98POg==
X-Received: by 2002:aa7:c9d9:0:b0:534:8bdf:a258 with SMTP id i25-20020aa7c9d9000000b005348bdfa258mr6823355edt.31.1699958835166;
        Tue, 14 Nov 2023 02:47:15 -0800 (PST)
Received: from ?IPV6:2a01:c22:774d:c900:d8c1:a971:ec8:d2af? (dynamic-2a01-0c22-774d-c900-d8c1-a971-0ec8-d2af.c22.pool.telefonica.de. [2a01:c22:774d:c900:d8c1:a971:ec8:d2af])
        by smtp.googlemail.com with ESMTPSA id d17-20020aa7c1d1000000b0052febc781bfsm4940681edp.36.2023.11.14.02.47.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Nov 2023 02:47:14 -0800 (PST)
Message-ID: <ea31480f-2887-41fe-a560-f4bb1103479e@gmail.com>
Date: Tue, 14 Nov 2023 11:47:15 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] lockdep WARN at PCI device rescan
To: Wolfram Sang <wsa@kernel.org>,
 Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
 Jean Delvare <jdelvare@suse.de>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bjorn Helgaas <bhelgaas@google.com>
References: <6xb24fjmptxxn5js2fjrrddjae6twex5bjaftwqsuawuqqqydx@7cl3uik5ef6j>
 <ZVNJCxh5vgj22SfQ@shikoro>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <ZVNJCxh5vgj22SfQ@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.11.2023 11:16, Wolfram Sang wrote:
> On Tue, Nov 14, 2023 at 06:54:29AM +0000, Shinichiro Kawasaki wrote:
>> Hello there.
>>
>> Recently I tried a couple of commands below on the kernel v6.6 and v6.7-rc1,
>> then observed a lockdep WARN at the second command [1]. The first command
>> removes a PCI device, and the second command rescans whole PCI devices to
>> regain the removed device.
>>
>>  # echo 1 > /sys/bus/pci/devices/0000:51:00.0/remove
>>  # echo 1 > /sys/bus/pci/rescan
>>
>> I tried this rescan for SAS-HBA or AHCI controller with HDDs. When those devices
>> are left in weird status after some kernel tests, I want to remove the SAS-HBA
>> and AHCI controller and rescan to get back the devices in good status. This
>> rescan looks working good except the WARN.
>>
>> The lockdep splat indicates possible deadlock between pci_rescan_remove_lock
>> and work_completion lock have deadlock possibility. Is the lockdep WARN a known
>> issue? I found a similar discussion in the past [2], but it did not discuss the
>> work_completion lock, so my observation looks a new, different issue.
>>
>> In the call stack, I found that the workqueue thread for i801_probe() calls
>> p2sb_bar(), which locks pci_rescan_remove_lock. IMHO, the issue cause looks that
>> pci_rescan_remove_lock is locked in both workqueue context and non-workqueue
>> context. As a fix trial, I created a quick patch [3]. It calls i801_probe() in
>> non-workqueue context only by adding a new flag to struct pci_driver. With this,
>> I observed the lockdep WARN disappears. Is this a good solution approach? If
>> not, is there any other better solution?
> 
> Thanks for the report and the proposed solution. I'll add the i801
> experts, Jean and Heiner, to CC.
> 

+ Bjorn, Andy

i801 just uses p2sb_bar(), I don't see any issue in i801. Root cause seems to
be in the PCI subsystem. Calling p2sb_bar() from a PCI driver probe callback
seems to be problematic, nevertheless it's a valid API usage.

The proposed fix helps to get an idea of how to work around the issue.
But IMO it more cures a symptom than fixes the root cause.

>>
>> [1] kernel message log at the second command
>>
>> [  242.922091] ======================================================
>> [  242.931663] WARNING: possible circular locking dependency detected
>> [  242.938292] mpt3sas_cm1: 63 BIT PCI BUS DMA ADDRESSING SUPPORTED, total mem (56799464 kB)
>> [  242.939415] 6.7.0-rc1-kts #1 Not tainted
>> [  242.939419] ------------------------------------------------------
>> [  242.939421] bash/1615 is trying to acquire lock:
>> [  242.939424] ff1100017bf87910 ((work_completion)(&wfc.work)){+.+.}-{0:0}, at: __flush_work+0xc5/0x980
>> [  242.989069] 
>>                but task is already holding lock:
>> [  243.000283] ffffffff870bf4a8 (pci_rescan_remove_lock){+.+.}-{3:3}, at: rescan_store+0x96/0xd0
>> [  243.012269] 
>>                which lock already depends on the new lock.
>>
>> [  243.028569] 
>>                the existing dependency chain (in reverse order) is:
>> [  243.041611] 
>>                -> #1 (pci_rescan_remove_lock){+.+.}-{3:3}:
>> [  243.053709]        __mutex_lock+0x16a/0x1880
>> [  243.060767]        p2sb_bar+0xa7/0x250
>> [  243.067213]        i801_add_tco_spt.constprop.0+0x88/0x1f0 [i2c_i801]
>> [  243.076707]        i801_add_tco+0x18a/0x210 [i2c_i801]
>> [  243.084727]        i801_probe+0x99c/0x1500 [i2c_i801]
>> [  243.092618]        local_pci_probe+0xd6/0x190
>> [  243.099708]        work_for_cpu_fn+0x4e/0xa0
>> [  243.106673]        process_one_work+0x736/0x1230
>> [  243.114012]        worker_thread+0x723/0x1300
>> [  243.121039]        kthread+0x2ee/0x3d0
>> [  243.127372]        ret_from_fork+0x2d/0x70
>> [  243.134073]        ret_from_fork_asm+0x1b/0x30
>> [  243.141140] 
>>                -> #0 ((work_completion)(&wfc.work)){+.+.}-{0:0}:
>> [  243.153341]        __lock_acquire+0x2e74/0x5ea0
>> [  243.160490]        lock_acquire+0x196/0x4b0
>> [  243.167236]        __flush_work+0xe2/0x980
>> [  243.173882]        work_on_cpu_key+0xcc/0xf0
>> [  243.180709]        pci_device_probe+0x548/0x740
>> [  243.187813]        really_probe+0x3df/0xb80
>> [  243.194525]        __driver_probe_device+0x18c/0x450
>> [  243.202128]        driver_probe_device+0x4a/0x120
>> [  243.209437]        __device_attach_driver+0x15e/0x270
>> [  243.217149]        bus_for_each_drv+0x101/0x170
>> [  243.224260]        __device_attach+0x189/0x380
>> [  243.231254]        pci_bus_add_device+0x9f/0xf0
>> [  243.238360]        pci_bus_add_devices+0x7f/0x190
>> [  243.245639]        pci_bus_add_devices+0x114/0x190
>> [  243.253017]        pci_rescan_bus+0x23/0x30
>> [  243.259711]        rescan_store+0xa2/0xd0
>> [  243.266187]        kernfs_fop_write_iter+0x356/0x530
>> [  243.273735]        vfs_write+0x513/0xd60
>> [  243.280090]        ksys_write+0xe7/0x1b0
>> [  243.286412]        do_syscall_64+0x5d/0xe0
>> [  243.292908]        entry_SYSCALL_64_after_hwframe+0x6e/0x76
>> [  243.301053] 
>>                other info that might help us debug this:
>>
>> [  243.315550]  Possible unsafe locking scenario:
>>
>> [  243.325803]        CPU0                    CPU1
>> [  243.332654]        ----                    ----
>> [  243.339492]   lock(pci_rescan_remove_lock);
>> [  243.345937]                                lock((work_completion)(&wfc.work));
>> [  243.355852]                                lock(pci_rescan_remove_lock);
>> [  243.365170]   lock((work_completion)(&wfc.work));
>> [  243.372235] 
>>                 *** DEADLOCK ***
>>
>> [  243.384100] 5 locks held by bash/1615:
>> [  243.390048]  #0: ff1100013f4b0418 (sb_writers#4){.+.+}-{0:0}, at: ksys_write+0xe7/0x1b0
>> [  243.400833]  #1: ff11000128429888 (&of->mutex){+.+.}-{3:3}, at: kernfs_fop_write_iter+0x21d/0x530
>> [  243.412623]  #2: ff11000103849968 (kn->active#136){.+.+}-{0:0}, at: kernfs_fop_write_iter+0x241/0x530
>> [  243.424832]  #3: ffffffff870bf4a8 (pci_rescan_remove_lock){+.+.}-{3:3}, at: rescan_store+0x96/0xd0
>> [  243.436773]  #4: ff1100019cc7e1a8 (&dev->mutex){....}-{3:3}, at: __device_attach+0x67/0x380
>> [  243.448048] 
>>                stack backtrace:
>> [  243.456654] CPU: 16 PID: 1615 Comm: bash Not tainted 6.7.0-rc1-kts #1
>> [  243.465797] Hardware name: Supermicro SYS-520P-WTR/X12SPW-TF, BIOS 1.2 02/14/2022
>> [  243.476145] Call Trace:
>> [  243.480820]  <TASK>
>> [  243.485084]  dump_stack_lvl+0x57/0x90
>> [  243.491112]  check_noncircular+0x2e1/0x3c0
>> [  243.497630]  ? __pfx_check_noncircular+0x10/0x10
>> [  243.504747]  ? __pfx___bfs+0x10/0x10
>> [  243.510680]  ? lockdep_lock+0xbc/0x1a0
>> [  243.516811]  ? __pfx_lockdep_lock+0x10/0x10
>> [  243.523436]  __lock_acquire+0x2e74/0x5ea0
>> [  243.529866]  ? __pfx___lock_acquire+0x10/0x10
>> [  243.536682]  lock_acquire+0x196/0x4b0
>> [  243.542710]  ? __flush_work+0xc5/0x980
>> [  243.548829]  ? __pfx_lock_acquire+0x10/0x10
>> [  243.555442]  ? __pfx___lock_acquire+0x10/0x10
>> [  243.562252]  ? driver_probe_device+0x4a/0x120
>> [  243.569061]  ? __device_attach_driver+0x15e/0x270
>> [  243.576282]  ? mark_lock+0xee/0x16c0
>> [  243.582222]  ? __flush_work+0xc5/0x980
>> [  243.588364]  __flush_work+0xe2/0x980
>> [  243.594300]  ? __flush_work+0xc5/0x980
>> [  243.600425]  ? __queue_work+0x4e4/0xe30
>> [  243.606658]  ? __pfx___flush_work+0x10/0x10
>> [  243.613287]  ? lock_is_held_type+0xce/0x120
>> [  243.619917]  ? queue_work_on+0x69/0xa0
>> [  243.626032]  ? lockdep_hardirqs_on+0x7d/0x100
>> [  243.632834]  work_on_cpu_key+0xcc/0xf0
>> [  243.638950]  ? __pfx_work_on_cpu_key+0x10/0x10
>> [  243.645849]  ? __pfx_work_for_cpu_fn+0x10/0x10
>> [  243.652738]  ? __pfx_local_pci_probe+0x10/0x10
>> [  243.659638]  pci_device_probe+0x548/0x740
>> [  243.666057]  ? __pfx_pci_device_probe+0x10/0x10
>> [  243.673057]  ? kernfs_create_link+0x167/0x230
>> [  243.679855]  really_probe+0x3df/0xb80
>> [  243.685860]  __driver_probe_device+0x18c/0x450
>> [  243.692737]  driver_probe_device+0x4a/0x120
>> [  243.699314]  __device_attach_driver+0x15e/0x270
>> [  243.706297]  ? __pfx___device_attach_driver+0x10/0x10
>> [  243.713890]  bus_for_each_drv+0x101/0x170
>> [  243.720312]  ? __pfx_bus_for_each_drv+0x10/0x10
>> [  243.727294]  ? lockdep_hardirqs_on+0x7d/0x100
>> [  243.734063]  ? _raw_spin_unlock_irqrestore+0x35/0x60
>> [  243.741505]  __device_attach+0x189/0x380
>> [  243.747747]  ? __pfx___device_attach+0x10/0x10
>> [  243.754554]  pci_bus_add_device+0x9f/0xf0
>> [  243.760836]  pci_bus_add_devices+0x7f/0x190
>> [  243.767328]  pci_bus_add_devices+0x114/0x190
>> [  243.773890]  pci_rescan_bus+0x23/0x30
>> [  243.779741]  rescan_store+0xa2/0xd0
>> [  243.785362]  ? __pfx_rescan_store+0x10/0x10
>> [  243.791785]  kernfs_fop_write_iter+0x356/0x530
>> [  243.798516]  vfs_write+0x513/0xd60
>> [  243.804054]  ? __pfx_vfs_write+0x10/0x10
>> [  243.810193]  ? __fget_light+0x51/0x220
>> [  243.816125]  ? __pfx_lock_release+0x10/0x10
>> [  243.822555]  ksys_write+0xe7/0x1b0
>> [  243.828097]  ? __pfx_ksys_write+0x10/0x10
>> [  243.834327]  ? syscall_enter_from_user_mode+0x22/0x90
>> [  243.841736]  ? lockdep_hardirqs_on+0x7d/0x100
>> [  243.848366]  do_syscall_64+0x5d/0xe0
>> [  243.854114]  ? do_syscall_64+0x6c/0xe0
>> [  243.860053]  ? do_syscall_64+0x6c/0xe0
>> [  243.865989]  ? lockdep_hardirqs_on+0x7d/0x100
>> [  243.872608]  ? do_syscall_64+0x6c/0xe0
>> [  243.878537]  ? lockdep_hardirqs_on+0x7d/0x100
>> [  243.885147]  entry_SYSCALL_64_after_hwframe+0x6e/0x76
>> [  243.892555] RIP: 0033:0x7fee10d53c34
>> [  243.898305] Code: c7 00 16 00 00 00 b8 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 80 3d 35 77 0d 00 00 74 13 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 54 c3 0f 1f 00 55 48 89 e5 48 83 ec 20 48 89
>> [  243.922266] RSP: 002b:00007ffd173e68e8 EFLAGS: 00000202 ORIG_RAX: 0000000000000001
>> [  243.932655] RAX: ffffffffffffffda RBX: 0000000000000002 RCX: 00007fee10d53c34
>> [  243.942564] RDX: 0000000000000002 RSI: 000055f17c9c4bc0 RDI: 0000000000000001
>> [  243.952485] RBP: 00007ffd173e6910 R08: 0000000000000073 R09: 0000000000000001
>> [  243.962408] R10: 0000000000000000 R11: 0000000000000202 R12: 0000000000000002
>> [  243.972328] R13: 000055f17c9c4bc0 R14: 00007fee10e245c0 R15: 00007fee10e21f20
>> [  243.982259]  </TASK>
>>
>> [2] https://patchwork.kernel.org/project/linux-pci/patch/20180921205752.3191-1-keith.busch@intel.com/
>>
>> [3] fix trial patch
>>
>> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
>> index 070999139c6..00d57d4e006 100644
>> --- a/drivers/i2c/busses/i2c-i801.c
>> +++ b/drivers/i2c/busses/i2c-i801.c
>> @@ -1820,6 +1820,7 @@ static struct pci_driver i801_driver = {
>>  		.pm	= pm_sleep_ptr(&i801_pm_ops),
>>  		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
>>  	},
>> +	.local_probe	= true,
>>  };
>>  
>>  static int __init i2c_i801_init(struct pci_driver *drv)
>> diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
>> index 51ec9e7e784..161ff37143a 100644
>> --- a/drivers/pci/pci-driver.c
>> +++ b/drivers/pci/pci-driver.c
>> @@ -368,7 +368,7 @@ static int pci_call_probe(struct pci_driver *drv, struct pci_dev *dev,
>>  	 * device is probed from work_on_cpu() of the Physical device.
>>  	 */
>>  	if (node < 0 || node >= MAX_NUMNODES || !node_online(node) ||
>> -	    pci_physfn_is_probed(dev)) {
>> +	    pci_physfn_is_probed(dev) || drv->local_probe) {
>>  		cpu = nr_cpu_ids;
>>  	} else {
>>  		cpumask_var_t wq_domain_mask;
>> diff --git a/include/linux/pci.h b/include/linux/pci.h
>> index 60ca768bc86..6fd086eb26c 100644
>> --- a/include/linux/pci.h
>> +++ b/include/linux/pci.h
>> @@ -957,6 +957,7 @@ struct pci_driver {
>>  	struct device_driver	driver;
>>  	struct pci_dynids	dynids;
>>  	bool driver_managed_dma;
>> +	bool local_probe;
>>  };
>>  
>>  static inline struct pci_driver *to_pci_driver(struct device_driver *drv)
>>


