Return-Path: <linux-i2c+bounces-2081-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B2186D65D
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Feb 2024 22:49:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1780D2848DC
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Feb 2024 21:49:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47C5616FF57;
	Thu, 29 Feb 2024 21:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="EEbdNBmz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDC141C77
	for <linux-i2c@vger.kernel.org>; Thu, 29 Feb 2024 21:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709243389; cv=none; b=m96FPDJHIHiNrkO5gM8rtcYig4bjLXWC5SLgnQk+kbMDxke7Z+cWLek43wvdUkgh7ZiqUmbuJXGsNJkloBqOIXxYPhi0VD8CQhauKBEpC4AzBeFEt8vtijrPG19kbxY5f0RxXfksE+uw3plJrPiUoC+MvdPHixfvpabMuHQ4s1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709243389; c=relaxed/simple;
	bh=3+1ZLdnGMWX22jYmyu1Zi8TtnBriiTsmJIXNQZ1Lvmo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QRF6XI4Iy3nnQZ8carRbkfowF2O+DckqIJmXmmh1LiyUMUaB274sGRsAy84oi2AoZ+c/Lqku8mFFC1rCKndHTDmjzQ8beeV10k4xyJHRaEXP7b50plS1egSTSpaCVp76f0DNCC0BGs9gKFEgLI8fB8sBjtT6G2Wny8TYa3GO0A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=EEbdNBmz; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 93D5D2C0108;
	Fri,  1 Mar 2024 10:49:43 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1709243383;
	bh=4x7y0nec21l1pERK1dJUUrTO8P6G+6T5s2cw+RzZky4=;
	h=From:To:Cc:Subject:Date:From;
	b=EEbdNBmzImu7rSjZfJf3cNlGheYQDqcDl5pCIpeb9KagG2ssgmbZfD+Rpp7hnJrHF
	 zBm8Sk7WkJpqp6Brh3BuZk1QxGSWKkWTWKii7L+YtuTKqPdT5vtPt1zlvdIhTwH9KN
	 y8xrQVumdUTvFB2XBOvBsrX7vpEOx+oDlQ5gdqPLZiZTSnMVWyPSJ+utwyAwy958i7
	 3hj5/NsodbPkwWD1zXrZlMARIW+VIn2CzsPBioKTpqhPQAi1a+8pVI25CBrcAeZVp9
	 /RZ2+kYO4z4PyT2w9Y5JL1vyxjP3qbCrYVqGjUR+ZH5DqoSJr2vhMiQlD8Gutfwfoa
	 msCvJVhF4SN7g==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B65e0fbf70000>; Fri, 01 Mar 2024 10:49:43 +1300
Received: from hamishm-dl.ws.atlnz.lc (hamishm-dl.ws.atlnz.lc [10.33.24.13])
	by pat.atlnz.lc (Postfix) with ESMTP id 5BEEF13EDA8;
	Fri,  1 Mar 2024 10:49:43 +1300 (NZDT)
Received: by hamishm-dl.ws.atlnz.lc (Postfix, from userid 1133)
	id 584D0240A76; Fri,  1 Mar 2024 10:49:43 +1300 (NZDT)
From: Hamish Martin <hamish.martin@alliedtelesis.co.nz>
To: mika.westerberg@linux.intel.com,
	wsa+renesas@sang-engineering.com
Cc: linux-i2c@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	Hamish Martin <hamish.martin@alliedtelesis.co.nz>
Subject: [PATCH v2 1/1] i2c: acpi: Unbind mux adapters before delete
Date: Fri,  1 Mar 2024 10:49:39 +1300
Message-ID: <20240229214940.299586-1-hamish.martin@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=BKkQr0QG c=1 sm=1 tr=0 ts=65e0fbf7 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=K6JAEmCyrfEA:10 a=1q8fwcNTFP7Op90FAO0A:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

There is an issue with ACPI overlay table removal specifically related
to I2C multiplexers.

Consider an ACPI SSDT Overlay that defines a PCA9548 I2C mux on an
existing I2C bus. When this table is loaded we see the creation of a
device for the overall PCA9548 chip and 8 further devices - one
i2c_adapter each for the mux channels. These are all bound to their
ACPI equivalents via an eventual invocation of acpi_bind_one().

When we unload the SSDT overlay we run into the problem. The ACPI
devices are deleted as normal via acpi_device_del_work_fn() and the
acpi_device_del_list.

