Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 973B5F12D7
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2019 10:51:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731791AbfKFJvD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Nov 2019 04:51:03 -0500
Received: from sauhun.de ([88.99.104.3]:50224 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731669AbfKFJui (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 6 Nov 2019 04:50:38 -0500
Received: from localhost (p54B33505.dip0.t-ipconnect.de [84.179.53.5])
        by pokefinder.org (Postfix) with ESMTPSA id 8AD712C0548;
        Wed,  6 Nov 2019 10:50:37 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 07/12] media: pci: cx23885: convert to i2c_new_scanned_device
Date:   Wed,  6 Nov 2019 10:50:25 +0100
Message-Id: <20191106095033.25182-8-wsa+renesas@sang-engineering.com>
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

 drivers/media/pci/cx23885/cx23885-i2c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/cx23885/cx23885-i2c.c b/drivers/media/pci/cx23885/cx23885-i2c.c
index 4f327ee9659e..f51fad33dc04 100644
--- a/drivers/media/pci/cx23885/cx23885-i2c.c
+++ b/drivers/media/pci/cx23885/cx23885-i2c.c
@@ -337,8 +337,8 @@ int cx23885_i2c_register(struct cx23885_i2c *bus)
 		strscpy(info.type, "ir_video", I2C_NAME_SIZE);
 		/* Use quick read command for probe, some IR chips don't
 		 * support writes */
-		i2c_new_probed_device(&bus->i2c_adap, &info, addr_list,
-				      i2c_probe_func_quick_read);
+		i2c_new_scanned_device(&bus->i2c_adap, &info, addr_list,
+				       i2c_probe_func_quick_read);
 	}
 
 	return bus->i2c_rc;
-- 
2.20.1

