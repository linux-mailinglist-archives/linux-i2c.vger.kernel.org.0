Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77F2964B498
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Dec 2022 12:57:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235425AbiLML5R (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Dec 2022 06:57:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235500AbiLML4f (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Dec 2022 06:56:35 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDE271EC75
        for <linux-i2c@vger.kernel.org>; Tue, 13 Dec 2022 03:56:34 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id a19so3093890ljk.0
        for <linux-i2c@vger.kernel.org>; Tue, 13 Dec 2022 03:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AHzv0352m74LurNkyRUC1Dedaf1/cYo0KvLOmkcQKAc=;
        b=tfz46t8IIsblJtgujCuRaimwuxqO9UasdiVHQddfmN8b58KqSABUgjnj6w0leGlME3
         KH9ERqOw88huXVAR75YGmGkA2lu+mJQ6/oFQT99zREeIn+joEPkqzFhSyyArkaJJkByC
         1G3FRGYiFa8oess0vEeZy6stvEp3RXOu42BFxlb0tnHgjGEd+D71DpaEy8ZOjKiXNd/A
         /r4TWLgNvGf3ojguDoqrpm7Hbu78UYTlLssrbLH5O6MGKD/xoq5MvPMFBOEeo9dbRp5I
         AxtJlKwHCBl1SlLcgjvrKnfIRMqBkh9aMq0v36wG8A9c3FIPVyw43C+lS8XelC/EY0EI
         dfqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AHzv0352m74LurNkyRUC1Dedaf1/cYo0KvLOmkcQKAc=;
        b=GbafIt82BTyepXh8EJSnCze2cWVmHVA24mmwTNtGCCkcz24KUmKaI+aayDE118rReL
         yw/Jc/DdCHdVwglwuRh1wBeYp7YIzVeF+Pr5R7cCLEuqI+QaUSLol5o0tM1UQGe/VK4q
         TOK9nAcQ+zaec8pmcVIZLT4kU0/LxBL86VsciiDibhF4Ph2eETC6SDLBO7YvxKwCOEKV
         4MYzJHIM0hymtcqlPxH8DRvtp3T3XOzbh92u41NrD8MEw4W6BO3NtPtCXRZnlq2PaQMU
         vMqcWrj+xP4M07CnnAdD7CRVWJOaz9mAaXxVcOCndQca3Vpfo22MUNOWIPttjcVl0nom
         7kkA==
X-Gm-Message-State: ANoB5pnqjmxRP/3ea87MDWp6i9/1apS+J4eM2+XVUM/vOua7xPm9v1eS
        ol2l6NF2nG7M9eovwysg7B8E+w==
X-Google-Smtp-Source: AA0mqf7oxHY+edNwciLH5vnruCmpDgtWjclSdauWSlpFm9jbOO3IELx482pE5SGdhTVohxkgFyYTYQ==
X-Received: by 2002:a05:651c:12c7:b0:277:42bd:dfe6 with SMTP id 7-20020a05651c12c700b0027742bddfe6mr4912375lje.3.1670932593353;
        Tue, 13 Dec 2022 03:56:33 -0800 (PST)
Received: from localhost.localdomain (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id 8-20020a2eb948000000b0026daf4fc0f7sm234573ljs.92.2022.12.13.03.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 03:56:33 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] arm64: dts: qcom: msm8916: Add fallback CCI compatible
Date:   Tue, 13 Dec 2022 12:56:26 +0100
Message-Id: <20221213115628.105149-2-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221213115628.105149-1-konrad.dybcio@linaro.org>
References: <20221213115628.105149-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add a fallback CCI compatible, as required by bindings.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 2ca8e977fc2a..4c0a0078adb5 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1167,7 +1167,7 @@ ports {
 		};
 
 		cci: cci@1b0c000 {
-			compatible = "qcom,msm8916-cci";
+			compatible = "qcom,msm8916-cci", "qcom,msm8226-cci";
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0x01b0c000 0x1000>;
-- 
2.39.0

