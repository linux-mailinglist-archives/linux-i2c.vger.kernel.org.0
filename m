Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F5BF6FD9C6
	for <lists+linux-i2c@lfdr.de>; Wed, 10 May 2023 10:42:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230335AbjEJImg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 May 2023 04:42:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236751AbjEJIm1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 May 2023 04:42:27 -0400
Received: from m126.mail.126.com (m126.mail.126.com [220.181.12.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 82AFC7EF7;
        Wed, 10 May 2023 01:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=URGhC
        Qs1rl6awSzpzIAKRNceZT9h15+rICvuMhdIDz8=; b=H/FclKemSkmFcCKcd/azD
        1DDzqwlCFocj9qu6yKeAGIx+OKTFJANjWMEVtLzVHdzM2Ec9+FmUkwFl8IpGkv+h
        uCwphwjB7uiMUNKfEKaWdMvg7DffmvtTMSce+b+rOr2MsKN17eE1kEdbtesvrtON
        4nciLFozwk682eb3U66teg=
Received: from king.lan (unknown [103.163.180.46])
        by zwqz-smtp-mta-g3-0 (Coremail) with SMTP id _____wC39HCdWFtkpdYvAg--.4572S2;
        Wed, 10 May 2023 16:41:01 +0800 (CST)
From:   wangyouwan@126.com
To:     jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, jsd@semihalf.com
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        youwan Wang <wangyouwan@126.com>
Subject: [PATCH] i2c: fix crash with msgs is NULL points
Date:   Wed, 10 May 2023 16:40:57 +0800
Message-Id: <20230510084057.17313-1-wangyouwan@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wC39HCdWFtkpdYvAg--.4572S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruw1fKF48WrW5WryDZFWDArb_yoWDCFbE9r
        n7Za92grW2yan3Gw13AFsxXrZ09r18Wa4xuF1xt393Cr1jyr1kAF4DAry3Zr1DXF47KFZ0
        g3Wq9F1rAr43JjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjUPEPUUUUU==
X-Originating-IP: [103.163.180.46]
X-CM-SenderInfo: 5zdqw5prxzt0a6rslhhfrp/1tbi3B9rFVpEFVGPZQAAsN
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: youwan Wang <wangyouwan@126.com>

There is some probability that msgs is empty

Signed-off-by: youwan Wang <wangyouwan@126.com>
---
 drivers/i2c/busses/i2c-designware-master.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 55ea91a63382..e11a73fd0a41 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -366,12 +366,17 @@ i2c_dw_xfer_msg(struct dw_i2c_dev *dev)
 	struct i2c_msg *msgs = dev->msgs;
 	u32 intr_mask;
 	int tx_limit, rx_limit;
-	u32 addr = msgs[dev->msg_write_idx].addr;
+	u32 addr;
 	u32 buf_len = dev->tx_buf_len;
 	u8 *buf = dev->tx_buf;
 	bool need_restart = false;
 	unsigned int flr;
 
+	if (WARN_ON(!msgs))
+		return;
+
+	addr = msgs[dev->msg_write_idx].addr;
+
 	intr_mask = DW_IC_INTR_MASTER_MASK;
 
 	for (; dev->msg_write_idx < dev->msgs_num; dev->msg_write_idx++) {
-- 
2.25.1

