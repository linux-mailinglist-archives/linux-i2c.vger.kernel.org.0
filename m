Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 899C71E0B2B
	for <lists+linux-i2c@lfdr.de>; Mon, 25 May 2020 11:59:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389631AbgEYJ7s (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 May 2020 05:59:48 -0400
Received: from www.zeus03.de ([194.117.254.33]:59644 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389398AbgEYJ7s (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 25 May 2020 05:59:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=8yciJFPF2oxY8A
        +fbAvt0/2CDgHMhSnMPwT5xV11nfE=; b=GqCMEPss2lCH+2BxfpL/tQ6o044jkb
        4HFguU3WfD1EktNOoBC7l9mATdR4klaj5W0KrqSW5eIkRTgwyK50Z2FZP0seCkRK
        WlDkmJMksx95nNNHeE1UkbQW9qiUHz+UmYOoUpZMN6kZKkiZqC36JrQR1iq2zyQe
        t1RgZYZCc1R2E=
Received: (qmail 2284546 invoked from network); 25 May 2020 11:59:46 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 May 2020 11:59:46 +0200
X-UD-Smtp-Session: l3s3148p1@zP/nCXamTuIgAwDPXwX9AARUgaNQd9RX
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     =?UTF-8?q?Bj=C3=B6rn=20Ard=C3=B6?= <bjorn.ardo@axis.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 2/2] i2c: slave-eeprom: update documentation to recent changes
Date:   Mon, 25 May 2020 11:59:34 +0200
Message-Id: <20200525095934.3058-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200525095934.3058-1-wsa+renesas@sang-engineering.com>
References: <20200525095934.3058-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Support for 16-bit addresses has been added, so remove it from the todo
list. Also, in the introductory sentence, may clear we talk about "slave
IP cores" to make reading easier.

Fixes: 82d514815441 ("i2c-eeprom_slave: Add support for more eeprom models")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-slave-eeprom.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/i2c-slave-eeprom.c b/drivers/i2c/i2c-slave-eeprom.c
index 6684852818ac..593f2fd39d17 100644
--- a/drivers/i2c/i2c-slave-eeprom.c
+++ b/drivers/i2c/i2c-slave-eeprom.c
@@ -5,10 +5,9 @@
  * Copyright (C) 2014 by Wolfram Sang, Sang Engineering <wsa@sang-engineering.com>
  * Copyright (C) 2014 by Renesas Electronics Corporation
  *
- * Because most IP blocks can only detect one I2C slave address anyhow, this
- * driver does not support simulating EEPROM types which take more than one
- * address. It is prepared to simulate bigger EEPROMs with an internal 16 bit
- * pointer, yet implementation is deferred until the need actually arises.
+ * Because most slave IP cores can only detect one I2C slave address anyhow,
+ * this driver does not support simulating EEPROM types which take more than
+ * one address.
  */
 
 /*
-- 
2.20.1

