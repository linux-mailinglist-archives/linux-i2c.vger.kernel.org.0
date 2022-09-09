Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C4D75B41EE
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Sep 2022 00:01:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230033AbiIIWBF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Sep 2022 18:01:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229751AbiIIWBE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Sep 2022 18:01:04 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3E3C144969;
        Fri,  9 Sep 2022 15:01:03 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id lc7so7229945ejb.0;
        Fri, 09 Sep 2022 15:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date;
        bh=BKCyjdc9y8jyZoNI0vZvSlCBXggxKRCrFRR6O6ctF+w=;
        b=iOMkKAyZEmwtbu4LUS927kV1V1ohVFL8tTMhjnHGf51srGxC3EyXBFcD6yL09+ncjj
         qID+niTIpLJob8iV0ZpTosx/Lzal4h1bYKDwO5KuaKeho+EF6hhtb9T1o8JcysOCc/uI
         nFN01b3iKP6X8eLEWsg4jBzVF8ksHYEOmxX+ochFPe02jgedQZLnjUrssAEBbG6ADase
         SuUohINaiD96DNsEpr05A4i9zSR6E9An+kHuRgE5TuWS7MSJc57ZgscY7ZrwVbqiEpNY
         4U9dgQY/8ywa7hMaLhHTpdQ3OhewmIJG/lrcR2gDWZZ0NM/ASt1mJJOTrAvrIIsHjUHE
         WZzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date;
        bh=BKCyjdc9y8jyZoNI0vZvSlCBXggxKRCrFRR6O6ctF+w=;
        b=Mvr+LFirTPd2uS6wLGknlf8o4PO3lJrgV+wdy/QzsrRdfAJTbvxb6rT5fVedvGMmPD
         eVhL97ECekS+8DKlB5PdmJOGZ5jbml+mZAyud9UIxh2Uvi/Mx07gQJWKcmPeJvfoZZf2
         xIqs26aVahpcV/halK3wt+yIUyvJGvclBanSdKsJK8HMSOn9oiGlDO1P1PL/3boTfhjI
         5K+NogwVK6vi2VXvWz6buhdfDU4MOMuaXCpI1VdIrt2r3Kv5TJGgSKkzRWOrE3gXNApf
         pv0ndem86hqP2UBsLq5iyR1/KpfksKIS7DW6qbD+cONjn8xgHp7Zx8klkK1Y9Walq68O
         urZg==
X-Gm-Message-State: ACgBeo3UIQ2E1AkB2d7BSA8btHpvaQVh4+mOcMcVkIUdKhUMzIiCf+ED
        12jcH8L0JAB7onh8ixByW10=
X-Google-Smtp-Source: AA6agR503tkKhQAd5Imgm4BPLKzov2ax/W4FLtg+tbq9EVWiAyuvxJRq+pRJaeUnfeqG3X9/MdTZ8Q==
X-Received: by 2002:a17:907:6d05:b0:73d:8092:91ea with SMTP id sa5-20020a1709076d0500b0073d809291eamr11258913ejc.280.1662760862538;
        Fri, 09 Sep 2022 15:01:02 -0700 (PDT)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id kx25-20020a170907775900b0073d70df6e56sm797592ejc.138.2022.09.09.15.01.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 15:01:02 -0700 (PDT)
Message-ID: <3ed145c6-f400-ee75-ccac-894b0a0d15d2@gmail.com>
Date:   Sat, 10 Sep 2022 00:01:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
From:   Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1 00/11] Add more Rockchip rk3128 compatible strings
To:     kever.yang@rock-chips.com
Cc:     sjg@chromium.org, philipp.tomsich@vrull.eu, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, heiko@sntech.de,
        ulf.hansson@linaro.org, miquel.raynal@bootlin.com, richard@nod.at,
        vigneshr@ti.com, kishon@ti.com, vkoul@kernel.org,
        thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
        gregkh@linuxfoundation.org, broonie@kernel.org,
        wim@linux-watchdog.org, linux@roeck-us.net,
        zhangqing@rock-chips.com, jamie@jamieiles.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-phy@lists.infradead.org,
        linux-pwm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Mainline U-boot has some support for legacy Rockchip SoC rk3128.
The rk3128.dtsi file is in need for some upgrading.
To verify the nodes more Rockchip rk3128 compatible strings are needed.

Not tested with hardware.
No intent to port drivers or dts files to Linux for now without physical board.
So pure for the bindings. 

https://lore.kernel.org/u-boot/421195e1-472c-f337-e87a-b0b6d520b808@gmail.com/T/#u

Johan Jonker (11):
  dt-bindings: serial: rockchip: add rockchip,rk3128-uart
  dt-bindings: i2c: rockchip: add rockchip,rk3128-i2c
  dt-bindings: pwm: rockchip: add rockchip,rk3128-pwm
  dt-bindings: mmc: rockchip: add rockchip,rk3128-dw-mshc
  dt-bindings: spi: rockchip: add rockchip,rk3128-spi
  dt-bindings: usb: dwc2: rockchip: add rockchip,rk3128-usb
  dt-bindings: watchdog: rockchip: add rockchip,rk3128-wdt
  dt-bindings: arm: rockchip: pmu: add rockchip,rk3128-pmu
  dt-bindings: phy: phy-rockchip-inno-usb2: add rockchip,rk3128-usb2phy
  dt-bindings: soc: rockchip: grf: add rockchip,rk3128-grf
  dt-bindings: mtd: rockchip: add rockchip,rk3128-nfc

 Documentation/devicetree/bindings/arm/rockchip/pmu.yaml       | 2 ++
 Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml           | 1 +
 Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml   | 1 +
 .../devicetree/bindings/mtd/rockchip,nand-controller.yaml     | 4 +++-
 .../devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml       | 1 +
 Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml       | 1 +
 .../devicetree/bindings/serial/snps-dw-apb-uart.yaml          | 1 +
 Documentation/devicetree/bindings/soc/rockchip/grf.yaml       | 2 ++
 Documentation/devicetree/bindings/spi/spi-rockchip.yaml       | 1 +
 Documentation/devicetree/bindings/usb/dwc2.yaml               | 1 +
 Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml   | 1 +
 11 files changed, 15 insertions(+), 1 deletion(-)

-- 
2.20.1

