Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73E0F62EFE8
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Nov 2022 09:45:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241161AbiKRIpi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Nov 2022 03:45:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241605AbiKRIpV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Nov 2022 03:45:21 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 722E0942C0
        for <linux-i2c@vger.kernel.org>; Fri, 18 Nov 2022 00:45:12 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id k8so8247979wrh.1
        for <linux-i2c@vger.kernel.org>; Fri, 18 Nov 2022 00:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PuYlzwdY3YL5ngZPDZI+/8bCcCBBYWki/srtrsbHb58=;
        b=JXq1G2EmbKMuhO4Fn3hNW7mofcNkECcT/2PFQ15oRVKt5RHjKXxO/CFoS+Z6k7EtY0
         Z1nKL31POAE+JLTT1gZNGtELi8M9qlIz8hrZwRonePc+dYc5mhGrsl1tss47o+EzrwcM
         2M2CNQBg5oKYc2nTUsobLPCYdyUdSEB+xmwS0bZ1g+Mo7jFd1Pdc1EHhR/AYdj0Rm+xg
         B6RgJucVysn+pzVQYYUg5mNN/sesTLn/tOv7oEhue0mfryA5f6DyQ1ltclfNiCscKwyO
         IPn4ZilZ8WFsmIWUz6Dk7DKll8mFya99WUR71f0dqMWiwrJMsRoMS8r732ElVLzq8wdW
         4zYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PuYlzwdY3YL5ngZPDZI+/8bCcCBBYWki/srtrsbHb58=;
        b=Th9eBhP+9dDy1hTZnwfzsoAlrWPOgMR0WcgGXOr08th4F21BEsiTxMCuJWg93qhBwR
         FfeflQxKJqu3M1CXlKNmnWLLw/g3e/cix/g6XqjmD53h6/oYUcU262Peya8Zms9Nc98h
         gBDZywB01Uzg1ifVOU3dgvImBRPsr7tNaY5Rbv9JgDVUs3B4mAseEVZJdzrRu1upjfSu
         Wjvc1Lh6vhbEzfCgEl9ACmTtKboTqoFvlQ+NSBrj7pstehdwNjicNyB4iLg2n63DrLQQ
         C67GmlM+lDHFlsoW0Kjd9NYyu/bI6kPFoHBE3h6kgOq2EsulGKQwrizzuPbPRCaKAfIc
         zKRQ==
X-Gm-Message-State: ANoB5plnH9DFsCR8Xgfm1ajBcOKIuqHluaRAdaV+2D0vTrTlPD5vJ+8F
        EaMr6BUR2xKn/baqo3WbY6Ztdw==
X-Google-Smtp-Source: AA0mqf4KUkO1+AZI996IGDEA3tkyIupVBg2d0wCuxFTyVJ68BqnoqSruiSFK+ufmuUDXEYjdsa6AVQ==
X-Received: by 2002:adf:ea0b:0:b0:236:695b:6275 with SMTP id q11-20020adfea0b000000b00236695b6275mr3771407wrm.116.1668761111812;
        Fri, 18 Nov 2022 00:45:11 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id v18-20020a5d6112000000b00236e834f050sm2960284wrt.35.2022.11.18.00.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 00:45:11 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Fri, 18 Nov 2022 09:45:08 +0100
Subject: [PATCH v2 4/6] soc: qcom: geni-se: add support for I2C Master Hub wrapper
 variant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v2-4-aadaa6997b28@linaro.org>
References: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v2-0-aadaa6997b28@linaro.org>
In-Reply-To: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v2-0-aadaa6997b28@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org
X-Mailer: b4 0.10.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The I2C Master Hub is a stripped down version of the GENI Serial Engine
QUP Wrapper Controller but only supporting I2C serial engines without
DMA support.

Add the clock list for the I2C Master Hub variant to a new desc struct
then pass it through the I2C Master Hub compatible match data.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/soc/qcom/qcom-geni-se.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index ced2a2932eda..41f5b4d507d7 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -932,8 +932,18 @@ static const struct geni_se_desc qup_desc = {
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
