Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBA657B2D62
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Sep 2023 10:01:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232813AbjI2IBQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 Sep 2023 04:01:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232822AbjI2IBN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 29 Sep 2023 04:01:13 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 605371BD
        for <linux-i2c@vger.kernel.org>; Fri, 29 Sep 2023 01:01:11 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5345a3dfe3bso9141053a12.3
        for <linux-i2c@vger.kernel.org>; Fri, 29 Sep 2023 01:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1695974470; x=1696579270; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K4AXanlYkF1UctT0i4z2SSgLVfpVBN6YLneat8LfHMI=;
        b=clRznoFA1sY2osFvY6SDGuCgw1iQ6CK9eZIp7dhSezFQ3hmQ8wJLVXT1QNRsY+DEH7
         ygNCbw7cRgl6Jx/qWYAamNcpt5WZp2C1vATWLMYZGNL7AqnrucBnErXFDZgdW2HmQJDv
         Xg9waeCO16E85Q0AdD9t/wH1IPHdscbTBaoSZXr8N/BGuQZN8bl9/4HAq8aOQfvO1Pjf
         +vDp1/GlGocuRYUKqwaVyfeJ+Ycu/nXxyUo4aJmzRKLIcggQGIFOjdc6U/55vfHcTpX6
         s9014kPx+L0HZwbN67mVCMko6m1LYX1yffqD0XPGgVn0B3ztmB5p7I6XuWpV4g7HGPe7
         G4mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695974470; x=1696579270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K4AXanlYkF1UctT0i4z2SSgLVfpVBN6YLneat8LfHMI=;
        b=wwRWfvoJgSgiFtSWHCRmYr6vpysAMQzgiLv8yokbBI13WcO0dc/kwXoqovQjwwnTHv
         NddwBdbqtSPhiGuzLPROWdDD9LkF1Ja1Hb4XJvJNXbHCV8Eaa9FQX5wIdceI1G05HYVI
         MMgobL2+SaBWN0VSC6sMJR5fIVXsY7EdBroRiu8bkRHeOIajw7S2Dk0yGAwJE2sz8CFP
         FpXkNBqBgDEUOuPuMunieusxAmKpwnmzJhpL7dGFaabWCdVdbyBMsQNBx9tT4vA0L5FG
         pBOp9VLIu9MD6z4YdbRVztzFEgjPsCda8NNxqKhHUeVpcgUR3cEiMF9Ba2FKuxTP5KuZ
         PJ0w==
X-Gm-Message-State: AOJu0YyQ9VymyJ8Ke09UOHZq9oYh9wAlBOjnkbIln9JbR4HcjtT8iByg
        O1tfxQWEUTPMzzOHPsio7C08Kw==
X-Google-Smtp-Source: AGHT+IG+juZVGk+drK2JRLPswl8hxtyEq3YJ8XGPJn2oMYNzLrEwcoHY46wVzk0EZrzIatxtdRwhnw==
X-Received: by 2002:a05:6402:751:b0:531:9c1:8276 with SMTP id p17-20020a056402075100b0053109c18276mr3035733edy.4.1695974469876;
        Fri, 29 Sep 2023 01:01:09 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id j6-20020aa7ca46000000b0052889d090bfsm10825040edt.79.2023.09.29.01.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 01:01:09 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Fri, 29 Sep 2023 10:01:07 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable CCI
 busses
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230929-sc7280-cci-v1-3-16c7d386f062@fairphone.com>
References: <20230929-sc7280-cci-v1-0-16c7d386f062@fairphone.com>
In-Reply-To: <20230929-sc7280-cci-v1-0-16c7d386f062@fairphone.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Enable the CCI busses where sensors are connected to.

Not covered here is the regulator used for pull-up on the I2C busses.
This would be pm8008_l6 (L6P).

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index c8e7e6689b20..3fc0b3f7dc31 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -388,6 +388,26 @@ vreg_bob: bob {
 	};
 };
 
+&cci0 {
+	status = "okay";
+};
+
+&cci0_i2c0 {
+	/* IMX800 @ 1a */
+};
+
+&cci0_i2c1 {
+	/* IMX858 @ 29 */
+};
+
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c1 {
+	/* S5KJN1SQ03 @ 10 */
+};
+
 &dispcc {
 	/* Disable for now so simple-framebuffer continues working */
 	status = "disabled";

-- 
2.42.0

