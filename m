Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B28F7474A8
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jul 2023 17:00:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231460AbjGDPAg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 Jul 2023 11:00:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230264AbjGDPAf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 4 Jul 2023 11:00:35 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF408E7B;
        Tue,  4 Jul 2023 08:00:34 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1b7f2239bfdso44959985ad.1;
        Tue, 04 Jul 2023 08:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688482834; x=1691074834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=shPbm+uI5/3SC13jgWVKcgDz0ij5+5a9JEJnuF1lyl4=;
        b=UC/S3gdPWd6a4p3b2UUCvJ21EhmOKfeF2uNwpHRnsgBiPBLfsSAUQH8uc8eXnkV6PB
         GCfedF4FF4Ysx2PUUI5KINe5+QFR70c95VVFhnOl9PLOB+B2V3rAV8jNaAenql6to6if
         Cw6Nbs//dahRBPB1XzBBl7p5HyOKvFITHJbqHE+UvzH4Ze2ndBuv6nfbFIKiu1wnskI9
         MwXLbvgSm+cbVs9ei8pVK9lc2/a59O3W1HTvKn2czGFQisSqWnOsUbh5uCfsuepUK7ry
         3LPbugOMYTerMQ25VGdyo1rT+qTm4OaMFFZUJv+KgLSTxJ6iWeUokLtCsZ+eSYqeJKiG
         U3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688482834; x=1691074834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=shPbm+uI5/3SC13jgWVKcgDz0ij5+5a9JEJnuF1lyl4=;
        b=SfUAVuNU9kP66bm1DTl6y1UPLO46P2tEmchUkrRFnIUVfhBuQXPDG1SUgfkYCluNjF
         1PYH2Uyl+ZlQl9vA+b58BVUIQ6DtkJC7Fr4nyIJwphYSKto5SXlRPeBy2jjDZkp/jLux
         0txGvG3am3ANlIWEo0Kxso5NcKuqNjOn7cIHxzEXwanlA07MIujOsCp2StSYvOis6juC
         VNvpC3EZuZPbluG8Ok/ZdoeauT8xUKfPFIfPnt93rQks33VUOx7y8d/PBrbjy8IqJXLt
         i4qzpPmX2dhwr4KhrtIDFJQMhOIwrB5LevHCeqUrZGSQlAVSj0o2QRV7zY4BUhniL0dy
         ndMg==
X-Gm-Message-State: ABy/qLbrQLZB1dNwhFbz6Q4n5aauPmAhq7ag7Zk9fgky+ThoNLVsQpck
        ymbMWlYt3/iF0yhNyPCQo/temwmr8lQ=
X-Google-Smtp-Source: APBJJlEwneV0k3503cs/fSP9t90yU5YTlNRbaBPzKSno64BHLJh+C87+uHEJENQ+SjUW99NW8ss7CQ==
X-Received: by 2002:a17:902:f546:b0:1b6:6f12:502e with SMTP id h6-20020a170902f54600b001b66f12502emr16904934plf.49.1688482834277;
        Tue, 04 Jul 2023 08:00:34 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j17-20020a170902c3d100b001b849932030sm10180908plj.198.2023.07.04.08.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 08:00:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH] i2c: mpc: Drop unused variable
Date:   Tue,  4 Jul 2023 08:00:31 -0700
Message-Id: <20230704150031.385001-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fix the following build error.

Error log:
drivers/i2c/busses/i2c-mpc.c: In function 'mpc_i2c_setup_512x':
drivers/i2c/busses/i2c-mpc.c:310:20: error: unused variable 'pval'

Fixes: 9d178e00583e ("i2c: mpc: Use of_property_read_reg() to parse "reg"")
Cc: Rob Herring <robh@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/i2c/busses/i2c-mpc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
index fb1b640f33b7..f460a7fb4eae 100644
--- a/drivers/i2c/busses/i2c-mpc.c
+++ b/drivers/i2c/busses/i2c-mpc.c
@@ -307,7 +307,6 @@ static void mpc_i2c_setup_512x(struct device_node *node,
 {
 	struct device_node *node_ctrl;
 	void __iomem *ctrl;
-	const u32 *pval;
 	u32 idx;
 
 	/* Enable I2C interrupts for mpc5121 */
-- 
2.39.2

