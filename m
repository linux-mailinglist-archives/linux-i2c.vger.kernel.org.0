Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74D906B5B0D
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Mar 2023 12:20:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbjCKLUl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 11 Mar 2023 06:20:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230416AbjCKLTv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 11 Mar 2023 06:19:51 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EDD8B5AAA
        for <linux-i2c@vger.kernel.org>; Sat, 11 Mar 2023 03:17:08 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id g10so1875172eda.1
        for <linux-i2c@vger.kernel.org>; Sat, 11 Mar 2023 03:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678533422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PQMu1OBGcFAt/9oWZHzoRm8MXiI9ypYZwvYh5dmA858=;
        b=ghNsLS5SpFOkMhJwbC4XS8uoD5BFbmT7NzIgtfULzPzTvyI6QOO4HG8pFT6C5UGUat
         mPQjoT0+sT0CMzL6ME0C9Y7HgaZfd5r5Xw4O7S9SIWwXUXfVZTxxRURXoBMwbLdb9gGa
         HDdJT2S0B0Au5ZAlepE+GieSNxYU1miaru7gYjFtSzq0r4EAOOeYmyvSqOnuvYq3AZ+P
         cDsUDnxd/3IbWY4dvOjVfnM5uW1UsHGO4HjnbrWw78+Q4BG/Mgpam7LHpxHdbtD4Qg0u
         6gMJzi0QokME5X3W0CknQVOhtzGKD1hmJ+bkvWUYiErUyxxO33PDCAakK4egTqj6Vg1i
         5RYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678533422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PQMu1OBGcFAt/9oWZHzoRm8MXiI9ypYZwvYh5dmA858=;
        b=YtrNi/UJ+PtAUzw/Bji9gnKcpXm0Pip+NkA7S8MU91iXuWWMJgHYWq+L9OmeNuxcKY
         JjdqgVRAYcWIUj5//fdpzIjPEdAyW/eqfZVBo1ESY2amxor8roY/k/vwJ5hfqP6JdvFk
         0b+xOQzB6VRqSGgRDondr6ZVY3qLo5EOoR1pB5Erxrucd7NCCIFZ/R/JcWRcJiMkpDMB
         YMJHDSLSUD9X3mu1/YRHond3Ge6SkPZeGz8WUu2OFywuMgHL/Ixq78FlMCAl9jN5EEpf
         H5L0CE9/mt99gHGhG7bDpnDMt9ddR5jbJdo+c3K9jfkYCfdPm60m1kPA4X1B2kXTytNv
         oHYQ==
X-Gm-Message-State: AO0yUKV239nGUeq+5uIYhEm+2lD90ek9WtUKjgjyC4BAF/jO8lSIf3t4
        7yLL9lTTmdCYjLrbSeaKKXA9vg==
X-Google-Smtp-Source: AK7set9fN9lhkzsTcd/hCm+YqcO1tpXtDV/ErKyu7Dxn7TQH6PWFP0BxhlriXHSFNitMA1yqiFIQRQ==
X-Received: by 2002:a17:906:1ed1:b0:8e9:6f9f:7c2d with SMTP id m17-20020a1709061ed100b008e96f9f7c2dmr4914227ejj.35.1678533422221;
        Sat, 11 Mar 2023 03:17:02 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:fa97:2d7c:bdd7:e1b])
        by smtp.gmail.com with ESMTPSA id mp27-20020a1709071b1b00b008d398a4e687sm973975ejc.158.2023.03.11.03.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 03:17:01 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Qii Wang <qii.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-i2c@vger.kernel.org, chrome-platform@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        linux-actions@lists.infradead.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/5] i2c: owl: drop of_match_ptr for ID table
Date:   Sat, 11 Mar 2023 12:16:55 +0100
Message-Id: <20230311111658.251951-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230311111658.251951-1-krzysztof.kozlowski@linaro.org>
References: <20230311111658.251951-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The driver can match only via the DT table so the table should be always
used and the of_match_ptr does not have any sense (this also allows ACPI
matching via PRP0001, even though it might not be relevant here).

  drivers/i2c/busses/i2c-owl.c:510:34: error: ‘owl_i2c_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/i2c/busses/i2c-owl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-owl.c b/drivers/i2c/busses/i2c-owl.c
index 98882fe4e965..99ddd8894964 100644
--- a/drivers/i2c/busses/i2c-owl.c
+++ b/drivers/i2c/busses/i2c-owl.c
@@ -519,7 +519,7 @@ static struct platform_driver owl_i2c_driver = {
 	.probe		= owl_i2c_probe,
 	.driver		= {
 		.name	= "owl-i2c",
-		.of_match_table = of_match_ptr(owl_i2c_of_match),
+		.of_match_table = owl_i2c_of_match,
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
-- 
2.34.1

