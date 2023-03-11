Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E2116B5B0C
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Mar 2023 12:20:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229455AbjCKLUj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 11 Mar 2023 06:20:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230493AbjCKLTy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 11 Mar 2023 06:19:54 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F153C22110
        for <linux-i2c@vger.kernel.org>; Sat, 11 Mar 2023 03:17:10 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id r15so3557234edq.11
        for <linux-i2c@vger.kernel.org>; Sat, 11 Mar 2023 03:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678533424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z8oeEF/AzQvtVXNpB84yj5TovVGMv/c0ViZXuwoTaQY=;
        b=COAYxq8AT0uqrQbCHXbkj/g3Qs5hDhVsuLTBYQ2bJxruNac6vrplyfs/UEmjVMq0dg
         xkvGkHlKUlM/BiBesQ4flwUDD8euDmOnvLogGgeauHDXcRaKY7MKeGsDSZ/GrGNU4qIz
         tH7FNf6A8uxdhY7kF2QOEiB+UsCAtS2q9xCNIlHIYYUMZYCJTNhi0tyWQu0fTSiQa/w6
         rYdfiaalgA17snDR6+upjrCTTZb3oCrv+sFohA/UpdFo/7hzrimPTydZ8Gpzxk01kvnY
         4hpevlULBOtb7zoQlhFr9SkubsB3XM05CAhGDqHeJjeUpRZPfeVhc/hLoUeRYM5krq4H
         2EQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678533424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z8oeEF/AzQvtVXNpB84yj5TovVGMv/c0ViZXuwoTaQY=;
        b=yieQq+a6GemrHasxJfYlkRGr7Q2CorTZfSaBoYrTYL1KbMgFWsecJHzkMl/oHOPe9N
         Zv0I6wFi02jPKaF7dL42pOsRakk86Axji7FO5tU5vV6fropVoY5Uy5dOWyyiDaD1jVjy
         s/tn/vniT3dvT7pWHik2TK3zW/isPVRA0yG4NyHTqvmsoXEqqogkAoV1sgqrDZKdSHTB
         yzvPnGqb/NMVIzSAJQtVzj9MFmupVti2vIlIbEGk+MyHRrCLfi0/Dv5A+SJBBTC2raFd
         hGQCcBV0dlCP00P3qnsDL93RRqB9S95miQLKMsRUhmSVRKLakUNN+FeTK6nNA4vI8KNR
         aNKA==
X-Gm-Message-State: AO0yUKVBEI+xHthLJ/pbsAVimgrG2NAxBTXFBjTJSWyCwNmLQWELK54z
        cshc2bC3MPENz3PFusoqYqciSw==
X-Google-Smtp-Source: AK7set+7reM6pcFdrkUari419jtBHFEUXuCxP/FHHAYCrdORM+/x//6YsjthlED3+SIQ+yWdonig6Q==
X-Received: by 2002:a17:906:9f21:b0:884:3707:bd83 with SMTP id fy33-20020a1709069f2100b008843707bd83mr3376069ejc.69.1678533424385;
        Sat, 11 Mar 2023 03:17:04 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:fa97:2d7c:bdd7:e1b])
        by smtp.gmail.com with ESMTPSA id mp27-20020a1709071b1b00b008d398a4e687sm973975ejc.158.2023.03.11.03.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 03:17:04 -0800 (PST)
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
Subject: [PATCH 4/5] i2c: cros-ec-tunnel: Mark ACPI and OF related data as maybe unused
Date:   Sat, 11 Mar 2023 12:16:57 +0100
Message-Id: <20230311111658.251951-4-krzysztof.kozlowski@linaro.org>
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

The driver can be compile tested with !CONFIG_OF or !CONFIG_ACPI making
certain data unused:

  drivers/i2c/busses/i2c-cros-ec-tunnel.c:295:34: error: ‘cros_ec_i2c_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/i2c/busses/i2c-cros-ec-tunnel.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cros-ec-tunnel.c b/drivers/i2c/busses/i2c-cros-ec-tunnel.c
index 4e787dc709f9..8b3ff5bb14d8 100644
--- a/drivers/i2c/busses/i2c-cros-ec-tunnel.c
+++ b/drivers/i2c/busses/i2c-cros-ec-tunnel.c
@@ -292,13 +292,13 @@ static int ec_i2c_remove(struct platform_device *dev)
 	return 0;
 }
 
-static const struct of_device_id cros_ec_i2c_of_match[] = {
+static const struct of_device_id cros_ec_i2c_of_match[] __maybe_unused = {
 	{ .compatible = "google,cros-ec-i2c-tunnel" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, cros_ec_i2c_of_match);
 
-static const struct acpi_device_id cros_ec_i2c_tunnel_acpi_id[] = {
+static const struct acpi_device_id cros_ec_i2c_tunnel_acpi_id[] __maybe_unused = {
 	{ "GOOG0012", 0 },
 	{ }
 };
-- 
2.34.1

