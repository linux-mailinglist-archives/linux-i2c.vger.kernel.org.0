Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D3A75B4220
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Sep 2022 00:03:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232042AbiIIWCL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Sep 2022 18:02:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229751AbiIIWBu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Sep 2022 18:01:50 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32C141449C7;
        Fri,  9 Sep 2022 15:01:49 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id lz22so7157464ejb.3;
        Fri, 09 Sep 2022 15:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date;
        bh=qFqPSvBGjdUsVcV5ZS+65QeMy/XEKV7OnAaz6pLKOfw=;
        b=Aq5Txh40RV1S3WvnnQtQzYz5b6rkZkPkiAyjnO9W76im/RXn3A2CAdtcAYKu0saeBm
         64v/qE8X8Gr28VFWaGyrnaU13aylc0AlCIa/ukAeLVpbxe074XQLC9kLGoV77aTfl+CJ
         M9abehot3L1NFJHP3YN6hiUlPZdXzgkLtTIrvTfCqFPBtbHbtuXaiGqBmXAjaf5S0iHT
         FUTDEWefWwxLWd3rRFj7YNuOXV88AEIhmvwwNwJ+tGhJL6ty5kHxYymOVbIZnLHlF2uv
         lyVsuD/BFZVmnEYsIZMQF3+j6XJMo/0NbGfN83pAbkfMGStus+ceoL5jyjbcnddIegbZ
         vr3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=qFqPSvBGjdUsVcV5ZS+65QeMy/XEKV7OnAaz6pLKOfw=;
        b=co5dwoLkXryG185Txyu94R22Qo/v4rCqCT7t682SBK5RZHGyIAnsgEbsMRz5495XC4
         yuXwnkmWZeUAXvMNa8Sydx7FjDOB6/7YULuZy9KMqjTxp3C70FP8sJchXGuAHFKbs+Ym
         02/489ge6rY61we6lzJUAMI1FJMQxWKGz0Uy9ULLFe4z/2ii/qPDUAiF2WkCnzxTdp0E
         g7krDR6SrEhteg3Y6GelnUVVqD2GhAovo3aNSJXphAx02PnTiceS8TaJxSZco97SJhE3
         D6nhcpImA/mruqfrlKE1+XSdF6+7MoshS4mVwvrbim98JRKZo3RK3lbGh/2SCCEDbs7E
         T4iA==
X-Gm-Message-State: ACgBeo1kGBXx+OV/rIR24B3D3VVlAuoBdfAodykZYgRAl+R6xdtIIHHi
        EqwC8Dv6xv3vnlQ67mVZPHU=
X-Google-Smtp-Source: AA6agR6kays4kR8/EPe2OVFsWoVLEdWSsiVS+SIhxyvMVF8om26ABaEGzg1Jko+NH6t0J2E828rBUw==
X-Received: by 2002:a17:907:7242:b0:742:7c5:46b5 with SMTP id ds2-20020a170907724200b0074207c546b5mr11460741ejc.274.1662760907774;
        Fri, 09 Sep 2022 15:01:47 -0700 (PDT)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id 17-20020a170906329100b007742cf42836sm812553ejw.144.2022.09.09.15.01.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 15:01:47 -0700 (PDT)
Message-ID: <d477a077-a68f-e752-5192-807db80a9e68@gmail.com>
Date:   Sat, 10 Sep 2022 00:01:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
From:   Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1 09/11] dt-bindings: phy: phy-rockchip-inno-usb2: add
 rockchip,rk3128-usb2phy
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
References: <20220909212543.17428-1-jbx6244@gmail.com>
Content-Language: en-US
In-Reply-To: <20220909212543.17428-1-jbx6244@gmail.com>
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

Add rockchip,rk3128-usb2phy compatible string.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 .../devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml
index 4b7528973..f71920082 100644
--- a/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     enum:
       - rockchip,px30-usb2phy
+      - rockchip,rk3128-usb2phy
       - rockchip,rk3228-usb2phy
       - rockchip,rk3308-usb2phy
       - rockchip,rk3328-usb2phy
-- 
2.20.1

