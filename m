Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEB6F1205AA
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2019 13:30:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727710AbfLPM3v (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Dec 2019 07:29:51 -0500
Received: from sauhun.de ([88.99.104.3]:39798 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727534AbfLPM3t (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 16 Dec 2019 07:29:49 -0500
Received: from localhost (p54B33297.dip0.t-ipconnect.de [84.179.50.151])
        by pokefinder.org (Postfix) with ESMTPSA id 42D702C2D98;
        Mon, 16 Dec 2019 13:29:48 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] media: pci: bt8xx: convert to i2c_new_scanned_device
Date:   Mon, 16 Dec 2019 13:29:43 +0100
Message-Id: <20191216122946.3495-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191216122946.3495-1-wsa+renesas@sang-engineering.com>
References: <20191216122946.3495-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Move from the deprecated i2c_new_probed_device() to the new
i2c_new_scanned_device(). Make use of the new ERRPTR if suitable.

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Acked-by: Sean Young <sean@mess.org>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
Build tested only.

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

