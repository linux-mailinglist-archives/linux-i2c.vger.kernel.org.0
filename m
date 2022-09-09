Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE8265B4245
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Sep 2022 00:03:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232168AbiIIWCN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Sep 2022 18:02:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232078AbiIIWCB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Sep 2022 18:02:01 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0E44144807;
        Fri,  9 Sep 2022 15:01:59 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id y17so2054035ejo.6;
        Fri, 09 Sep 2022 15:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date;
        bh=dJgP6ROM7fy18qXnDj4sYxfn6j3cBSDbu87Uzoh/mPs=;
        b=kzsAPKknk5rN0rZqP+/kkZT9XwPez/aS/y5XL0nwcYk+/BI211OTBLPuemprjBz6qp
         V2BIkYbqgTAQKjlW2yqwtaLrzr0K+JvWHOD5vfT25lgDqBxHZnoMmLc+IMg20UwMgmHB
         nzxPUY43D4VDSFlSIhufRNZ2edGGboiSrqKyYJLROoXNcctNcL4ycSb57S57/dXrJF5j
         aOL9hFb0VPuVn3EQ8LayVCDxFhtR9LNi6NlUOIQ6t/IpJk1+iM0m61pYtGpgrwenGvPX
         E30QG30rPWpxoBdCymkQMWKy2AMI3+UdbKuKEmt223Xv+01zv25LJmdvXqm18+QuILh7
         Lp5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=dJgP6ROM7fy18qXnDj4sYxfn6j3cBSDbu87Uzoh/mPs=;
        b=X17jQvEko9mvThYQd3JBeCZ2pfDmGTyj0afACx6ZoZ0pOOMsB1/V0G9V1TD2IU1t6p
         nW/kVRuQqvSNrCB92HaNXYePECymxd/9WXzS0SAWUTonhBvYhRJZpwzgPF2D/Z7UbwNB
         ateoFx4vr2X5FkNMqD5JP/o45QD2dJskT4pAyKVITBuTwI2Apq0MkpVIIHmRq0oc42kQ
         +o9e8LrI22LYp1Chqyto1JSw/XX/lKwe1dL/ed14HFXhjhPS+mPt7alKR/Dbqus0Udp/
         4ToiB2Zg9llTqJ4KexgwFNugNsmzsN352MRIWpzbZiO4QNC8UI8ETkRx5EQDnVrcmY3/
         /djQ==
X-Gm-Message-State: ACgBeo3TXFs/7vgOE/qKXv/hUQzp7NB9LidYoyO/LFRzzgZXKV3vjbSn
        Rlm1FN8Ssq6ls6QVSJZL5Kw=
X-Google-Smtp-Source: AA6agR7uYAXXWiQFLUOqvuZJBRDWcRoJN/vf/0M+mARnp2SlRABjXV8skeF25VKomorxrgW9DhSQ0Q==
X-Received: by 2002:a17:907:c08:b0:77a:9b71:222f with SMTP id ga8-20020a1709070c0800b0077a9b71222fmr1545881ejc.739.1662760918453;
        Fri, 09 Sep 2022 15:01:58 -0700 (PDT)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id ka5-20020a170907920500b0073c5192cba6sm787243ejb.114.2022.09.09.15.01.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 15:01:58 -0700 (PDT)
Message-ID: <a4da79fe-3449-6538-742f-790835ffe43a@gmail.com>
Date:   Sat, 10 Sep 2022 00:01:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
From:   Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1 07/11] dt-bindings: watchdog: rockchip: add
 rockchip,rk3128-wdt
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

Add rockchip,rk3128-wdt compatible string.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
index 6461eb4f4..92df6e453 100644
--- a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
@@ -20,6 +20,7 @@ properties:
           - enum:
               - rockchip,px30-wdt
               - rockchip,rk3066-wdt
+              - rockchip,rk3128-wdt
               - rockchip,rk3188-wdt
               - rockchip,rk3228-wdt
               - rockchip,rk3288-wdt
-- 
2.20.1

