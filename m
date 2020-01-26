Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 475EB149B87
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Jan 2020 16:43:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbgAZPnC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Jan 2020 10:43:02 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:33004 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725838AbgAZPnB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 26 Jan 2020 10:43:01 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1ivk3t-0000kU-Tf; Sun, 26 Jan 2020 15:42:57 +0000
From:   Colin King <colin.king@canonical.com>
To:     Michal Simek <michal.simek@xilinx.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] i2c: xiic: fix indentation issue
Date:   Sun, 26 Jan 2020 15:42:57 +0000
Message-Id: <20200126154257.41336-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a statment that is indented one level too deeply, remove
the extraneous tab.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
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

