Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3582C34FAC7
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Mar 2021 09:52:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234273AbhCaHwS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 Mar 2021 03:52:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:52160 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234223AbhCaHwE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 31 Mar 2021 03:52:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 97186619B1;
        Wed, 31 Mar 2021 07:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617177124;
        bh=SBWU4dqOXVDNxMJ1NxfDjDKlQqbBSpOivYvLi5omI6A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dS+Op3aAACQjBgeMBsRuRinn6b/CxFaKbiAN4Ay9D/L4urD9fMK3CdBdiL3MLLlcj
         AAJEo4Xr28+ARM7cnMpQbHhlnJbncXEplF+gMgYeLtvP5cmo+8OBoJnEHn2Wcd4X9j
         7cRCQMLashn4nnZRHXsAHKmemMS98q5XxuHmJO+EYXZSvejHBH8+5sUNZyQSR5XlYi
         A4FlAD5s6zlnTqm4RDHRszFpwlXL1SCELq8s6RYtrWkquGwDaTLX9ePai2xJnYz77l
         1XMDttwjtQAYS33vfzblWOLuYKRqDqJTuX74wRPiQQ9O7UTaVgN7RIwub9F38xg9Pn
         3LUMcbvT1mCQw==
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RFT 2/2] i2c: tegra-bpmp: make some functions void
Date:   Wed, 31 Mar 2021 09:51:41 +0200
Message-Id: <20210331075141.22227-3-wsa@kernel.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210331075141.22227-1-wsa@kernel.org>
References: <20210331075141.22227-1-wsa@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

They return 0 always, so save some lines and code.

Signed-off-by: Wolfram Sang <wsa@kernel.org>
---
 drivers/i2c/busses/i2c-tegra-bpmp.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra-bpmp.c b/drivers/i2c/busses/i2c-tegra-bpmp.c
index 295286ad6d6c..3680d608698b 100644
--- a/drivers/i2c/busses/i2c-tegra-bpmp.c
+++ b/drivers/i2c/busses/i2c-tegra-bpmp.c
@@ -38,7 +38,7 @@ struct tegra_bpmp_i2c {
  * firmware I2C driver to avoid any issues in future if Linux I2C flags are
  * changed.
  */
-static int tegra_bpmp_xlate_flags(u16 flags, u16 *out)
+static void tegra_bpmp_xlate_flags(u16 flags, u16 *out)
 {
 	if (flags & I2C_M_TEN)
 		*out |= SERIALI2C_TEN;
@@ -63,8 +63,6 @@ static int tegra_bpmp_xlate_flags(u16 flags, u16 *out)
 
 	if (flags & I2C_M_RECV_LEN)
 		*out |= SERIALI2C_RECV_LEN;
-
-	return 0;
 }
 
 /**
@@ -81,22 +79,19 @@ static int tegra_bpmp_xlate_flags(u16 flags, u16 *out)
  *
  * See deserialize_i2c documentation for the data format in the other direction.
  */
-static int tegra_bpmp_serialize_i2c_msg(struct tegra_bpmp_i2c *i2c,
+static void tegra_bpmp_serialize_i2c_msg(struct tegra_bpmp_i2c *i2c,
 					struct mrq_i2c_request *request,
 					struct i2c_msg *msgs,
 					unsigned int num)
 {
 	char *buf = request->xfer.data_buf;
 	unsigned int i, j, pos = 0;
-	int err;
 
 	for (i = 0; i < num; i++) {
 		struct i2c_msg *msg = &msgs[i];
 		u16 flags = 0;
 
-		err = tegra_bpmp_xlate_flags(msg->flags, &flags);
-		if (err < 0)
-			return err;
+		tegra_bpmp_xlate_flags(msg->flags, &flags);
 
 		buf[pos++] = msg->addr & 0xff;
 		buf[pos++] = (msg->addr & 0xff00) >> 8;
@@ -112,8 +107,6 @@ static int tegra_bpmp_serialize_i2c_msg(struct tegra_bpmp_i2c *i2c,
 	}
 
 	request->xfer.data_size = pos;
-
-	return 0;
 }
 
 /**
@@ -247,12 +240,7 @@ static int tegra_bpmp_i2c_xfer_common(struct i2c_adapter *adapter,
 	memset(&request, 0, sizeof(request));
 	memset(&response, 0, sizeof(response));
 
-	err = tegra_bpmp_serialize_i2c_msg(i2c, &request, msgs, num);
-	if (err < 0) {
-		dev_err(i2c->dev, "failed to serialize message: %d\n", err);
-		return err;
-	}
-
+	tegra_bpmp_serialize_i2c_msg(i2c, &request, msgs, num);
 	err = tegra_bpmp_i2c_msg_xfer(i2c, &request, &response, atomic);
 	if (err < 0) {
 		dev_err(i2c->dev, "failed to transfer message: %d\n", err);
-- 
2.30.0

