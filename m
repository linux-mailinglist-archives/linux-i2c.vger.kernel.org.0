Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 753D9135AD
	for <lists+linux-i2c@lfdr.de>; Sat,  4 May 2019 00:34:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726348AbfECWev (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 May 2019 18:34:51 -0400
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:44153 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726276AbfECWev (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 May 2019 18:34:51 -0400
Received: from Internal Mail-Server by MTLPINE2 (envelope-from asmaa@mellanox.com)
        with ESMTPS (AES256-SHA encrypted); 4 May 2019 01:34:48 +0300
Received: from farm-1.mtbu.labs.mlnx (farm-1.mtbu.labs.mlnx [10.15.2.31])
        by mtbu-labmailer.labs.mlnx (8.14.4/8.14.4) with ESMTP id x43MYlNL021876;
        Fri, 3 May 2019 18:34:47 -0400
Received: (from asmaa@localhost)
        by farm-1.mtbu.labs.mlnx (8.14.7/8.13.8/Submit) id x43MYkmc002591;
        Fri, 3 May 2019 18:34:46 -0400
From:   Asmaa Mnebhi <Asmaa@mellanox.com>
To:     minyard@acm.org, wsa@the-dreams.de, vadimp@mellanox.com,
        michaelsh@mellanox.com
Cc:     Asmaa Mnebhi <Asmaa@mellanox.com>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: [PATCH v6 0/1] Add support for IPMB driver
Date:   Fri,  3 May 2019 18:34:40 -0400
Message-Id: <cover.1556921955.git.Asmaa@mellanox.com>
X-Mailer: git-send-email 2.1.2
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Vadim,

I apologize I forgot to address your previous comment concerning
the ACPI table. I have added the ACPI device id as well as documented
it for whomever wants to use either the ACPI table or device tree.
I did not need that for my testing due to our internal build tools/
code structure.
But I have tested with the device tree and ACPI table as well and
it works fine.

I have addressed your comment concerning using macros instead of magic numbers.

Also, since both you and Corey suggest to not use typecasting,
I will probably change it to GENMASK in my next update. I am waiting
for one more advocate against typecasting!

Asmaa Mnebhi (1):
  Add support for IPMB driver

 Documentation/IPMB.txt           | 103 ++++++++++
 drivers/char/ipmi/Kconfig        |   8 +
 drivers/char/ipmi/Makefile       |   1 +
 drivers/char/ipmi/ipmb_dev_int.c | 397 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 509 insertions(+)
 create mode 100644 Documentation/IPMB.txt
 create mode 100644 drivers/char/ipmi/ipmb_dev_int.c

-- 
2.1.2

