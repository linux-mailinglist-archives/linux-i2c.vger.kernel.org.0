Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C925D62EFE0
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Nov 2022 09:45:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241363AbiKRIpf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Nov 2022 03:45:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241489AbiKRIpS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Nov 2022 03:45:18 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2964F942F6
        for <linux-i2c@vger.kernel.org>; Fri, 18 Nov 2022 00:45:10 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id x5so4107555wrt.7
        for <linux-i2c@vger.kernel.org>; Fri, 18 Nov 2022 00:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=ora/VunEn0YneVtDdkAbPmkCHMtwr9PRQnKVi+QQtuk=;
        b=PWKvBm09nWluf8q9xZx5T063ULZCTCSLwTivRmIV5S0KnyAMfLueWTage9HLdTGNpE
         NZ31+jMT4SZ6ehGHptyA0JqxUwstvDhii2cpOQyashKNJ6P9VgY9JtGt7ob6HIF7Hirq
         Xr2aYb49CXySFC8LF3YwI6BC8EqFUmeTlJb18c8lsOh+6vNIu6m8D2JRg1KJUkt1w0uE
         o7Fp5EtGGH7naQRjScYV9uqS17tUy8GFBtpN7P7tYI3BxScD6mq/BjBWCNwEZWPPbWPt
         fl0sLxBmTDWR2SJRnqp5D4tp8J6vOQesalACJlkG3t2e00cWrImVViLf4nWBdh0mVfCb
         TGvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ora/VunEn0YneVtDdkAbPmkCHMtwr9PRQnKVi+QQtuk=;
        b=yvnIp0Wz+vrI3FBEMn+jqWxARl3xgcUI4udnbJDHFkea3YjEn5iJWVgm7yYK/Njpwt
         WkDiIcK6epNFxHaWDKK/XSg3MEeamxxxFU5nWRGrAvygSOwsriF7pIB4YK4c7Pv0k9u2
         zyduaxGRdE+uV+5WdWowwRDTBB0SHJnNQs7+mcyFaBzyJqVIhv/h2XKNL2qLXYNYnncP
         JI+NV5ltyZyGkFxnHUoD/jVc2doKjr8wbMDaZ9A2FtlIRFoao2kby81bscdpyZG+mVzk
         c3P6nEf9x4+8kNjtx/RNtcW1ZhIGHbaCLJwatJ1kfuUlAofsoqv7S1zVc92PWcv/J6Bq
         dcqg==
X-Gm-Message-State: ANoB5pmm6LNxt5zzXoSNB6Krr6dXhxm355BRR3VR01kXblj0OspMUaST
        GzhtnJG4469LofXfYKO19+zUBg==
X-Google-Smtp-Source: AA0mqf6eeEHhhxK6RxscWgzRkeJS+Z73karOL8G1Cll4V/G4ET6dxlzUFdmwBPGLNNNQKDtjBb6y9g==
X-Received: by 2002:adf:ce0f:0:b0:22e:2e22:6698 with SMTP id p15-20020adfce0f000000b0022e2e226698mr3805864wrn.296.1668761108653;
        Fri, 18 Nov 2022 00:45:08 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id v18-20020a5d6112000000b00236e834f050sm2960284wrt.35.2022.11.18.00.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 00:45:08 -0800 (PST)
Subject: [PATCH v2 0/6] soc: qcom: add support for the I2C Master Hub
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIABBGd2MC/52NTQrCMBCFryJZO5IJ6Z8r7yEukjo2gSaRTFuQ0rs7eARXj+/B+96umGokVtfTri
 ptkWPJAuZ8UmNweSKIT2FltDGIaCG7mnipJU/AqW8aDetbmFyCaEZIjheqEFYP1rru5XGwXUNKfN4x
 ga8uj0GMeZ1nKUPkpdTP739Difs/VxuChtZaO6BuHdr+NkdZl0upk3ocx/EF0WZInegAAAA=
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Fri, 18 Nov 2022 09:45:04 +0100
Message-Id: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v2-0-aadaa6997b28@linaro.org>
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
To: Konrad Dybcio <konrad.dybcio@somainline.org>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-i2c@vger.kernel.org
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

---
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

 .../bindings/i2c/qcom,i2c-geni-qcom.yaml           | 64 ++++++++++++++++----
 .../devicetree/bindings/soc/qcom/qcom,geni-se.yaml | 44 ++++++++++++--
 drivers/i2c/busses/i2c-qcom-geni.c                 | 58 +++++++++++++++++-
 drivers/soc/qcom/qcom-geni-se.c                    | 69 +++++++++++++++++-----
 4 files changed, 202 insertions(+), 33 deletions(-)
---
base-commit: 094226ad94f471a9f19e8f8e7140a09c2625abaa
change-id: 20221114-narmstrong-sm8550-upstream-i2c-master-hub-44a7fb19475e

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>
