Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D98763C2FB
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Nov 2022 15:47:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235772AbiK2OrI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Nov 2022 09:47:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234542AbiK2OrH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Nov 2022 09:47:07 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8BDF58BE7
        for <linux-i2c@vger.kernel.org>; Tue, 29 Nov 2022 06:47:04 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id o30so11091239wms.2
        for <linux-i2c@vger.kernel.org>; Tue, 29 Nov 2022 06:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=kifJd8r2Xa1q+K0dxzGSjChYAfuX1ssub9et6+nGfyA=;
        b=dChll5z5Y5NlSI5MIwkb56C1byWbdDhw5sfw0hWQweOzWb315QmrF7ZsQNBydiL/Es
         g6KdP2sjNwoAXznEhddww57/tLTot5VL7d4DF0Zvz9vPwn3lVU9U1iByOtmlB4VXyPGC
         EGCmxK36DDUO/OmQMwsol6duRdnkyx/7+D81pSxCWxjlhfMNxptUhobRvE6mCIOdfpDt
         mZtOhHIyX9gQYjyClgwT34s79zegD76CGZQqaMgFXQR2uUkzssgOm9LJNKvsy85d5HUH
         5xcP/ykkhOpMy2uUiords+k4ktBDOvW6ZS3XRR1pXXia5IMXIrAK0escOcmMdTyCfOj5
         QJwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kifJd8r2Xa1q+K0dxzGSjChYAfuX1ssub9et6+nGfyA=;
        b=uuIL0xE5liRT9nSblxxyoMT/OknmnreeUgaj5QXVa8Csk8P9S+vUjTgV//mTqWs94N
         EMNFncE1/sHUiQ7OQGSpi3kWLx53HSykkPZkOIAL/N/et81ZdH5ukvYmpa5bRFlvB/yQ
         NVAouM0seLJvERvax0XDwoBBxkpG/rUnqBAWd1flNimhiSCOqHgmXSuHxx56d0E7trze
         qrW42+665vubPx4LmXq/0NFS+MsO0UATv9PRTEi5XEWosMMP27dZAna/AxkAD8BimjsY
         IwsOi+HSEDCru//oikW1ka/YkIycoLVRWFNjVtO5zl9pMOY6qC6yDlfSCk52huw2SG21
         5CGw==
X-Gm-Message-State: ANoB5plGKSokO8CaZAeFUEyN9gxbL96qFzGnmD2qZqsP+VuxL5R5n9T7
        nb9sTUkKn6yLU32NiMhFl4pKKV3+kqte7oad
X-Google-Smtp-Source: AA0mqf4LwDATeguZjiikhtDg9rpV8OUIcos19ZmT8RhkzAa+eyTqrecpvIOCQeVLgsDFXDR7dN2H1g==
X-Received: by 2002:a1c:4b12:0:b0:3cf:90de:7724 with SMTP id y18-20020a1c4b12000000b003cf90de7724mr45158928wma.18.1669733223362;
        Tue, 29 Nov 2022 06:47:03 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id b10-20020adfee8a000000b00241dec4ad16sm13717792wro.96.2022.11.29.06.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 06:47:02 -0800 (PST)
Subject: [PATCH v3 0/6] soc: qcom: add support for the I2C Master Hub
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIAGQbhmMC/52NzQ7CIBAGX6Xh7BpA+oMn38N4WFosJAUMtCSm6bu78ebV02Y2+WZ2Vmz2trBrs7
 Nsqy8+RYLLqWGjwzhb8BMxk1xKIYSCiDmUNac4QwlD23LYXsQWA3g5QsCy2gxuM6AU9k8jtOpby8hn
 sFgwGePoyBi3ZaGn82VN+f3tV0Hn/k+qCuDQKaW04B0KNdwWT+t0TnlmD8pU+bdakhpxQuy07o38VR /H8QHEAKbnQwEAAA==
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Tue, 29 Nov 2022 15:47:00 +0100
Message-Id: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v3-0-f6a20dc9996e@linaro.org>
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
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The I2C Master Hub is a stripped down version of the GENI Serial Engine
QUP Wrapper Controller but only supporting I2C serial engines without
DMA support.

The I2C Master Hub only supports a variant of the I2C serial engine with:
- a separate "core" clock
- no DMA support
- non discoverable fixed FIFO size

Since DMA isn't supported, the wrapper doesn't need the Master AHB clock
and the iommus property neither.

This patchset adds the bindings changes to the QUPv3 wrapper and I2C serial
element bindings to reflect the different resources requirements.

In order to reuse the QUPv3 wrapper and I2C serial element driver support,
the I2C Master Hub requirements are expressed in new desc structs passed
as device match data.

To: Andy Gross <agross@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-i2c@vger.kernel.org
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v3:
- Fixed check of DT clocks count on geni-se.c with Kondar help
- Added Krzysztof's Reviewed-by on patches 1 & 2
- Link to v2: https://lore.kernel.org/r/20221114-narmstrong-sm8550-upstream-i2c-master-hub-v2-0-aadaa6997b28@linaro.org

Changes in v2:
- Fixed all commits messages to remove "This" and fix grammar
- Fixed the bindings by moving the if in allOf:if
- Fixed the bindings by adding minItems: & maxItems: instead of true
- Added a warning about clock count in patch 3
- Added Reviewed-by from Konrad on patches 3, 4 & 5
- Link to v1: https://lore.kernel.org/r/20221114-narmstrong-sm8550-upstream-i2c-master-hub-v1-0-64449106a148@linaro.org

---
Neil Armstrong (6):
      dt-bindings: qcom: geni-se: document I2C Master Hub wrapper variant
      dt-bindings: i2c: qcom-geni: document I2C Master Hub serial I2C engine
      soc: qcom: geni-se: add desc struct to specify clocks from device match data
      soc: qcom: geni-se: add support for I2C Master Hub wrapper variant
      i2c: qcom-geni: add desc struct to prepare support for I2C Master Hub variant
      i2c: qcom-geni: add support for I2C Master Hub variant

 .../bindings/i2c/qcom,i2c-geni-qcom.yaml           | 64 +++++++++++++++---
 .../devicetree/bindings/soc/qcom/qcom,geni-se.yaml | 44 ++++++++++--
 drivers/i2c/busses/i2c-qcom-geni.c                 | 58 +++++++++++++++-
 drivers/soc/qcom/qcom-geni-se.c                    | 79 ++++++++++++++++++----
 4 files changed, 212 insertions(+), 33 deletions(-)
---
base-commit: 094226ad94f471a9f19e8f8e7140a09c2625abaa
change-id: 20221114-narmstrong-sm8550-upstream-i2c-master-hub-44a7fb19475e

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>
