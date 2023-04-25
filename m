Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAE346EE7EC
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Apr 2023 20:59:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234965AbjDYS7U (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Apr 2023 14:59:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234488AbjDYS7T (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Apr 2023 14:59:19 -0400
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D290C16F3D;
        Tue, 25 Apr 2023 11:59:15 -0700 (PDT)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6a5f7341850so4951527a34.2;
        Tue, 25 Apr 2023 11:59:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682449155; x=1685041155;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LaaEFcFebGPV3hach/dJKlwiRfFDPwrlFKEHi8nlBFk=;
        b=eJtGFWs53L0pcNTmzQNGLzm869nhyHETyBZoNgbFR5TGWESjYbpIBZ6fL7//8TTf3J
         r2hsO3S4J0kP4wV1EduYDh4FXvEEWElQtR6iXAGi0RMioTlogK77fJ+sJQISchqCM/+W
         Km2aUl+PJaaeQHjT2izFmHerUGPY9Y+QKTKO8ZGv3nxVOMebrT1c4trrrJd156DKyTtp
         7kOGwkgH1af7vKbg1da2duYGAgVgeb6axFicg0S6M3kDPR76ZFYBR6Tu4G/rsg1ly2zY
         l8Hd7DaxKgd7GP1Rc9Hwo4CGdLrVnuZnJ4/pj/viG0WzRWAUpSOVWd80U8WEm8v/FTOT
         qI+w==
X-Gm-Message-State: AAQBX9cV8aTkSjqkeqM9CPXQDAh9QQu6ohc7cRXS3/vRufHOTU73ZA0S
        KRNUTKN6nLU1bWB1aO/SQQ==
X-Google-Smtp-Source: AKy350btMvEteniArc68zN6tLE59uuQYNqbU/qiTh2s58asn9CBEj6Vnmv2nzWBlTvvoTxI11bNeVQ==
X-Received: by 2002:a05:6830:1bc9:b0:6a6:1a39:2631 with SMTP id v9-20020a0568301bc900b006a61a392631mr9138512ota.15.1682449155017;
        Tue, 25 Apr 2023 11:59:15 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id d5-20020a9d4f05000000b006a5db4474c8sm6034648otl.33.2023.04.25.11.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 11:59:14 -0700 (PDT)
Received: (nullmailer pid 2084720 invoked by uid 1000);
        Tue, 25 Apr 2023 18:59:13 -0000
Date:   Tue, 25 Apr 2023 13:59:13 -0500
From:   Rob Herring <robh@kernel.org>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Satish Nagireddy <satish.nagireddy@getcruise.com>
Subject: Re: [PATCH v12 1/8] dt-bindings: i2c: Add I2C Address Translator
 (ATR)
Message-ID: <20230425185913.GA2084119-robh@kernel.org>
References: <20230425072601.51031-1-tomi.valkeinen@ideasonboard.com>
 <20230425072601.51031-2-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230425072601.51031-2-tomi.valkeinen@ideasonboard.com>
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

On Tue, Apr 25, 2023 at 10:25:54AM +0300, Tomi Valkeinen wrote:
> Add bindings for I2C Address Translator. Only one property is added,
> 'i2c-alias-pool', which can be used in the bindings for the device that
> supports ATR.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Acked-by: Wolfram Sang <wsa@kernel.org>
> ---
>  .../devicetree/bindings/i2c/i2c-atr.yaml      | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-atr.yaml

I commented on v11.
