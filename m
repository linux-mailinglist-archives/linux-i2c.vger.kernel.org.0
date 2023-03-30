Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D44EA6D0723
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Mar 2023 15:43:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232132AbjC3Nnk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Mar 2023 09:43:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232181AbjC3Nnc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 Mar 2023 09:43:32 -0400
Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D39DBDFD;
        Thu, 30 Mar 2023 06:43:23 -0700 (PDT)
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
        by mx0a-0016f401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32UDAlfq014499;
        Thu, 30 Mar 2023 06:43:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=pfpt0220;
 bh=Ssk0O0bXBPfhBKJenQvgeKoOFmkN+0GiqUnjxldS3ws=;
 b=Z9UcGxhIQZFx6FuvYtJiiReWsTwhMauciJKUrm+0aMxm5oDf13jCqZSRX5Sq1vDeFonT
 vBY1d51DTtZabjKezIHECiOnaz/rwSJr1vGgvsRbSyVkMv8eQEovO4E1lEIEWTSnxZ08
 vLWIjUG3obG5Vf/YD0R7tGDzXxb9zjiQ0n//MPvBJOwGuFWAcBAQApSEDMLilXVfdfAh
 WMkvZjozZakJa7CUF3hqgBoobL5OWc9psuMc+BO2Uql5ogMQo4YumV/g3+5r4KXu/Ubx
 idiJ1MOlIV0Ql/dKX6LC9IjNBjKCsfFgg+LLDoycqk9ApyaOparATIxZp7Zz5zSaghcf rg== 
Received: from dc5-exch02.marvell.com ([199.233.59.182])
        by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 3pn2ty2nvq-12
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Thu, 30 Mar 2023 06:43:21 -0700
Received: from DC5-EXCH02.marvell.com (10.69.176.39) by DC5-EXCH02.marvell.com
 (10.69.176.39) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Thu, 30 Mar
 2023 06:40:45 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH02.marvell.com
 (10.69.176.39) with Microsoft SMTP Server id 15.0.1497.48 via Frontend
 Transport; Thu, 30 Mar 2023 06:40:45 -0700
Received: from localhost.localdomain (unknown [10.110.150.250])
        by maili.marvell.com (Postfix) with ESMTP id C220F3F704A;
        Thu, 30 Mar 2023 06:40:45 -0700 (PDT)
From:   Piyush Malgujar <pmalgujar@marvell.com>
To:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <wsa@kernel.org>, <rric@kernel.org>
CC:     <jannadurai@marvell.com>, <cchavva@marvell.com>,
        Suneel Garapati <sgarapati@marvell.com>,
        Piyush Malgujar <pmalgujar@marvell.com>
Subject: [PATCH 3/3] i2c: octeon: Handle watchdog timeout
Date:   Thu, 30 Mar 2023 06:39:53 -0700
Message-ID: <20230330133953.21074-4-pmalgujar@marvell.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230330133953.21074-1-pmalgujar@marvell.com>
References: <20230330133953.21074-1-pmalgujar@marvell.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 5yIs7O4U5wswzkYXU_QdDCdps8dWcBwJ
X-Proofpoint-ORIG-GUID: 5yIs7O4U5wswzkYXU_QdDCdps8dWcBwJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-30_09,2023-03-30_03,2023-02-09_01
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
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
---
 drivers/i2c/busses/i2c-octeon-core.c | 8 ++++++++
 drivers/i2c/busses/i2c-octeon-core.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/drivers/i2c/busses/i2c-octeon-core.c b/drivers/i2c/busses/i2c-octeon-core.c
index 7c49dc8ccbd2ef05fec675d282193b98f2b69835..3482db7165f243232937e0af148fe996858e9f2e 100644
--- a/drivers/i2c/busses/i2c-octeon-core.c
+++ b/drivers/i2c/busses/i2c-octeon-core.c
@@ -187,6 +187,7 @@ static int octeon_i2c_hlc_wait(struct octeon_i2c *i2c)
 static int octeon_i2c_check_status(struct octeon_i2c *i2c, int final_read)
 {
 	u8 stat;
+	u64 mode;
 
 	/*
 	 * This is ugly... in HLC mode the status is not in the status register
@@ -249,6 +250,13 @@ static int octeon_i2c_check_status(struct octeon_i2c *i2c, int final_read)
 	case STAT_RXADDR_NAK:
 	case STAT_AD2W_NAK:
 		return -ENXIO;
+
+	case STAT_WDOG_TOUT:
+		mode = __raw_readq(i2c->twsi_base + MODE(i2c));
+		/* Set BUS_MON_RST to reset bus monitor */
+		mode |= BIT(3);
+		octeon_i2c_writeq_flush(mode, i2c->twsi_base + MODE(i2c));
+		return -EIO;
 	default:
 		dev_err(i2c->dev, "unhandled state: %d\n", stat);
 		return -EIO;
diff --git a/drivers/i2c/busses/i2c-octeon-core.h b/drivers/i2c/busses/i2c-octeon-core.h
index 89d7d3bb8e30bd5787978d17d5a9b20ab0d41e22..a8d1bf9e89b8b0d21f52ff9f77f0ecf5263b5843 100644
--- a/drivers/i2c/busses/i2c-octeon-core.h
+++ b/drivers/i2c/busses/i2c-octeon-core.h
@@ -72,6 +72,7 @@
 #define STAT_SLAVE_ACK		0xC8
 #define STAT_AD2W_ACK		0xD0
 #define STAT_AD2W_NAK		0xD8
+#define STAT_WDOG_TOUT		0xF0
 #define STAT_IDLE		0xF8
 
 /* TWSI_INT values */
-- 
2.17.1

