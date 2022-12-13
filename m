Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2B0464BC0E
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Dec 2022 19:33:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236227AbiLMSdh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Dec 2022 13:33:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236494AbiLMSdR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Dec 2022 13:33:17 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 170F324BC1
        for <linux-i2c@vger.kernel.org>; Tue, 13 Dec 2022 10:33:16 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id b13so6373724lfo.3
        for <linux-i2c@vger.kernel.org>; Tue, 13 Dec 2022 10:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GmKS4yAhUGAdkF3tOGXdpLmNGlia3T0F+vc1q7Xr8Xo=;
        b=m2BHS9twa2b7zID1oJ/iao0iVKlBV6K+Ofp9ZgGyUjFGlJHdeExbrLmy3BAULqbWen
         BC69+a+FWDzYIsTDVi6rL+F7D5+IoErx+6R8g87Rr6VbLXKLiT6rlcIvHTfqtLZ1zidh
         vsZIV0ffmzAr5/3d4Kyq46HOx9gdyMoosBzk8ONFin5tKRWHHojNDpuFv8z+46KeFUXY
         l9t7REoqZFy04dGy5+cKh0L8GlAOQZlWmsKfNRC0KUScBrkeLcbIig2EtgehCf8SvK4W
         UN6IK7R+lvvx8UsbqLi3hg0h2hR9+nwQuKIpul1/y/I6F5DqLiSmgK8aFA7LiFKEzUrZ
         jNLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GmKS4yAhUGAdkF3tOGXdpLmNGlia3T0F+vc1q7Xr8Xo=;
        b=jA/uv+7Rk9tk46WMArn1NurAcvAaKpqH2DC1ci9B3C/SlW6RymvSkg1R6jB8viEbmG
         Hy5RiASHD0VaYJVpNF6D7OEb7VmI21EeiDs2WQeOYQYQ7sC0/jcjDjqaC4QzhlUpnbeH
         Hbx7BFF5nvcGKvDcu32JWU0kxVFBbmKIARRQlj2W+9ui8KVwYR7BBDDMo6Sk1bLbC90G
         H68JBoLPok4o8hHVFKHGxKEFAkFfl1uZKFKTUVvgYx9yMog9RA8lrzkF5+1tJiv7JKxv
         gO11wJq/it7NK/dfc4B2aAWnvG0i5whlaqto3VxPvdQZufO9nhje8Zp0IGWPs5uUTmV1
         p/pw==
X-Gm-Message-State: ANoB5ploMkELSw4tD1AHPse5Mn+O3gE9ucEKODcOtKWYtVyCfnZ40G3M
        mxzQOG+wYTDRjH7DF19KrHusww==
X-Google-Smtp-Source: AA0mqf5qEhP6JVR1nUz4+hgmxT7n21aOY1ZOIgjsoJZlHCwp8i1wlgj/Qn79G1LiA5H2yhVLohnYtw==
X-Received: by 2002:a05:6512:39cf:b0:4b5:3505:d7f9 with SMTP id k15-20020a05651239cf00b004b53505d7f9mr5965987lfu.35.1670956394474;
        Tue, 13 Dec 2022 10:33:14 -0800 (PST)
Received: from localhost.localdomain (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id t10-20020a056512208a00b004b501497b6fsm465963lfr.148.2022.12.13.10.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 10:33:13 -0800 (PST)
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
Subject: [PATCH v2 3/6] arm64: dts: qcom: sdm845: Add fallback CCI compatible
Date:   Tue, 13 Dec 2022 19:33:02 +0100
Message-Id: <20221213183305.544644-3-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221213183305.544644-1-konrad.dybcio@linaro.org>
References: <20221213183305.544644-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add a fallback CCI compatible, as required by bindings.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
No changes in v2.

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 9eecf1b4ebf9..154f5054a200 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4386,7 +4386,7 @@ port@3 {
 		};
 
 		cci: cci@ac4a000 {
-			compatible = "qcom,sdm845-cci";
+			compatible = "qcom,sdm845-cci", "qcom,msm8996-cci";
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-- 
2.39.0

