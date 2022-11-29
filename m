Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9F4B63C30B
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Nov 2022 15:47:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235827AbiK2OrQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Nov 2022 09:47:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235796AbiK2OrK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Nov 2022 09:47:10 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25F045C0ED
        for <linux-i2c@vger.kernel.org>; Tue, 29 Nov 2022 06:47:08 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id ay14-20020a05600c1e0e00b003cf6ab34b61so14528237wmb.2
        for <linux-i2c@vger.kernel.org>; Tue, 29 Nov 2022 06:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T0Q5MXbXZSDNK30Oz1UpNS2OJdhndmv3wBdEHLEBaLM=;
        b=UMc+xQ4qZhQB/7QZU4DR/+z7qm8VeDWnv5SP3X72fx4USl0XYSjvXYpCioKc2oAmRP
         WFkjyZsWiWU+PcnEVikqrzMKUer5bbBxQNtFqopCvzR0eU7+hucfzS9aJhqGf3ii3P+o
         OTwaEtfTdHj2UKRkiqTc1X+WF84WOE8NOD//jaCnyP4wYHQouNRPpcJi14qP5W5Qw9FM
         VxlqlK+M3h+BUDlKOWD9vkCsTXe6B5etW+PRtIiTGAEE7yNONxtGFRbbqyKdQATux3Es
         Z9DU+w1huF2QslKpnfkkl8IhNqXX95k0aHHGM9mFiCcpz70PV4dlsJF1NxIjXmfPIPHj
         U8gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T0Q5MXbXZSDNK30Oz1UpNS2OJdhndmv3wBdEHLEBaLM=;
        b=tz9wT2Lk47q19EpNhxdBrlzV8Lc0pd6Ud6iV7ttgrBCY93AXYt8icxQfCILxy3ud7a
         qZtFwodyDxwLyce3tdCuS+OAgBdnV4rzCuaI3o1440qV6NdpIx4OT9IGj01LCe78yMPU
         xhW9ZDL2neEEaDLkyxBK3n4UAzVEqb2WcCWKY7VAi4Cro9Qcqe8IbC7beTqL7t+qxO1V
         IgLYtF24DhHVtQGboYb6On5TuKwtg37EHm08ei+adYF8tMzNOUu7XD3vRBDk5dezwqp9
         KXXMv3cPJWO+fqU2xCYV9TZ92rUpFxzC22s8y8rkUJkYMqe1kPKmTo6NQDG6B4Fo2IcJ
         hLLA==
X-Gm-Message-State: ANoB5pnLCkBYXJOPNzsYw1tdMHNTPVDXVcgGsJubPcHYzH7qjUpmZgWj
        GiQxM6TISkZjHyDurZY7UjGrN1NiOL61Tutv
X-Google-Smtp-Source: AA0mqf4PuGpNaXKcfWSP85aNCRlRaooV/CN1/rauzi3yNoTCDVZ1r0n8DBnjPUqy0JWrtdZ/tOZJPQ==
X-Received: by 2002:a7b:c2aa:0:b0:3cf:5d41:bea1 with SMTP id c10-20020a7bc2aa000000b003cf5d41bea1mr29866594wmk.118.1669733226685;
        Tue, 29 Nov 2022 06:47:06 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id b10-20020adfee8a000000b00241dec4ad16sm13717792wro.96.2022.11.29.06.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 06:47:06 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Tue, 29 Nov 2022 15:47:04 +0100
Subject: [PATCH v3 4/6] soc: qcom: geni-se: add support for I2C Master Hub wrapper
 variant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v3-4-f6a20dc9996e@linaro.org>
References: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v3-0-f6a20dc9996e@linaro.org>
In-Reply-To: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v3-0-f6a20dc9996e@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
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

Add the clock list for the I2C Master Hub variant to a new desc struct
then pass it through the I2C Master Hub compatible match data.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/soc/qcom/qcom-geni-se.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 9ddee9fd11ba..f0475b93ca73 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -942,8 +942,18 @@ static const struct geni_se_desc qup_desc = {
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
