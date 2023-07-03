Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66B58745D55
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jul 2023 15:31:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231522AbjGCNbR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jul 2023 09:31:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229914AbjGCNbQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Jul 2023 09:31:16 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61E0DE3
        for <linux-i2c@vger.kernel.org>; Mon,  3 Jul 2023 06:31:15 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2b6a5fd1f46so68093681fa.1
        for <linux-i2c@vger.kernel.org>; Mon, 03 Jul 2023 06:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688391073; x=1690983073;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mmnKR6NrcH13RIboC24wgvo0cXm9uFpdKMc5Nw0n2zA=;
        b=ScMdpPo+quZsGKt6VxpWHDSxyvsyHQTKTkDln/Nk5LM97r3ByHE8tRaLbaMvIxbS85
         lQMOOI6mNxiq/LTabMNpFsGcPccJoVDJvShOaSrpsRAAw2GVxGZ0/hQb3kL+DOn9bPO3
         LzzMb+6WZ9gj9hrm80XN+GiplqVeWvzt2DHlJzYUm4O3fYez/hIEfojd6aCDtOQLMyDw
         /JST52UuE9cGQN/N23OmzKAbDBCwMaT+9FXOCFXxFcoYHA40lGBrO7AfStANI6Fie7bc
         AybJ0M1nIfz4EcE8lNqRCIoqPrMLcwxi6MjmTcgE/1FmWXxq/MKuYPxjFySG61Pss78+
         QEIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688391073; x=1690983073;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mmnKR6NrcH13RIboC24wgvo0cXm9uFpdKMc5Nw0n2zA=;
        b=UT7egrParNVdQA4QIcrUj1nbDaokRy4DiEMOt+SaIMbsYIF3qsziY0MZeB5Iznwgoj
         OLo57l7WL+T7jYj5T0ZVIw61X9qebrjLbPXkmj2CtkHk4IHmqtnxJ70QYB5zVJ7hr9kH
         SbGNvTvIcDFrM5reta0wc9U3ZQBEwgZTsjs5Yu/m0yiJRfUPBjlpr/QVztD8FOkum+hF
         b91umKtd7MOzsunnCbvVgDuHMKhz0G+0RXNgXn2IqaRiKdsc+eOwMgM8vyqSZucEpOC5
         wtoHMzHH0KVsg7lRTbNPkNW3lETpd1c+HzknFtA2MATMNd/HNlN6de0sRy7L5cdlpTso
         Sd1Q==
X-Gm-Message-State: ABy/qLZ0UO9NFTq/mSAEX06LmxPYN+f9rNLOAGJfaLG9IBQSE0IKrPFU
        FpOdYgVSRy8wBztmwsXWI5+7x+FB+Gi8mvqnWBDDIQ==
X-Google-Smtp-Source: APBJJlGFdqjy8wwAOkx2KKsD9YVjv9xJFBDRdOY+uU/tTgJX7vCdJgPQj5vpQBGok4bNXDBHh5GbeQ==
X-Received: by 2002:a05:6512:3984:b0:4fb:85b2:cf78 with SMTP id j4-20020a056512398400b004fb85b2cf78mr8856638lfu.37.1688391073559;
        Mon, 03 Jul 2023 06:31:13 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
        by smtp.gmail.com with ESMTPSA id ep7-20020a056512484700b004fbb1f70ceesm833417lfb.227.2023.07.03.06.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 06:31:13 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/5] Add interconnects to QUPs on SM8250
Date:   Mon, 03 Jul 2023 15:31:09 +0200
Message-Id: <20230703-topic-8250_qup_icc-v1-0-fea39aa07525@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ3NomQC/x2N0QqDMAwAf0XyvEBtp5X9yhCpMZsBqV2rMhD/f
 WGPd3DcCYWzcIFHdULmQ4qsUaG+VUBziG9GmZTBGuuMNw63NQlhZxszfPY0CBG2tW+74O7kmUD
 DMRTGMYdIs6ZxXxaVKfNLvv/Ts7+uH6A3bfx5AAAA
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andi Shyti <andi.shyti@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-i2c@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688391072; l=1274;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=P/b9sUtVGW1aCLv/5W9/Do7IS4MZ5AYwLEHs4cWI4Yo=;
 b=FeyN/5yDiFSyKCkhToHlIcdNwZzpYCsAzae8/E3MTmMzSSgehX8sZSykvbqgM4E5OR2o/LBXV
 pAWX9VvkUzICzoebYDjNNIbkASbiD70Z2u/I6lHttwRFt3eIaxT4Pcp
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SM8250 (like SM8150 but unlike all other QUP-equipped SoCs) doesn't
provide a qup-core path. Adjust the bindings and drivers as necessary,
and then describe the icc paths in the device tree. This makes it possible
for interconnect sync_state succeed so long as you don't use UFS.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (5):
      dt-bindings: spi: spi-geni-qcom: Allow no qup-core icc path
      dt-bindings: serial: geni-qcom: Allow no qup-core icc path
      dt-bindings: i2c: qcom,i2c-geni: Allow no qup-core icc path
      soc: qcom: geni-se: Allow any combination of icc paths
      arm64: dts: qcom: sm8250: Add interconnects and power-domains to QUPs

 .../bindings/i2c/qcom,i2c-geni-qcom.yaml           |  27 ++--
 .../bindings/serial/qcom,serial-geni-qcom.yaml     |  26 ++--
 .../bindings/spi/qcom,spi-geni-qcom.yaml           |  15 ++-
 arch/arm64/boot/dts/qcom/sm8250.dtsi               | 150 +++++++++++++++++++++
 drivers/soc/qcom/qcom-geni-se.c                    |   9 +-
 5 files changed, 204 insertions(+), 23 deletions(-)
---
base-commit: 296d53d8f84ce50ffaee7d575487058c8d437335
change-id: 20230703-topic-8250_qup_icc-61768a34c7ec

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

