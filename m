Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6E6164B494
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Dec 2022 12:57:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235428AbiLML5Q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Dec 2022 06:57:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235518AbiLML4w (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Dec 2022 06:56:52 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3EB51EC54
        for <linux-i2c@vger.kernel.org>; Tue, 13 Dec 2022 03:56:37 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id p36so4465718lfa.12
        for <linux-i2c@vger.kernel.org>; Tue, 13 Dec 2022 03:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81cVYB4WBwyYTibh03Nt60wZieVhPQ4WqxkREiyJ0l4=;
        b=L6MfK/DT800uQ4C1wKH33reBgBDMlE1HZD232OP7tDjjxyofJ8A1IIzMb/EEl7ZcEn
         zRyiaui1F6D2u0L34qTlhgMUALFVF0aZgC8joPXJ8vnKZEmD5Pyfu4YjXSkg1MV8zGYC
         bSjQE56KLlPJSwGf2BmE5k8ciuoDx9sfiqQFCMAGMVLq31X/fQm4R1/IIvtGY9U+gyth
         0IP20h5UY9PwOVj/kQKxDONtYJywA4XucyilypM/7tnpDLk+ptke0hLgCVBTf8oOo0Ve
         qRvnni0gGZa4aTgqLHdv7w2Eod+92Uixi/j8sD8yQy6+Ia8a1T1BBeppSlrsGJ9hAA3o
         HxKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=81cVYB4WBwyYTibh03Nt60wZieVhPQ4WqxkREiyJ0l4=;
        b=DKeE8ei9xLjWDq5iRo2LSQLj2E09SujkQa0F3S6iatnD0301VQk5hN1635tGE3s5ZL
         b97UdjR/MSwsDsXGok47e8c+DfEIJesjW2LZP8YNIOyRbfp5L917ZWeKo/6wr3VckaxH
         t33j+0el+PV05ES3RyuiS67oUrlNUzyZjje2RCuHBlcFUnbXiOCkoxi+yACcnIgEcoXS
         lyHtDkOFa8DFUa0eVLU0GbUQmdlIepueF2hMufgsSJWaG241b6fYF0oaDutaj6pY28rm
         qFkSnX01InxpOsKoyhRzjJnnAUSU6qPv/99JLDmk4P40nRtttjiNM2ZU0txhQbKiS+WL
         tplQ==
X-Gm-Message-State: ANoB5pns7n5Q/UdcfyYlhKq9JLMuYeyJpXgxiLNbcDTCvWfxjnB2tJNP
        lZNzYXJi8fYbURar5RWqjYpVMg==
X-Google-Smtp-Source: AA0mqf6OAUdWKElxTu2E2vcEHGn6PHuw+ai1qzAKHvmmzM4ECQRepR0TXTC0YvLh1TcAUVNVBb3UjQ==
X-Received: by 2002:a05:6512:798:b0:4b4:f913:18b6 with SMTP id x24-20020a056512079800b004b4f91318b6mr6031932lfr.21.1670932596260;
        Tue, 13 Dec 2022 03:56:36 -0800 (PST)
Received: from localhost.localdomain (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id 8-20020a2eb948000000b0026daf4fc0f7sm234573ljs.92.2022.12.13.03.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 03:56:35 -0800 (PST)
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
Subject: [PATCH 4/4] arm64: dts: qcom: sm8250: Add fallback CCI compatible
Date:   Tue, 13 Dec 2022 12:56:28 +0100
Message-Id: <20221213115628.105149-4-konrad.dybcio@linaro.org>
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
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 0c4ecdab1244..6d16857fed26 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3723,7 +3723,7 @@ videocc: clock-controller@abf0000 {
 		};
 
 		cci0: cci@ac4f000 {
-			compatible = "qcom,sm8250-cci";
+			compatible = "qcom,sm8250-cci", "qcom,msm8996-cci";
 			#address-cells = <1>;
 			#size-cells = <0>;
 
@@ -3764,7 +3764,7 @@ cci0_i2c1: i2c-bus@1 {
 		};
 
 		cci1: cci@ac50000 {
-			compatible = "qcom,sm8250-cci";
+			compatible = "qcom,sm8250-cci", "qcom,msm8996-cci";
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-- 
2.39.0

