Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6055D4A030B
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jan 2022 22:42:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351576AbiA1Vmg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Jan 2022 16:42:36 -0500
Received: from www.zeus03.de ([194.117.254.33]:59934 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240843AbiA1Vmf (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 Jan 2022 16:42:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=YIAus5FadnGCySljOHnD5fVK80a
        tYbNU5ynyUrk96oM=; b=hlnwe1IQ3MR89Qv96favgzM6/VzmEaq/qcUcPGPODvo
        NB23iSNB3ASYvibh1b8ulFvF7KtAz+z6I29P6JIYpQi3u//BvV9RTZw5qPQQZRRM
        QPj6c/xDoQ00let2fQCSHHVz4ceNfiTKfyi+Qk0HREAE/F46H1VNjHDkg0gS6/Ec
        =
Received: (qmail 384844 invoked from network); 28 Jan 2022 22:42:33 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Jan 2022 22:42:33 +0100
X-UD-Smtp-Session: l3s3148p1@7eL7T6vWjrS8ahEL
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Akhil R <akhilrajeev@nvidia.com>,
        linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] i2c: don't export function which is only used internally
Date:   Fri, 28 Jan 2022 22:42:25 +0100
Message-Id: <20220128214225.10419-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

i2c_setup_smbus_alert() is only needed within the I2C core, so no need
to export it to other modules.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-core-smbus.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
index 304c2c8fee68..053b215308c4 100644
--- a/drivers/i2c/i2c-core-smbus.c
+++ b/drivers/i2c/i2c-core-smbus.c
@@ -716,5 +716,4 @@ int i2c_setup_smbus_alert(struct i2c_adapter *adapter)
 
 	return PTR_ERR_OR_ZERO(i2c_new_smbus_alert_device(adapter, NULL));
 }
-EXPORT_SYMBOL_GPL(i2c_setup_smbus_alert);
 #endif
-- 
2.30.2