However, the following warning and stack trace is output as the
deletion does not go smoothly:
------------[ cut here ]------------
kernfs: can not remove 'physical_node', no directory
WARNING: CPU: 1 PID: 11 at fs/kernfs/dir.c:1674 kernfs_remove_by_name_ns+=
0xb9/0xc0
Modules linked in:
CPU: 1 PID: 11 Comm: kworker/u128:0 Not tainted 6.8.0-rc6+ #1
Hardware name: congatec AG conga-B7E3/conga-B7E3, BIOS 5.13 05/16/2023
Workqueue: kacpi_hotplug acpi_device_del_work_fn
RIP: 0010:kernfs_remove_by_name_ns+0xb9/0xc0
Code: e4 00 48 89 ef e8 07 71 db ff 5b b8 fe ff ff ff 5d 41 5c 41 5d e9 a=
7 55 e4 00 0f 0b eb a6 48 c7 c7 f0 38 0d 9d e8 97 0a d5 ff <0f> 0b eb dc =
0f 1f 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90
RSP: 0018:ffff9f864008fb28 EFLAGS: 00010286
RAX: 0000000000000000 RBX: ffff8ef90a8d4940 RCX: 0000000000000000
RDX: ffff8f000e267d10 RSI: ffff8f000e25c780 RDI: ffff8f000e25c780
RBP: ffff8ef9186f9870 R08: 0000000000013ffb R09: 00000000ffffbfff
R10: 00000000ffffbfff R11: ffff8f000e0a0000 R12: ffff9f864008fb50
R13: ffff8ef90c93dd60 R14: ffff8ef9010d0958 R15: ffff8ef9186f98c8
FS:  0000000000000000(0000) GS:ffff8f000e240000(0000) knlGS:0000000000000=
000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f48f5253a08 CR3: 00000003cb82e000 CR4: 00000000003506f0
Call Trace:
 <TASK>
 ? kernfs_remove_by_name_ns+0xb9/0xc0
 ? __warn+0x7c/0x130
 ? kernfs_remove_by_name_ns+0xb9/0xc0
 ? report_bug+0x171/0x1a0
 ? handle_bug+0x3c/0x70
 ? exc_invalid_op+0x17/0x70
 ? asm_exc_invalid_op+0x1a/0x20
 ? kernfs_remove_by_name_ns+0xb9/0xc0
 ? kernfs_remove_by_name_ns+0xb9/0xc0
 acpi_unbind_one+0x108/0x180
 device_del+0x18b/0x490
 ? srso_return_thunk+0x5/0x5f
 ? srso_return_thunk+0x5/0x5f
 device_unregister+0xd/0x30
 i2c_del_adapter.part.0+0x1bf/0x250
 i2c_mux_del_adapters+0xa1/0xe0
 i2c_device_remove+0x1e/0x80
 device_release_driver_internal+0x19a/0x200
 bus_remove_device+0xbf/0x100
 device_del+0x157/0x490
 ? __pfx_device_match_fwnode+0x10/0x10
 ? srso_return_thunk+0x5/0x5f
 device_unregister+0xd/0x30
 i2c_acpi_notify+0x10f/0x140
 notifier_call_chain+0x58/0xd0
 blocking_notifier_call_chain+0x3a/0x60
 acpi_device_del_work_fn+0x85/0x1d0
 process_one_work+0x134/0x2f0
 worker_thread+0x2f0/0x410
 ? __pfx_worker_thread+0x10/0x10
 kthread+0xe3/0x110
 ? __pfx_kthread+0x10/0x10
 ret_from_fork+0x2f/0x50
 ? __pfx_kthread+0x10/0x10
 ret_from_fork_asm+0x1b/0x30
 </TASK>
---[ end trace 0000000000000000 ]---
...
repeated 7 more times, 1 for each channel of the mux
...

The issue is that the binding of the ACPI devices to their peer I2C
adapters is not correctly cleaned up. Digging deeper into the issue we
see that the deletion order is such that the ACPI devices matching the
mux channel i2c adapters are deleted first during the SSDT overlay
removal. For each of the channels we see a call to i2c_acpi_notify()
with ACPI_RECONFIG_DEVICE_REMOVE but, because these devices are not
actually i2c_clients, nothing is done for them.

Later on, after each of the mux channels has been dealt with, we come
to delete the i2c_client representing the PCA9548 device. This is the
call stack we see above, whereby the kernel cleans up the i2c_client
including destruction of the mux and its channel adapters. At this
point we do attempt to unbind from the ACPI peers but those peers no
longer exist and so we hit the kernfs errors.

The fix is to augment i2c_acpi_notify() to handle i2c_adapters. But,
given that the life cycle of the adapters is linked to the i2c_client,
instead of deleting the i2c_adapters during the i2c_acpi_notify(), we
just trigger unbinding of the ACPI device from the adapter device, and
allow the clean up of the adapter to continue in the way it always has.

Signed-off-by: Hamish Martin <hamish.martin@alliedtelesis.co.nz>
---
 drivers/i2c/i2c-core-acpi.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index d6037a328669..67fa8deccef6 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -445,6 +445,11 @@ static struct i2c_client *i2c_acpi_find_client_by_ad=
ev(struct acpi_device *adev)
 	return i2c_find_device_by_fwnode(acpi_fwnode_handle(adev));
 }
=20
+static struct i2c_adapter *i2c_acpi_find_adapter_by_adev(struct acpi_dev=
ice *adev)
+{
+	return i2c_find_adapter_by_fwnode(acpi_fwnode_handle(adev));
+}
+
 static int i2c_acpi_notify(struct notifier_block *nb, unsigned long valu=
e,
 			   void *arg)
 {
@@ -471,11 +476,17 @@ static int i2c_acpi_notify(struct notifier_block *n=
b, unsigned long value,
 			break;
=20
 		client =3D i2c_acpi_find_client_by_adev(adev);
-		if (!client)
-			break;
+		if (client) {
+			i2c_unregister_device(client);
+			put_device(&client->dev);
+		}
+
+		adapter =3D i2c_acpi_find_adapter_by_adev(adev);
+		if (adapter) {
+			acpi_device_notify_remove(&adapter->dev);
+			put_device(&adapter->dev);
+		}
=20
-		i2c_unregister_device(client);
-		put_device(&client->dev);
 		break;
 	}
=20
--=20
2.43.0


