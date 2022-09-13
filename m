Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E85115B6ED9
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Sep 2022 16:06:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232441AbiIMOGC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Sep 2022 10:06:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232411AbiIMOFy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Sep 2022 10:05:54 -0400
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 038571C127;
        Tue, 13 Sep 2022 07:05:52 -0700 (PDT)
Received: by mail-oo1-f50.google.com with SMTP id w39-20020a4a97aa000000b0044dfa1ddc67so1952747ooi.6;
        Tue, 13 Sep 2022 07:05:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=gUoMuqH8RQNLf6TD5ZgHBTjgUa9ZzQ80Xl0NxTsaRAQ=;
        b=atlBAHFy5pXU5vu/FMKYD5xMcXZAvVe+4JOqgOWDp0mnko8v3jEdh4zxfnyufDdVg4
         fQSsLQu1Ub54q3gePuLMKBsBm+/SxRlNNSMkdFerrY1m6SUOqU08GFGQVxp3oCLX02Z/
         UMz8gTiMyKApaCMQAD+uRgddhIecikQPGw4MtYPIZr1ZLFAfarZMDpnJS9GC/KbSQAFa
         JlufXp8IkqgQ3kWExDBZWP4gymgvbNTMiM9yk9zjmg6UjLbEhBGDTtuRP5VhnY0neV5G
         PmqnkENH9bO5++xzkjZY2bqInAM+fzAOSqrjyvPOo1kKVGD5x0ShyQDF9H2kkooCyJr3
         cPzA==
X-Gm-Message-State: ACgBeo1vsi/waodI0BM1NqWhLqSdFMaZtoD2gPM9cbEy36p3z6V8Ctvl
        TJmUR9tUwJ8z737u2tftLg==
X-Google-Smtp-Source: AA6agR6RrtTNw9L8FzOsi4f1dPwDybzh223SP/qImE6imeHr6gssP4vZDFglDT81BonBYIffpKUqWw==
X-Received: by 2002:a4a:b04e:0:b0:472:912a:63c9 with SMTP id g14-20020a4ab04e000000b00472912a63c9mr8418280oon.87.1663077951213;
        Tue, 13 Sep 2022 07:05:51 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id k6-20020a056870818600b0010d7242b623sm7045343oae.21.2022.09.13.07.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 07:05:50 -0700 (PDT)
Received: (nullmailer pid 3591626 invoked by uid 1000);
        Tue, 13 Sep 2022 14:05:49 -0000
Date:   Tue, 13 Sep 2022 09:05:49 -0500
From:   Rob Herring <robh@kernel.org>
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     philipp.tomsich@vrull.eu, linux-kernel@vger.kernel.org,
        sjg@chromium.org, heiko@sntech.de, thierry.reding@gmail.com,
        vigneshr@ti.com, linux-rockchip@lists.infradead.org,
        linux-mmc@vger.kernel.org, gregkh@linuxfoundation.org,
        linux@roeck-us.net, u.kleine-koenig@pengutronix.de, kishon@ti.com,
        robh+dt@kernel.org, miquel.raynal@bootlin.com, jamie@jamieiles.com,
        wim@linux-watchdog.org, broonie@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, zhangqing@rock-chips.com,
        linux-watchdog@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pwm@vger.kernel.org, vkoul@kernel.org, richard@nod.at,
        linux-mtd@lists.infradead.org, linux-phy@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-usb@vger.kernel.org, ulf.hansson@linaro.org,
        kever.yang@rock-chips.com
Subject: Re: [PATCH v1 01/11] dt-bindings: serial: rockchip: add
 rockchip,rk3128-uart
Message-ID: <20220913140549.GA3591205-robh@kernel.org>
References: <20220909212543.17428-1-jbx6244@gmail.com>
 <4f283231-2ed4-202b-0c23-157bce0841ee@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f283231-2ed4-202b-0c23-157bce0841ee@gmail.com>
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

On Sat, 10 Sep 2022 00:01:28 +0200, Johan Jonker wrote:
> Add rockchip,rk3128-uart compatible string.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
