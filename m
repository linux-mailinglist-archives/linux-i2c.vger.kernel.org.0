Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A058194A33
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Mar 2020 22:12:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727724AbgCZVMb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Mar 2020 17:12:31 -0400
Received: from sauhun.de ([88.99.104.3]:54342 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726496AbgCZVJx (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 26 Mar 2020 17:09:53 -0400
Received: from localhost (p54B3331F.dip0.t-ipconnect.de [84.179.51.31])
        by pokefinder.org (Postfix) with ESMTPSA id B20A02C1F84;
        Thu, 26 Mar 2020 22:09:51 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mike Isely <isely@pobox.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] media: usb: pvrusb2: convert to use i2c_new_client_device()
Date:   Thu, 26 Mar 2020 22:09:46 +0100
Message-Id: <20200326210947.12747-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200326210947.12747-1-wsa+renesas@sang-engineering.com>
References: <20200326210947.12747-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Move away from the deprecated API.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c b/drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c
index 275394bafe7d..63db04fe12d3 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c
@@ -564,7 +564,7 @@ static void pvr2_i2c_register_ir(struct pvr2_hdw *hdw)
 		strscpy(info.type, "ir_video", I2C_NAME_SIZE);
 		pvr2_trace(PVR2_TRACE_INFO, "Binding %s to i2c address 0x%02x.",
 			   info.type, info.addr);
-		i2c_new_device(&hdw->i2c_adap, &info);
+		i2c_new_client_device(&hdw->i2c_adap, &info);
 		break;
 	case PVR2_IR_SCHEME_ZILOG:     /* HVR-1950 style */
 	case PVR2_IR_SCHEME_24XXX_MCE: /* 24xxx MCE device */
@@ -579,7 +579,7 @@ static void pvr2_i2c_register_ir(struct pvr2_hdw *hdw)
 		strscpy(info.type, "ir_z8f0811_haup", I2C_NAME_SIZE);
 		pvr2_trace(PVR2_TRACE_INFO, "Binding %s to i2c address 0x%02x.",
 			   info.type, info.addr);
-		i2c_new_device(&hdw->i2c_adap, &info);
+		i2c_new_client_device(&hdw->i2c_adap, &info);
 		break;
 	default:
 		/* The device either doesn't support I2C-based IR or we
-- 
2.20.1

