Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7F9677E9EC
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Aug 2023 21:49:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240880AbjHPTss (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Aug 2023 15:48:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345907AbjHPTs2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Aug 2023 15:48:28 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6E7E1FF3
        for <linux-i2c@vger.kernel.org>; Wed, 16 Aug 2023 12:48:27 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-cf4cb742715so7415460276.2
        for <linux-i2c@vger.kernel.org>; Wed, 16 Aug 2023 12:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692215307; x=1692820107;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nkZLboM2Wm9YlU5YcPRNRdsA86AbIHK8rlKPDBuPrH8=;
        b=w1omL2BiOFpkdL5jDclMmBY0GNnDbrWPT4wTL4N2sQpREeclV+NMYHxIdUx9hQ5/X1
         1ceBSumpLZfuuKV31ysa+PqpHBwXG3XdIvLMIOPkMfMCmzt+6STuu9nqzp5vPlc3ROyo
         EwN+SX9nLIhz0we10ylC835cua9hzNyD3wFz35mWISCc755akVT34hz/6ISQX7cymKKQ
         jI+x8IEWL/Tk7pmKBhpVskeeHsg3mt1jzfDz+PyOzmBI6Ksc/CMDJeFHj6MQwwgauTa/
         De/iHDXsuuCoTWEfuqekPQ+aFMTaQFBOBvxacVvea5KIVpTOuyanIORyYaVbcuFbCSQK
         /sCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692215307; x=1692820107;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nkZLboM2Wm9YlU5YcPRNRdsA86AbIHK8rlKPDBuPrH8=;
        b=bgxIpwoSAb7XliNDXSGcmZM0FR0C3d6XOqIb5EoGufIJJfZKE9BDGMxFXs9sknBYHA
         f52bwZQ8mGnT6F/LiGvzwU/3yl1vuvqc5XIEIMjkbLutFdww/ZzlYijR65UTCYV1nX0D
         vfezOAIvWoMDNaBxfNBDsEFi8F3x3XA7Lm/lPFMCQHj1ubb4qI46jYX4bOjOqNFtpPNq
         wwoTEMmdPs/8RftLsjoSQqz+k1Vk1u9w19UxO9qmARV3s+g2pvyzoOl16pRtYaAP0Ouw
         mvI3V3lOfzlunLX7YJ56da/Vgvb0YUFwRZ+AQCr3sVVuMCRPs1Bt9nsj3xQy49JG/BqX
         m2Bg==
X-Gm-Message-State: AOJu0Yza5I8tRoJu+dHdz9IrdsSCR8HEe24BYXe6MU5DDE4Md8i4/5J8
        QhFkUAsEUW5hMODWxICimNViCubeaFOdMWaxWg==
X-Google-Smtp-Source: AGHT+IHjp9P72ZGwmOWlkS671Xd985XpiPnEOZX2GKLyktLXegMqDh3mye2IrJSib9umXBMNuOxs5qxEBzWx72SCXg==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a05:6902:1828:b0:d47:4b58:a19e with
 SMTP id cf40-20020a056902182800b00d474b58a19emr40504ybb.11.1692215307122;
 Wed, 16 Aug 2023 12:48:27 -0700 (PDT)
Date:   Wed, 16 Aug 2023 19:48:23 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAYo3WQC/yWNQQqEMAwAvyI5G6jtrqhfEQ+1TddcVBIsgvh3i
 3ubucxcoCRMCkN1gVBm5W0t0tQVhMWvP0KOxcEa60zXtJg3jhiFM4ki24DzoUp/3E+P3qf+k77 B9WSgVHahxOd7GKf7fgCAzDQXcQAAAA==
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692215306; l=1676;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=hkaFiiA7JBYWa2I9LQiYCZ5i8gpVCmv0FGtI2UsqcAI=; b=C+oj7SwQG5q6DxF4FuXnKHonwIbMc/hMkdyBDnSA5r93/ldMj84vq4vMPjfD+yqNQdN46FsVt
 DYX535Hg3IwCqUUFd4fVOYEFuw7cTbl8W+Vcw+jn7/fL+2Ugzue4gxH
X-Mailer: b4 0.12.3
Message-ID: <20230816-void-drivers-i2c-busses-i2c-pxa-v1-1-931634b931ec@google.com>
Subject: [PATCH] i2c: pxa: fix clang -Wvoid-pointer-to-enum-cast warning
From:   Justin Stitt <justinstitt@google.com>
To:     Andi Shyti <andi.shyti@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When building with clang 18 I see the following warning:
|       drivers/i2c/busses/i2c-pxa.c:1267:15: warning: cast to smaller integer
|       type 'enum pxa_i2c_types' from 'const void *' [-Wvoid-pointer-to-enum-cast]
|        1267 |         *i2c_types = (enum pxa_i2c_types)(of_id->data);

This is due to the fact that `of_id->data` is a void* while `enum pxa_i2c_types`
has the size of an int.

Cast `of_id->data` to a uintptr_t to silence the above warning for clang
builds using W=1

Link: https://github.com/ClangBuiltLinux/linux/issues/1910
Reported-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Note: I think something like this may be more readable:
| 	*i2c_types = (enum pxa_i2c_types)(uintptr_t)of_id->data;

Thoughts on this approach against the one present in this patch?
---
 drivers/i2c/busses/i2c-pxa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index 937f7eebe906..20d1132d3d69 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -1264,7 +1264,7 @@ static int i2c_pxa_probe_dt(struct platform_device *pdev, struct pxa_i2c *i2c,
 	i2c->use_pio = of_property_read_bool(np, "mrvl,i2c-polling");
 	i2c->fast_mode = of_property_read_bool(np, "mrvl,i2c-fast-mode");
 
-	*i2c_types = (enum pxa_i2c_types)(of_id->data);
+	*i2c_types = (uintptr_t)of_id->data;
 
 	return 0;
 }

---
base-commit: 2ccdd1b13c591d306f0401d98dedc4bdcd02b421
change-id: 20230816-void-drivers-i2c-busses-i2c-pxa-aaf94f5c39e0

Best regards,
--
Justin Stitt <justinstitt@google.com>

