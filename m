Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AA9D256D99
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Aug 2020 14:21:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726030AbgH3MV3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Aug 2020 08:21:29 -0400
Received: from 212.199.177.27.static.012.net.il ([212.199.177.27]:53738 "EHLO
        herzl.nuvoton.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726130AbgH3MV2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 30 Aug 2020 08:21:28 -0400
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
        by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 07UCKsfm000554;
        Sun, 30 Aug 2020 15:20:54 +0300
Received: by taln60.nuvoton.co.il (Postfix, from userid 20088)
        id B9DDC639D3; Sun, 30 Aug 2020 15:20:54 +0300 (IDT)
From:   Tali Perry <tali.perry1@gmail.com>
To:     kunyi@google.com, xqiu@google.com, benjaminfair@google.com,
        avifishman70@gmail.com, joel@jms.id.au, tmaimon77@gmail.com,
        wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>
Subject: [PATCH v2] i2c: npcm7xx: bug fix timeout (usec instead of msec)
Date:   Sun, 30 Aug 2020 15:20:51 +0300
Message-Id: <20200830122051.197892-1-tali.perry1@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

i2c: npcm7xx: bug fix timeout (usec instead of msec)

Signed-off-by: Tali Perry <tali.perry1@gmail.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 75f07138a6fa..abb334492a3d 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2093,8 +2093,13 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 		}
 	}
 
-	/* Adaptive TimeOut: astimated time in usec + 100% margin */
-	timeout_usec = (2 * 10000 / bus->bus_freq) * (2 + nread + nwrite);
+	/*
+	 * Adaptive TimeOut: estimated time in usec + 100% margin:
+	 * 2: double the timeout for clock stretching case
+	 * 9: bits per transaction (including the ack/nack)
+	 * 1000000: micro second in a second
+	 */
+	timeout_usec = (2 * 9 * 1000000 / bus->bus_freq) * (2 + nread + nwrite);
 	timeout = max(msecs_to_jiffies(35), usecs_to_jiffies(timeout_usec));
 	if (nwrite >= 32 * 1024 || nread >= 32 * 1024) {
 		dev_err(bus->dev, "i2c%d buffer too big\n", bus->num);

base-commit: d012a7190fc1fd72ed48911e77ca97ba4521bccd
-- 
2.22.0

