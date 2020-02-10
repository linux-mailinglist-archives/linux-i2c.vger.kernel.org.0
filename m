Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17E6815804D
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Feb 2020 17:59:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727558AbgBJQ7R (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Feb 2020 11:59:17 -0500
Received: from sauhun.de ([88.99.104.3]:43648 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727003AbgBJQ7R (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 10 Feb 2020 11:59:17 -0500
Received: from localhost (p54B33161.dip0.t-ipconnect.de [84.179.49.97])
        by pokefinder.org (Postfix) with ESMTPSA id 944532C07F3;
        Mon, 10 Feb 2020 17:59:15 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-input@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH RESEND] input: mouse: convert to i2c_new_scanned_device
Date:   Mon, 10 Feb 2020 17:59:02 +0100
Message-Id: <20200210165902.5250-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Move from the deprecated i2c_new_probed_device() to the new
i2c_new_scanned_device(). Make use of the new ERRPTR if suitable.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Build tested only.

 drivers/input/mouse/psmouse-smbus.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/input/mouse/psmouse-smbus.c b/drivers/input/mouse/psmouse-smbus.c
index 027efdd2b2ad..27358e543283 100644
--- a/drivers/input/mouse/psmouse-smbus.c
+++ b/drivers/input/mouse/psmouse-smbus.c
@@ -190,6 +190,7 @@ static int psmouse_smbus_create_companion(struct device *dev, void *data)
 	struct psmouse_smbus_dev *smbdev = data;
 	unsigned short addr_list[] = { smbdev->board.addr, I2C_CLIENT_END };
 	struct i2c_adapter *adapter;
+	struct i2c_client *client;
 
 	adapter = i2c_verify_adapter(dev);
 	if (!adapter)
@@ -198,12 +199,12 @@ static int psmouse_smbus_create_companion(struct device *dev, void *data)
 	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_HOST_NOTIFY))
 		return 0;
 
-	smbdev->client = i2c_new_probed_device(adapter, &smbdev->board,
-					       addr_list, NULL);
-	if (!smbdev->client)
+	client = i2c_new_scanned_device(adapter, &smbdev->board, addr_list, NULL);
+	if (IS_ERR(client))
 		return 0;
 
 	/* We have our(?) device, stop iterating i2c bus. */
+	smbdev->client = client;
 	return 1;
 }
 
-- 
2.20.1

