Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 027C853047F
	for <lists+linux-i2c@lfdr.de>; Sun, 22 May 2022 18:28:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349268AbiEVQ2f (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 22 May 2022 12:28:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344039AbiEVQ20 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 22 May 2022 12:28:26 -0400
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8C821408F;
        Sun, 22 May 2022 09:28:24 -0700 (PDT)
Received: from g550jk.arnhem.chello.nl (a246182.upc-a.chello.nl [62.163.246.182])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 63A4CCCD47;
        Sun, 22 May 2022 16:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1653236898; bh=CoTN//IFcGHJAD0zibGBr30oBzqXrd4ztzhciPGcdAQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=v/dN0W5j+weiTe/2/qSO5tq38/vu4DJVPBBtiqhYYE1TNQL2GXbkTxpX+HPYn2S0Z
         1enz1FfKmkLGZY7Rrxc79UXYsTcknXf1LbYEeq7JXQAG9ie1y5twoNyPjzxKgaNkey
         5ABGHm+J/XyXQxr9hL0LvVgyv5UoYocUk6ebL1qw=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        matti.lehtimaki@gmail.com, Luca Weiss <luca@z3ntu.xyz>
Subject: [RFC PATCH 09/14] dt-bindings: i2c: qcom-cci: add QCOM MSM8974 compatible
Date:   Sun, 22 May 2022 18:27:57 +0200
Message-Id: <20220522162802.208275-10-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220522162802.208275-1-luca@z3ntu.xyz>
References: <20220522162802.208275-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,
        PDS_OTHER_BAD_TLD,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add the compatible for the CCI found in MSM8974 which supports two I2C
masters.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt b/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
index 924ad8c03464..166865e48849 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
@@ -7,6 +7,7 @@ PROPERTIES:
 	Value type: <string>
 	Definition: must be one of:
 		"qcom,msm8916-cci"
+		"qcom,msm8974-cci"
 		"qcom,msm8996-cci"
 		"qcom,sdm845-cci"
 		"qcom,sm8250-cci"
@@ -43,9 +44,9 @@ PROPERTIES:
 
 SUBNODES:
 
-The CCI provides I2C masters for one (msm8916) or two i2c busses (msm8996,
-sdm845, sm8250 and sm8450), described as subdevices named "i2c-bus@0" and
-"i2c-bus@1".
+The CCI provides I2C masters for one (msm8916) or two i2c busses (msm8974,
+msm8996, sdm845, sm8250 and sm8450), described as subdevices named "i2c-bus@0"
+and "i2c-bus@1".
 
 PROPERTIES:
 
-- 
2.36.0

