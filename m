Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B0EC5B4227
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Sep 2022 00:03:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232075AbiIIWCB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Sep 2022 18:02:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232130AbiIIWBs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Sep 2022 18:01:48 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 810C01451DB;
        Fri,  9 Sep 2022 15:01:42 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id nc14so7167084ejc.4;
        Fri, 09 Sep 2022 15:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date;
        bh=/Iy585fR3X6UvC3KDzJ3yTvDIvdDJpLP2lUgFyTemrQ=;
        b=SObLg3/vIipr/q+a7GFlW/5snMqk+u7gFyCIEYk1QhzSHWzvRy+8ZXztMfCpQg8JSm
         24inwyaHPI9Yb1t63xDhrnbjMEcQAVeyUZ1WApa/r8rvPzOTZ6diu0S3y9Ihs1LMK8Ug
         LdxtiRdDozexZneI5mFLycdvXR0sTIuqW/05aXwfvCIBdGO4RbcEp/LDrXdq83ETso6n
         hyhuV+Y19Xpvulk3D6Q9nDhto/1lXn8OgEFwTvMo0KvGk3IemELvnXIlFu7bwzU+Rpbc
         V1XUgHKOeuPuozwh/frmFeIDkq6bFmNCtm6LBitqZKKeb696g/3AiLkOnq4PTD26EyHy
         q15w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=/Iy585fR3X6UvC3KDzJ3yTvDIvdDJpLP2lUgFyTemrQ=;
        b=XtkhqomWam18uI8RgoL3wFboQzPp3bDea2r8W9o8txyLcWlZ8uT5aHqXuHvhbBVqmj
         diG/5p463/ta3WoNFGmSTGv6uG2h7ujvg5Z5+YPIu0+HeydaV0ipfKskMQg6c55IFxLD
         Bs028yqleabKUft83Lo+69VpfMA74NwCAZyT85L4PAsbLg5Ls0O8R9cKecCs8MO2Li/8
         OPoEns0FtyPm3u83V9C54e8zlWY021n//3nOb//kU7obkF5AIXSma+h4hFfUjPI0DO9F
         1jXuxJDD4+HFCh+SlDrbp+gPa3OumrOS6IJyhprLxpNUDGCHK+Nqy3cji2nRdLuJ9LzN
         3B2A==
X-Gm-Message-State: ACgBeo1s+W1YcHHSpvBIgNej1NzR7S6QpZWoRz+/NWRpynVSAQWE36yI
        +aS1DXGgDSotSQ8ngqJEu7g=
X-Google-Smtp-Source: AA6agR5P9E5vqAGDDOsYqL8PtNRRaRQx2Dg4tkI6iIxekx/dkEqXrSPGKyrP3NMOo3ogKmfDUT2kDQ==
X-Received: by 2002:a17:906:4fc4:b0:73d:d4e9:2d6e with SMTP id i4-20020a1709064fc400b0073dd4e92d6emr11327995ejw.165.1662760901076;
        Fri, 09 Sep 2022 15:01:41 -0700 (PDT)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id a18-20020a170906275200b0073dd0b0ba67sm776683ejd.200.2022.09.09.15.01.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 15:01:40 -0700 (PDT)
Message-ID: <fddc23ff-0c87-4998-1bdf-4dbfa4c74046@gmail.com>
Date:   Sat, 10 Sep 2022 00:01:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
From:   Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1 10/11] dt-bindings: soc: rockchip: grf: add
 rockchip,rk3128-grf
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

Add rockchip,rk3128-grf compatible string.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
index 75a2b8bb2..08d705ab4 100644
--- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
@@ -28,6 +28,7 @@ properties:
               - rockchip,px30-usb2phy-grf
               - rockchip,rk3036-grf
               - rockchip,rk3066-grf
+              - rockchip,rk3128-grf
               - rockchip,rk3188-grf
               - rockchip,rk3228-grf
               - rockchip,rk3288-grf
@@ -178,6 +179,7 @@ allOf:
           contains:
             enum:
               - rockchip,px30-usb2phy-grf
+              - rockchip,rk3128-grf
               - rockchip,rk3228-grf
               - rockchip,rk3308-usb2phy-grf
               - rockchip,rk3328-usb2phy-grf
-- 
2.20.1

