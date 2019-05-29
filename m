Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B92A22DF70
	for <lists+linux-i2c@lfdr.de>; Wed, 29 May 2019 16:16:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726820AbfE2OQo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 May 2019 10:16:44 -0400
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:41329 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727030AbfE2OQo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 May 2019 10:16:44 -0400
Received: from Internal Mail-Server by MTLPINE2 (envelope-from vadimp@mellanox.com)
        with ESMTPS (AES256-SHA encrypted); 29 May 2019 17:16:41 +0300
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id x4TEGfpZ019088;
        Wed, 29 May 2019 17:16:41 +0300
From:   Vadim Pasternak <vadimp@mellanox.com>
To:     wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org, michaelsh@mellanox.com,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH v1 i2c-next] i2c: mlxcpld: prevent devices from being unbounded from driver via sysfs
Date:   Wed, 29 May 2019 14:16:36 +0000
Message-Id: <20190529141636.6043-1-vadimp@mellanox.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Rule out the possibility of unbinding 'mlxcpld_i2c_driver' from a
device via sysfs, by setting "suppress_bind_attrs" to "true".
'i2c_mlxcpld' is a platform drivers and it registered via
platform_driver_probe() and can be bound to devices only once, upon
registration.

It fixes the issue found while running kernel with the option
CONFIG_DEBUG_TEST_DRIVER_REMOVE.
Driver 'mlx-platform' registers 'i2c_mlxcpld' device and then registers
few underlying 'i2c-mux-reg' devices:
	priv->pdev_i2c = platform_device_register_simple("i2c_mlxcpld", nr,
							 NULL, 0);
	if (IS_ERR(priv->pdev_i2c)) {
		err = PTR_ERR(priv->pdev_i2c);
		goto fail_alloc;
	}

	for (i = 0; i < ARRAY_SIZE(mlxplat_mux_data); i++) {
		priv->pdev_mux[i] = platform_device_register_resndata(
						&mlxplat_dev->dev,
						"i2c-mux-reg", i, NULL,
						0, &mlxplat_mux_data[i],
						sizeof(mlxplat_mux_data[i]));
	...

There is a race during initialization flow while 'i2c_mlxcpld.1' is
removing after probe, while 'i2c-mux-reg.0' is still in probing flow:
'i2c_mlxcpld.1'	flow:	probe -> remove -> probe.
'i2c-mux-reg.0'	flow:		  probe -> ...

[   12:621096] Registering platform device 'i2c_mlxcpld.1'. Parent at platform
[   12:621117] device: 'i2c_mlxcpld.1': device_add
[   12:621155] bus: 'platform': add device i2c_mlxcpld.1
[   12:621384] Registering platform device 'i2c-mux-reg.0'. Parent at mlxplat
[   12:621395] device: 'i2c-mux-reg.0': device_add
[   12:621425] bus: 'platform': add device i2c-mux-reg.0
[   12:621806] Registering platform device 'i2c-mux-reg.1'. Parent at mlxplat
[   12:621828] device: 'i2c-mux-reg.1': device_add
[   12:621892] bus: 'platform': add device i2c-mux-reg.1
[   12:621906] bus: 'platform': add driver i2c_mlxcpld
[   12:621996] bus: 'platform': driver_probe_device: matched device i2c_mlxcpld.1 with driver i2c_mlxcpld
[   12:622003] bus: 'platform': really_probe: probing driver i2c_mlxcpld with device i2c_mlxcpld.1
[   12:622100] i2c_mlxcpld i2c_mlxcpld.1: no default pinctrl state
[   12:622293] device: 'i2c-1': device_add
[   12:627280] bus: 'i2c': add device i2c-1
[   12:627692] device: 'i2c-1': device_add
[   12.629639] bus: 'platform': add driver i2c-mux-reg
[   12.629718] bus: 'platform': driver_probe_device: matched device i2c-mux-reg.0 with driver i2c-mux-reg
[   12.629723] bus: 'platform': really_probe: probing driver i2c-mux-reg with device i2c-mux-reg.0
[   12.629818] i2c-mux-reg i2c-mux-reg.0: no default pinctrl state
[   12.629981] platform i2c-mux-reg.0: Driver i2c-mux-reg requests probe deferral
[   12.629986] platform i2c-mux-reg.0: Added to deferred list
[   12.629992] bus: 'platform': driver_probe_device: matched device i2c-mux-reg.1 with driver i2c-mux-reg
[   12.629997] bus: 'platform': really_probe: probing driver i2c-mux-reg with device i2c-mux-reg.1
[   12.630091] i2c-mux-reg i2c-mux-reg.1: no default pinctrl state
[   12.630247] platform i2c-mux-reg.1: Driver i2c-mux-reg requests probe deferral
[   12.630252] platform i2c-mux-reg.1: Added to deferred list
[   12.640892] devices_kset: Moving i2c-mux-reg.0 to end of list
[   12.640900] platform i2c-mux-reg.0: Retrying from deferred list
[   12.640911] bus: 'platform': driver_probe_device: matched device i2c-mux-reg.0 with driver i2c-mux-reg
[   12.640919] bus: 'platform': really_probe: probing driver i2c-mux-reg with device i2c-mux-reg.0
[   12.640999] i2c-mux-reg i2c-mux-reg.0: no default pinctrl state
[   12.641177] platform i2c-mux-reg.0: Driver i2c-mux-reg requests probe deferral
[   12.641187] platform i2c-mux-reg.0: Added to deferred list
[   12.641198] devices_kset: Moving i2c-mux-reg.1 to end of list
[   12.641219] platform i2c-mux-reg.1: Retrying from deferred list
[   12.641237] bus: 'platform': driver_probe_device: matched device i2c-mux-reg.1 with driver i2c-mux-reg
[   12.641247] bus: 'platform': really_probe: probing driver i2c-mux-reg with device i2c-mux-reg.1
[   12.641331] i2c-mux-reg i2c-mux-reg.1: no default pinctrl state
[   12.641465] platform i2c-mux-reg.1: Driver i2c-mux-reg requests probe deferral
[   12.641469] platform i2c-mux-reg.1: Added to deferred list
[   12.646427] device: 'i2c-1': device_add
[   12.646647] bus: 'i2c': add device i2c-1
[   12.647104] device: 'i2c-1': device_add
[   12.669231] devices_kset: Moving i2c-mux-reg.0 to end of list
[   12.669240] platform i2c-mux-reg.0: Retrying from deferred list
[   12.669258] bus: 'platform': driver_probe_device: matched device i2c-mux-reg.0 with driver i2c-mux-reg
[   12.669263] bus: 'platform': really_probe: probing driver i2c-mux-reg with device i2c-mux-reg.0
[   12.669343] i2c-mux-reg i2c-mux-reg.0: no default pinctrl state
[   12.669585] device: 'i2c-2': device_add
[   12.669795] bus: 'i2c': add device i2c-2
[   12.670201] device: 'i2c-2': device_add
[   12.671427] i2c i2c-1: Added multiplexed i2c bus 2
[   12.671514] device: 'i2c-3': device_add
[   12.671724] bus: 'i2c': add device i2c-3
[   12.672136] device: 'i2c-3': device_add
[   12.673378] i2c i2c-1: Added multiplexed i2c bus 3
[   12.673472] device: 'i2c-4': device_add
[   12.673676] bus: 'i2c': add device i2c-4
[   12.674060] device: 'i2c-4': device_add
[   12.675861] i2c i2c-1: Added multiplexed i2c bus 4
[   12.675941] device: 'i2c-5': device_add
[   12.676150] bus: 'i2c': add device i2c-5
[   12.676550] device: 'i2c-5': device_add
[   12.678103] i2c i2c-1: Added multiplexed i2c bus 5
[   12.678193] device: 'i2c-6': device_add
[   12.678395] bus: 'i2c': add device i2c-6
[   12.678774] device: 'i2c-6': device_add
[   12.679969] i2c i2c-1: Added multiplexed i2c bus 6
[   12.680065] device: 'i2c-7': device_add
[   12.680275] bus: 'i2c': add device i2c-7
[   12.680913] device: 'i2c-7': device_add
[   12.682506] i2c i2c-1: Added multiplexed i2c bus 7
[   12.682600] device: 'i2c-8': device_add
[   12.682808] bus: 'i2c': add device i2c-8
[   12.683189] device: 'i2c-8': device_add
[   12.683907] device: 'i2c-1': device_unregister
[   12.683945] device: 'i2c-1': device_unregister
[   12.684387] device: 'i2c-1': device_create_release
[   12.684536] bus: 'i2c': remove device i2c-1
[   12.686019] i2c i2c-8: Failed to create compatibility class link
[   12.686086] ------------[ cut here ]------------
[   12.686087] can't create symlink to mux device
[   12.686224] Workqueue: events deferred_probe_work_func
[   12.686135] WARNING: CPU: 7 PID: 436 at drivers/i2c/i2c-mux.c:416 i2c_mux_add_adapter+0x729/0x7d0 [i2c_mux]
[   12.686232] RIP: 0010:i2c_mux_add_adapter+0x729/0x7d0 [i2c_mux]
[   0x190/0x190 [i2c_mux]
[   12.686300]  ? i2c_mux_alloc+0xac/0x110 [i2c_mux]
[   12.686306]  ? i2c_mux_reg_set+0x200/0x200 [i2c_mux_reg]
[   12.686313]  i2c_mux_reg_probe+0x22c/0x731 [i2c_mux_reg]
[   12.686322]  ? i2c_mux_reg_deselect+0x60/0x60 [i2c_mux_reg]
[   12.686346]  platform_drv_probe+0xa8/0x110
[   12.686351]  really_probe+0x185/0x720
[   12.686358]  driver_probe_device+0xdf/0x1f0
...
[   12.686522] i2c i2c-1: Added multiplexed i2c bus 8
[   12.686621] device: 'i2c-9': device_add
[   12.686626] kobject_add_internal failed for i2c-9 (error: -2 parent: i2c-1)
[   12.694729] i2c-core: adapter 'i2c-1-mux (chan_id 8)': can't register device (-2)
[   12.705726] i2c i2c-1: failed to add mux-adapter 8 as bus 9 (error=-2)
[   12.714494] device: 'i2c-8': device_unregister
[   12.714537] device: 'i2c-8': device_unregister

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 drivers/i2c/busses/i2c-mlxcpld.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-mlxcpld.c b/drivers/i2c/busses/i2c-mlxcpld.c
index 2fd717d8dd30..dbdceeb5ac5d 100644
--- a/drivers/i2c/busses/i2c-mlxcpld.c
+++ b/drivers/i2c/busses/i2c-mlxcpld.c
@@ -543,6 +543,7 @@ static struct platform_driver mlxcpld_i2c_driver = {
 	.remove		= mlxcpld_i2c_remove,
 	.driver = {
 		.name = MLXCPLD_I2C_DEVICE_NAME,
+		.suppress_bind_attrs = true,
 	},
 };
 
-- 
2.11.0

