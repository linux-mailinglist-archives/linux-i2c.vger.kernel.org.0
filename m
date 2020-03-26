Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1ACF4194A3B
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Mar 2020 22:12:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726954AbgCZVMp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Mar 2020 17:12:45 -0400
Received: from sauhun.de ([88.99.104.3]:54276 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726330AbgCZVJv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 26 Mar 2020 17:09:51 -0400
Received: from localhost (p54B3331F.dip0.t-ipconnect.de [84.179.51.31])
        by pokefinder.org (Postfix) with ESMTPSA id E43FD2C1F87;
        Thu, 26 Mar 2020 22:09:48 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] media: pci: cx88: convert to use i2c_new_client_device()
Date:   Thu, 26 Mar 2020 22:09:41 +0100
Message-Id: <20200326210947.12747-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200326210947.12747-1-wsa+renesas@sang-engineering.com>
References: <20200326210947.12747-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Move away from the deprecated API and make use of the fact that
unregistering devices is NULL- and ERR_PTR-safe.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/media/pci/cx88/cx88-core.c  | 3 +--
 drivers/media/pci/cx88/cx88-input.c | 2 +-
 drivers/media/pci/cx88/cx88-video.c | 2 +-
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/cx88/cx88-core.c b/drivers/media/pci/cx88/cx88-core.c
index dcadf78657d6..48c8a3429542 100644
--- a/drivers/media/pci/cx88/cx88-core.c
+++ b/drivers/media/pci/cx88/cx88-core.c
@@ -1070,8 +1070,7 @@ void cx88_core_put(struct cx88_core *core, struct pci_dev *pci)
 	mutex_lock(&devlist);
 	cx88_ir_fini(core);
 	if (core->i2c_rc == 0) {
-		if (core->i2c_rtc)
-			i2c_unregister_device(core->i2c_rtc);
+		i2c_unregister_device(core->i2c_rtc);
 		i2c_del_adapter(&core->i2c_adap);
 	}
 	list_del(&core->devlist);
diff --git a/drivers/media/pci/cx88/cx88-input.c b/drivers/media/pci/cx88/cx88-input.c
index c7c2acd55266..7e0fed9cd200 100644
--- a/drivers/media/pci/cx88/cx88-input.c
+++ b/drivers/media/pci/cx88/cx88-input.c
@@ -638,7 +638,7 @@ void cx88_i2c_init_ir(struct cx88_core *core)
 				   I2C_SMBUS_READ, 0,
 				   I2C_SMBUS_QUICK, NULL) >= 0) {
 			info.addr = *addrp;
-			i2c_new_device(&core->i2c_adap, &info);
+			i2c_new_client_device(&core->i2c_adap, &info);
 			break;
 		}
 	}
diff --git a/drivers/media/pci/cx88/cx88-video.c b/drivers/media/pci/cx88/cx88-video.c
index 6aabc45aa93c..ba0e9660a047 100644
--- a/drivers/media/pci/cx88/cx88-video.c
+++ b/drivers/media/pci/cx88/cx88-video.c
@@ -1385,7 +1385,7 @@ static int cx8800_initdev(struct pci_dev *pci_dev,
 		};
 
 		request_module("rtc-isl1208");
-		core->i2c_rtc = i2c_new_device(&core->i2c_adap, &rtc_info);
+		core->i2c_rtc = i2c_new_client_device(&core->i2c_adap, &rtc_info);
 	}
 		/* fall-through */
 	case CX88_BOARD_DVICO_FUSIONHDTV_5_PCI_NANO:
-- 
2.20.1

