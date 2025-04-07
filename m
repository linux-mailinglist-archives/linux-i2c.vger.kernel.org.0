Return-Path: <linux-i2c+bounces-10189-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2FEA7EF55
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 22:34:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 343F018846D5
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 20:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AD672185AB;
	Mon,  7 Apr 2025 20:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="fHIPK4h5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BEA20B7EF;
	Mon,  7 Apr 2025 20:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744058053; cv=none; b=KogltAQ7BS9Ke+cCIyxVHwsMrHxANK/tydgBGY57UR4WR5mtmLvNY4OczQBmNdjEHvJmdWiOtZpNRSwmRhSciYUBo4V7ZUo9llIEZ1Pp0+nRou7F9jEiJojp56NxT/6P+3EwkbtWTufaEi1YT231PJMzEZtqTj1HopQV3zKmXL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744058053; c=relaxed/simple;
	bh=7eSKTrL7sY3FqaRuSBFO85TfDkrKJnCdqHKY/AQ/xZ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MemKA8ZDdxuuyjMFPkcllD8XzU/tYOC3p0W01WAJodBHkxzqHAsnyivHHt3ZmDbAQIJiB18nK7QatupERXn7bzyRp+bynM90tQmG5zUMJSyrAz3v2fwLZo6gbU6O5B0vgb1tEnERXQzWLZU5sk93QS+r5xw8mMa1/BNnK+iDJ5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=fHIPK4h5; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=DgSAqxzrl7FFLKj74nkQmugA4IRHf7ZiUXAWNrKe1/k=; b=fHIPK4h5uIHgkIFHMLwtqDYOSQ
	Y6an35xH3D9kl+nS8HOU+MgssGVtwFK9aoylOYcvheNe6MjFvisIMri8+eWI3ktoGlGxo1o/0lsTQ
	K/2qBi05tLihTRXdTIsDIpsXpuqe78AAFvePRkl0zAwmdytyn1OFkOCKeVFnmEl98zKxqvXoc2MsW
	h6k+IDzB+Ai5gK8ARkEee5RJv19IckujwYosPK9FvTiaDkMLQeFvTO+RaVhMXYm/fAz8Aer+sMOfN
	8bKbtyH1Pe1iTxLUqe/ljJpVFZUKFRBeDLl6NrVRUVgyM6sEwlgLhyQlZIjo1g7N3993quFNt5NcM
	pRLGg0KA==;
Received: from 179-125-75-236-dinamico.pombonet.net.br ([179.125.75.236] helo=[192.168.67.187])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1u1tAS-00D1yP-4b; Mon, 07 Apr 2025 22:34:04 +0200
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Date: Mon, 07 Apr 2025 17:33:34 -0300
Subject: [PATCH] i2c: cros-ec-tunnel: defer probe if parent EC is not
 present
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-null-ec-parent-v1-1-f7dda62d3110@igalia.com>
X-B4-Tracking: v=1; b=H4sIAJ429GcC/x3MMQqAMAxA0atIZgNtoyheRRykRg1IlVRFkN7d4
 viG/1+IrMIRuuIF5Vui7CHDlgX4dQwLo0zZ4IyrDZHFcG0bssdjVA4nUmNsy3NbNUSQo0N5luc
 f9kNKH9K+yRtgAAAA
X-Change-ID: 20250331-null-ec-parent-37018ef84733
To: Andi Shyti <andi.shyti@kernel.org>, Benson Leung <bleung@chromium.org>, 
 Guenter Roeck <groeck@chromium.org>, Doug Anderson <dianders@chromium.org>, 
 Vincent Palatin <vpalatin@chromium.org>, Simon Glass <sjg@chromium.org>, 
 Lee Jones <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c@vger.kernel.org, chrome-platform@lists.linux.dev, 
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com, 
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
X-Mailer: b4 0.14.2

When i2c-cros-ec-tunnel and the EC driver are built-in, the EC parent
device will not be found, leading to NULL pointer dereference.

That can also be reproduced by unbinding the controller driver and then
loading i2c-cros-ec-tunnel module (or binding the device).

