Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DD5C67531E
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Jan 2023 12:12:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229954AbjATLMa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Jan 2023 06:12:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229703AbjATLM2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Jan 2023 06:12:28 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A6BCB4E21
        for <linux-i2c@vger.kernel.org>; Fri, 20 Jan 2023 03:12:25 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id hw16so12989991ejc.10
        for <linux-i2c@vger.kernel.org>; Fri, 20 Jan 2023 03:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OfzggvR5GAJWNY3SBEL5sV3sSdqBdNkvzmkoduGkVE8=;
        b=i+30OnT1UGVubEaZYDCXe923zdH6oxIyNZy6VplKDTQhND+CFPoChZchGf2gUlhfis
         f6ml4pnH6Nm+S6ZFV2YubEpD5fPEpWIxb+8kG/1yuYvLHGToWOIBJWZfShZgczjzWqzl
         7U/sbj4IGJs7M8+rPfMoJiJoxRCg/Zd2GXeEj/id8EtLFtJGzaRMSVa0W1plXRSaRLBS
         s0+W11t8QcNtLPvc+5yOx3AhUasHdrh0dfrn8prbcXCpBW5vqSp09xCRxnBmh1hT66dN
         JN4fnGgZwr/wVnHL/92+DNO2CQecaqyAPmHOSXytIyx5uQJxYE9WEf30G10/GVM8R2wk
         vCBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OfzggvR5GAJWNY3SBEL5sV3sSdqBdNkvzmkoduGkVE8=;
        b=VwJ6Hom/Pwnzz7LIKPrNtHIThOrBAlNRr+dNxyQewctdcHXww5Uoe7yBou8PAPiPt9
         fxHxhetHDXpGiJUzr8HgIpDC1WgJ5ScUFXNCNJZKFlXOX29WqUFcTDoB9pxJDEwVKMxl
         kbZR1+y3n4MczBfxiO8bIG00jItsmNCaJng1tG0JUb9vDYmli2it54K0Di4vy0SI4QMH
         z+ZE/JO4uxxvj33wXkNRDcvxTVrqKh4VuhqYMugoZtzfp5a3++7tMsvobl4f+PeQ6Zpl
         gtU9TF8qPuQPEBDO5GAncFedhHx9AOcnXeGKHw+Nvfz60lQgn/R67NoyhbL6yyOD8188
         za/w==
X-Gm-Message-State: AFqh2koyd/V5ftLJ7TlvtDV5lQzdOrJjFici1fw05SXNvTuJFDKWaQ8I
        NQi9YrNNnffMC4xsVhD8Y1Ngsw==
X-Google-Smtp-Source: AMrXdXvwwjl6H+vQuYjU15Y/5EYFYujeX2U4qQUVU9C8x0lGStLvU4bjDnP4JSaZ0hmlMFyB7O/Q2w==
X-Received: by 2002:a17:906:c0c1:b0:7c4:fa17:7203 with SMTP id bn1-20020a170906c0c100b007c4fa177203mr13130663ejb.63.1674213144017;
        Fri, 20 Jan 2023 03:12:24 -0800 (PST)
Received: from [172.16.220.87] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id du1-20020a17090772c100b0084bfd56fb3bsm17667492ejc.162.2023.01.20.03.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 03:12:23 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/4] Add CCI bus support for SM6350
Date:   Fri, 20 Jan 2023 12:11:53 +0100
Message-Id: <20221213-sm6350-cci-v1-0-e5d0c36e0c4f@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPl2ymMC/w3LOwqAMAwA0KtIZgP9oKi3SWPUgFZo0EV6dzu+4
 X1gUlQMlu6DIq+a3rnB9x3wQXkX1LUZggvBBx/RrjEODpkV45Ro8zOxxAQtJDLBVCjz0Up+zrPW
 H6nd2HBhAAAA
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.11.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add the camera clock controller node and CCI nodes to sm6350 dtsi and enable
the i2c busses on Fairphone 4 dts.

This is tested using PM8008 regulator patches from the lists which power the
cameras, and using i2cdetect/i2cget/i2cset reading the sensor ID registers.

To: Andy Gross <agross@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
To: Loic Poulain <loic.poulain@linaro.org>
To: Robert Foss <rfoss@kernel.org>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht
Cc: phone-devel@vger.kernel.org
Cc: linux-i2c@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

---
Luca Weiss (4):
      dt-bindings: i2c: qcom-cci: Document SM6350 compatible
      arm64: dts: qcom: sm6350: Add camera clock controller
      arm64: dts: qcom: sm6350: Add CCI nodes
      arm64: dts: qcom: sm7225-fairphone-fp4: Enable CCI busses

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |   2 +
 arch/arm64/boot/dts/qcom/sm6350.dtsi               | 141 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  |  20 +++
 3 files changed, 163 insertions(+)
---
base-commit: 1578f85d549045aac441821064e7953732460e51
change-id: 20221213-sm6350-cci-38baf19ace3b

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>
