Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 274715347E2
	for <lists+linux-i2c@lfdr.de>; Thu, 26 May 2022 03:09:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231168AbiEZBJ3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 25 May 2022 21:09:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345518AbiEZBJ0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 25 May 2022 21:09:26 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B8A5972BD
        for <linux-i2c@vger.kernel.org>; Wed, 25 May 2022 18:09:25 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id v9so578064oie.5
        for <linux-i2c@vger.kernel.org>; Wed, 25 May 2022 18:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8qeLsmkLFjZrwsQ5wQ7ctSmVFgEYNzLLrEHfowanxvg=;
        b=hNGaTXFOrVZqUk7tgA7ayfPjtFT9dhJYhgZXsrlOSWMUAQp6lVOd6NuHtHtEYm4DBW
         k9VZ2eZXIgRJrU4d8Fdr8/k8aVNrIdoXEeIAigPpmGdYSX/f7yNoakPdl0MEFIZhJR4Y
         7Qz/EESqRSSlpcAKtUoADFIfgDH1aUgVYCD6CPlL4d9vOIrbX4wAzlQSO3svnTUwEtqj
         kuef6vIDhCdSJ3Yj6wQf+y2/q5TcaIOVtow6bwxC+R/ZzuobgY4rraw1wNBx8DTI9Hn2
         s2boha5OwBfWqlEqDzukSBGeBdB1bKSCkYxSWNWvOqDfo7Jz78/mOjuxuzX0ItnwuSsC
         nalQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8qeLsmkLFjZrwsQ5wQ7ctSmVFgEYNzLLrEHfowanxvg=;
        b=WdO/aNK4+k+C/34nCiKwvCEav69XGGCrfxSGRX6/46H9i4ukl7renFMvn8zqYlmVQ8
         7Eu+RPE7C84WQw/Q+BK4m3bH3zUuRnIKBOl4wuBiMsAL3si1oB21LI51pXskIBRe9I3c
         x7F6rqhRcrMS3Wih32A5mnomgzncsvh7s5B00/92ZUIf37rjeP3wvEFOVsod0fusj7/H
         BISH/t0vKAIRpxXuMpb0ZEKQeC2SgJJ4mHN101MaclrYqW7iONA3Ua+GaTipz73BfZnP
         P82ff9czHmEqjUX7GXOIVkO/h1YvkRjnBn7kGF8vUb1JIxDpvFRaltNjdxC7uOIJAiUl
         Ifrw==
X-Gm-Message-State: AOAM533cHm/PF6p4+1ZWWDH/cv6q08PZGLS6k6iUV8fqIASohLDYXeFN
        +/3S0FRshQOPawGljUx9cTdeKGe54ufFng==
X-Google-Smtp-Source: ABdhPJydgpUCuKkOA7vCopdsCuLXmrIMJidmiBYAuDWx2aU/awjw7OPNPsk8oW0bKgtPkM+/ZESpcg==
X-Received: by 2002:a05:6808:3198:b0:32b:a54:1238 with SMTP id cd24-20020a056808319800b0032b0a541238mr6622067oib.16.1653527364871;
        Wed, 25 May 2022 18:09:24 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:4b69:8e74:fc8e:b11f:9d42])
        by smtp.gmail.com with ESMTPSA id gn9-20020a056870d98900b000f27976b9d9sm140884oab.6.2022.05.25.18.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 18:09:24 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     wsa+renesas@sang-engineering.com
Cc:     nathan@kernel.org, linux-i2c@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] i2c: mxs: Silence a clang warning
Date:   Wed, 25 May 2022 22:09:14 -0300
Message-Id: <20220526010914.1165826-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Change the of_device_get_match_data() cast to (uintptr_t)
to silence the following clang warning:

drivers/i2c/busses/i2c-mxs.c:802:18: warning: cast to smaller integer type 'enum mxs_i2c_devtype' from 'const void *' [-Wvoid-pointer-to-enum-cast]

Reported-by: kernel test robot <lkp@intel.com>
Fixes: c32abd8b5691 ("i2c: mxs: Remove unneeded platform_device_id")
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/i2c/busses/i2c-mxs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mxs.c b/drivers/i2c/busses/i2c-mxs.c
index 864a3f1bd4e1..68f67d084c63 100644
--- a/drivers/i2c/busses/i2c-mxs.c
+++ b/drivers/i2c/busses/i2c-mxs.c
@@ -799,7 +799,7 @@ static int mxs_i2c_probe(struct platform_device *pdev)
 	if (!i2c)
 		return -ENOMEM;
 
-	i2c->dev_type = (enum mxs_i2c_devtype)of_device_get_match_data(&pdev->dev);
+	i2c->dev_type = (uintptr_t)of_device_get_match_data(&pdev->dev);
 
 	i2c->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(i2c->regs))
-- 
2.25.1

