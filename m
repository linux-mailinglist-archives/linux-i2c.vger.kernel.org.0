Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D561657F695
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Jul 2022 20:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229640AbiGXSqo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 24 Jul 2022 14:46:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbiGXSqn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 24 Jul 2022 14:46:43 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 772ACDFFE
        for <linux-i2c@vger.kernel.org>; Sun, 24 Jul 2022 11:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=59VMu2mZfc4bQgi0BRYfAUG1XtD
        QsXV1vgkuqsP6Ghk=; b=hAw6mSLTIgFw71fWBG4WnIzxQLewSQd8dcD0tqEGP0X
        07c+CKuAi5earXot/qb7xqDGxhmbYSx8ltHFFUEFM4st4VvrUApdGROzBg74UuCq
        C3Cj4TsBXHsxLVtqHN7PUXv+gtqUQBl2NyEo/V7UAwUo8fYUr4rhKp2w2Wh4Fgbw
        =
Received: (qmail 2068608 invoked from network); 24 Jul 2022 20:46:36 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Jul 2022 20:46:36 +0200
X-UD-Smtp-Session: l3s3148p1@07CgfJHkGWpZD+9y
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] i2c: extend documentation about retvals of master_xfer functions
Date:   Sun, 24 Jul 2022 20:46:28 +0200
Message-Id: <20220724184628.2752-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

It was stated how the error codes should be. It was not stated what the
regular case should return. Add this.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 include/linux/i2c.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index fbda5ada2afc..8eab5017bff3 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -537,7 +537,8 @@ i2c_register_board_info(int busnum, struct i2c_board_info const *info,
  *
  * The return codes from the ``master_xfer{_atomic}`` fields should indicate the
  * type of error code that occurred during the transfer, as documented in the
- * Kernel Documentation file Documentation/i2c/fault-codes.rst.
+ * Kernel Documentation file Documentation/i2c/fault-codes.rst. Otherwise, the
+ * number of messages executed should be returned.
  */
 struct i2c_algorithm {
 	/*
-- 
2.35.1

