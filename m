Return-Path: <linux-i2c+bounces-2042-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1C086A6A9
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Feb 2024 03:39:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7936F1F28ECD
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Feb 2024 02:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBD811CD0F;
	Wed, 28 Feb 2024 02:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="UXSuuIK9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4CA1CD13
	for <linux-i2c@vger.kernel.org>; Wed, 28 Feb 2024 02:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709087986; cv=none; b=lJcbuGsZpMV4bcBd/ekesFJrqsQM2ko+2qCKudFpU6hbaannCqV9NA6iIyFsTD7EZVTTyLHogPECVz85K+kgCkSWX933mYt+F9K6M/xSdQh0K47GP2c7pKd1IQcxpHdS4/XKi6NpqhV5FMSif72O0JqPrUrZt6RjyXIvXHZV18c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709087986; c=relaxed/simple;
	bh=DYKsPK+nAJRHdem3y+JromxDS/bOMz+5yFpxfUA6UcY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O52x4zwWBf64/uqTwkP7i0StOdt1uziUcoYhn4CTdAvRbFgDaeM9mY0470Eyr8FBNbP88Hojqt9xiSN37oUk2WXNZ6lSuypdggicq0GQhIKC8BAIKebBbftiCo+cNYEiSUrDAT49l60L3G9E0ajowkuvYvvgFF8YpHbzI6avPCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=UXSuuIK9; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 9A60E2C0F60;
	Wed, 28 Feb 2024 15:39:40 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1709087980;
	bh=74NS7Xkcqh5ka9xf2XrX1XQHgALZjeqj8WkhUPSZZYM=;
	h=From:To:Cc:Subject:Date:From;
	b=UXSuuIK9goyR5rN58VCscnPrD5Gxu2sbEi8E91bvR3saSdYexpO5T4Ly3bikpM/eY
	 j8XYiXS6irm4PFryVhI7i3V0Rv7F2hJtFEwKs8TfYJ5IQN815L2syrq68NLAzwBGo1
	 xiS0h1te7BnNazxVGFDaGAzFf6X0+21H78AE035fdUNWFXTRA1N7Po3UWnOIPxjjSV
	 uZLF2vjO1RZ301DjltHrNgqF+Wre3BcfU1rVGyr15Opvt+zZwgFKKfOaxnYxY7B5ZI
	 qmk9VFzYJJG8rb7gqgaXwfLI7MZKbIa5tzy9X9N77E+XBmsEGo/vMqrnAgXS+Z5O6r
	 21ooNiWJokoxQ==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B65de9cec0000>; Wed, 28 Feb 2024 15:39:40 +1300
Received: from hamishm-dl.ws.atlnz.lc (hamishm-dl.ws.atlnz.lc [10.33.24.13])
	by pat.atlnz.lc (Postfix) with ESMTP id 70F7F13EDA8;
	Wed, 28 Feb 2024 15:39:40 +1300 (NZDT)
Received: by hamishm-dl.ws.atlnz.lc (Postfix, from userid 1133)
	id 6D19B240BBF; Wed, 28 Feb 2024 15:39:40 +1300 (NZDT)
From: Hamish Martin <hamish.martin@alliedtelesis.co.nz>
To: mika.westerberg@linux.intel.com,
	wsa+renesas@sang-engineering.com
Cc: linux-i2c@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	Hamish Martin <hamish.martin@alliedtelesis.co.nz>
Subject: [PATCH 0/1] I2C mux ACPI SSDT overlay removal issue
Date: Wed, 28 Feb 2024 15:39:24 +1300
Message-ID: <20240228023925.2814638-1-hamish.martin@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=BKkQr0QG c=1 sm=1 tr=0 ts=65de9cec a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=k7vzHIieQBIA:10 a=nXG3BeEQHGMQi2UDEzgA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

I have found an issue with ACPI overlay table removal specifically relate=
d to I2C multiplexers.

