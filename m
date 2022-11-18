Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85B4D62EFF7
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Nov 2022 09:46:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241661AbiKRIqC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Nov 2022 03:46:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241345AbiKRIpY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Nov 2022 03:45:24 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CA6917075
        for <linux-i2c@vger.kernel.org>; Fri, 18 Nov 2022 00:45:14 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id x5so4107864wrt.7
        for <linux-i2c@vger.kernel.org>; Fri, 18 Nov 2022 00:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w96//s+DKsR2vwyM7MoWsFHf/kzUOoVxQJ2TCTp4km0=;
        b=DnhRcHytlKZdpIe7HWqKcQIIDDjOZeQNBkYi30Mx0bixpzGTuFiAqWiJ99uMMfGsaA
         4NDc+N1Qtnk/YmstKjX1dx3phSOnJPXzmZ2T2zSST8ljyzAItu1ILKaM1X2TglNrtkut
         g7qlEd6uDUbY9KgAG8I/ZZQ/iHqm4zESzm7vPc4wazBwEm+Fud8lZtYXtLJX7Aj6z5fv
         WubAcpU3mXc01QXy25fxn9Ig1ir1oeMIVmvImKYdtxfd3gpUu9McGPdvMBNRx7ijmanx
         OFD8wv6cJN6FcEH7w2IELz84L+IzxjeiIMhtKQJUq69Nwv+CVQAp85lkh4NbUNfz2nIe
         7fhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w96//s+DKsR2vwyM7MoWsFHf/kzUOoVxQJ2TCTp4km0=;
        b=jzhQoDlCpjEqDZMbNhFB5Fq9NW5Ngew14/4f2UpWHqsF2/R2Qy8b4pgDDp9D1DG6Aq
         Q5uDKr+o7qm3RP0FIcnq0wFZtMxqxS2Doxy/LB2LvBEUDrWw3qduVcoz/0jAi+AFWw2W
         ul5tOZeetTfRm9Liv6jnmn16gWVSbJ/GEluZOW7XLSthODh5EKwfqv99yuj07VTmo2BC
         /VjgoKypUyBPvcHrRncQrSM3lbuOUmLAspDs9ALZ0Y7XXwYZo90IW9JX7FLvtF0G+jzd
         ZO0yJYX4alafOYV2Hc05BWPKAz/vi929SLXKDmHG4nZ8nK7BykizDbY3zX0KAWx9YzdL
         lCgw==
X-Gm-Message-State: ANoB5plBdR+rQXjrbdAdL5HELJviGQ3ayijmpHbi9Imgy3qvY5OaeNbk
        tNoCM1MGrJ2EJdT1VFoI/6o9Jw==
X-Google-Smtp-Source: AA0mqf4UrgmJznGeTqnfuDCPYSbngfFUCa87fNs5LatjAlNgWXjIBdIO3SEYK8xxIFJ4fNKPsm5SEg==
X-Received: by 2002:a05:6000:70f:b0:22e:41c5:7ef7 with SMTP id bs15-20020a056000070f00b0022e41c57ef7mr3707513wrb.332.1668761113472;
        Fri, 18 Nov 2022 00:45:13 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id v18-20020a5d6112000000b00236e834f050sm2960284wrt.35.2022.11.18.00.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 00:45:13 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Fri, 18 Nov 2022 09:45:10 +0100
Subject: [PATCH v2 6/6] i2c: qcom-geni: add support for I2C Master Hub variant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v2-6-aadaa6997b28@linaro.org>
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

Add the I2C Master Hub serial engine compatible along the specific
requirements in a new desc struct passed through the device match data.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
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
