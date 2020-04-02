Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 509FE19BF65
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Apr 2020 12:34:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387972AbgDBKev (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Apr 2020 06:34:51 -0400
Received: from mga17.intel.com ([192.55.52.151]:11633 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387709AbgDBKev (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 2 Apr 2020 06:34:51 -0400
IronPort-SDR: acahSyckWk4vtwftEPcOL6VdNlHeeFnvxdh+hjTdekymvV6lgG+FZ37fNDvb+E1PE+6R11DFK0
 qyEfTf94eVAg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2020 03:34:49 -0700
IronPort-SDR: x1SMarOvKyOMzGfNszmZdzBhA2BSgS5sBkKeQNwkbLZJffPM/sxewNFyBYVS5YmL9ZWFGZyhYf
 q7TpgjW0vZPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,335,1580803200"; 
   d="scan'208";a="360157801"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 02 Apr 2020 03:34:48 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 02 Apr 2020 13:34:47 +0300
Date:   Thu, 2 Apr 2020 13:34:47 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Jian-Hong Pan <jian-hong@endlessm.com>,
        Ajay Gupta <ajayg@nvidia.com>
Cc:     linux-i2c@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        linux-usb@vger.kernel.org,
        Linux Upstreaming Team <linux@endlessm.com>
Subject: Re: [BUG] i2c_nvidia_gpu takes long time and makes system suspend &
 resume failed with NVIDIA cards
Message-ID: <20200402103447.GD1886416@kuha.fi.intel.com>
References: <CAPpJ_edj++oy7_EDN95tM+BPdYFOztpCrRh-cfzFrY6unJb1Rw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPpJ_edj++oy7_EDN95tM+BPdYFOztpCrRh-cfzFrY6unJb1Rw@mail.gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On Thu, Apr 02, 2020 at 06:22:14PM +0800, Jian-Hong Pan wrote:
> Hi,
> 
> We got some machines like Acer desktop equipped with NVIDIA GTX 1660
> card, Acer Predator PH315-52 equipped with NVIDIA GeForce RTX 2060
> Mobile and ASUS UX581LV equipped with NNVIDIA GeForce RTX 2060.
> We found them take long time (more than 50 seconds) to resume after
> suspend.  During the resuming time, the screen is blank.  And check
> the dmesg, found the error during resume:
> 
> [   28.060831] PM: suspend entry (deep)
> [   28.144260] Filesystems sync: 0.083 seconds
> [   28.150219] Freezing user space processes ...
> [   48.153282] Freezing of tasks failed after 20.003 seconds (1 tasks
> refusing to freeze, wq_busy=0):
> [   48.153447] systemd-udevd   D13440   382    330 0x80004124
> [   48.153457] Call Trace:
> [   48.153504]  ? __schedule+0x272/0x5a0
> [   48.153558]  ? hrtimer_start_range_ns+0x18c/0x2c0
> [   48.153622]  schedule+0x45/0xb0
> [   48.153668]  schedule_hrtimeout_range_clock+0x8f/0x100
> [   48.153738]  ? hrtimer_init_sleeper+0x80/0x80
> [   48.153798]  usleep_range+0x5a/0x80
> [   48.153850]  gpu_i2c_check_status.isra.0+0x3a/0xa0 [i2c_nvidia_gpu]
> [   48.153933]  gpu_i2c_master_xfer+0x155/0x20e [i2c_nvidia_gpu]
> [   48.154012]  __i2c_transfer+0x163/0x4c0
> [   48.154067]  i2c_transfer+0x6e/0xc0
> [   48.154120]  ccg_read+0x11f/0x170 [ucsi_ccg]
> [   48.154182]  get_fw_info+0x17/0x50 [ucsi_ccg]
> [   48.154242]  ucsi_ccg_probe+0xf4/0x200 [ucsi_ccg]
> [   48.154312]  ? ucsi_ccg_init+0xe0/0xe0 [ucsi_ccg]
> [   48.154377]  i2c_device_probe+0x113/0x210
> [   48.154435]  really_probe+0xdf/0x280
> [   48.154487]  driver_probe_device+0x4b/0xc0
> [   48.154545]  device_driver_attach+0x4e/0x60
> [   48.154604]  __driver_attach+0x44/0xb0
> [   48.154657]  ? device_driver_attach+0x60/0x60
> [   48.154717]  bus_for_each_dev+0x6c/0xb0
> [   48.154772]  bus_add_driver+0x172/0x1c0
> [   48.154824]  driver_register+0x67/0xb0
> [   48.154877]  i2c_register_driver+0x39/0x70
> [   48.154932]  ? 0xffffffffc00ac000
> [   48.154978]  do_one_initcall+0x3e/0x1d0
> [   48.155032]  ? free_vmap_area_noflush+0x8d/0xe0
> [   48.155093]  ? _cond_resched+0x10/0x20
> [   48.155145]  ? kmem_cache_alloc_trace+0x3a/0x1b0
> [   48.155208]  do_init_module+0x56/0x200
> [   48.155260]  load_module+0x21fe/0x24e0
> [   48.155322]  ? __do_sys_finit_module+0xbf/0xe0
> [   48.155381]  __do_sys_finit_module+0xbf/0xe0
> [   48.155441]  do_syscall_64+0x3d/0x130
> [   48.156841]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> [   48.158074] RIP: 0033:0x7fba3b4bc2a9
> [   48.158707] Code: Bad RIP value.
> [   48.158990] RSP: 002b:00007ffe1da3a6d8 EFLAGS: 00000246 ORIG_RAX:
> 0000000000000139
> [   48.159259] RAX: ffffffffffffffda RBX: 000055ca6922c470 RCX: 00007fba3b4bc2a9
> [   48.159566] RDX: 0000000000000000 RSI: 00007fba3b3c0cad RDI: 0000000000000010
> [   48.159842] RBP: 00007fba3b3c0cad R08: 0000000000000000 R09: 0000000000000000
> [   48.160117] R10: 0000000000000010 R11: 0000000000000246 R12: 0000000000000000
> [   48.160412] R13: 000055ca6922f940 R14: 0000000000020000 R15: 000055ca6922c470
> 
> I have filed this to bugzilla and more detail:
> https://bugzilla.kernel.org/show_bug.cgi?id=206653
> 
> Any comment will be appreciated.

You are using an outdated kernel, 5.4.0. Please make sure that you can
reproduce the issue with mainline, or at least with the longterm
5.4.x.

Ajay, based on the backtrace, the issue seems to be starting from your
I2C driver. Please take a look at this.


thanks,

-- 
heikki
