Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 018A47AB8B1
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Sep 2023 19:56:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233877AbjIVR42 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Sep 2023 13:56:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233216AbjIVR4J (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Sep 2023 13:56:09 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C860E198B
        for <linux-i2c@vger.kernel.org>; Fri, 22 Sep 2023 10:54:27 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2747b49cac4so1756206a91.0
        for <linux-i2c@vger.kernel.org>; Fri, 22 Sep 2023 10:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695405267; x=1696010067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j+EF4vJBkJk+ZVR9CblihV9KVKwpbDqXkhI36zKUO6c=;
        b=kLcYT/LllAUOWPyeCaorT9YFh0fumN7IpfIOstAMpbLCIqfT1UOG+3iaCV8NAoeDWO
         zV5svidS8VKtsGNVgp5rphF2FvKVA+o+vZ2t3/jpBYjQdTgs6W61mhh4v6NzFrh7LI5c
         5C7oCVD6sNJ2k3jzfrL/jVGkcqSacZScVEtws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695405267; x=1696010067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j+EF4vJBkJk+ZVR9CblihV9KVKwpbDqXkhI36zKUO6c=;
        b=lpULfM8vHwnaeSo2qUevXdhzr6XqVNrptaSHEpkWuEIcFFo1T1dyx5FEPn6RQ2ZatE
         RGd8lmZWoxAMjiWWqdhJWktgSlQ0AIAklWD2n7H+wPsK+6YPUKkBiddL6zuNHbLowmsO
         bVif3sARxq70d7a1wdaGWvl0gVb8vpCbVdX4muuI6j1h+NDt5/9xKPEgFsPA2fSptXcu
         oT0SRFgl8IkanMmKuowRyJ5YR0u+97/ot9YFHGYw6v2Jni5GRcbv+ua/GgASyE6Q0PF4
         wPD0DXpXISLyqzFBEjcvIdk0oMdDm6gDtXSsRLzWDNjV1Wxi+WooKkLvYX+KZDGy8195
         3Q0w==
X-Gm-Message-State: AOJu0YzzZXkpkMREbs01ODM0cq6ttgQsFJzKzI7cjgCRy342O/zYDEJ1
        r/FxUkR/qIIJHN+RvUzRtopmQQ==
X-Google-Smtp-Source: AGHT+IEHTrz6vwmxrsTFOxVvmSb41QWPkh3jvMMRyJ03luJqtTFxKRrwM8037x7mO0uOF1KONBCuJg==
X-Received: by 2002:a17:90a:c7d2:b0:26b:4e40:7be8 with SMTP id gf18-20020a17090ac7d200b0026b4e407be8mr425881pjb.12.1695405267155;
        Fri, 22 Sep 2023 10:54:27 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id 4-20020a17090a098400b00274a9f8e82asm5621422pjo.51.2023.09.22.10.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:54:26 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, linux-i2c@vger.kernel.org,
        llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: [PATCH] media: i2c: Annotate struct i2c_atr with __counted_by
Date:   Fri, 22 Sep 2023 10:54:25 -0700
Message-Id: <20230922175424.work.863-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1312; i=keescook@chromium.org;
 h=from:subject:message-id; bh=xHqAexkdir++JtYVtYwcT7l23jrkf39UFVqFNHYvTUM=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDdTROjZmn9PrBfPmIbpkMcg5sdNYLw8r0dJEE
 dRDF6P38uuJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3U0QAKCRCJcvTf3G3A
 JmMlEACyXQMycy4pimGfzQlMXVi/e5YP4/RoKKXxI3rA+mIRz/OEaWUNy187GNrPLMuVRUEl6+m
 7HBRBE5xxKe03wBcUu0kmWdpDuLIN0efMNzsWH2PQY8YPDw1V7Gaeh5FHD+MTY9xp+88FCZq0dw
 O5fNNwnBpaiJ8q+hwyak4O84zmGhnxy/Mo7yPZMWaq4nFn8IbqprfKnjorcedYUuWWHfJQ1wkzN
 HoR3w0l8YapoHDkp1vCqhdfExasn72Qu0UgN/n4xVTJckAJ0+UYYw9s3DpLvqRzSi0PTgN67ypb
 MtWf6E0kk2TN113KyScBCSU9h6D6uo0uRSZvt8PrTi2J50/IftiSoNkwY2w3DuBxqu28vd+lJJz
 sWfGFrp0lfdEIb5YqkIWT1BUxW6nD1VcLLfUWD1zneBljOu5GXct0D3g342AYe0F3g8u2LpXzH0
 uVG/7sBg/wHslmjgTJWx+VpOXkqbGue5ZH4PhIzc7kislQ3tkMj22IuxBpvqiWqVFZL+cvF3SdL
 ur0bGhn7qFjouZrQNO0SP3eQP9E3dxRNyf3zyiuBzMvrejRFAt6V7oeIgKwjGns6fOBtQUonNQg
 sZQ0aauL4gW0OOpE4M5dDcWJo8GNLi1tkdvWc5+p8IzCTba898Lo16aluMogKJDOy6MZDBvb2pN
 7SVgLij pk1wMheg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct i2c_atr.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Wolfram Sang <wsa@kernel.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Tom Rix <trix@redhat.com>
Cc: linux-i2c@vger.kernel.org
Cc: llvm@lists.linux.dev
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/i2c/i2c-atr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
index 8ca1daadec93..f21475ae5921 100644
--- a/drivers/i2c/i2c-atr.c
+++ b/drivers/i2c/i2c-atr.c
@@ -94,7 +94,7 @@ struct i2c_atr {
 
 	struct notifier_block i2c_nb;
 
-	struct i2c_adapter *adapter[];
+	struct i2c_adapter *adapter[] __counted_by(max_adapters);
 };
 
 static struct i2c_atr_alias_pair *
-- 
2.34.1

