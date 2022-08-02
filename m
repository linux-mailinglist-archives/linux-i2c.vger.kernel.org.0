Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08A1A587F16
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Aug 2022 17:40:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229934AbiHBPkJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 Aug 2022 11:40:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230172AbiHBPkF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 2 Aug 2022 11:40:05 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9580A12D0D
        for <linux-i2c@vger.kernel.org>; Tue,  2 Aug 2022 08:40:01 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id a9so9708184lfm.12
        for <linux-i2c@vger.kernel.org>; Tue, 02 Aug 2022 08:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eR+jIk6y76703ygo3fPNAI8KJwSjksOFVBOQ8Ou+X38=;
        b=Z44vomIu1vlrkKrgD0y9X+WRd4t9rq/Lcr/M+Z/NTLgNlUzjy2z7y7RCNXjcNrpqLW
         upctHyN45wXKE6tcdG0kh+zyloT77waWD/oUTcrUjvQRMTJPVTnXlY1qfoDjoHOlrrRU
         ltjuM+xLB3g/Hto1WiPaT+En8bU3P7GqahqcUxLy0tKnpwI/fdILZ9Rua2CJkUqAX8f+
         coyoUchbrO4/Hw4ucu8BVfY5ZaGrx4Gi0OQ+hlaIzf6bcqRIKo2GgvdmfWWGJuyxm1by
         ZhWTE36x/9XWQ0xjCjSlYXo3JKJiaI8f+rnTX5kZQOlo+vpMT5i4q5ReVG/WpiwmpH9f
         UlHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eR+jIk6y76703ygo3fPNAI8KJwSjksOFVBOQ8Ou+X38=;
        b=QwvMzTBEyc46PdPgaGWGMOvOtowTEk2uS0FnlQ1jStg3Nmk+YxQ+hL8DK2ZIc2luir
         SCVw2XaFXBmNgQj/OCdUQL1lWaSwKukqLGKP5YVSdtPKD0/sr0GNoeYw3/ZAGQlE3xqs
         ChXjBELaM2xAT642v/TjcpPvwEwAWwrhTWlVPqWQ+WQoLsatZdvbP8FQT7Mngk8UfOUP
         K3hGxyuzQIbh9GeCFakzRoNZmdMmFhYQXlcGadm/dsuYX/1Xp8ixgIjH+qW3EU4Yp709
         YTcp4iVRqCtgdSWP9d2ZGcfNyw7VAVN37ZnNTAFM47Ib1i1SNSvVBVF0O4Bn8kUUhQDP
         7oyA==
X-Gm-Message-State: AJIora/n15CoFSjEf/OBjMvm/rmxg0XMQUfJh8AYyScVPGU1y9DANPku
        9oN73FJakpOXFgqeD3dQq9TQVw==
X-Google-Smtp-Source: AGRyM1u070zUSww2mx8UKdgMlVGN0dx3qOXKUKO7Qx35GEHXE+r5vYkRm3ogPruaVOaY7qEGsk0sMA==
X-Received: by 2002:ac2:4101:0:b0:48a:b45c:468a with SMTP id b1-20020ac24101000000b0048ab45c468amr7968699lfi.593.1659454799963;
        Tue, 02 Aug 2022 08:39:59 -0700 (PDT)
Received: from krzk-bin.. ([213.161.169.44])
        by smtp.gmail.com with ESMTPSA id c2-20020a056512074200b0048b06f34566sm407669lfs.76.2022.08.02.08.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Aug 2022 08:39:58 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     corbet@lwn.net,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/5] i2c/arm: dt-bindings: qcom: qcom,i2c-cci: convert to dtschema
Date:   Tue,  2 Aug 2022 17:39:42 +0200
Message-Id: <20220802153947.44457-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Hi,

The DTS patches are independent. Bindings can go via I2C tree, DTS via Qualcomm.

This is the most northern-patch I created so far: 71°10'21"N 25°47'04"E. Does
anyone needs a key-signing around? :)

The place is quite unusual for developing code although its location is
significant only in personal aspect. The geography does not impute any
particular importance of the patches. This is just one more small step towards
better DTS and broader DT schema validation.

Best regards,
Krzysztof

Krzysztof Kozlowski (5):
  arm64: dts: qcom: sdm845-db845c: drop power-domains from CCI I2C
    sensors
  arm64: dts: qcom: sdm845-db845c: drop gpios from CCI I2C sensors
  arm64: dts: qcom: use GPIO flags for tlmm
  ARM: dts: qcom: use GPIO flags for tlmm
  dt-bindings: i2c: qcom,i2c-cci: convert to dtschema

 .../devicetree/bindings/i2c/i2c-qcom-cci.txt  |  96 -------
 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml | 242 ++++++++++++++++++
 MAINTAINERS                                   |   2 +-
 .../arm/boot/dts/qcom-apq8074-dragonboard.dts |   3 +-
 arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi |   3 +-
 arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1.dtsi |   4 +-
 .../boot/dts/qcom-ipq4019-ap.dk07.1-c1.dts    |   5 +-
 .../qcom-msm8974-lge-nexus5-hammerhead.dts    |   2 +-
 arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts  |   2 +-
 .../qcom/msm8994-sony-xperia-kitakami.dtsi    |   2 +-
 arch/arm64/boot/dts/qcom/msm8994.dtsi         |   3 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |   3 +-
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts    |  12 +-
 .../boot/dts/qcom/sdm845-xiaomi-beryllium.dts |   2 +-
 .../boot/dts/qcom/sdm845-xiaomi-polaris.dts   |   4 +-
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts |   2 +-
 .../boot/dts/qcom/sdm850-samsung-w737.dts     |   2 +-
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts       |   2 +-
 18 files changed, 267 insertions(+), 124 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml

-- 
2.34.1

