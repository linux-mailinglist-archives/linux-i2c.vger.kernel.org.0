Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43C84776AE9
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Aug 2023 23:25:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230484AbjHIVZu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Aug 2023 17:25:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230333AbjHIVZs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Aug 2023 17:25:48 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 405361BD9
        for <linux-i2c@vger.kernel.org>; Wed,  9 Aug 2023 14:25:47 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d637af9a981so99518276.0
        for <linux-i2c@vger.kernel.org>; Wed, 09 Aug 2023 14:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691616346; x=1692221146;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TeHUuHfRgnWDPuFH4hkEU5fzn9hCBRBVrCadOWnm/dY=;
        b=m3F8/0ulUMYTwL9xFOJ0hLRUE0yTJsXtRqAWzCWvR8A+u4BtSF1Y9J//7l8oh0HeNF
         d5qEkunwkS56Mz1cw7IUxuZVEOW2FD/UTOgzMNQJmPWQHyJ05/0wM/x6SuBrfs27Jrnt
         qUklp3oTnJ7R4SapRrWPkfff8qOSLDGr1ld2cj9x3iq+oq3psVc6yx8Uk7alFVQLOTC7
         FXHyjmZP0uT9Fi12AOmKZle93xdSLL1acnmz/8ctRZCUx4WiU1KuNlsM4s+l6BcfmLmd
         +0n++QJDHSgrwWPxPCHclEP51dI4/IAC4TY6UkzLXJbTD3a9ekMpmCia1UX6FTucRJgY
         pE0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691616346; x=1692221146;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TeHUuHfRgnWDPuFH4hkEU5fzn9hCBRBVrCadOWnm/dY=;
        b=f4hVoOD6ZbgMW8pSkzFdN8l5yvo9vA/RR7GamQkc4sLkOzkRHx+l8BEhxvVVaEsnAv
         aVH+K+JLUVRFMXEeJuWcWc5mBWv46mEnWTXLS6rEHP3VNjWFj3pHsZlyjn0z3o+KlKCp
         nIJXfFpxI4v8Vll6SpHDLdLVF+v9/qDJ6icR/Sv+5aB/xW0tLNb2ytAyE09bE6ia/6Wt
         5+L7mWtKb/WtWUCKM5WwzPPItz9k+6Z8GDaEW2aQheQam0dED0flAgD/MXBNFqoolhIR
         /BEpMW/uezezp7n81Lyv+AcJQxhUdXvqGIpQMNIX+c3Z6hPTd2AH+F7EHL8cH9ssttWU
         gQ/A==
X-Gm-Message-State: AOJu0YxFFIihG1MCQLi11PRRYonpRS3NbyfUEXchE0itK6E2ROVPXXEN
        AL6IcJNWXs0O+wgRBLr0RsMkwspiRzIMn1OrPw==
X-Google-Smtp-Source: AGHT+IER7CD8SLhYDzqAvYfXBz6YfQlFaQpKeWFvIJE3aWUQIYc8I61MFtiEi6h9Vzp0vHtlu9BcD3BOdPTotW/zYw==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a25:1409:0:b0:c6a:caf1:e601 with SMTP
 id 9-20020a251409000000b00c6acaf1e601mr9823ybu.13.1691616346561; Wed, 09 Aug
 2023 14:25:46 -0700 (PDT)
Date:   Wed, 09 Aug 2023 21:25:36 +0000
In-Reply-To: <20230809-cbl-1903-v1-0-df9d66a3ba3e@google.com>
Mime-Version: 1.0
References: <20230809-cbl-1903-v1-0-df9d66a3ba3e@google.com>
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691616343; l=1145;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=8JnGtAd2EouEzprwFG0EpWdSWssM4tBnJ8iYInUW3tw=; b=y/bJoUJDpUrl23oM/z5FEe37aFVYK4HTaD9RQ9C+npAsantOFJJouIu1r+p30Gfq3nlCbIx8G
 DhPci9Ygy+cDBvibVqeQG0Mi40YPg54DPSndE/L8i0YHBy2nhk5+ZJD
X-Mailer: b4 0.12.3
Message-ID: <20230809-cbl-1903-v1-2-df9d66a3ba3e@google.com>
Subject: [PATCH 2/2] i2c: i2c-rcar: fix -Wvoid-pointer-to-enum-cast warning
From:   Justin Stitt <justinstitt@google.com>
To:     Andi Shyti <andi.shyti@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
        Nathan Chancellor <nathan@kernel.org>,
        Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fix the following warning:

|  drivers/i2c/busses/i2c-rcar.c:1066:18: error: cast to smaller integer type \
|       'enum rcar_i2c_type' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]
|   1066 |         priv->devtype = (enum rcar_i2c_type)of_device_get_match_data(dev);
|        |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Link: https://github.com/ClangBuiltLinux/linux/issues/1904
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
 drivers/i2c/busses/i2c-rcar.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 2d9c37410ebd..ae4072bc96dc 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -1063,7 +1063,7 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->io))
 		return PTR_ERR(priv->io);
 
-	priv->devtype = (enum rcar_i2c_type)of_device_get_match_data(dev);
+	priv->devtype = (unsigned long) of_device_get_match_data(dev);
 	init_waitqueue_head(&priv->wait);
 
 	adap = &priv->adap;

-- 
2.41.0.640.ga95def55d0-goog

