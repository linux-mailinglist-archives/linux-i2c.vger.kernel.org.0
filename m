Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60ADD12DA3C
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Dec 2019 17:14:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727068AbfLaQOg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Dec 2019 11:14:36 -0500
Received: from sauhun.de ([88.99.104.3]:51538 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727056AbfLaQOg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 31 Dec 2019 11:14:36 -0500
Received: from localhost (p5486C426.dip0.t-ipconnect.de [84.134.196.38])
        by pokefinder.org (Postfix) with ESMTPSA id 3D0092C07BD;
        Tue, 31 Dec 2019 17:14:34 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Kieran Bingham <kieran@ksquared.org.uk>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH 2/5] i2c: core: add new variant to check for a client
Date:   Tue, 31 Dec 2019 17:13:57 +0100
Message-Id: <20191231161400.1688-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191231161400.1688-1-wsa+renesas@sang-engineering.com>
References: <20191231161400.1688-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

For the new 'alias' feature, we need to scan for devices while holding
the lock. We focus on read_byte transactions for now to keep things
simple. Requesting an alias will be rare, so there is not much overhead.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-core-base.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 20a726dc78db..51bd953ddfb2 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -2108,6 +2108,23 @@ static int i2c_default_probe(struct i2c_adapter *adap, unsigned short addr)
 	return err >= 0;
 }
 
+static int i2c_unlocked_read_byte_probe(struct i2c_adapter *adap, unsigned short addr)
+{
+	union i2c_smbus_data dummy;
+	int err;
+
+	if (i2c_check_functionality(adap, I2C_FUNC_SMBUS_READ_BYTE)) {
+		err = __i2c_smbus_xfer(adap, addr, 0, I2C_SMBUS_READ, 0,
+				     I2C_SMBUS_BYTE, &dummy);
+	} else {
+		dev_warn(&adap->dev, "No suitable probing method supported for address 0x%02X\n",
+			 addr);
+		err = -EOPNOTSUPP;
+	}
+
+	return err >= 0;
+}
+
 static int i2c_scan_for_client(struct i2c_adapter *adap, unsigned short addr,
 			    int (*probe)(struct i2c_adapter *adap, unsigned short addr))
 {
-- 
2.20.1

