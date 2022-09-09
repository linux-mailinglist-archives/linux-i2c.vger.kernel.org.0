Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE6645B4251
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Sep 2022 00:05:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230423AbiIIWED (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Sep 2022 18:04:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232361AbiIIWCl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Sep 2022 18:02:41 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BC4C14A51B;
        Fri,  9 Sep 2022 15:02:34 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id gh9so7131603ejc.8;
        Fri, 09 Sep 2022 15:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date;
        bh=5wDSQei0VH/0N0cIYpX+WvxREvgCAsAfy7LHoQVjBlQ=;
        b=pzeyCMXPWtw5W3TzsjGLnySXo8soVYUYeJ9xFygN5yMcAFfkmo68Mn5NVSDaAqvEef
         eMfcgrKdofMIrb0NkC9c/9Vds5bjV3ktzlLzWstteZoyzJiblmObGx9yNFJOzwAvY7lO
         1KY9hKyA68Qr0+/E5uvCFdh+SbIOxQgl4kCdLO3bEGLkkfQGP9D/Q9zv03tqjXBbFmW/
         wQA877zU19eUftI9o02PkytlYbM/sujtsOJ3kUS0dJ/fdCEs1YH93ga6tw2Zt32RLYLH
         dvfsrtjWpLuPSgMAfQYmTNPST7qelX0TgYFbw5w+81Sytx+Gi4mwLwH/2plVR4zEjN9H
         7bkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=5wDSQei0VH/0N0cIYpX+WvxREvgCAsAfy7LHoQVjBlQ=;
        b=F3HCG7L//kgoDJrzYe+NHXevX4FMYr/mOfckkY9UiMdW75Jt75KEJfaEWla9QBXWEt
         8KV4xU7H1cLDSPDaGPB4IOo/ecTZ+MUkHKo5wvrWld4UykUNo5gT7J6J+8AEwqwozzyf
         Nw6KJmiTcotPujdcucTvvi0y+bA4mRoOCJtzBQERRXMGlZywYDYGHpg0k6Zfj5e/P58A
         HueLAjnXzhhsjp7F5LV+7VeCjiLqTL5gKnkmdlnAWS/WJGVsu9YGx3TaL+akcp/iro8a
         Pu/ytwsBSg9CICSq4/qpDDcLGSIYYSWzyFdOVkc2hiRIkEZTc+4g1VVNNRWZMJvazQdp
         2MGw==
X-Gm-Message-State: ACgBeo1/aaw/tDvawkIN+gg+jIv09L3TnbJFxV3lwP4+XMZIGiqjgbdT
        pM9e3hRr9puUuEiHXrpLoZI=
X-Google-Smtp-Source: AA6agR5i2KdDv0Rikxka5ZmZqz4fP9NU9rl0imXOMXzTXa+EpchEAZGLS2pB1pzRZUktqmDJgOVSoQ==
X-Received: by 2002:a17:907:3d8e:b0:741:8ebe:3464 with SMTP id he14-20020a1709073d8e00b007418ebe3464mr11326966ejc.747.1662760952366;
        Fri, 09 Sep 2022 15:02:32 -0700 (PDT)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id x17-20020a1709065ad100b0073d87068042sm804845ejs.110.2022.09.09.15.02.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 15:02:32 -0700 (PDT)
Message-ID: <405db21d-154e-fed0-7524-ace1cef0203c@gmail.com>
Date:   Sat, 10 Sep 2022 00:02:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
From:   Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1 02/11] dt-bindings: i2c: rockchip: add rockchip,rk3128-i2c
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

Add rockchip,rk3128-i2c compatible string.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
index ee9f8b91d..82b9d6682 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
@@ -29,6 +29,7 @@ properties:
       - items:
           - enum:
               - rockchip,rk3036-i2c
+              - rockchip,rk3128-i2c
               - rockchip,rk3368-i2c
           - const: rockchip,rk3288-i2c
       - items:
-- 
2.20.1

