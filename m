Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FACDAA678
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2019 16:50:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389092AbfIEOud (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Sep 2019 10:50:33 -0400
Received: from bastet.se.axis.com ([195.60.68.11]:49824 "EHLO
        bastet.se.axis.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728590AbfIEOud (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Sep 2019 10:50:33 -0400
Received: from localhost (localhost [127.0.0.1])
        by bastet.se.axis.com (Postfix) with ESMTP id E278418508;
        Thu,  5 Sep 2019 16:50:30 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
        by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id VKi2rIb-LVH8; Thu,  5 Sep 2019 16:50:30 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
        by bastet.se.axis.com (Postfix) with ESMTPS id 2828A184F4;
        Thu,  5 Sep 2019 16:50:30 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 0F8EE1E076;
        Thu,  5 Sep 2019 16:50:30 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 041E51E068;
        Thu,  5 Sep 2019 16:50:30 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
        by boulder03.se.axis.com (Postfix) with ESMTP;
        Thu,  5 Sep 2019 16:50:29 +0200 (CEST)
Received: from lnxbjornar3.se.axis.com (lnxbjornar3.se.axis.com [10.88.24.4])
        by thoth.se.axis.com (Postfix) with ESMTP id EC2AB2A94;
        Thu,  5 Sep 2019 16:50:29 +0200 (CEST)
Received: by lnxbjornar3.se.axis.com (Postfix, from userid 9651)
        id E9A6FC470F; Thu,  5 Sep 2019 16:50:29 +0200 (CEST)
From:   =?UTF-8?q?Bj=C3=B6rn=20Ard=C3=B6?= <bjorn.ardo@axis.com>
To:     wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org,
        =?UTF-8?q?Bj=C3=B6rn=20Ard=C3=B6?= <bjornar@axis.com>
Subject: [PATCH] i2c-eeprom_slave: Add comment about address handling
Date:   Thu,  5 Sep 2019 16:50:26 +0200
Message-Id: <1567695026-20108-1-git-send-email-bjorn.ardo@axis.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The behaviour of the EEPROM in the case where we only send in a
8bit address to a 16bit address EEPROM is not defined. Added comment
about that the slave-eeprom behaves diffrently from how an actuall
device does (only one model measured).

Signed-off-by: Björn Ardö <bjorn.ardo@axis.com>
---
 drivers/i2c/i2c-slave-eeprom.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/i2c/i2c-slave-eeprom.c b/drivers/i2c/i2c-slave-eeprom.c
index 773afaa..92ff999 100644
--- a/drivers/i2c/i2c-slave-eeprom.c
+++ b/drivers/i2c/i2c-slave-eeprom.c
@@ -11,6 +11,12 @@
  * pointer, yet implementation is deferred until the need actually arises.
  */
 
+/*
+ * FIXME: What to do if only 8 bits of a 16 bit address are sent?
+ * The ST-M24C64 sends only 0xff then. Needs verification with other
+ * EEPROMs, though. We currently use the 8 bit as a valid address.
+ */
+
 #include <linux/bitfield.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
-- 
2.1.4

