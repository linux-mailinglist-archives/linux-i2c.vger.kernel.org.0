Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFFDA53DB94
	for <lists+linux-i2c@lfdr.de>; Sun,  5 Jun 2022 15:33:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244347AbiFENdU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 5 Jun 2022 09:33:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231650AbiFENdT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 5 Jun 2022 09:33:19 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F390E387BF
        for <linux-i2c@vger.kernel.org>; Sun,  5 Jun 2022 06:33:16 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id c5-20020a1c3505000000b0038e37907b5bso8719710wma.0
        for <linux-i2c@vger.kernel.org>; Sun, 05 Jun 2022 06:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NbA7wh6jY57A81MjAXEOdG7Q5joLo5XSqFmERYe0yms=;
        b=KUt8AZOzNgbQqIXStUVCuFGSgDZ2GjKz/m7+3s++R2lHfDBG9uRWnD4abumwN/BtDD
         sm+WhmB6LHlbFKIIMVxc/XdGG9t5tPqKMQfHhVQNCHaM+x+ztHA09HkGuQikZ7z5PR2I
         j9FsPbeVBsRZ6Zf6MpPv0sbilYeqPuyR627Bhupbrkjl87E/h19SDQD25s1DZbv8HcgA
         qhm2RsHyaapoLYtz8k4VipUibyDnHbDUGuGglW7lu6aPe1w5oIU7ce1mWQtkwZQqXlIZ
         ZtOtz7LczF/LuLJkCgyOjiMvxH9QpzXQxCS6XmDRURKG5EqgkoMY4Qc4RTINiNl1JGDd
         fnYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NbA7wh6jY57A81MjAXEOdG7Q5joLo5XSqFmERYe0yms=;
        b=4Nnz0uv2UnoQzKXSp3w1slHznvPs8lb2rEMQQocIDaCyO5etP5Sya1LB8c7DI4cbOD
         PN7YlT7qd5V55FITVK/wpsME+OHwECllAUquALLEN8tFisEqNRKoct4G1++T/3UZmNRi
         tsT8tN01tELqKeCveC7y04tegzRrA1xGAPkodwvBBMrsH0ukuA2mPx7EM2cLFLZhmWII
         T+moj7r+4nLDks7xH84M+BabDSSCcounqzdEq9RKpXhoQsnp6/y+Tp6E48DJJ39MixhB
         tej3nLNs2LjyyaaFNnJAinpOtlw7kGtgKQaDM8UBQCsbzDytCFIR/OXQ4dx4lXhTwwMr
         daUw==
X-Gm-Message-State: AOAM532pWCFmM61P0BNi4XlVE7Gf/WspfF72C6JDJTFn6XAWSOvcuYzZ
        cYK9cNH6N7DTzpt7mQLbR13DUQ==
X-Google-Smtp-Source: ABdhPJw10bY4o1/w1XS51daNaShBW8xHRcfsZfqKIJEbYDaIL1gaYDHaYsbiQI0FgXSBT2fsoaPqMw==
X-Received: by 2002:a05:600c:19cc:b0:39c:3022:1b23 with SMTP id u12-20020a05600c19cc00b0039c30221b23mr16534325wmq.106.1654435995365;
        Sun, 05 Jun 2022 06:33:15 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id n187-20020a1c27c4000000b0039c151298b7sm18217076wmn.10.2022.06.05.06.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 06:33:14 -0700 (PDT)
From:   mail@conchuod.ie
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Steve Twiss <stwiss.opensource@diasemi.com>
Cc:     Conor Dooley <conor.dooley@microchip.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-riscv@lists.infradead.org,
        Atul Khare <atulkhare@rivosinc.com>
Subject: [PATCH v1 0/6] clear riscv dtbs_check errors
Date:   Sun,  5 Jun 2022 14:32:55 +0100
Message-Id: <20220605133300.376161-1-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
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

From: Conor Dooley <conor.dooley@microchip.com>

Hey,
Couple conversions from txt to yaml here with the intent of fixing the
the dtbs_check warnings for riscv. Atul Khare already sent patches for
the gpio-line-names & cache-sets (which went awol) and will clear the
remaining two errors.

Rob/Krzysztof:
Have I correctly expressed the mutually exclusive properties?
I had a look around, but wasn't able to find an obvious binding to ape.

Wasn't sure if a txt -> yaml conversion's MAINTAINERS update was meant
to be in the same patch or not, so feel free to squash.
Thanks,
Conor.

Conor Dooley (6):
  dt-bindings: mmc: convert mmc-spi-slot to yaml
  dt-bindings: i2c: convert ocores binding to yaml
  MAINTAINERS: convert ocores i2c dt-binding to yaml
  dt-bindings: mfd: convert da9063 to yaml
  MAINTAINERS: convert da9063 to yaml
  riscv: dts: sifive: "fix" pmic watchdog node name

 .../devicetree/bindings/i2c/i2c-ocores.txt    |  78 -----------
 .../devicetree/bindings/i2c/i2c-ocores.yaml   | 132 ++++++++++++++++++
 .../devicetree/bindings/mfd/da9063.txt        | 111 ---------------
 .../devicetree/bindings/mfd/da9063.yaml       | 123 ++++++++++++++++
 .../devicetree/bindings/mmc/mmc-spi-slot.txt  |  29 ----
 .../devicetree/bindings/mmc/mmc-spi-slot.yaml |  76 ++++++++++
 .../devicetree/bindings/trivial-devices.yaml  |   2 -
 MAINTAINERS                                   |   3 +-
 .../boot/dts/sifive/hifive-unmatched-a00.dts  |   2 +-
 9 files changed, 334 insertions(+), 222 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-ocores.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-ocores.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/da9063.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/da9063.yaml
 delete mode 100644 Documentation/devicetree/bindings/mmc/mmc-spi-slot.txt
 create mode 100644 Documentation/devicetree/bindings/mmc/mmc-spi-slot.yaml

-- 
2.36.1

