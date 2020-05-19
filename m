Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55ECD1D9594
	for <lists+linux-i2c@lfdr.de>; Tue, 19 May 2020 13:48:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728817AbgESLsQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 May 2020 07:48:16 -0400
Received: from www.zeus03.de ([194.117.254.33]:51434 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728730AbgESLsQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 19 May 2020 07:48:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=ddBak6zLWC9Npbp+57vBV7FzFAK
        8sMiCd2TfuRJsrVg=; b=Qj7/NifCNrTOp0Eizvr+WGzkn8XoNw95WwqmbC69Lpo
        2UxP4ltU8z1TPtPvPkaT9/0wCSbBbNZkM7IKTzfRkJzQ4JMUAUbRYzjpEk4+Cq5m
        t4cr60o72C1QEl2TIwQjuChe+Us84rM7Rz9O4DrXgrGbNRlkDuVHstJlAPkp6cWE
        =
Received: (qmail 239073 invoked from network); 19 May 2020 13:48:14 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2020 13:48:14 +0200
X-UD-Smtp-Session: l3s3148p1@AU7G2v6lOuUgAwDPXxCmAFNwG0mTH/5q
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] i2c: save a variable in i2c_detect()
Date:   Tue, 19 May 2020 13:48:09 +0200
Message-Id: <20200519114809.15304-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

No need to populate a variable if it is used only in debug output which
may get compiled away anyhow.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-core-base.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 5be24bf8a194..3712878f1b47 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -2260,7 +2260,6 @@ static int i2c_detect(struct i2c_adapter *adapter, struct i2c_driver *driver)
 	const unsigned short *address_list;
 	struct i2c_client *temp_client;
 	int i, err = 0;
-	int adap_id = i2c_adapter_id(adapter);
 
 	address_list = driver->address_list;
 	if (!driver->detect || !address_list)
@@ -2288,7 +2287,7 @@ static int i2c_detect(struct i2c_adapter *adapter, struct i2c_driver *driver)
 	for (i = 0; address_list[i] != I2C_CLIENT_END; i += 1) {
 		dev_dbg(&adapter->dev,
 			"found normal entry for adapter %d, addr 0x%02x\n",
-			adap_id, address_list[i]);
+			i2c_adapter_id(adapter), address_list[i]);
 		temp_client->addr = address_list[i];
 		err = i2c_detect_address(temp_client, driver);
 		if (unlikely(err))
-- 
2.20.1

