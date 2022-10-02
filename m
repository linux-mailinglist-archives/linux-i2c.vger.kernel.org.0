Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC8105F2313
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Oct 2022 14:29:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229901AbiJBM3Q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 2 Oct 2022 08:29:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229895AbiJBM3P (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 2 Oct 2022 08:29:15 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47DAE275EE;
        Sun,  2 Oct 2022 05:29:14 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id a10so9255244ljq.0;
        Sun, 02 Oct 2022 05:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=vzUkslNqHuk/gt2iSzlp7aterSAq7Hwa28XR1XEMjT0=;
        b=ak4G1xuuINLt0/Cv6B1t/9YtTYjsjIoqnAVjsx+5PcOKMszTS7fZ82pdg55099UftG
         oEKhxs6ZzbzrzjpqPNAwKWKO+aTfzs/PFHjKqUKvnxX5bBbxvjZGPjIDxeaFCMaqDs9g
         oY9RNS61jTQjzVv8JSSzL3FwlFLKY3RBw8kAHWDiY33/zXTDH9dXRhjUMmtnX9LoocAa
         5KPyWulqYdUpttjN6NM77bKzPhK6YqllxcP2xOMdXfVws/ZuV0FwQMmdGg+i599qN/JC
         ukIjUWbbtc/2gcHe6n3EhU9rvSXEiTXZfNiU1n/u49JX8W8tu255fBu1c2aEVlxSxiE5
         pg8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=vzUkslNqHuk/gt2iSzlp7aterSAq7Hwa28XR1XEMjT0=;
        b=ZlondFTIe1cy4y2tsc430tzQdOm502ICw2z8HzlDBJZk55mzXsW062aLBelzvszYCx
         b/sPwcn8xw8ATzvouGQqmHSEYfMRj64QEpsVyA8vI322XRVM+QPHt29m9Luy0W/d0olh
         JeF9JSA1C0wKK+HTnKTS6S6/fzxechCNjkaBXjeTC7xSSwkpjrwzeCYeiuwWS7BETasy
         ave/1YJklQsOmJ5b0uDXP+vz/I7V4ttJF0vXXibrSj+8YSx6DFZxNxwUcIJLeD54gIHf
         P8uYeb9ikpvKiZHRGXLNNQESQR31PzbZoRNKALXNrpacKfyeD+om9wU1sUMAEG1KGWol
         nlDA==
X-Gm-Message-State: ACrzQf0R3w29Qv7PgHkZqKRwkfes8VWM96zkMlLR7K9IhAdhouvWrIdC
        NRnLGTFut1XgoBVbPvGklHJbtra4EL86ow==
X-Google-Smtp-Source: AMsMyM51xrThJFnO0ojzjtOSEHCIXB9er7xDErKgrgfCIHuuCGe2LrxkP6N443yx73fms9o1fjSaUA==
X-Received: by 2002:a2e:8190:0:b0:26b:d94b:75e9 with SMTP id e16-20020a2e8190000000b0026bd94b75e9mr5494437ljg.379.1664713752438;
        Sun, 02 Oct 2022 05:29:12 -0700 (PDT)
Received: from i-vetokaappi.home.lan (dsl-hkibng42-5673c7-93.dhcp.inet.fi. [86.115.199.93])
        by smtp.gmail.com with ESMTPSA id v18-20020a197412000000b0049493c14b17sm1064948lfe.181.2022.10.02.05.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Oct 2022 05:29:11 -0700 (PDT)
From:   =?UTF-8?q?Matti=20Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        =?UTF-8?q?Matti=20Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v1 0/6] Qualcomm CCI for MSM8226 and fix CCI documentation for MSM8974
Date:   Sun,  2 Oct 2022 15:28:52 +0300
Message-Id: <20221002122859.75525-1-matti.lehtimaki@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This series adds support for Camera Control Interface found on MSM8226
and adds missing clock documentation for CCI found on MSM8974. In
addition the series adds CCI device tree nodes for both MSM8226 and
MSM8974.

Luca Weiss (1):
  ARM: dts: qcom: msm8974: Add CCI bus

Matti Lehtimäki (2):
  dt-bindings: i2c: qcom,i2c-cci: Document MSM8226 compatible
  dt-bindings: i2c: qcom,i2c-cci: Document clocks for MSM8974

Rayyan Ansari (3):
  ARM: dts: qcom: msm8226: Add MMCC node
  i2c: qcom-cci: Add MSM8226 compatible
  ARM: dts: qcom: msm8226: Add CCI bus

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml | 23 ++++++-
 arch/arm/boot/dts/qcom-msm8226.dtsi           | 52 +++++++++++++++
 arch/arm/boot/dts/qcom-msm8974.dtsi           | 66 +++++++++++++++++++
 drivers/i2c/busses/i2c-qcom-cci.c             |  1 +
 4 files changed, 140 insertions(+), 2 deletions(-)

-- 
2.34.1

