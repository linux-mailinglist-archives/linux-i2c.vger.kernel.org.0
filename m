Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 754901F553F
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jun 2020 14:59:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728814AbgFJM7D (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Jun 2020 08:59:03 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:35582 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728540AbgFJM7D (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 Jun 2020 08:59:03 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1jj0Jp-00052r-9V; Wed, 10 Jun 2020 12:59:01 +0000
From:   Colin King <colin.king@canonical.com>
To:     Paul Cercueil <paul@crapouillou.net>, linux-i2c@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: jz4780: remove redundant assignment to variable i
Date:   Wed, 10 Jun 2020 13:59:01 +0100
Message-Id: <20200610125901.1134204-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.27.0.rc0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable i is being initialized with a value that is
never read and it is being updated later with a new value. The
initialization is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/i2c/busses/i2c-jz4780.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-jz4780.c b/drivers/i2c/busses/i2c-jz4780.c
index ba831df6661e..fcdabfa3b5ee 100644
--- a/drivers/i2c/busses/i2c-jz4780.c
+++ b/drivers/i2c/busses/i2c-jz4780.c
@@ -691,7 +691,7 @@ static inline int jz4780_i2c_xfer_write(struct jz4780_i2c *i2c,
 static int jz4780_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msg,
 			   int count)
 {
-	int i = -EIO;
+	int i;
 	int ret = 0;
 	struct jz4780_i2c *i2c = adap->algo_data;
 
-- 
2.27.0.rc0

