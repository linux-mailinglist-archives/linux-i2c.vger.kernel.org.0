Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18F85F12C4
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2019 10:51:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731692AbfKFJuk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Nov 2019 04:50:40 -0500
Received: from sauhun.de ([88.99.104.3]:50202 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731677AbfKFJuk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 6 Nov 2019 04:50:40 -0500
Received: from localhost (p54B33505.dip0.t-ipconnect.de [84.179.53.5])
        by pokefinder.org (Postfix) with ESMTPSA id A35402C0554;
        Wed,  6 Nov 2019 10:50:38 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 09/12] media: pci: bt8xx: convert to i2c_new_scanned_device
Date:   Wed,  6 Nov 2019 10:50:27 +0100
Message-Id: <20191106095033.25182-10-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191106095033.25182-1-wsa+renesas@sang-engineering.com>
References: <20191106095033.25182-1-wsa+renesas@sang-engineering.com>
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

Build tested only. RFC, please comment and/or ack, but don't apply yet.

 drivers/media/pci/bt8xx/bttv-input.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/bt8xx/bttv-input.c b/drivers/media/pci/bt8xx/bttv-input.c
index 492bc85c2700..41226f1d0e5b 100644
--- a/drivers/media/pci/bt8xx/bttv-input.c
+++ b/drivers/media/pci/bt8xx/bttv-input.c
@@ -386,7 +386,7 @@ void init_bttv_i2c_ir(struct bttv *btv)
 
 	if (btv->init_data.name) {
 		info.platform_data = &btv->init_data;
-		i2c_dev = i2c_new_device(&btv->c.i2c_adap, &info);
+		i2c_dev = i2c_new_client_device(&btv->c.i2c_adap, &info);
 	} else {
 		/*
 		 * The external IR receiver is at i2c address 0x34 (0x35 for
@@ -396,9 +396,9 @@ void init_bttv_i2c_ir(struct bttv *btv)
 		 * internal.
 		 * That's why we probe 0x1a (~0x34) first. CB
 		 */
-		i2c_dev = i2c_new_probed_device(&btv->c.i2c_adap, &info, addr_list, NULL);
+		i2c_dev = i2c_new_scanned_device(&btv->c.i2c_adap, &info, addr_list, NULL);
 	}
-	if (NULL == i2c_dev)
+	if (IS_ERR(i2c_dev))
 		return;
 
 #if defined(CONFIG_MODULES) && defined(MODULE)
-- 
2.20.1

