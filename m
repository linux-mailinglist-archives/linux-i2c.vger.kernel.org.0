Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B2FD5B421B
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Sep 2022 00:03:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230280AbiIIWCq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Sep 2022 18:02:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232209AbiIIWCR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Sep 2022 18:02:17 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CF5B148B50;
        Fri,  9 Sep 2022 15:02:12 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id r18so7106884eja.11;
        Fri, 09 Sep 2022 15:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date;
        bh=84IeXs7nTrhn2LPjfnNsoXr0C5Os+SqTZDjnVNhpIt8=;
        b=f9B4QIN9JsapOYlcnM2DFoO6Pti4hR6siI8xX3lgGGSC0KtLXVcrucJ9+EKx6R7rr8
         fhxc45Hj+QSyINyLkc9/ylw3a0Tq6TrDFHsXCNfUsnI3V0PIQhmKMXZjBrybrOOvgF+C
         iGamfzYZ5I2n7bGh1gJP7B1Kxsvkc8zrjcidUi7e697c82noA7Qos/kMr9HKoD/emT8f
         G87feDf2ZrXP4IlJgJriY4ni+H5V8PasGm2MyAJ7LZkbwISLTmJ4vj/uRI1n10KfZae9
         GhlSPqCm8AfdVzAr8HHhnidLL7hbxdAnmv0XPQrFqbQaUVamxuGjx0c96z0m3CWunsqs
         zvPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=84IeXs7nTrhn2LPjfnNsoXr0C5Os+SqTZDjnVNhpIt8=;
        b=XgmMsaK0qp1Z2B/y3BuR4WawO6OlFPldEaJtDknxQX1kuM/HV2gfSZo5ZQjilU0sik
         CHAKa0P6WUFSDRlDSkbNPd6DtAqeaaoZrc/90/5QTJOFnoF2UHK+tFa6Et6kHD7dvb6A
         y5bos4RSUk6IpHS41FnGhPaKHqyKPjEpxIZmbdYUMNdjQ66nBXiruPOg547f7NzPS2yR
         8yw9+MLQY+0Lfr9cLUZPjzz+5eHRqp2THKTWskErJrj8wiG5Ekc7A1kL2zq6Wo8WYRPB
         K3BCA1y6ryVOz3L0R1bsBqb3RCScEIghM1y//rMX5PwkadenQnhS7h2NTh3x2wit7dsA
         drQw==
X-Gm-Message-State: ACgBeo0lVUyiK1CGeyMySA2qS09qmU+99VCUAcWCkxhL1uK2TKRiScXC
        sEwPy0TIcW/pK4ZSMxIJoBs=
X-Google-Smtp-Source: AA6agR6QJDpctQ7oGxmXZ3T0dXBhchTVyDBgORO5ngJq8sbHWtn/5k7WNrJOnVADlIvqVEPKsumCRA==
X-Received: by 2002:a17:906:5d0e:b0:742:7a6:a1c3 with SMTP id g14-20020a1709065d0e00b0074207a6a1c3mr10861826ejt.732.1662760929935;
        Fri, 09 Sep 2022 15:02:09 -0700 (PDT)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id k16-20020a170906681000b0072b13ac9ca3sm778129ejr.183.2022.09.09.15.02.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 15:02:09 -0700 (PDT)
Message-ID: <c05fb9a3-ebf7-adec-e8ca-bd137d157f50@gmail.com>
Date:   Sat, 10 Sep 2022 00:02:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
From:   Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1 05/11] dt-bindings: spi: rockchip: add rockchip,rk3128-spi
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

Add rockchip,rk3128-spi compatible string.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 Documentation/devicetree/bindings/spi/spi-rockchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/spi-rockchip.yaml b/Documentation/devicetree/bindings/spi/spi-rockchip.yaml
index 21f2de785..52768894b 100644
--- a/Documentation/devicetree/bindings/spi/spi-rockchip.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-rockchip.yaml
@@ -27,6 +27,7 @@ properties:
       - items:
           - enum:
               - rockchip,px30-spi
+              - rockchip,rk3128-spi
               - rockchip,rk3188-spi
               - rockchip,rk3288-spi
               - rockchip,rk3308-spi
-- 
2.20.1

