Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47E5D18EB7D
	for <lists+linux-i2c@lfdr.de>; Sun, 22 Mar 2020 19:23:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726137AbgCVSXg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 22 Mar 2020 14:23:36 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:33005 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725997AbgCVSXg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 22 Mar 2020 14:23:36 -0400
Received: by mail-wr1-f68.google.com with SMTP id a25so14027549wrd.0
        for <linux-i2c@vger.kernel.org>; Sun, 22 Mar 2020 11:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=mJxJlTV4kRRQdamwDKjoIvHLdlpESFc+S0X+geSNFqE=;
        b=BJaiKVHOu3AzckjfTNAW7nWLG7qzRP4YevQaBhi1qM6EFEruYms/H447/JaITaOGmy
         1NjCsotimSOEddJqoP6QIXKRGQS/GVnQkV/q5uejX4Q1Eg5S7Xe2QCGoMp48pR5WNb06
         un+BC6TI3OSW80qWsCZGdBwj6SRhdLm9D702g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=mJxJlTV4kRRQdamwDKjoIvHLdlpESFc+S0X+geSNFqE=;
        b=ha2oa+2L4u+Cz1Xo3ls6mBW/cL4QzyHzi8IsBUjaHbcbQagi0uggsPVqEf4OQP9svT
         1VJOnltkwAsIg/jpqTlTjC921liaVPmuMLb63uIfSBagNuGQ8TxLPhEPgHZmm2Jb1Vi0
         I8eR4mOpPURmHK89hFOjh+Bfou1S1UXRP5T+ViDfPDQqv2XqkWw20kOB79A4Sez+zpjB
         bB7zj1KJdtexzfPQnA1Ecd9158RpTSBrX22FrKBXXjXNZRnB2ij4oF2DXmNxUeCxNxvi
         WzQmORdugvr0T+lMkfeU3GkKvPbU7br6aZF4WrqVWP5H/JfuXdKjcwPbqlN/AW4e9ZqG
         fHEg==
X-Gm-Message-State: ANhLgQ29ne8RURaZKQ+5HDb9DimS7Vne0iZC9K/hDih4kkkDo+Xj6q7Y
        SQIz2sRlgn2jNQ87nSzpBiB89g==
X-Google-Smtp-Source: ADFU+vvcdR4iaQTCyJEtVWF44e2sCFqWNQLkGn043JRn0pdCuYAclM13FTmoxf09QPwSxZnocF2WGQ==
X-Received: by 2002:adf:b1c1:: with SMTP id r1mr23574240wra.337.1584901414969;
        Sun, 22 Mar 2020 11:23:34 -0700 (PDT)
Received: from rayagonda.dhcp.broadcom.net ([192.19.234.250])
        by smtp.gmail.com with ESMTPSA id z6sm18498640wrp.95.2020.03.22.11.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2020 11:23:34 -0700 (PDT)
From:   Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
To:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Wolfram Sang <wsa@the-dreams.de>,
        Lori Hikichi <lori.hikichi@broadcom.com>,
        Shreesha Rajashekar <shreesha.rajashekar@broadcom.com>,
        Nishka Dasgupta <nishkadg.linux@gmail.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Subject: [PATCH v1 1/1] i2c: iproc: add support for SMBUS quick cmd
Date:   Sun, 22 Mar 2020 23:53:22 +0530
Message-Id: <20200322182322.32743-1-rayagonda.kokatanur@broadcom.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add support for SMBUS quick command.

SMBUS quick command passes single bit of information to the
slave (target) device. Can be used to turn slave device on or off.

By default i2c_detect tool uses the smbus quick cmd to try and
detect devices. Without this support it will not detect some slaves.

Signed-off-by: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
---
 drivers/i2c/busses/i2c-bcm-iproc.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
index 30efb7913b2e..6a461e06e6dd 100644
--- a/drivers/i2c/busses/i2c-bcm-iproc.c
+++ b/drivers/i2c/busses/i2c-bcm-iproc.c
@@ -79,6 +79,7 @@
 #define M_CMD_STATUS_RX_FIFO_FULL    0x6
 #define M_CMD_PROTOCOL_SHIFT         9
 #define M_CMD_PROTOCOL_MASK          0xf
+#define M_CMD_PROTOCOL_QUICK         0x0
 #define M_CMD_PROTOCOL_BLK_WR        0x7
 #define M_CMD_PROTOCOL_BLK_RD        0x8
 #define M_CMD_PROTOCOL_PROCESS       0xa
@@ -765,7 +766,11 @@ static int bcm_iproc_i2c_xfer_internal(struct bcm_iproc_i2c_dev *iproc_i2c,
 	 * number of bytes to read
 	 */
 	val = BIT(M_CMD_START_BUSY_SHIFT);
-	if (msg->flags & I2C_M_RD) {
+
+	if (msg->len == 0) {
+		/* SMBUS QUICK Command (Read/Write) */
+		val |= (M_CMD_PROTOCOL_QUICK << M_CMD_PROTOCOL_SHIFT);
+	} else if (msg->flags & I2C_M_RD) {
 		u32 protocol;
 
 		iproc_i2c->rx_bytes = 0;
@@ -827,8 +832,7 @@ static uint32_t bcm_iproc_i2c_functionality(struct i2c_adapter *adap)
 {
 	u32 val;
 
-	/* We do not support the SMBUS Quick command */
-	val = I2C_FUNC_I2C | (I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK);
+	val = I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
 
 	if (adap->algo->reg_slave)
 		val |= I2C_FUNC_SLAVE;
-- 
2.17.1

