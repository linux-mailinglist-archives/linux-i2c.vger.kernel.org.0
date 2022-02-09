Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E30DA4AFEE8
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Feb 2022 22:04:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232768AbiBIVEJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Feb 2022 16:04:09 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:54562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232767AbiBIVEJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Feb 2022 16:04:09 -0500
Received: from smtp-fw-80007.amazon.com (smtp-fw-80007.amazon.com [99.78.197.218])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C913C094CAC;
        Wed,  9 Feb 2022 13:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1644440652; x=1675976652;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=10tm3cQsz7x9PrwW3/R/GSrD5sWBEjDc7ttJqudyxLM=;
  b=B3GFd7auusninFXrghiq+YzqPFwqiU3hXrKH+DkC9I1DzNKUk0jre9hX
   C+fQie6o9f2CHCRaycVnPC5XPEwgW1b2CKbDE6lqWeaKJpG/0O3fPzeKD
   RSGPUv1xajvTbfFhEWAwbX47BtD0L6iNNKg6PfwF/9+KN+4mS5ssrEgqZ
   g=;
X-IronPort-AV: E=Sophos;i="5.88,356,1635206400"; 
   d="scan'208";a="61888969"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO email-inbound-relay-iad-1e-98691110.us-east-1.amazon.com) ([10.25.36.210])
  by smtp-border-fw-80007.pdx80.corp.amazon.com with ESMTP; 09 Feb 2022 21:04:10 +0000
Received: from EX13MTAUWC002.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
        by email-inbound-relay-iad-1e-98691110.us-east-1.amazon.com (Postfix) with ESMTPS id DA0188124D;
        Wed,  9 Feb 2022 21:04:07 +0000 (UTC)
Received: from EX13D47UWC001.ant.amazon.com (10.43.162.39) by
 EX13MTAUWC002.ant.amazon.com (10.43.162.240) with Microsoft SMTP Server (TLS)
 id 15.0.1497.28; Wed, 9 Feb 2022 21:04:06 +0000
Received: from dev-dsk-jorcrous-2c-c78924fd.us-west-2.amazon.com
 (10.43.162.55) by EX13D47UWC001.ant.amazon.com (10.43.162.39) with Microsoft
 SMTP Server (TLS) id 15.0.1497.28; Wed, 9 Feb 2022 21:04:06 +0000
From:   <jorcrous@amazon.com>
To:     <linux-arm-msm@vger.kernel.org>
CC:     Jordan Crouse <jorcrous@amazon.com>,
        Akash Asthana <akashast@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mukesh Savaliya <msavaliy@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH] i2c: qcom-geni: Fix return value for master_xfer
Date:   Wed, 9 Feb 2022 21:03:56 +0000
Message-ID: <20220209210356.2848-1-jorcrous@amazon.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.43.162.55]
X-ClientProxiedBy: EX13D24UWB002.ant.amazon.com (10.43.161.159) To
 EX13D47UWC001.ant.amazon.com (10.43.162.39)
X-Spam-Status: No, score=-11.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Jordan Crouse <jorcrous@amazon.com>

The master_xfer function is supposed to return the number of messages that
were processed. Both  geni_i2c_gpi_xfer and geni_i2c_fifo_xfer are
returning 0 which is being interpeted as a error in the upper layers.

Fixes: 8133682618cb ("i2c: qcom-geni: Add support for GPI DMA")
Signed-off-by: Jordan Crouse <jorcrous@amazon.com>
---

 drivers/i2c/busses/i2c-qcom-geni.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index c5345f3421a8..e008161e1a67 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -619,7 +619,7 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
 		geni_i2c_gpi_unmap(gi2c, &msgs[i], tx_buf, tx_addr, rx_buf, rx_addr);
 	}
 
-	return 0;
+	return num;
 
 err:
 	dmaengine_terminate_sync(gi2c->rx_c);
@@ -645,10 +645,10 @@ static int geni_i2c_fifo_xfer(struct geni_i2c_dev *gi2c,
 			ret = geni_i2c_tx_one_msg(gi2c, &msgs[i], m_param);
 
 		if (ret)
-			break;
+			return ret;
 	}
 
-	return ret;
+	return num;
 }
 
 static int geni_i2c_xfer(struct i2c_adapter *adap,
-- 
2.32.0

