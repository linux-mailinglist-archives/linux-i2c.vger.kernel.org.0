Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3D6A52F468
	for <lists+linux-i2c@lfdr.de>; Fri, 20 May 2022 22:29:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241913AbiETU3c (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 May 2022 16:29:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353444AbiETU3a (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 May 2022 16:29:30 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 170BB18540E
        for <linux-i2c@vger.kernel.org>; Fri, 20 May 2022 13:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=0cklkvq9it+QBY
        JmC7XZH0UQTVqQNLzhlX7tQ1zmjzo=; b=kzDjT9li219djEUe3sWEzT0RVhcIQ0
        hlddROh8KP1GgDU5MnnVlN+QLfqqLnegxdAZ7DI2C2Qv7HAs1+1e5UL2Xx2dRk6B
        RB7VG7YHwZTLEv1Zc4mNjevAcuLWfQhGjWlvMq3v3UHm1zkSLSm/DMyaF6AT04RD
        e60yJ1r0FH+5U=
Received: (qmail 3917270 invoked from network); 20 May 2022 22:29:24 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 May 2022 22:29:24 +0200
X-UD-Smtp-Session: l3s3148p1@Qe2aWHffhOsgAwDtxwyXAGMY7IbT6g6m
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 1/3] i2c: rcar: use BIT macro consistently
Date:   Fri, 20 May 2022 22:29:16 +0200
Message-Id: <20220520202918.17889-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220520202918.17889-1-wsa+renesas@sang-engineering.com>
References: <20220520202918.17889-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Easier to read and ensures proper types.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-rcar.c | 70 +++++++++++++++++------------------
 1 file changed, 35 insertions(+), 35 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 6e932f948293..88d060725301 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -45,44 +45,44 @@
 #define ICDMAER	0x3c	/* DMA enable (Gen3) */
 
 /* ICSCR */
-#define SDBS	(1 << 3)	/* slave data buffer select */
-#define SIE	(1 << 2)	/* slave interface enable */
-#define GCAE	(1 << 1)	/* general call address enable */
-#define FNA	(1 << 0)	/* forced non acknowledgment */
+#define SDBS	BIT(3)	/* slave data buffer select */
+#define SIE	BIT(2)	/* slave interface enable */
+#define GCAE	BIT(1)	/* general call address enable */
+#define FNA	BIT(0)	/* forced non acknowledgment */
 
 /* ICMCR */
-#define MDBS	(1 << 7)	/* non-fifo mode switch */
-#define FSCL	(1 << 6)	/* override SCL pin */
-#define FSDA	(1 << 5)	/* override SDA pin */
-#define OBPC	(1 << 4)	/* override pins */
-#define MIE	(1 << 3)	/* master if enable */
-#define TSBE	(1 << 2)
-#define FSB	(1 << 1)	/* force stop bit */
-#define ESG	(1 << 0)	/* enable start bit gen */
+#define MDBS	BIT(7)	/* non-fifo mode switch */
+#define FSCL	BIT(6)	/* override SCL pin */
+#define FSDA	BIT(5)	/* override SDA pin */
+#define OBPC	BIT(4)	/* override pins */
+#define MIE	BIT(3)	/* master if enable */
+#define TSBE	BIT(2)
+#define FSB	BIT(1)	/* force stop bit */
+#define ESG	BIT(0)	/* enable start bit gen */
 
 /* ICSSR (also for ICSIER) */
-#define GCAR	(1 << 6)	/* general call received */
-#define STM	(1 << 5)	/* slave transmit mode */
-#define SSR	(1 << 4)	/* stop received */
-#define SDE	(1 << 3)	/* slave data empty */
-#define SDT	(1 << 2)	/* slave data transmitted */
-#define SDR	(1 << 1)	/* slave data received */
-#define SAR	(1 << 0)	/* slave addr received */
+#define GCAR	BIT(6)	/* general call received */
+#define STM	BIT(5)	/* slave transmit mode */
+#define SSR	BIT(4)	/* stop received */
+#define SDE	BIT(3)	/* slave data empty */
+#define SDT	BIT(2)	/* slave data transmitted */
+#define SDR	BIT(1)	/* slave data received */
+#define SAR	BIT(0)	/* slave addr received */
 
 /* ICMSR (also for ICMIE) */
-#define MNR	(1 << 6)	/* nack received */
-#define MAL	(1 << 5)	/* arbitration lost */
-#define MST	(1 << 4)	/* sent a stop */
-#define MDE	(1 << 3)
-#define MDT	(1 << 2)
-#define MDR	(1 << 1)
-#define MAT	(1 << 0)	/* slave addr xfer done */
+#define MNR	BIT(6)	/* nack received */
+#define MAL	BIT(5)	/* arbitration lost */
+#define MST	BIT(4)	/* sent a stop */
+#define MDE	BIT(3)
+#define MDT	BIT(2)
+#define MDR	BIT(1)
+#define MAT	BIT(0)	/* slave addr xfer done */
 
 /* ICDMAER */
-#define RSDMAE	(1 << 3)	/* DMA Slave Received Enable */
-#define TSDMAE	(1 << 2)	/* DMA Slave Transmitted Enable */
-#define RMDMAE	(1 << 1)	/* DMA Master Received Enable */
-#define TMDMAE	(1 << 0)	/* DMA Master Transmitted Enable */
+#define RSDMAE	BIT(3)	/* DMA Slave Received Enable */
+#define TSDMAE	BIT(2)	/* DMA Slave Transmitted Enable */
+#define RMDMAE	BIT(1)	/* DMA Master Received Enable */
+#define TMDMAE	BIT(0)	/* DMA Master Transmitted Enable */
 
 /* ICFBSCR */
 #define TCYC17	0x0f		/* 17*Tcyc delay 1st bit between SDA and SCL */
@@ -97,11 +97,11 @@
 #define RCAR_IRQ_RECV	(MNR | MAL | MST | MAT | MDR)
 #define RCAR_IRQ_STOP	(MST)
 
-#define ID_LAST_MSG	(1 << 0)
-#define ID_DONE		(1 << 2)
-#define ID_ARBLOST	(1 << 3)
-#define ID_NACK		(1 << 4)
-#define ID_EPROTO	(1 << 5)
+#define ID_LAST_MSG		BIT(0)
+#define ID_DONE			BIT(2)
+#define ID_ARBLOST		BIT(3)
+#define ID_NACK			BIT(4)
+#define ID_EPROTO		BIT(5)
 /* persistent flags */
 #define ID_P_HOST_NOTIFY	BIT(28)
 #define ID_P_REP_AFTER_RD	BIT(29)
-- 
2.35.1

