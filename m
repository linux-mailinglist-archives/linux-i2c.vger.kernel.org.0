Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A254EFF2F
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Apr 2019 19:58:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726028AbfD3R6w (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Apr 2019 13:58:52 -0400
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:57074 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725950AbfD3R6w (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Apr 2019 13:58:52 -0400
Received: from Internal Mail-Server by MTLPINE2 (envelope-from asmaa@mellanox.com)
        with ESMTPS (AES256-SHA encrypted); 30 Apr 2019 20:58:50 +0300
Received: from farm-1.mtbu.labs.mlnx (farm-1.mtbu.labs.mlnx [10.15.2.31])
        by mtbu-labmailer.labs.mlnx (8.14.4/8.14.4) with ESMTP id x3UHwmIm027615;
        Tue, 30 Apr 2019 13:58:48 -0400
Received: (from asmaa@localhost)
        by farm-1.mtbu.labs.mlnx (8.14.7/8.13.8/Submit) id x3UHwma6006703;
        Tue, 30 Apr 2019 13:58:48 -0400
From:   Asmaa Mnebhi <Asmaa@mellanox.com>
To:     minyard@acm.org, wsa@the-dreams.de, vadimp@mellanox.com,
        michaelsh@mellanox.com
Cc:     Asmaa Mnebhi <Asmaa@mellanox.com>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: [PATCH v4 0/1] Add support for IPMB driver
Date:   Tue, 30 Apr 2019 13:58:44 -0400
Message-Id: <cover.1556645340.git.Asmaa@mellanox.com>
X-Mailer: git-send-email 2.1.2
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Thank you for your feedback Vadim. I have addressed your comments.

1) You are correct. This driver is not specific to Mellanox so I
have removed the Mellanox attribute.

2) I have added a documentation file called IPMB.txt which explains
how this module works and how it should be instantiated. It is very
similar to the existing linux i2c-slave-eeprom module.

The HW for my testing works as follows:
A BMC is connected to a Satellite MC via I2C (I2C is equivalent to
IPMB). The BMC initiates the IPMB requests and sends them via I2C.
Obviously the BMC needs its own driver to do this which I haven't
included in this code. We have no intent of upstreaming that at the
moment.
This ipmb-dev-int driver is to be loaded and instantiated on the
Satellite MC to be able to receive IPMB requests. These IPMB request
messages will be picked up by a user space program such (in my case
it is OpenIPMI) to handle the request and generate a response.
The response will be then passed from the user program back to
kernel space. Then this driver would send that response back to
the BMC.

3) You asked the following:

"Is it expected to be zero in vaid case?"
The 8 least significant bits of the sum is always expected to be 0
in the case where the checksum is valid. I have added a comment
for clarifications.

"why do you need this cast?"
buf[++ipmb_dev_p->msg_idx]=(u8)(client->addr<<1)
This is because client->addr is of type unsigned short which is
2 bytes so it is safer to typecast it to u8 (u8* buf)

"It could be only single ipmb-dev within the system? Couldn't
it be few, like master/slave for example?"
My understanding of your question is that: what if we have multiple
instances of ipmb-dev-int, that we register it under different
addresses?
This driver only works as a slave so it will only be instantiated
once on the Satellite MC under one slave address.

Asmaa Mnebhi (1):
  Add support for IPMB driver

 Documentation/IPMB.txt           |  53 ++++++
 drivers/char/ipmi/Kconfig        |   8 +
 drivers/char/ipmi/Makefile       |   1 +
 drivers/char/ipmi/ipmb_dev_int.c | 381 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 443 insertions(+)
 create mode 100644 Documentation/IPMB.txt
 create mode 100644 drivers/char/ipmi/ipmb_dev_int.c

-- 
2.1.2

