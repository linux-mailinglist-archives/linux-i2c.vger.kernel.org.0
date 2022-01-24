Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18668497A65
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jan 2022 09:31:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232454AbiAXIbq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Jan 2022 03:31:46 -0500
Received: from pi.codeconstruct.com.au ([203.29.241.158]:53138 "EHLO
        codeconstruct.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236286AbiAXIbp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Jan 2022 03:31:45 -0500
Received: by codeconstruct.com.au (Postfix, from userid 10001)
        id 2D400202F7; Mon, 24 Jan 2022 16:31:37 +0800 (AWST)
From:   Matt Johnston <matt@codeconstruct.com.au>
Cc:     linux-i2c@vger.kernel.org, Daniel Stodden <dns@arista.com>,
        Jean Delvare <jdelvare@suse.de>,
        Jeremy Kerr <jk@codeconstruct.com.au>
Subject: [PATCH v2 0/4] Increase SMBus max block size to 255
Date:   Mon, 24 Jan 2022 16:31:27 +0800
Message-Id: <20220124083131.417420-1-matt@codeconstruct.com.au>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

I've taken another look at smbus v3 255-byte changes. This series combines
Daniel's previous i2c-dev patch with my i2c core patch.

Bus drivers remain opt-in to 255-byte block size, the I2C_FUNC_SMBUS3_BLOCKSIZE
flag indicates to i2c-core that the driver has been audited to handle 255
byte buffers OK. They can be added as drivers are tested with 255 byte
protocols/applications.

Drivers without that flag will be limited to 32 bytes by the I2C core. This
will take care of in-kernel compatibility issues with the increased
I2C_SMBUS_BLOCK_MAX for drivers.

The flag can also be used by userspace/drivers to warn if a driver is
non-smbus3 which would prevent a particular application from working.
Otherwise the change should be transparent to users.

The i2c-dev changes will remain compatible with these cases:

* Existing binaries, new kernel
  Will pass the old transaction type values, i2c-dev will limit
  transfers to 32 bytes

* Binaries compiled with new uapi, new kernel
  Will pass new transaction type values, i2c-dev will allow 255 bytes.
  Userspace i2c_smbus_data has sufficient space for 255 byte blocks

It won't however work with new uapi+old kernel, the new transaction types are
unknown. I wonder if it would be better to keep current constants as-is, and
let userspace opt in to 255 byte sizes with an IOCTL_SMBUS3 and
'union i2c_smbus3_data' (just for userspace, the kernel keeps using 255 byte
i2c_smbus_data everywhere). It wouldn't be necessary to look at the
I2C_FUNC_SMBUS3_BLOCKSIZE flag, just make a single first attempt with IOCTL_SMBUS3
and if that returns -ENOTTY fall back to IOCTL_SMBUS as before.
Are there any other kernel mechanisms for indicating feature support?

That would also be safer for existing userspace that may be out in the wild.
It's possible there might be libraries currently using 'union i2c_smbus_data'
in their ABI - changing its size would break library users if programs were
recompiled with new uapi headers.

I can take a look at making IOCTL_SMBUS3 changes for i2c-dev, though my main
focus here is getting the kernel side changes working (I've only been doing
hardware testing with in-kernel code).

Cheers,
Matt

--
v2:
 - i2c-dev patch based (with modifications) on
   https://lore.kernel.org/linux-i2c/20200729203658.411-1-daniel.stodden@gmail.com/
 - Rename constants to _SMBUS3_ instead of previous _V3_

Previous version part of MCTP series, i2c-core/adapter changes taken from that:
https://lore.kernel.org/all/20211115024926.205385-2-matt@codeconstruct.com.au/

v1 i2c RFC:
https://lore.kernel.org/all/20210602044113.1581347-1-matt@codeconstruct.com.au/



Daniel Stodden (1):
  i2c: dev: Support smbus3 block size of 255 bytes

Matt Johnston (3):
  i2c: core: Allow 255 byte transfers for SMBus 3.x
  i2c: aspeed: Allow 255 byte block transfers
  i2c: npcm7xx: Allow 255 byte block SMBus transfers

 drivers/i2c/busses/i2c-aspeed.c  |  5 +-
 drivers/i2c/busses/i2c-npcm7xx.c |  3 +-
 drivers/i2c/i2c-core-smbus.c     | 20 ++++---
 drivers/i2c/i2c-dev.c            | 91 +++++++++++++++++++++++++++-----
 include/uapi/linux/i2c.h         | 16 ++++--
 5 files changed, 106 insertions(+), 29 deletions(-)

-- 
2.32.0

