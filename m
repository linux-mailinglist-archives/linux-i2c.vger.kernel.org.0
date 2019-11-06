Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A364F12C2
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2019 10:51:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731679AbfKFJuj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Nov 2019 04:50:39 -0500
Received: from sauhun.de ([88.99.104.3]:50202 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727015AbfKFJui (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 6 Nov 2019 04:50:38 -0500
Received: from localhost (p54B33505.dip0.t-ipconnect.de [84.179.53.5])
        by pokefinder.org (Postfix) with ESMTPSA id 736C82C0553;
        Wed,  6 Nov 2019 10:50:36 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH 05/12] video: fbdev: matrox: convert to i2c_new_scanned_device
Date:   Wed,  6 Nov 2019 10:50:23 +0100
Message-Id: <20191106095033.25182-6-wsa+renesas@sang-engineering.com>
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

 drivers/video/fbdev/matrox/i2c-matroxfb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/matrox/i2c-matroxfb.c b/drivers/video/fbdev/matrox/i2c-matroxfb.c
index 34e2659c3189..e2e4705e3fe0 100644
--- a/drivers/video/fbdev/matrox/i2c-matroxfb.c
+++ b/drivers/video/fbdev/matrox/i2c-matroxfb.c
@@ -191,8 +191,8 @@ static void* i2c_matroxfb_probe(struct matrox_fb_info* minfo) {
 				0x1b, I2C_CLIENT_END
 			};
 
-			i2c_new_probed_device(&m2info->maven.adapter,
-					      &maven_info, addr_list, NULL);
+			i2c_new_scanned_device(&m2info->maven.adapter,
+					       &maven_info, addr_list, NULL);
 		}
 	}
 	return m2info;
-- 
2.20.1

