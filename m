Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D50B39648B
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2019 17:34:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730433AbfHTPep (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Aug 2019 11:34:45 -0400
Received: from sauhun.de ([88.99.104.3]:37438 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726742AbfHTPeo (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 20 Aug 2019 11:34:44 -0400
Received: from localhost (p54B333DC.dip0.t-ipconnect.de [84.179.51.220])
        by pokefinder.org (Postfix) with ESMTPSA id B86272E354A;
        Tue, 20 Aug 2019 17:34:42 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] media: i2c: adv7842: drop check because i2c_unregister_device() is NULL safe
Date:   Tue, 20 Aug 2019 17:34:41 +0200
Message-Id: <20190820153441.7748-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190820153441.7748-1-wsa+renesas@sang-engineering.com>
References: <20190820153441.7748-1-wsa+renesas@sang-engineering.com>
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

 drivers/media/i2c/adv7842.c | 33 +++++++++++----------------------
 1 file changed, 11 insertions(+), 22 deletions(-)

diff --git a/drivers/media/i2c/adv7842.c b/drivers/media/i2c/adv7842.c
index ffc3d174c4a1..885619841719 100644
--- a/drivers/media/i2c/adv7842.c
+++ b/drivers/media/i2c/adv7842.c
@@ -3351,28 +3351,17 @@ static const struct v4l2_ctrl_config adv7842_ctrl_free_run_color = {
 static void adv7842_unregister_clients(struct v4l2_subdev *sd)
 {
 	struct adv7842_state *state = to_state(sd);
-	if (state->i2c_avlink)
-		i2c_unregister_device(state->i2c_avlink);
-	if (state->i2c_cec)
-		i2c_unregister_device(state->i2c_cec);
-	if (state->i2c_infoframe)
-		i2c_unregister_device(state->i2c_infoframe);
-	if (state->i2c_sdp_io)
-		i2c_unregister_device(state->i2c_sdp_io);
-	if (state->i2c_sdp)
-		i2c_unregister_device(state->i2c_sdp);
-	if (state->i2c_afe)
-		i2c_unregister_device(state->i2c_afe);
-	if (state->i2c_repeater)
-		i2c_unregister_device(state->i2c_repeater);
-	if (state->i2c_edid)
-		i2c_unregister_device(state->i2c_edid);
-	if (state->i2c_hdmi)
-		i2c_unregister_device(state->i2c_hdmi);
-	if (state->i2c_cp)
-		i2c_unregister_device(state->i2c_cp);
-	if (state->i2c_vdp)
-		i2c_unregister_device(state->i2c_vdp);
+	i2c_unregister_device(state->i2c_avlink);
+	i2c_unregister_device(state->i2c_cec);
+	i2c_unregister_device(state->i2c_infoframe);
+	i2c_unregister_device(state->i2c_sdp_io);
+	i2c_unregister_device(state->i2c_sdp);
+	i2c_unregister_device(state->i2c_afe);
+	i2c_unregister_device(state->i2c_repeater);
+	i2c_unregister_device(state->i2c_edid);
+	i2c_unregister_device(state->i2c_hdmi);
+	i2c_unregister_device(state->i2c_cp);
+	i2c_unregister_device(state->i2c_vdp);
 
 	state->i2c_avlink = NULL;
 	state->i2c_cec = NULL;
-- 
2.20.1

