Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07BD26B5B10
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Mar 2023 12:20:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230071AbjCKLUn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 11 Mar 2023 06:20:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230455AbjCKLTx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 11 Mar 2023 06:19:53 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B199720D0A
        for <linux-i2c@vger.kernel.org>; Sat, 11 Mar 2023 03:17:09 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id g10so1875268eda.1
        for <linux-i2c@vger.kernel.org>; Sat, 11 Mar 2023 03:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678533423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XeJqWZmIWIQYf/vyLenHeQ0JsQ8pjtOGtaM4WzEFmbc=;
        b=K4PlKgk6vphG7B8A+tKgwgLYu/eve2VtLYCEGfkUgVLwaOgCPb7AYrJKKgc58vohjO
         rzTftPa2ZxcY1mI64stQAL5MZ+JQPxTaEr1Y9AxaQYrbXROSwSQp5n05Z9wTPZYRFpmx
         Bx3zHVIcTIzCEjsajZ9GXEVo76iXFDZjOIW2qT5m5hbGmWcJdF+q6Sc+llFTkWrO6/9V
         duhkPfdmrunbmk+l25R3ueAi1TwDW72GfXGvCgamBE9c2PG9Rg1A0BPHsQOdMTqKJ21u
         X5qwUSuCcnDZb4uy/0MbHeF50kr+hbPu17toFAd8eu2Mm/u8Rj3Fbv+gwMYWmhA/wgTN
         7xSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678533423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XeJqWZmIWIQYf/vyLenHeQ0JsQ8pjtOGtaM4WzEFmbc=;
        b=qCDzIeYnJDHiNIlS0SR+6worB/CkA+5Mt7BbdhM0uLfm51HMzxCtoMpz5w1WUsesCz
         hS6aJRn+Y37sgdeCbH2ASM6j2eD6DASJQReOqZMzl6b/B9VlJxkTQ15AeaXuO8mlCRNo
         imXdZ+jO8xtZJRDxPC7ggshIiBxP9qcxNinuP0wS30xf3oj9P1ZGh8sxXPZHfI6qTvn3
         s5T/2zb+vVQRXOz74QEMj0LE4f390+JvIID0Id/njnN1qDTvcpjopdsN2Phgb+mYuXs+
         mVDId4kMhaL0H1ZSpTk8PkVu4UGf9NJwfhFv1uhk0IczKqNlk/VnhyY0nVoLNcTd+OzV
         PbqA==
X-Gm-Message-State: AO0yUKXruAsVOBSIox5Ry16UP6+KmNa2oSqK8dxe70UoJyMM7DsrZrLB
        E4Rw5UkZp4sSLkIeucDxkTBfsA==
X-Google-Smtp-Source: AK7set9OSxnoFK3vtZqGbIpUURfI1SqkV0jUsrsq7RgkKMadcVINTomgv4XfMX5TfGl07OS2xYV+hA==
X-Received: by 2002:a17:906:b88c:b0:8cf:fda0:5b9b with SMTP id hb12-20020a170906b88c00b008cffda05b9bmr5146168ejb.22.1678533423260;
        Sat, 11 Mar 2023 03:17:03 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:fa97:2d7c:bdd7:e1b])
        by smtp.gmail.com with ESMTPSA id mp27-20020a1709071b1b00b008d398a4e687sm973975ejc.158.2023.03.11.03.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 03:17:02 -0800 (PST)
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
Subject: [PATCH 3/5] i2c: xiic: hide OF related data for COMPILE_TEST
Date:   Sat, 11 Mar 2023 12:16:56 +0100
Message-Id: <20230311111658.251951-3-krzysztof.kozlowski@linaro.org>
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

The driver can be compile tested with !CONFIG_OF making certain data
unused:

  drivers/i2c/busses/i2c-xiic.c:1202:39: error: ‘xiic_2_00’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/i2c/busses/i2c-xiic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index dbb792fc197e..806b447055fb 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1199,11 +1199,11 @@ static const struct i2c_adapter xiic_adapter = {
 	.algo = &xiic_algorithm,
 };
 
+#if defined(CONFIG_OF)
 static const struct xiic_version_data xiic_2_00 = {
 	.quirks = DYNAMIC_MODE_READ_BROKEN_BIT,
 };
 
-#if defined(CONFIG_OF)
 static const struct of_device_id xiic_of_match[] = {
 	{ .compatible = "xlnx,xps-iic-2.00.a", .data = &xiic_2_00 },
 	{ .compatible = "xlnx,axi-iic-2.1", },
-- 
2.34.1

