Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4239114A309
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jan 2020 12:30:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730004AbgA0LaN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Jan 2020 06:30:13 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:51995 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726428AbgA0LaN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Jan 2020 06:30:13 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1iw2Kn-0000lf-4X; Mon, 27 Jan 2020 11:13:37 +0000
From:   Colin King <colin.king@canonical.com>
To:     Michal Simek <michal.simek@xilinx.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next][V3] i2c: xiic: fix indentation issue
Date:   Mon, 27 Jan 2020 11:13:36 +0000
Message-Id: <20200127111336.114501-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a statement that is indented one level too deeply, remove
the extraneous tab.

Fixes: b4c119dbc300 ("i2c: xiic: Add timeout to the rx fifo wait loop")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
V2: fix type in commit message
V3: add fixes tag
---
 drivers/i2c/busses/i2c-xiic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index b17d30c9ab40..90c1c362394d 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -261,7 +261,7 @@ static int xiic_clear_rx_fifo(struct xiic_i2c *i2c)
 		xiic_getreg8(i2c, XIIC_DRR_REG_OFFSET);
 		if (time_after(jiffies, timeout)) {
 			dev_err(i2c->dev, "Failed to clear rx fifo\n");
-				return -ETIMEDOUT;
+			return -ETIMEDOUT;
 		}
 	}
 
-- 
2.24.0

