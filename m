Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47B7B5B6EED
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Sep 2022 16:07:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232577AbiIMOGw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Sep 2022 10:06:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232532AbiIMOGe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Sep 2022 10:06:34 -0400
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 729F259270;
        Tue, 13 Sep 2022 07:06:26 -0700 (PDT)
Received: by mail-ot1-f54.google.com with SMTP id v2-20020a056830090200b006397457afecso8129800ott.13;
        Tue, 13 Sep 2022 07:06:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=XwWk5SoJuKv1MY6V80vnF8Lyms9Ev4e9+aisy0cJdGI=;
        b=ZLzJiFLC1STgyfRQgZyaRFzYSZHY87KW6/gvpvUjEj2nUln8r6HpuR6pk9vuZfCtg5
         uukOboIkUxZk/ZU6dY3C2m/eDyCKvQshjnavsBjMev0T+AdIeg1UXL7vziO+wLDapGKq
         ZxZXliPqMCVN/+o02Ux20IUNSyDdGjVPeUGjyRepHSuVtrYjxGhs+m1XJFUyMuZ4IysE
         x5eVRZoH2Jf04Sa+rnZP1nz6uEGDCdaJod+aygP3VIdLVkC2b8kI/t1apu3gDQyyeAtT
         veC8FEEdtg8GyNqQ0eFEtQnOP/nx3dr2mY3GJ4fOySySYKaCtLO4scsMkWRCZFnU8Vjx
         OLXA==
X-Gm-Message-State: ACgBeo0Jr2c0Yg+KZqyT3OlrcnmDuid9KJfKleOVyRGfuvNPHIi3ZtCb
        GkasbpM+QXWBP4NkeGGIvw==
X-Google-Smtp-Source: AA6agR5SWl6Oj+EGjpBSFta1Oh0daG7E4brT6mZmxxChyVqbTbfzFGLGAKFSANHqFwdD6yPA4tgYRw==
X-Received: by 2002:a9d:d89:0:b0:654:fc7e:f4ec with SMTP id 9-20020a9d0d89000000b00654fc7ef4ecmr8772019ots.49.1663077985195;
        Tue, 13 Sep 2022 07:06:25 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id x88-20020a9d20e1000000b00637032a39a3sm5891387ota.6.2022.09.13.07.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 07:06:24 -0700 (PDT)
Received: (nullmailer pid 3592810 invoked by uid 1000);
        Tue, 13 Sep 2022 14:06:23 -0000
Date:   Tue, 13 Sep 2022 09:06:23 -0500
From:   Rob Herring <robh@kernel.org>
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     linux-usb@vger.kernel.org, miquel.raynal@bootlin.com,
        wim@linux-watchdog.org, linux-phy@lists.infradead.org,
        robh+dt@kernel.org, linux@roeck-us.net, linux-pwm@vger.kernel.org,
        linux-rockchip@lists.infradead.org, richard@nod.at,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, vkoul@kernel.org, vigneshr@ti.com,
        u.kleine-koenig@pengutronix.de,
        linux-arm-kernel@lists.infradead.org, heiko@sntech.de,
        sjg@chromium.org, linux-kernel@vger.kernel.org, broonie@kernel.org,
        ulf.hansson@linaro.org, philipp.tomsich@vrull.eu, kishon@ti.com,
        jamie@jamieiles.com, linux-i2c@vger.kernel.org,
        zhangqing@rock-chips.com, thierry.reding@gmail.com,
        kever.yang@rock-chips.com, gregkh@linuxfoundation.org,
        linux-watchdog@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v1 08/11] dt-bindings: arm: rockchip: pmu: add
 rockchip,rk3128-pmu
Message-ID: <20220913140623.GA3592754-robh@kernel.org>
References: <20220909212543.17428-1-jbx6244@gmail.com>
 <faf2b30e-1a1a-0dc1-04ce-f40e5d758718@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <faf2b30e-1a1a-0dc1-04ce-f40e5d758718@gmail.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, 10 Sep 2022 00:01:52 +0200, Johan Jonker wrote:
> Add rockchip,rk3128-pmu compatible string.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip/pmu.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
