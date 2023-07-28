Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94897766C62
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jul 2023 14:01:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236454AbjG1MBd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Jul 2023 08:01:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236387AbjG1MBR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 Jul 2023 08:01:17 -0400
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9108E4488;
        Fri, 28 Jul 2023 05:00:55 -0700 (PDT)
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
        by mx0b-0016f401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36SA5iXa031978;
        Fri, 28 Jul 2023 05:00:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=pfpt0220;
 bh=wj8azf31MMqLKteU8U8+leS/iINL9OVGVCBfp16vErI=;
 b=gPvkeTLRYNyd47jOBaV+zcbUgRqpdntfzVgs2xTWjgIfigJNVh12GdLcGIpoH/Vs7I6w
 wS1b60qRVwydhXA+wonzgvaERxQEyvd3uLdPEbeVAbVm7ciAazye9+BSGmW7BbBGyZQM
 gLyLxYHx32U6ukklndWB0ixoF3Kyz2nrxzfQ1/b0GivpTTz/fHS5DyLsGKlTIJqmIHo1
 t8o5j46OQWnAr7V2BpSGB6SbA4Silyv/G4UmM6mLu0CPoDFURWlsWKRU3r2QFIgj9NDH
 jGleHH8nrLIfT3WFYRR3jwaaNkS7BE69IbBEexnG47jaTTHbafEUs3gLXxDeDNiRvuWc Ng== 
Received: from dc5-exch02.marvell.com ([199.233.59.182])
        by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 3s389rxamc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Fri, 28 Jul 2023 05:00:51 -0700
Received: from DC5-EXCH02.marvell.com (10.69.176.39) by DC5-EXCH02.marvell.com
 (10.69.176.39) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Fri, 28 Jul
 2023 05:00:49 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH02.marvell.com
 (10.69.176.39) with Microsoft SMTP Server id 15.0.1497.48 via Frontend
 Transport; Fri, 28 Jul 2023 05:00:49 -0700
Received: from localhost.localdomain (unknown [10.110.150.250])
        by maili.marvell.com (Postfix) with ESMTP id 320543F704F;
        Fri, 28 Jul 2023 05:00:49 -0700 (PDT)
From:   Piyush Malgujar <pmalgujar@marvell.com>
To:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <andi.shyti@kernel.org>, <rric@kernel.org>
CC:     <cchavva@marvell.com>, <sgarapati@marvell.com>,
        <jannadurai@marvell.com>, Piyush Malgujar <pmalgujar@marvell.com>
Subject: [PATCH v2 3/4] i2c: octeon: Handle watchdog timeout
Date:   Fri, 28 Jul 2023 05:00:03 -0700
Message-ID: <20230728120004.19680-4-pmalgujar@marvell.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230728120004.19680-1-pmalgujar@marvell.com>
References: <20230728120004.19680-1-pmalgujar@marvell.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: nVBBvOsh8FLp5kYEioPtdhqyTkcUb9vp
X-Proofpoint-GUID: nVBBvOsh8FLp5kYEioPtdhqyTkcUb9vp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Suneel Garapati <sgarapati@marvell.com>

Status code 0xF0 refers to expiry of TWSI controller
access watchdog and needs bus monitor reset using MODE
register.

Signed-off-by: Suneel Garapati <sgarapati@marvell.com>
Signed-off-by: Piyush Malgujar <pmalgujar@marvell.com>
Acked-by: Andi Shyti <andi.shyti@kernel.org>
---
 drivers/i2c/busses/i2c-octeon-core.c | 8 ++++++++
 drivers/i2c/busses/i2c-octeon-core.h | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/i2c/busses/i2c-octeon-core.c b/drivers/i2c/busses/i2c-octeon-core.c
index 6636719ca8f005056230620e2cee19de7154e024..0c89d8d640424356f1ea4f7da11d528631ae7efd 100644
--- a/drivers/i2c/busses/i2c-octeon-core.c
+++ b/drivers/i2c/busses/i2c-octeon-core.c
@@ -178,6 +178,7 @@ static int octeon_i2c_hlc_wait(struct octeon_i2c *i2c)
 static int octeon_i2c_check_status(struct octeon_i2c *i2c, int final_read)
 {
 	u8 stat;
+	u64 mode;
 
 	/*
 	 * This is ugly... in HLC mode the status is not in the status register
@@ -240,6 +241,13 @@ static int octeon_i2c_check_status(struct octeon_i2c *i2c, int final_read)
 	case STAT_RXADDR_NAK:
 	case STAT_AD2W_NAK:
 		return -ENXIO;
+
+	case STAT_WDOG_TOUT:
+		mode = __raw_readq(i2c->twsi_base + MODE(i2c));
+		/* Set BUS_MON_RST to reset bus monitor */
+		mode |= BUS_MON_RST_MASK;
+		octeon_i2c_writeq_flush(mode, i2c->twsi_base + MODE(i2c));
+		return -EIO;
 	default:
 		dev_err(i2c->dev, "unhandled state: %d\n", stat);
 		return -EIO;
diff --git a/drivers/i2c/busses/i2c-octeon-core.h b/drivers/i2c/busses/i2c-octeon-core.h
index e89f041550ace5f7cbcdd94146d0193abe51d466..e53fe60a41b7feb7ccc081cc671cec7be00c5a97 100644
--- a/drivers/i2c/busses/i2c-octeon-core.h
+++ b/drivers/i2c/busses/i2c-octeon-core.h
@@ -72,6 +72,7 @@
 #define STAT_SLAVE_ACK		0xC8
 #define STAT_AD2W_ACK		0xD0
 #define STAT_AD2W_NAK		0xD8
+#define STAT_WDOG_TOUT		0xF0
 #define STAT_IDLE		0xF8
 
 /* TWSI_INT values */
@@ -106,6 +107,9 @@ struct octeon_i2c_reg_offset {
 /* Set REFCLK_SRC and HS_MODE in TWSX_MODE register */
 #define TWSX_MODE_HS_MASK	(BIT(4) | BIT(0))
 
+/* Set BUS_MON_RST to reset bus monitor */
+#define BUS_MON_RST_MASK	BIT(3)
+
 struct octeon_i2c {
 	wait_queue_head_t queue;
 	struct i2c_adapter adap;
-- 
2.17.1

