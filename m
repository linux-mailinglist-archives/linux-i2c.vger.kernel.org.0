Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A19D839CA2
	for <lists+linux-i2c@lfdr.de>; Sat,  8 Jun 2019 12:57:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727289AbfFHK5S (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 8 Jun 2019 06:57:18 -0400
Received: from sauhun.de ([88.99.104.3]:51954 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727185AbfFHK47 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 8 Jun 2019 06:56:59 -0400
Received: from localhost (p5486CBCC.dip0.t-ipconnect.de [84.134.203.204])
        by pokefinder.org (Postfix) with ESMTPSA id DD9FE3E47A0;
        Sat,  8 Jun 2019 12:56:57 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 32/34] staging: media: soc_camera: mt9t031: simplify getting the adapter of a client
Date:   Sat,  8 Jun 2019 12:56:11 +0200
Message-Id: <20190608105619.593-33-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190608105619.593-1-wsa+renesas@sang-engineering.com>
References: <20190608105619.593-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

We have a dedicated pointer for that, so use it. Much easier to read and
less computation involved.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Please apply to your subsystem tree.

 drivers/staging/media/soc_camera/mt9t031.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/soc_camera/mt9t031.c b/drivers/staging/media/soc_camera/mt9t031.c
index 615ae9df2c57..c14f23221544 100644
--- a/drivers/staging/media/soc_camera/mt9t031.c
+++ b/drivers/staging/media/soc_camera/mt9t031.c
@@ -751,7 +751,7 @@ static int mt9t031_probe(struct i2c_client *client,
 {
 	struct mt9t031 *mt9t031;
 	struct soc_camera_subdev_desc *ssdd = soc_camera_i2c_to_desc(client);
-	struct i2c_adapter *adapter = to_i2c_adapter(client->dev.parent);
+	struct i2c_adapter *adapter = client->adapter;
 	int ret;
 
 	if (!ssdd) {
-- 
2.19.1

