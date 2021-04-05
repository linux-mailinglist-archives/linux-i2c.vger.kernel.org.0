Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 105A9353E0B
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Apr 2021 12:33:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237712AbhDEJDi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Apr 2021 05:03:38 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:15542 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237686AbhDEJDd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Apr 2021 05:03:33 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FDPky3mZlzPnp9
        for <linux-i2c@vger.kernel.org>; Mon,  5 Apr 2021 17:00:42 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Mon, 5 Apr 2021 17:03:24 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <linux-i2c@vger.kernel.org>
Subject: [PATCH drivers/i2c 2/3] i2c: iop3xx: Fix coding style issues
Date:   Mon, 5 Apr 2021 17:03:49 +0800
Message-ID: <1617613430-11921-3-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617613430-11921-1-git-send-email-tiantao6@hisilicon.com>
References: <1617613430-11921-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fix 20 checkpatch errors.

Among these errors, 18 of them are incorrect space usage, such as:

  ERROR: space prohibited after that open parenthesis '('
  #128: FILE: drivers/i2c/busses/i2c-iop3xx.c:128:
  +               if ( !rc ) rc = -I2C_ERR_BERR

The remaining two errors are trailing statements should be on next line,
such as:

  ERROR: trailing statements should be on next line
  #128: FILE: drivers/i2c/busses/i2c-iop3xx.c:128:
  +               if ( !rc ) rc = -I2C_ERR_BERR;

No functional changes.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
Signed-off-by: Zihao Tang <tangzihao1@hisilicon.com>
---
 drivers/i2c/busses/i2c-iop3xx.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-iop3xx.c b/drivers/i2c/busses/i2c-iop3xx.c
index 2f8b805..cfecaf1 100644
--- a/drivers/i2c/busses/i2c-iop3xx.c
+++ b/drivers/i2c/busses/i2c-iop3xx.c
@@ -125,10 +125,12 @@ iop3xx_i2c_error(u32 sr)
 	int rc = 0;
 
 	if ((sr & IOP3XX_ISR_BERRD)) {
-		if ( !rc ) rc = -I2C_ERR_BERR;
+		if (!rc)
+			rc = -I2C_ERR_BERR;
 	}
 	if ((sr & IOP3XX_ISR_ALD)) {
-		if ( !rc ) rc = -I2C_ERR_ALD;
+		if (!rc)
+			rc = -I2C_ERR_ALD;
 	}
 	return rc;
 }
@@ -151,12 +153,12 @@ iop3xx_i2c_get_srstat(struct i2c_algo_iop3xx_data *iop3xx_adap)
  * sleep until interrupted, then recover and analyse the SR
  * saved by handler
  */
-typedef int (* compare_func)(unsigned test, unsigned mask);
+typedef int (*compare_func)(unsigned test, unsigned mask);
 /* returns 1 on correct comparison */
 
 static int
 iop3xx_i2c_wait_event(struct i2c_algo_iop3xx_data *iop3xx_adap,
-			  unsigned flags, unsigned* status,
+			  unsigned flags, unsigned *status,
 			  compare_func compare)
 {
 	unsigned sr = 0;
@@ -167,7 +169,7 @@ iop3xx_i2c_wait_event(struct i2c_algo_iop3xx_data *iop3xx_adap,
 	do {
 		interrupted = wait_event_interruptible_timeout (
 			iop3xx_adap->waitq,
-			(done = compare( sr = iop3xx_i2c_get_srstat(iop3xx_adap) ,flags )),
+			(done = compare(sr = iop3xx_i2c_get_srstat(iop3xx_adap), flags)),
 			1 * HZ
 			);
 		if ((rc = iop3xx_i2c_error(sr)) < 0) {
@@ -177,7 +179,7 @@ iop3xx_i2c_wait_event(struct i2c_algo_iop3xx_data *iop3xx_adap,
 			*status = sr;
 			return -ETIMEDOUT;
 		}
-	} while(!done);
+	} while (!done);
 
 	*status = sr;
 
@@ -204,7 +206,7 @@ iop3xx_i2c_wait_tx_done(struct i2c_algo_iop3xx_data *iop3xx_adap, int *status)
 {
 	return iop3xx_i2c_wait_event(
 		iop3xx_adap,
-	        IOP3XX_ISR_TXEMPTY | IOP3XX_ISR_ALD | IOP3XX_ISR_BERRD,
+		IOP3XX_ISR_TXEMPTY | IOP3XX_ISR_ALD | IOP3XX_ISR_BERRD,
 		status, any_bits_set);
 }
 
@@ -226,7 +228,7 @@ iop3xx_i2c_wait_idle(struct i2c_algo_iop3xx_data *iop3xx_adap, int *status)
 
 static int
 iop3xx_i2c_send_target_addr(struct i2c_algo_iop3xx_data *iop3xx_adap,
-				struct i2c_msg* msg)
+				struct i2c_msg *msg)
 {
 	unsigned long cr = __raw_readl(iop3xx_adap->ioaddr + CR_OFFSET);
 	int status;
@@ -273,7 +275,7 @@ iop3xx_i2c_write_byte(struct i2c_algo_iop3xx_data *iop3xx_adap, char byte,
 }
 
 static int
-iop3xx_i2c_read_byte(struct i2c_algo_iop3xx_data *iop3xx_adap, char* byte,
+iop3xx_i2c_read_byte(struct i2c_algo_iop3xx_data *iop3xx_adap, char *byte,
 				int stop)
 {
 	unsigned long cr = __raw_readl(iop3xx_adap->ioaddr + CR_OFFSET);
@@ -305,7 +307,7 @@ iop3xx_i2c_writebytes(struct i2c_adapter *i2c_adap, const char *buf, int count)
 	int rc = 0;
 
 	for (ii = 0; rc == 0 && ii != count; ++ii)
-		rc = iop3xx_i2c_write_byte(iop3xx_adap, buf[ii], ii==count-1);
+		rc = iop3xx_i2c_write_byte(iop3xx_adap, buf[ii], ii == count-1);
 	return rc;
 }
 
@@ -317,7 +319,7 @@ iop3xx_i2c_readbytes(struct i2c_adapter *i2c_adap, char *buf, int count)
 	int rc = 0;
 
 	for (ii = 0; rc == 0 && ii != count; ++ii)
-		rc = iop3xx_i2c_read_byte(iop3xx_adap, &buf[ii], ii==count-1);
+		rc = iop3xx_i2c_read_byte(iop3xx_adap, &buf[ii], ii == count-1);
 
 	return rc;
 }
@@ -330,7 +332,7 @@ iop3xx_i2c_readbytes(struct i2c_adapter *i2c_adap, char *buf, int count)
  * condition.
  */
 static int
-iop3xx_i2c_handle_msg(struct i2c_adapter *i2c_adap, struct i2c_msg* pmsg)
+iop3xx_i2c_handle_msg(struct i2c_adapter *i2c_adap, struct i2c_msg *pmsg)
 {
 	struct i2c_algo_iop3xx_data *iop3xx_adap = i2c_adap->algo_data;
 	int rc;
@@ -369,7 +371,7 @@ iop3xx_i2c_master_xfer(struct i2c_adapter *i2c_adap, struct i2c_msg *msgs,
 
 	iop3xx_i2c_transaction_cleanup(iop3xx_adap);
 
-	if(ret)
+	if (ret)
 		return ret;
 
 	return im;
-- 
2.7.4

