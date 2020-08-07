Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A491F23EE02
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Aug 2020 15:19:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726066AbgHGNTP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Aug 2020 09:19:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:39634 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726015AbgHGNTO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 7 Aug 2020 09:19:14 -0400
Received: from ziggy.com (81.172.57.81.dyn.user.ono.com [81.172.57.81])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E29522086A;
        Fri,  7 Aug 2020 13:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596806354;
        bh=90W/RlmEX3PAdf4oEsZD+boIBLyjUS1TrXoIlmoXv6M=;
        h=From:To:Cc:Subject:Date:From;
        b=K3+w16/vPkbiOROuEmRUBKt2EyFZDHkhwM5D5RPR/xWJI8gBlWeT59Be2kccdeeRA
         sQapHJNEC+JUFGTMpNd6O9xDexL3aIIAvw7Ip+Un4iDC7tbW0jmLN+maSqoWj7tUOr
         RRdZl8udmoxeaVGeBQbK1KrJszBNor5PMilIcjUU=
From:   matthias.bgg@kernel.org
To:     qii.wang@mediatek.com, matthias.bgg@gmail.com, wsa@the-dreams.de,
        yingjoe.chen@mediatek.com
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Matthias Brugger <mbrugger@suse.com>
Subject: [v2] i2c: mediatek: Fix i2c_spec_values description
Date:   Fri,  7 Aug 2020 15:19:04 +0200
Message-Id: <20200807131904.6515-1-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Matthias Brugger <mbrugger@suse.com>

The struct i2c_spec_values have it's members documented but is
missing the starting '@', which leads to warings like:

drivers/i2c/busses/i2c-mt65xx.c:267: warning: Function parameter or member 'min_low_ns' not described in 'i2c_spec_values'

We also delete min_high_ns member as it is not used in the code.

Signed-off-by: Matthias Brugger <mbrugger@suse.com>
---

Changes since v1:
delete mint_high_ns member

 drivers/i2c/busses/i2c-mt65xx.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index e889f74703e4..efc14041d45b 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -253,14 +253,13 @@ struct mtk_i2c {
 
 /**
  * struct i2c_spec_values:
- * min_low_ns: min LOW period of the SCL clock
- * min_su_sta_ns: min set-up time for a repeated START condition
- * max_hd_dat_ns: max data hold time
- * min_su_dat_ns: min data set-up time
+ * @min_low_ns: min LOW period of the SCL clock
+ * @min_su_sta_ns: min set-up time for a repeated START condition
+ * @max_hd_dat_ns: max data hold time
+ * @min_su_dat_ns: min data set-up time
  */
 struct i2c_spec_values {
 	unsigned int min_low_ns;
-	unsigned int min_high_ns;
 	unsigned int min_su_sta_ns;
 	unsigned int max_hd_dat_ns;
 	unsigned int min_su_dat_ns;
-- 
2.28.0

