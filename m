Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB7963404B5
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Mar 2021 12:36:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229896AbhCRLgK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Mar 2021 07:36:10 -0400
Received: from mail.sch.bme.hu ([152.66.249.140]:15944 "EHLO mail.sch.bme.hu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230125AbhCRLfx (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 18 Mar 2021 07:35:53 -0400
Received: from Exchange2016-1.sch.bme.hu (152.66.249.140) by
 Exchange2016-1.sch.bme.hu (152.66.249.140) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2176.2; Thu, 18 Mar 2021 12:35:47 +0100
Received: from Cognitio.sch.bme.hu (152.66.211.220) by
 Exchange2016-1.sch.bme.hu (152.66.249.140) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 18 Mar 2021 12:35:47 +0100
From:   =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <bence98@sch.bme.hu>
To:     <linux-i2c@vger.kernel.org>
CC:     =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <bence98@sch.bme.hu>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 1/2] i2c: Add I2C_AQ_NO_REP_START adapter quirk
Date:   Thu, 18 Mar 2021 11:52:09 +0000
Message-ID: <20210318115210.2014204-2-bence98@sch.bme.hu>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210318115210.2014204-1-bence98@sch.bme.hu>
References: <20210318115210.2014204-1-bence98@sch.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This quirk signifies that the adapter cannot do a repeated
START, it always issues a STOP condition after transfers.

Signed-off-by: Bence Csókás <bence98@sch.bme.hu>
---
 include/linux/i2c.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 56622658b215..a670ae129f4b 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -687,6 +687,8 @@ struct i2c_adapter_quirks {
 #define I2C_AQ_NO_ZERO_LEN_READ		BIT(5)
 #define I2C_AQ_NO_ZERO_LEN_WRITE	BIT(6)
 #define I2C_AQ_NO_ZERO_LEN		(I2C_AQ_NO_ZERO_LEN_READ | I2C_AQ_NO_ZERO_LEN_WRITE)
+/* adapter cannot do repeated START */
+#define I2C_AQ_NO_REP_START		BIT(7)
 
 /*
  * i2c_adapter is the structure used to identify a physical i2c bus along
-- 
2.31.0

