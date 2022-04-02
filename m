Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 855E44F056B
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Apr 2022 20:40:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244605AbiDBSmL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 2 Apr 2022 14:42:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240715AbiDBSmK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 2 Apr 2022 14:42:10 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09A534756A
        for <linux-i2c@vger.kernel.org>; Sat,  2 Apr 2022 11:40:18 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id w4so8553494wrg.12
        for <linux-i2c@vger.kernel.org>; Sat, 02 Apr 2022 11:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R0bwaoRy8YP0Kka6d0PR4kRnGp6k/gPNidKoi7gvCCI=;
        b=URDJ3cCHTnlp0bYj+GpNw8EIKiC1517X/uMlkAr23rxB/6VlQHcy/jrd0G6QM65nZX
         2Luj++y1IZb5rOWXfFShm94mRf+nigTy7tk8+eiRNSXmVSUA07YeV8/G97iDXbAoySFP
         wtrkxCHLyhLHZXrDRoMbnW0AFkVAsb18orB2ZK0Z0Cv0QD2unyangyc7QXsFHPjYOXpL
         8GglQZrPbQSNPWHhMzsfoAWjBOF3ddtl1U3te8n8yEn7LmKtTNDeL/wO/j8yzMPDi0wd
         d1Qc2LmnDf8Hkm2wZSQ0NW+bcExEihlFBUGL2EhfHKzYp4q8vERtnhJuda6dEG07gAHZ
         /cWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R0bwaoRy8YP0Kka6d0PR4kRnGp6k/gPNidKoi7gvCCI=;
        b=AkLKWMk5vFYKBnjYlA04e4YLd179idqoIvEd7tUKLgVg9wHgKOfnDu0z1ApDvWvTk9
         7YmfM78UCVTkO7kfswUIKSwzRwei9Lvbqv7gaNckMwWCUdI9Y2gquohw3g7UMss9tM1C
         M2CB/Hrul0MU6NC+LDLng4czvAAt1UWSK72U6UK0Wy81fxB5QPcrBmQZ4iKBb6Xabn5T
         ZtFr2OX7dopGgGme38Now9LYuxpJmsZj0E29E+EFskX1GWWhKEBXU/hh46GL8ZW9j2fP
         tTR7jmp2ma8u5orbEQVwih68BwI22LpCJUs4KGP8kE118wJPRQgTmLb7hYhoRlMW7jC0
         ErHw==
X-Gm-Message-State: AOAM530T0qCyCRVcKeo5MET5L3eBmr0aWUa17x78Ot0nbahTY6tfgmG/
        TDjrgeP4rmofEyQ86V+oO8bCTg==
X-Google-Smtp-Source: ABdhPJyr8f7Kmujacwvt6D5jb632G4JW2j0OdeTO8iHDHsAdsWcTY+7h1E41JoLr7Iu+uJ1G3+sN2g==
X-Received: by 2002:a05:6000:1887:b0:204:2917:ad3e with SMTP id a7-20020a056000188700b002042917ad3emr11877380wri.138.1648924816609;
        Sat, 02 Apr 2022 11:40:16 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id m20-20020a05600c4f5400b0038b5162260csm6760502wmq.23.2022.04.02.11.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 11:40:16 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org
Cc:     Kuldeep Singh <singh.kuldeep87k@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 0/9] dt-bindings: qcom: convert entire GSBI (QUP I2C/SPI/UART) to DT schema
Date:   Sat,  2 Apr 2022 20:40:02 +0200
Message-Id: <20220402184011.132465-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

Changes since v2
================
1. Several new schema patches (GSBI, I2C and UART schema).
2. Several DTS fixes for clocks and DMAs. The choice of dma tx-rx
   and clocks core-iface was by more-or-less number of fixes needed.
3. Add Kuldeep acks to patches without changes.

Changes since v1
================
1. Fix path in com/qcom,gsbi.txt.
2. Merge clock-names in example, correct $ref path (Kuldeep).

Merging
=======
1. The DTS patches are independent and silence warnings pointed
    out by schema.

2. The DT schema patches should be taken together as GSBI (final patch)
   depends on previous bindings.

Best regards,
Krzysztof

Cc: Kuldeep Singh <singh.kuldeep87k@gmail.com>

Krzysztof Kozlowski (9):
  arm64: dts: qcom: align dmas in I2C/SPI/UART with DT schema
  arm64: dts: qcom: align clocks in I2C/SPI with DT schema
  ARM: dts: qcom: ipq4019: align dmas in SPI/UART with DT schema
  ARM: dts: qcom: ipq4019: align clocks in I2C with DT schema
  ARM: dts: qcom: msm8660: disable GSBI8
  spi: dt-bindings: qcom,spi-qup: convert to dtschema
  dt-bindings: serial: qcom,msm-uartdm: convert to dtschema
  dt-bindings: i2c: qcom,i2c-qup: convert to dtschema
  dt-bindings: qcom: qcom,gsbi: convert to dtschema

 .../devicetree/bindings/i2c/qcom,i2c-qup.txt  |  40 ------
 .../devicetree/bindings/i2c/qcom,i2c-qup.yaml |  89 ++++++++++++
 .../bindings/serial/qcom,msm-uartdm.txt       |  81 -----------
 .../bindings/serial/qcom,msm-uartdm.yaml      | 112 +++++++++++++++
 .../bindings/soc/qcom/qcom,gsbi.txt           |  87 ------------
 .../bindings/soc/qcom/qcom,gsbi.yaml          | 133 ++++++++++++++++++
 .../devicetree/bindings/spi/qcom,spi-qup.txt  | 103 --------------
 .../devicetree/bindings/spi/qcom,spi-qup.yaml |  81 +++++++++++
 arch/arm/boot/dts/qcom-ipq4019.dtsi           |  36 ++---
 arch/arm/boot/dts/qcom-msm8660.dtsi           |   1 +
 arch/arm64/boot/dts/qcom/ipq6018.dtsi         |  20 +--
 arch/arm64/boot/dts/qcom/ipq8074.dtsi         |  40 +++---
 arch/arm64/boot/dts/qcom/msm8916.dtsi         |  68 ++++-----
 arch/arm64/boot/dts/qcom/msm8953.dtsi         |  48 +++----
 arch/arm64/boot/dts/qcom/msm8994.dtsi         |  42 +++---
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |  36 ++---
 arch/arm64/boot/dts/qcom/qcs404.dtsi          |  92 ++++++------
 17 files changed, 607 insertions(+), 502 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/qcom,i2c-qup.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/qcom,i2c-qup.yaml
 delete mode 100644 Documentation/devicetree/bindings/serial/qcom,msm-uartdm.txt
 create mode 100644 Documentation/devicetree/bindings/serial/qcom,msm-uartdm.yaml
 delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,gsbi.txt
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,gsbi.yaml
 delete mode 100644 Documentation/devicetree/bindings/spi/qcom,spi-qup.txt
 create mode 100644 Documentation/devicetree/bindings/spi/qcom,spi-qup.yaml

-- 
2.32.0

