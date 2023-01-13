Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1852A668E5E
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jan 2023 07:54:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239812AbjAMGy1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Jan 2023 01:54:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240140AbjAMGxz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 Jan 2023 01:53:55 -0500
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FAD180AD5;
        Thu, 12 Jan 2023 22:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=+vjCdnNHnoKV66V7CriGqH+jy/q8YcC08G4pBcceoz4=; b=ZxGFpU8MYskapzeoOdpERrzVzq
        YkDWqcyxmJMkvHFeTpfM9+NL+cPObd98toj9MGz4tghL1Ww8xOulgp5Xip2xEJMyPLnqBybKcaY6f
        4hlqG2YHhpm/L2FR7QDAUHCIzKHB3OWke6IVeifKfnxNo2fs2wDisZ5r7+dy3QZC4zAMNsFF+xyji
        CjNWqi+Ga3lMITzHeRm286GFzPRrVf2Jil9ItutdJn2wP36DR3zqWGLTRQC2M6Qd9USVf2Eu5Eg1o
        eFmBqEJiyU2ijIKz9S+IPFpiNvhyyk7TIOO99RXq/nLsYIIFL+X8tr8xQrVdaagSgxNclOzh6/YMF
        618Kzhsg==;
Received: from [2601:1c2:d80:3110::9307] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1pGDhP-000qH5-1J; Fri, 13 Jan 2023 06:37:59 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org
Subject: [PATCH] i2c: axxia: use 'struct' for kernel-doc notation
Date:   Thu, 12 Jan 2023 22:37:56 -0800
Message-Id: <20230113063756.14071-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add "struct" to prevent this kernel-doc warning:

drivers/i2c/busses/i2c-axxia.c:135: warning: cannot understand function prototype: 'struct axxia_i2c_dev '

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Krzysztof Adamski <krzysztof.adamski@nokia.com>
Cc: Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c@vger.kernel.org
---
 drivers/i2c/busses/i2c-axxia.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -- a/drivers/i2c/busses/i2c-axxia.c b/drivers/i2c/busses/i2c-axxia.c
--- a/drivers/i2c/busses/i2c-axxia.c
+++ b/drivers/i2c/busses/i2c-axxia.c
@@ -118,7 +118,7 @@
 #define SDA_HOLD_TIME		0x90
 
 /**
- * axxia_i2c_dev - I2C device context
+ * struct axxia_i2c_dev - I2C device context
  * @base: pointer to register struct
  * @msg: pointer to current message
  * @msg_r: pointer to current read message (sequence transfer)
