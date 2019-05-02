Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95CFF12203
	for <lists+linux-i2c@lfdr.de>; Thu,  2 May 2019 20:38:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726324AbfEBSiN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 May 2019 14:38:13 -0400
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:34772 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726308AbfEBSiM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 May 2019 14:38:12 -0400
Received: from Internal Mail-Server by MTLPINE2 (envelope-from asmaa@mellanox.com)
        with ESMTPS (AES256-SHA encrypted); 2 May 2019 21:38:07 +0300
Received: from farm-1.mtbu.labs.mlnx (farm-1.mtbu.labs.mlnx [10.15.2.31])
        by mtbu-labmailer.labs.mlnx (8.14.4/8.14.4) with ESMTP id x42Ic5Nr009183;
        Thu, 2 May 2019 14:38:05 -0400
Received: (from asmaa@localhost)
        by farm-1.mtbu.labs.mlnx (8.14.7/8.13.8/Submit) id x42Ic4Wm031640;
        Thu, 2 May 2019 14:38:04 -0400
From:   Asmaa Mnebhi <Asmaa@mellanox.com>
To:     minyard@acm.org, wsa@the-dreams.de, vadimp@mellanox.com,
        michaelsh@mellanox.com
Cc:     Asmaa Mnebhi <Asmaa@mellanox.com>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: [PATCH v5 0/1] Add support for IPMB driver
Date:   Thu,  2 May 2019 14:38:01 -0400
Message-Id: <cover.1556821099.git.Asmaa@mellanox.com>
X-Mailer: git-send-email 2.1.2
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Addressed Vadim's and Corey's comments.

1) I added support to instantiate several ipmb devices in the case
where there are multiple BMCs requesting data via IPMB to one
Satellite MC. Each instantiated device is named after the
IPMBus/I2C bus number it is associated with. I have documented all
this in IPMB.txt.

2) I think it might be confusing to use rol16 along with
GENMASK since it isn't as straight forward to read as a simple
(u8) typecast. I haven't really seen examples in the linux kernel
where this combo is being used as a substistute for typecasting;
while I have found multiple drivers where typecasting to (u8) is
being used: bt-bmc.c, kcs_bmc_aspeed.c, kcs_bmc_npcm7xx.c.
If you strongly feel it is worth it, I will change it.

3) I could eventually upstream the BMC driver I have been using
to test this ipmb-dev-int.
The reason I needed it is because the ipmb-dev-int driver is not
responsible for sending requests via I2C. It is only responsible
for receiving those requests and passing them to a user space program.
Once a response is received from the user space program, the driver
will forward that response back to the source requester.

The driver that I have on my bmc, is called ipmb-host. It works
hand in hand with ipmi_msghandler and ipmi_devintf to create
the /dev/ipmi0 device file to enable the use of ipmitool program
on the BMC. Once an ipmitool command is issued on the BMC, the
request message is sent to the Satellite MC. Once the BMC received
a response back from the Satellite MC, it will pass it to the
ipmitool program which will display the output to the user.

ipmb-dev-int does not need the msghandler not the devintf to be
loaded.

Asmaa Mnebhi (1):
  Add support for IPMB driver

 Documentation/IPMB.txt           |  64 +++++++
 drivers/char/ipmi/Kconfig        |   8 +
 drivers/char/ipmi/Makefile       |   1 +
 drivers/char/ipmi/ipmb_dev_int.c | 384 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 457 insertions(+)
 create mode 100644 Documentation/IPMB.txt
 create mode 100644 drivers/char/ipmi/ipmb_dev_int.c

-- 
2.1.2

