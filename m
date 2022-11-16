Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCAD362B7CF
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Nov 2022 11:22:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237364AbiKPKWR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Nov 2022 05:22:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237441AbiKPKVz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Nov 2022 05:21:55 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C544E2229D
        for <linux-i2c@vger.kernel.org>; Wed, 16 Nov 2022 02:21:53 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id j15so29154742wrq.3
        for <linux-i2c@vger.kernel.org>; Wed, 16 Nov 2022 02:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L9LHd2ehuEfnQ9RNakq0DpdG6JioG/27TAyA40ItIwA=;
        b=R27/7fCyVH45BDUa4WXg6S3Pgbigv9mlZo33xtIQld+3/A8Vwu0VmEU2jmlsnxkxVH
         mFz9uSAmWYNulgvSMKc+97yYBL3kkCUaxR4R0BZQpQvHSxMSS9fHqmn/uzbX7hFDLC1U
         G5XkIteo0N/HotD09px3J2jHasyjq8sUa6OTFWtRZS3mv8jvDi1NenU8pqKluaYj9n9R
         Bh4QZJr1ch1IqlF0eCi46kclUGX2knoqK8yfB7y060bV1Spwel8y2fM8Q/7UKAsHlWJR
         hJ+CjW33FxEV/ABoQ6wJDXQT4hfRLASN84JEymLiabtGGcUQAE+6ZHYmhDN49eI9k8qP
         o4dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L9LHd2ehuEfnQ9RNakq0DpdG6JioG/27TAyA40ItIwA=;
        b=WiRGBkiYNIElykyaguzWW/Woehc+4LPPwRVtB1OCkDsrejHTlmYT5yixV+pw3eyhpk
         h7o7ceorrevQentICtiXyCPFCf03D4MZyYnvroYlVsmbB8aKFeWzr+tWkkTp9d4C+R6M
         O9uMZKcZLOwC5moFKZixA0uT+A9RGjvGLyHsXWl3x5olgG3itCH9Hj1YV5tUq0e0rMNU
         Fuz0mcMh6vRgp4sfFiOPviVDkepl3gzq0l/uTH+9lbxr2hoNufJ6sJohbQXcVnfJfZ7F
         a+n2kDbkCxc6skG76MzyYJeppEoQ1EGi1idGM1QRS6dgi8VMinaLzkk68B5/d3bkcJy3
         Y1sw==
X-Gm-Message-State: ANoB5pkU1zt/2y72QAWd2QaYzzVJSM4Ld1nwDDjxct8oqdJP6WwDWWZD
        PSMnd4uN/YZO5RgY0PfjlmEJKg==
X-Google-Smtp-Source: AA0mqf6R0gpm59nK4sRq1lh2TKTK+Ghgr2CVeUJ8KNAWowNoyf+WwVrKD2Fw1waeCkI+I3RRhgGQNw==
X-Received: by 2002:a05:6000:3:b0:22f:bf9b:b6b3 with SMTP id h3-20020a056000000300b0022fbf9bb6b3mr13045074wrx.108.1668594112362;
        Wed, 16 Nov 2022 02:21:52 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id o5-20020a05600c510500b003b4ff30e566sm6133615wms.3.2022.11.16.02.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 02:21:52 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 16 Nov 2022 11:21:51 +0100
Subject: [PATCH 4/6] soc: qcom: geni-se: add support for I2C Master Hub wrapper
 variant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v1-4-64449106a148@linaro.org>
References: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v1-0-64449106a148@linaro.org>
In-Reply-To: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v1-0-64449106a148@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.10.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The I2C Master Hub is a stripped down version of the GENI Serial Engine
QUP Wrapper Controller but only supporting I2C serial engines without
DMA support.

This adds the clock list for the I2C Master Hub variant to a new desc
struct then passes it through the I2C Master Hub compatible match data.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/soc/qcom/qcom-geni-se.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index f4f54d92a01a..8430a0192bb9 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -930,8 +930,18 @@ static const struct geni_se_desc qup_desc = {
 	.num_clks = ARRAY_SIZE(qup_clks),
 };
 
+static const char * const i2c_master_hub_clks[] = {
+	"s-ahb",
+};
+
+static const struct geni_se_desc i2c_master_hub_desc = {
+	.clks = i2c_master_hub_clks,
+	.num_clks = ARRAY_SIZE(i2c_master_hub_clks),
+};
+
 static const struct of_device_id geni_se_dt_match[] = {
 	{ .compatible = "qcom,geni-se-qup", .data = &qup_desc },
+	{ .compatible = "qcom,geni-se-i2c-master-hub", .data = &i2c_master_hub_desc },
 	{}
 };
 MODULE_DEVICE_TABLE(of, geni_se_dt_match);

-- 
b4 0.10.1
