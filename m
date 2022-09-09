Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E598B5B4217
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Sep 2022 00:03:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230384AbiIIWBy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Sep 2022 18:01:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232117AbiIIWBm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Sep 2022 18:01:42 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAB539F1AD;
        Fri,  9 Sep 2022 15:01:32 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id z97so4495985ede.8;
        Fri, 09 Sep 2022 15:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date;
        bh=NmRnkF/b4urbMwNGs+O/IXW2teRNRXDeqTuXV1ih1+E=;
        b=T913G/OwVTc6zJHTucTLdGC3/1L6OaWQQgTlxwoLmdOWRj+HhCfMwgTVNdXXMjeQ99
         3bbHk2ooY+VF8lYwPmn/40Nnpz66YekmDkprhbv9+s81ol8lziIHWgVCUPMuRw32KVDF
         EdNcdgFMuOLVne5hmxU10uHbTtDjnxZ1mQ270druo+8KBMZRGvQ8T3f9Yz+EU/deG8uP
         ZJ1j+UZg2VsDMDP1DreWF0aCxBSefgK9lpeYIgJePdnv03fufzR5bHG8kMW0hM+W6OBh
         6+hu+kI1jlITROO5mwRYXtWc38GxgtXNmK7jggQbBThXkOK9mqtEgB6pEzByudNtTuzc
         eBeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=NmRnkF/b4urbMwNGs+O/IXW2teRNRXDeqTuXV1ih1+E=;
        b=H8SHh35+XBCW0cdhgMmwSUxEvGGaDjJ90ZiohbtwmCWbP+Ph3xnwQqSPMA2OD11SMv
         NvbHklbfl5FFe94xirGEJtU83FqY4EwExcLKBPMwwo2gv9JdWzzFRSvYea0L5yiKye+z
         ORS0FiAMh8hIfqFElJudA6XdITsovdAdrKJpCuZB4uRS54aNT5CQw5M1N/d5kZyaojvd
         LID0j1WqwoiJwHSfeVJ/CsFaiOT8H3tRkIc5wAsvV+uilDpejpgIzBaJpwsD/YW4p/4y
         kRbYMk8z26CHTvfdx8e6qMlFQ4YiQSwMSEawhCbCv7cRvaCmhnpfo4Qw0gW1q2ceqlJ0
         758Q==
X-Gm-Message-State: ACgBeo0mXtDu7ll1ekZgbxf0f2S7xMXFKoXpiZ4Ieoqd/Pbjub9ER24+
        ZQshrs5q6Kl+udEbIKNZ9PQ=
X-Google-Smtp-Source: AA6agR74AD/MIEsTUlaY2NmRHF+g7QaChAq+nYds+c0GE5UUrhGZiF/SHGbNr3Ib4ayILOCg5oaFxQ==
X-Received: by 2002:a05:6402:5409:b0:44f:1e05:1e8 with SMTP id ev9-20020a056402540900b0044f1e0501e8mr11804087edb.373.1662760890827;
        Fri, 09 Sep 2022 15:01:30 -0700 (PDT)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id f10-20020a170906048a00b0073d83f80b05sm804688eja.94.2022.09.09.15.01.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 15:01:30 -0700 (PDT)
Message-ID: <4f283231-2ed4-202b-0c23-157bce0841ee@gmail.com>
Date:   Sat, 10 Sep 2022 00:01:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
From:   Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1 01/11] dt-bindings: serial: rockchip: add
 rockchip,rk3128-uart
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

Add rockchip,rk3128-uart compatible string.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index dc74643ae..b9c2287c5 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -26,6 +26,7 @@ properties:
               - rockchip,rk1808-uart
               - rockchip,rk3036-uart
               - rockchip,rk3066-uart
+              - rockchip,rk3128-uart
               - rockchip,rk3188-uart
               - rockchip,rk3288-uart
               - rockchip,rk3308-uart
-- 
2.20.1

