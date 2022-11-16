Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DD2062B7D3
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Nov 2022 11:22:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238763AbiKPKWT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Nov 2022 05:22:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238095AbiKPKV5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Nov 2022 05:21:57 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A87582252D
        for <linux-i2c@vger.kernel.org>; Wed, 16 Nov 2022 02:21:55 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id l14so29131560wrw.2
        for <linux-i2c@vger.kernel.org>; Wed, 16 Nov 2022 02:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pv5CcBvM1Y0DmqwfRO50yvVc4LT+eZLqos1FdCMiOYE=;
        b=sNX56Yaa+zhdebatzuNg1q/oOgZqyK47/jJYDv8HGwrlB9RJ5B9k/A+KJAJwj6uWvH
         kXVMwg5mVJyulez1FN1bzC/VaDWDyQddXHLz8D96l7RgQh08thdIETLdXPUkC1EsZKOt
         DUkHxF5msJUPlbmPcbPdLyCTsuawKS0+6zmLNEpDvZTyAv06bjmVH/ypRAqhw7SE7+tP
         Idh9ZydDXdNC06roDDAbmQJNx/OlWkJd6IyQCDvxB0DE/UpX0a2jkBlIehhGCDtWgjSw
         fjffMyuYYRJv4ioS/LhSCsLavArIdobqXIehzw5QAYYBlJ7SD3MgZBXAOxgbsDBMc4Q2
         rkMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pv5CcBvM1Y0DmqwfRO50yvVc4LT+eZLqos1FdCMiOYE=;
        b=W1fv8IFMF4KstymWkv3iMHkdR8wEv6W26xVJMx+g3Gj7FRiVkOilJ47m5BXSVMOtnN
         0OZsd6PTgPagyIhXx8ygm5qY80aLtHw3hUknx1FCE6G6a6/yvrEx/ILKbiRG8WOR8ZN2
         3jkLC7jHavRcCQqcQ1wDNbgMvPWln0Au9did9IOh8r26zt8mscARtcSbz49UWGBbGKSr
         +aTKMw3J+jmQ1zs/NXyyE8c0hT0T8vwoxPaUdHWcXj9I/NOm45DdFXZy1C8hr1HXXIsA
         F7e7y1c/wV+mAXi46UX+8wLyjifCIt4rO5JCbmymVRNr4EuWE8LPedCLlLzEUnxxQWZ2
         Ks5Q==
X-Gm-Message-State: ANoB5plSZt1oYMCrpkDyamqcNv/9oLdn+0Rg4jKZMfILp6B3Vdpvbe6S
        uvlpyFKrTWNe+cRHwLIbYHIpOw==
X-Google-Smtp-Source: AA0mqf5O7XLKhkLnRE6lo0qQ5+WVf2QMDkYiVkkmh3KnsQdsDjNuWBtqr9w2Ssw84W3TI1WuDaFMiA==
X-Received: by 2002:adf:fc47:0:b0:22e:4953:9932 with SMTP id e7-20020adffc47000000b0022e49539932mr13484547wrs.486.1668594114246;
        Wed, 16 Nov 2022 02:21:54 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id o5-20020a05600c510500b003b4ff30e566sm6133615wms.3.2022.11.16.02.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 02:21:53 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 16 Nov 2022 11:21:53 +0100
Subject: [PATCH 6/6] i2c: qcom-geni: add support for I2C Master Hub variant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v1-6-64449106a148@linaro.org>
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

This adds the I2C Master Hub serial engine compatible along the
specific requirements in a new desc struct passed throug the device
match data.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 75dd0718c5a1..bfe75038bc14 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -1026,8 +1026,16 @@ static const struct dev_pm_ops geni_i2c_pm_ops = {
 									NULL)
 };
 
+const struct geni_i2c_desc i2c_master_hub = {
+	.has_core_clk = true,
+	.icc_ddr = NULL,
+	.no_dma_support = true,
+	.tx_fifo_depth = 16,
+};
+
 static const struct of_device_id geni_i2c_dt_match[] = {
 	{ .compatible = "qcom,geni-i2c" },
+	{ .compatible = "qcom,geni-i2c-master-hub", .data = &i2c_master_hub },
 	{}
 };
 MODULE_DEVICE_TABLE(of, geni_i2c_dt_match);

-- 
b4 0.10.1
