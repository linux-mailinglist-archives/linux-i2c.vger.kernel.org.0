Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CD9916C3D0
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2020 15:26:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730587AbgBYO0V (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Feb 2020 09:26:21 -0500
Received: from sauhun.de ([88.99.104.3]:39388 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730525AbgBYO0V (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 Feb 2020 09:26:21 -0500
Received: from localhost (p5486CE6D.dip0.t-ipconnect.de [84.134.206.109])
        by pokefinder.org (Postfix) with ESMTPSA id 08CF62C1F2E;
        Tue, 25 Feb 2020 15:26:18 +0100 (CET)
From:   Wolfram Sang <wsa@the-dreams.de>
To:     linux-i2c@vger.kernel.org
Cc:     linuxppc-dev@lists.ozlabs.org, Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH] i2c: powermac: correct comment about custom handling
Date:   Tue, 25 Feb 2020 15:26:13 +0100
Message-Id: <20200225142613.7169-1-wsa@the-dreams.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The comment had some flaws which are now fixed:
- the prefix is 'MAC' not 'AAPL'
- no kernel coding style and too short length
- 'we do' instead of 'we to'

Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
---
 drivers/i2c/busses/i2c-powermac.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-powermac.c b/drivers/i2c/busses/i2c-powermac.c
index 973e5339033c..d565714c1f13 100644
--- a/drivers/i2c/busses/i2c-powermac.c
+++ b/drivers/i2c/busses/i2c-powermac.c
@@ -279,14 +279,13 @@ static bool i2c_powermac_get_type(struct i2c_adapter *adap,
 {
 	char tmp[16];
 
-	/* Note: we to _NOT_ want the standard
-	 * i2c drivers to match with any of our powermac stuff
-	 * unless they have been specifically modified to handle
-	 * it on a case by case basis. For example, for thermal
-	 * control, things like lm75 etc... shall match with their
-	 * corresponding windfarm drivers, _NOT_ the generic ones,
-	 * so we force a prefix of AAPL, onto the modalias to
-	 * make that happen
+	/*
+	 * Note: we do _NOT_ want the standard i2c drivers to match with any of
+	 * our powermac stuff unless they have been specifically modified to
+	 * handle it on a case by case basis. For example, for thermal control,
+	 * things like lm75 etc... shall match with their corresponding
+	 * windfarm drivers, _NOT_ the generic ones, so we force a prefix of
+	 * 'MAC', onto the modalias to make that happen
 	 */
 
 	/* First try proper modalias */
-- 
2.20.1

