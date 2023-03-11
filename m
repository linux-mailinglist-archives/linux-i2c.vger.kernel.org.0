Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0EB66B5B0F
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Mar 2023 12:20:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230039AbjCKLUm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 11 Mar 2023 06:20:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230511AbjCKLT4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 11 Mar 2023 06:19:56 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8647C6E45
        for <linux-i2c@vger.kernel.org>; Sat, 11 Mar 2023 03:17:12 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id y4so1285549edo.2
        for <linux-i2c@vger.kernel.org>; Sat, 11 Mar 2023 03:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678533425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wcJifq10PLRhKC9buL1zZTG6brvOgNimyFGPw1oZQ8g=;
        b=lKEQi5BZGiIsVpqyS3XtNgZoaI8gioPoWmR53UPyduIVkHVeBEbmWQaXemsy7pgoPS
         UnT7c+7ZyvKkk0HWLGJmgAwsttuT4HVispzrnMPyJqS5Np8eI3GRYyaG414K6oVMRNUm
         QVqgb3m4l83Le3oN3ft7CuJLwMHw+hjFZgSFgWC2j9v5by9CxRRgC5nDXDsaxyZluBqk
         IBiUAyVvuUjg9DW9Kn9dcYeNjBhKM6POvPlVnUnZ/vXpWzeI2pXo9U2pZhSrlCZILBwz
         d44tevPSOVgUvRM+45bqyA8UKyptBc/JrFkZ7kGJ3iXRmTNNXy16orqGNh57sQxmaXAQ
         wENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678533425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wcJifq10PLRhKC9buL1zZTG6brvOgNimyFGPw1oZQ8g=;
        b=AMxgB7QtqnMIgeQI082zN+V56Ld9gIjQ+gG7xktW/iMs1Jm1m0dL8Vzqlz1xd8h69e
         NWZk7MjEwJJKfvmJ3Ey1ZCjRr7Y8uMd1QfpuBp1qYQ9eVTAUysnfYe1WtHtWfeQzMpKE
         7J4smSOLXBTKKVmBKA4BniEQiOrwkPzanP7iWbQ3fPNBAkkCRTrM/jsnnE8Y4mWEpc4Z
         9OvZlV6BdXZfYfV5XdPY/ufi1KtCaO7SmL47ytJCF/qP/Bswfq+ZHmxQhAT/qBr3t28p
         ZaARjcjX/mdL0Xm7vNAHGCrI1xTzMaMm5ZwUNyMm/n7YssbKVS5/Akfl+JWpKXxE39Sa
         03cA==
X-Gm-Message-State: AO0yUKVk7Lf7nsLluxNmEBZggFQrSCv+sMLBwTXe+CeKDVeBygKWXbEW
        QUEHlIScr6uQUTTG0YwBlbPYqQ==
X-Google-Smtp-Source: AK7set90Rqx3sRtuOK2S/VP6FZHdkiLyZ5wFXMpa2VaqCReSCM1nTUR53MQaNMHyzGhGC7lvJVRG7Q==
X-Received: by 2002:a17:906:e118:b0:8f5:2965:49f2 with SMTP id gj24-20020a170906e11800b008f5296549f2mr5109281ejb.23.1678533425339;
        Sat, 11 Mar 2023 03:17:05 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:fa97:2d7c:bdd7:e1b])
        by smtp.gmail.com with ESMTPSA id mp27-20020a1709071b1b00b008d398a4e687sm973975ejc.158.2023.03.11.03.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 03:17:05 -0800 (PST)
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
Subject: [PATCH 5/5] i2c: synquacer: mark OF related data as maybe unused
Date:   Sat, 11 Mar 2023 12:16:58 +0100
Message-Id: <20230311111658.251951-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230311111658.251951-1-krzysztof.kozlowski@linaro.org>
References: <20230311111658.251951-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The driver can be compile tested with !CONFIG_OF making certain data
unused:

  drivers/i2c/busses/i2c-synquacer.c:632:34: error: ‘synquacer_i2c_dt_ids’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/i2c/busses/i2c-synquacer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-synquacer.c b/drivers/i2c/busses/i2c-synquacer.c
index e4026c5416b1..50d19cf99a03 100644
--- a/drivers/i2c/busses/i2c-synquacer.c
+++ b/drivers/i2c/busses/i2c-synquacer.c
@@ -629,7 +629,7 @@ static int synquacer_i2c_remove(struct platform_device *pdev)
 	return 0;
 };
 
-static const struct of_device_id synquacer_i2c_dt_ids[] = {
+static const struct of_device_id synquacer_i2c_dt_ids[] __maybe_unused = {
 	{ .compatible = "socionext,synquacer-i2c" },
 	{ /* sentinel */ }
 };
-- 
2.34.1