[  271.991245] BUG: kernel NULL pointer dereference, address: 0000000000000058
[  271.998215] #PF: supervisor read access in kernel mode
[  272.003351] #PF: error_code(0x0000) - not-present page
[  272.008485] PGD 0 P4D 0
[  272.011022] Oops: Oops: 0000 [#1] SMP NOPTI
[  272.015207] CPU: 0 UID: 0 PID: 3859 Comm: insmod Tainted: G S                  6.15.0-rc1-00004-g44722359ed83 #30 PREEMPT(full)  3c7fb39a552e7d949de2ad921a7d6588d3a4fdc5
[  272.030312] Tainted: [S]=CPU_OUT_OF_SPEC
[  272.034233] Hardware name: HP Berknip/Berknip, BIOS Google_Berknip.13434.356.0 05/17/2021
[  272.042400] RIP: 0010:ec_i2c_probe+0x2b/0x1c0 [i2c_cros_ec_tunnel]
[  272.048577] Code: 1f 44 00 00 41 57 41 56 41 55 41 54 53 48 83 ec 10 65 48 8b 05 06 a0 6c e7 48 89 44 24 08 4c 8d 7f 10 48 8b 47 50 4c 8b 60 78 <49> 83 7c 24 58 00 0f 84 2f 01 00 00 48 89 fb be 30 06 00 00 4c 9
[  272.067317] RSP: 0018:ffffa32082a03940 EFLAGS: 00010282
[  272.072541] RAX: ffff969580b6a810 RBX: ffff969580b68c10 RCX: 0000000000000000
[  272.079672] RDX: 0000000000000000 RSI: 0000000000000282 RDI: ffff969580b68c00
[  272.086804] RBP: 00000000fffffdfb R08: 0000000000000000 R09: 0000000000000000
[  272.093936] R10: 0000000000000000 R11: ffffffffc0600000 R12: 0000000000000000
[  272.101067] R13: ffffffffa666fbb8 R14: ffffffffc05b5528 R15: ffff969580b68c10
[  272.108198] FS:  00007b930906fc40(0000) GS:ffff969603149000(0000) knlGS:0000000000000000
[  272.116282] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  272.122024] CR2: 0000000000000058 CR3: 000000012631c000 CR4: 00000000003506f0
[  272.129155] Call Trace:
[  272.131606]  <TASK>
[  272.133709]  ? acpi_dev_pm_attach+0xdd/0x110
[  272.137985]  platform_probe+0x69/0xa0
[  272.141652]  really_probe+0x152/0x310
[  272.145318]  __driver_probe_device+0x77/0x110
[  272.149678]  driver_probe_device+0x1e/0x190
[  272.153864]  __driver_attach+0x10b/0x1e0
[  272.157790]  ? driver_attach+0x20/0x20
[  272.161542]  bus_for_each_dev+0x107/0x150
[  272.165553]  bus_add_driver+0x15d/0x270
[  272.169392]  driver_register+0x65/0x110
[  272.173232]  ? cleanup_module+0xa80/0xa80 [i2c_cros_ec_tunnel 3a00532f3f4af4a9eade753f86b0f8dd4e4e5698]
[  272.182617]  do_one_initcall+0x110/0x350
[  272.186543]  ? security_kernfs_init_security+0x49/0xd0
[  272.191682]  ? __kernfs_new_node+0x1b9/0x240
[  272.195954]  ? security_kernfs_init_security+0x49/0xd0
[  272.201093]  ? __kernfs_new_node+0x1b9/0x240
[  272.205365]  ? kernfs_link_sibling+0x105/0x130
[  272.209810]  ? kernfs_next_descendant_post+0x1c/0xa0
[  272.214773]  ? kernfs_activate+0x57/0x70
[  272.218699]  ? kernfs_add_one+0x118/0x160
[  272.222710]  ? __kernfs_create_file+0x71/0xa0
[  272.227069]  ? sysfs_add_bin_file_mode_ns+0xd6/0x110
[  272.232033]  ? internal_create_group+0x453/0x4a0
[  272.236651]  ? __vunmap_range_noflush+0x214/0x2d0
[  272.241355]  ? __free_frozen_pages+0x1dc/0x420
[  272.245799]  ? free_vmap_area_noflush+0x10a/0x1c0
[  272.250505]  ? load_module+0x1509/0x16f0
[  272.254431]  do_init_module+0x60/0x230
[  272.258181]  __se_sys_finit_module+0x27a/0x370
[  272.262627]  do_syscall_64+0x6a/0xf0
[  272.266206]  ? do_syscall_64+0x76/0xf0
[  272.269956]  ? irqentry_exit_to_user_mode+0x79/0x90
[  272.274836]  entry_SYSCALL_64_after_hwframe+0x55/0x5d
[  272.279887] RIP: 0033:0x7b9309168d39
[  272.283466] Code: 5b 41 5c 5d c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d af 40 0c 00 f7 d8 64 89 01 8
[  272.302210] RSP: 002b:00007fff50f1a288 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[  272.309774] RAX: ffffffffffffffda RBX: 000058bf9b50f6d0 RCX: 00007b9309168d39
[  272.316905] RDX: 0000000000000000 RSI: 000058bf6c103a77 RDI: 0000000000000003
[  272.324036] RBP: 00007fff50f1a2e0 R08: 00007fff50f19218 R09: 0000000021ec4150
[  272.331166] R10: 000058bf9b50f7f0 R11: 0000000000000246 R12: 0000000000000000
[  272.338296] R13: 00000000fffffffe R14: 0000000000000000 R15: 000058bf6c103a77
[  272.345428]  </TASK>
[  272.347617] Modules linked in: i2c_cros_ec_tunnel(+)
[  272.364585] gsmi: Log Shutdown Reason 0x03

Returning -EPROBE_DEFER will allow the device to be bound once the
controller is bound, in the case of built-in drivers.

Fixes: 9d230c9e4f4e ("i2c: ChromeOS EC tunnel driver")
Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
---
 drivers/i2c/busses/i2c-cros-ec-tunnel.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i2c/busses/i2c-cros-ec-tunnel.c b/drivers/i2c/busses/i2c-cros-ec-tunnel.c
index 43bf90d90eebabe88af2d6a32a299da9175799e9..208ce4f9e782cdc5e08a5c91ccc8ddfeb4c6ef04 100644
--- a/drivers/i2c/busses/i2c-cros-ec-tunnel.c
+++ b/drivers/i2c/busses/i2c-cros-ec-tunnel.c
@@ -247,6 +247,9 @@ static int ec_i2c_probe(struct platform_device *pdev)
 	u32 remote_bus;
 	int err;
 
+	if (!ec)
+		return dev_err_probe(dev, -EPROBE_DEFER, "couldn't find parent EC device\n");
+
 	if (!ec->cmd_xfer) {
 		dev_err(dev, "Missing sendrecv\n");
 		return -EINVAL;

---
base-commit: abc16e78abb442bfbfb6497712d64500a6ed8c2f
change-id: 20250331-null-ec-parent-37018ef84733

Best regards,
-- 
Thadeu Lima de Souza Cascardo <cascardo@igalia.com>


