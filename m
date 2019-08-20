Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA6A196494
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2019 17:35:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730463AbfHTPep (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Aug 2019 11:34:45 -0400
Received: from sauhun.de ([88.99.104.3]:37424 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730204AbfHTPeo (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 20 Aug 2019 11:34:44 -0400
Received: from localhost (p54B333DC.dip0.t-ipconnect.de [84.179.51.220])
        by pokefinder.org (Postfix) with ESMTPSA id 28ADF2E3540;
        Tue, 20 Aug 2019 17:34:42 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] media: i2c: adv7511-v4l2: drop check because i2c_unregister_device() is NULL safe
Date:   Tue, 20 Aug 2019 17:34:40 +0200
Message-Id: <20190820153441.7748-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

No need to check the argument of i2c_unregister_device() because the
function itself does it.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
Build tested only, buildbot is happy, too.

Please apply to your tree.

 drivers/media/i2c/adv7511-v4l2.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/adv7511-v4l2.c b/drivers/media/i2c/adv7511-v4l2.c
index 7db94267bcab..55b3a9c12e43 100644
--- a/drivers/media/i2c/adv7511-v4l2.c
+++ b/drivers/media/i2c/adv7511-v4l2.c
@@ -1940,8 +1940,7 @@ static int adv7511_probe(struct i2c_client *client, const struct i2c_device_id *
 err_unreg_pktmem:
 	i2c_unregister_device(state->i2c_pktmem);
 err_unreg_cec:
-	if (state->i2c_cec)
-		i2c_unregister_device(state->i2c_cec);
+	i2c_unregister_device(state->i2c_cec);
 err_unreg_edid:
 	i2c_unregister_device(state->i2c_edid);
 err_entity:
@@ -1967,8 +1966,7 @@ static int adv7511_remove(struct i2c_client *client)
 	adv7511_init_setup(sd);
 	cancel_delayed_work(&state->edid_handler);
 	i2c_unregister_device(state->i2c_edid);
-	if (state->i2c_cec)
-		i2c_unregister_device(state->i2c_cec);
+	i2c_unregister_device(state->i2c_cec);
 	i2c_unregister_device(state->i2c_pktmem);
 	destroy_workqueue(state->work_queue);
 	v4l2_device_unregister_subdev(sd);
-- 
2.20.1

