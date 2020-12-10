Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A82BA2D628E
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Dec 2020 17:54:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389916AbgLJQxD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Dec 2020 11:53:03 -0500
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:42344 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2392247AbgLJQwI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Dec 2020 11:52:08 -0500
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@nvidia.com)
        with SMTP; 10 Dec 2020 18:51:17 +0200
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 0BAGpFT2032299;
        Thu, 10 Dec 2020 18:51:17 +0200
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH i2c-next 2/3] i2c: mlxcpld: Decrease polling time for performance improvement
Date:   Thu, 10 Dec 2020 18:51:12 +0200
Message-Id: <20201210165113.6130-3-vadimp@nvidia.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201210165113.6130-1-vadimp@nvidia.com>
References: <20201210165113.6130-1-vadimp@nvidia.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Decrease polling time 'MLXCPLD_I2C_POLL_TIME' from 2000 usec to 400
usec. It greatly improves performance of I2C transactions.

Reliability of setting polling time to 400 usec has been thoroughly
validated across all the supported systems.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/i2c/busses/i2c-mlxcpld.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mlxcpld.c b/drivers/i2c/busses/i2c-mlxcpld.c
index dbd185368c38..9e45214d1eb6 100644
--- a/drivers/i2c/busses/i2c-mlxcpld.c
+++ b/drivers/i2c/busses/i2c-mlxcpld.c
@@ -25,7 +25,7 @@
 #define MLXCPLD_I2C_MAX_ADDR_LEN	4
 #define MLXCPLD_I2C_RETR_NUM		2
 #define MLXCPLD_I2C_XFER_TO		500000 /* usec */
-#define MLXCPLD_I2C_POLL_TIME		2000   /* usec */
+#define MLXCPLD_I2C_POLL_TIME		400   /* usec */
 
 /* LPC I2C registers */
 #define MLXCPLD_LPCI2C_CPBLTY_REG	0x0
-- 
2.11.0