Consider an ACPI SSDT Overlay such as the following which defines a PCA95=
48 I2C mux "MUX0" on the existing I2C bus "\_SB.I2CA":

DefinitionBlock ("my_mux.asl", "SSDT", 1, "ATL", "RMUX", 0x00000001)
{
    External (\_SB.I2CA, DeviceObj)

    Scope (\_SB.I2CA)
    {
        // i2c mux (8-Channel)
        Device (MUX0)
        {
            Name (_HID, "PRP0001")  // Use compatible string
            Name (_CRS, ResourceTemplate ()
            {
                I2cSerialBusV2 (0x70, ControllerInitiated,
                                100000, AddressingMode7Bit,
                                "\\_SB.I2CA", 0x00,
                                ResourceConsumer, , Exclusive, )
            })
            Name (_DSD, Package ()
            {
                ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"), // Devic=
e Properties UUID
                Package ()
                {
                    Package () { "name", "cex_direct_mux" },
                    Package () { "compatible", "nxp,pca9548" },
                    Package () { "i2c-mux-idle-disconnect", "" },
                }
            })

            Device (CH00) { name (_ADR, 0) }
            Device (CH01) { name (_ADR, 1) }
            Device (CH02) { name (_ADR, 2) }
            Device (CH03) { name (_ADR, 3) }
            Device (CH04) { name (_ADR, 4) }
            Device (CH05) { name (_ADR, 5) }
            Device (CH06) { name (_ADR, 6) }
            Device (CH07) { name (_ADR, 7) }
        }
    }
}

When this table is loaded (using configfs method) we see the creation of =
a device for the overall PCA9548 chip and 8 further devices - one i2c_ada=
pter each for the mux channels. These are all bound to their ACPI equival=
ents via an eventual invocation of acpi_bind_one().

When we unload the SSDT overlay (rmdir /sys/kernel/config/acpi/table/my_m=
ux/) we run into the problem. The ACPI devices are deleted via acpi_devic=
e_del_work_fn() and the acpi_device_del_list.=20

The following warning and stack trace is output as the deletion does not =
go smoothly:
# rmdir /sys/kernel/config/acpi/table/my_mux/
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

The issue as I see it is that the binding of the ACPI devices to their pe=
er I2C adapters is not correctly cleaned up.=20
Digging deeper into the issue we see that the deletion order is such that=
 the ACPI devices matching the mux channel i2c adapters are deleted first=
 during the SSDT overlay removal. For each of the channels we see a call =
to i2c_acpi_notify() with ACPI_RECONFIG_DEVICE_REMOVE but, because these =
devices are not actually i2c_clients, nothing is done for them.=20

Later on, after each of the mux channels has been dealt with, we come to =
delete the i2c_client representing the PCA9548 device. This is the call s=
tack we see above, whereby the kernel cleans up the i2c_client including =
destruction of the mux and it's channel adapters (i2c_mux_del_adapters() =
-> i2c_del_adapter()). At this point we do attempt to unbind from the ACP=
I peers but those peers no longer exist and so we hit the kernfs errors.

My proposed fix is to augment i2c_acpi_notify() to handle i2c_adapters. B=
ut, given that the life cycle of the adapters is linked to the i2c_client=
, instead of deleting the i2c_adapters during the i2c_acpi_notify(), we i=
nstead just trigger unbinding of the ACPI device from the adapter device,=
 and allow the cleanup of the adapter to continue in the way it always ha=
s.

This fix resolves my specific issue with the I2C mux removal. However, I'=
m not sure about whether there is a better fix for this issue so if you h=
ave suggestions please let me know. I'm not sure if there needs to be fur=
ther code to ensure this new code only runs for this specific case where =
the i2c_adapters are part of an i2c mux. Guidance on this would be apprec=
iated.

Hamish Martin (1):
  i2c: acpi: Unbind mux adapters before delete

 drivers/i2c/i2c-core-acpi.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

--=20
2.43.0


