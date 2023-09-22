Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D51677AB85E
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Sep 2023 19:53:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233295AbjIVRxX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Sep 2023 13:53:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233405AbjIVRxF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Sep 2023 13:53:05 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C4D41721
        for <linux-i2c@vger.kernel.org>; Fri, 22 Sep 2023 10:51:58 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-690d25b1dbdso2241593b3a.2
        for <linux-i2c@vger.kernel.org>; Fri, 22 Sep 2023 10:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695405117; x=1696009917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LMP6Eo/vaMIazZNY5B2EIxzC5JUt58mRyjJ2WHITWvc=;
        b=EXVamoRZkEedTX2JhbRhHnxZSe33ND2+9sr7vmkR1nGNQOrqxgczFuEN27qT3RV9n+
         m1QtmBForVG0oajKGziFwhY7vAGLcEj6V4VY0DE0FwbDpAVQEGlr5Q97EHf9oarW7uFl
         Ymp7T6gkdlHZ150KOvoltstzse+coUk5b5t8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695405117; x=1696009917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LMP6Eo/vaMIazZNY5B2EIxzC5JUt58mRyjJ2WHITWvc=;
        b=lqdMhVTzN0uU2RxTxBF3ut1V2CNUxpxRrb1EJdhItDjdCnlC9sU7Mcpb39uuzIdqWJ
         zPDzclf0LxH+xt+aEfOT+mGGXMcBBids3Brwo1vzef8mfTSBrV7RYI8f5xPjBN6K/BHH
         29+ybWAH2AtP2cDwAnzKAgBVQC7Vo+77YgiRC1ign0g1xDPO2XGcfDHfztUBvYEyn5MC
         QvD+4XHXXIr8uwLRpHVn0dhVaJJbif7UFBoDng5Xba372vsXe6iwWUrUTpecrIa6UvYD
         YmHHW9dPHaUqNsnfzeQSzs9Q1jj1aMok4E/dS6gRFrQp1NyfuSUlFOhFF9SpVYWoIh/C
         SgKw==
X-Gm-Message-State: AOJu0YwYVzEz9JXKGTnQQlJGum4m20eWhXzYubfewf4Dx0Q+n44Yrknx
        zrmIol6VSnH5Uu2PT5oRLYpHgQ==
X-Google-Smtp-Source: AGHT+IFPV6bCMgdrADQ4gtFCdwV9MgXVLuYaes6w0ZZJOH08TXJJuxiCpV6lhgi5HCH4XD7ka4TMrw==
X-Received: by 2002:a05:6a21:a586:b0:159:fe1d:2f09 with SMTP id gd6-20020a056a21a58600b00159fe1d2f09mr307564pzc.6.1695405117494;
        Fri, 22 Sep 2023 10:51:57 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id e5-20020a62ee05000000b0069069ca9814sm3463168pfi.219.2023.09.22.10.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:51:57 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-i2c@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: [PATCH] eeprom: at24: Annotate struct at24_data with __counted_by
Date:   Fri, 22 Sep 2023 10:51:55 -0700
Message-Id: <20230922175155.work.872-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1169; i=keescook@chromium.org;
 h=from:subject:message-id; bh=DIpsB/ou/Bn4dXxGISBN9wBhUC+HRqEPU3gJ+srAuCA=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDdQ77Iev/RbO+fPKpsBUGVaL7crbXoZB/KWdF
 Xqifi3aarSJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3UOwAKCRCJcvTf3G3A
 Juo/EACZ6Od5Kn99qc5leb8EtaCoZDT1wKVq+FCHfwf1oDM9tMGvk0gt7nu+QQmrcgu/+nCNpy5
 pGVC8+lAd7xQZlw+YzjGV/ogHKK/cKbtCpl2xoPrs4RUzNEqCbNm3VIjRII1D7Wr9wg5A+mg//0
 10ZhtU7LlSGXqp9TM97DojKy2hS7JFzb/WRCX6Ns6a/XahbuncnM9zNLz5fjqkg0d76a88Ys6Sj
 reiGEku7RQWZQSp0sBw8CGdD/gJOcEaS5FXe4dJ+1pXWmH+0q0sfXCZWBBxItKOU8wZpNxlRVtB
 HLlbLc1cz3FMEielQXectGA4SXvdNa4WObULLyPwpdiH8m18LkVNGjuGSGgsgJoWOdhy0BNs7Yy
 Ptb9Xg1aLq6fzqnS6Be7NqOFofukMU6arKsgvWxJZOmL4atQ8ja//EHhssObOi9A3aUBXbihMrp
 czGAc27Qc37LZP7iXq76h462Rv6uRlhIdUUusZUFRF0ooHmsnxXRcVUI8WFRAAsN3xEVxyAVFA0
 OfXe9C6EV2sAmkapNTAc8VU7lzH2iqwTAklmAsqle3aYC7GbJZ5xcpixKadpgxbwlV4my4kJw5f
 blbAi1WprMuKKNiUqZ3bg0MlZ8Yb5NBJxLJqwSwL3kvhUVTUSOrCXvmv8zDkJqxcgUQigoBq/U7
 8ekvNsl G0KklGmw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
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

As found with Coccinelle[1], add __counted_by for struct at24_data.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-i2c@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/misc/eeprom/at24.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index af83aca452b7..7dfd7fdb423e 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -92,7 +92,7 @@ struct at24_data {
 	 * them for us.
 	 */
 	u8 bank_addr_shift;
-	struct regmap *client_regmaps[];
+	struct regmap *client_regmaps[] __counted_by(num_addresses);
 };
 
 /*
-- 
2.34.1

