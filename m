Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F7445B6EF7
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Sep 2022 16:07:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232558AbiIMOHe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Sep 2022 10:07:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232461AbiIMOHJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Sep 2022 10:07:09 -0400
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB91B5AC71;
        Tue, 13 Sep 2022 07:06:47 -0700 (PDT)
Received: by mail-ot1-f43.google.com with SMTP id x23-20020a056830409700b00655c6dace73so5870522ott.11;
        Tue, 13 Sep 2022 07:06:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=zoPmw8JW/Le55KAdfImgxUs7YtJIEgve1VGjOMzTQeo=;
        b=PO4ITECyZRtsc8S4zWSZGrKrvTDsp2S55zEsRTjzvyPiTgEcEF+bs+bYQQsb55Z2i4
         1Gys7KAFEHg81J9V8M4s6ZqhkcpF7EMl4MnMaJFsOqmf6zQtPbo6IZaAqjUeKnMAXEle
         am6lX+77xvgnn4yoGC6ZUfynwAXqr9hGUIwPPBliM2qzjVaB38AkhqMS0DQS3+cW+fPY
         X4/SOEjJHccepaoEx/nWeKL4YSI/Keyzb3ropDNqr+gyZf9CSaY1WvNpWcFWVm6qdQIY
         25gDYq2tBLvUHu4OrDyx77lEPVRIHf0nfxRyDS7I45enlzuIRcWAR2ZvAPKuSSetQyqt
         J4bA==
X-Gm-Message-State: ACgBeo2JTdKkrl77C0xORgFAFLZtGdNWyDaeDIh8XhF9TbA3iC7Zx0Qm
        qQOE5PYK11MELmv3vJ2OMA==
X-Google-Smtp-Source: AA6agR5LFvgkAS1RLpwP+MalfrYVSYShfCYdO8clZgU1WUU4EmFpEH8pJbpxErYAZmbdlxR6vK8NLA==
X-Received: by 2002:a05:6830:91b:b0:655:f7a3:61ba with SMTP id v27-20020a056830091b00b00655f7a361bamr2961087ott.226.1663078006506;
        Tue, 13 Sep 2022 07:06:46 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id o8-20020a9d4048000000b006370c0e5be0sm6155675oti.48.2022.09.13.07.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 07:06:46 -0700 (PDT)
Received: (nullmailer pid 3593540 invoked by uid 1000);
        Tue, 13 Sep 2022 14:06:44 -0000
Date:   Tue, 13 Sep 2022 09:06:44 -0500
From:   Rob Herring <robh@kernel.org>
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     robh+dt@kernel.org, linux-i2c@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-watchdog@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-usb@vger.kernel.org,
        linux-rockchip@lists.infradead.org, jamie@jamieiles.com,
        sjg@chromium.org, wim@linux-watchdog.org, vkoul@kernel.org,
        ulf.hansson@linaro.org, heiko@sntech.de, linux@roeck-us.net,
        thierry.reding@gmail.com, miquel.raynal@bootlin.com,
        philipp.tomsich@vrull.eu, kever.yang@rock-chips.com,
        vigneshr@ti.com, broonie@kernel.org, zhangqing@rock-chips.com,
        devicetree@vger.kernel.org, u.kleine-koenig@pengutronix.de,
        linux-mmc@vger.kernel.org, kishon@ti.com,
        linux-phy@lists.infradead.org, linux-spi@vger.kernel.org,
        gregkh@linuxfoundation.org, linux-serial@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, richard@nod.at,
        linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v1 06/11] dt-bindings: usb: dwc2: rockchip: add
 rockchip,rk3128-usb
Message-ID: <20220913140644.GA3593492-robh@kernel.org>
References: <20220909212543.17428-1-jbx6244@gmail.com>
 <dfb657ab-85e5-ac47-810d-133c7e8dd823@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dfb657ab-85e5-ac47-810d-133c7e8dd823@gmail.com>
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

On Sat, 10 Sep 2022 00:02:01 +0200, Johan Jonker wrote:
> Add rockchip,rk3128-usb compatible string.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  Documentation/devicetree/bindings/usb/dwc2.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
