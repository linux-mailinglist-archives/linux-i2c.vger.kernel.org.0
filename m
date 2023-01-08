Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D05B661A4A
	for <lists+linux-i2c@lfdr.de>; Sun,  8 Jan 2023 23:02:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233409AbjAHWCB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 8 Jan 2023 17:02:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231410AbjAHWBb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 8 Jan 2023 17:01:31 -0500
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86997DFB6;
        Sun,  8 Jan 2023 14:01:30 -0800 (PST)
Received: by mail-qt1-f176.google.com with SMTP id v14so6577297qtq.3;
        Sun, 08 Jan 2023 14:01:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tqvkg+sv6uRRogNZ+vALt28IuW9OZ+Dw5Ea/2cbdCrM=;
        b=kRppF5io3Vm493Ib2882zSWV9u2yDH/lZ8Jt37B1hAJnTyptcVU3sjBMj/F04hZqTw
         uoS3xwgwnODV3msGtpH+Cakic96k80vpyNvvNOtYOSb0oJ20A7GaYvFLcNzYXSbj5FC9
         dTM/AA26xwDIWfUvfnc5qakHFkOei221WyIawyJEdmyvap+utpwFX1lT1oAfQDmQqu4K
         rawfqJDuzcMsV88ysQEcZ0b9RIyYs5ic39lGi2gTTKiRFZcFsEW93kExUx3rpif/Xs+d
         Fg1sQQI1pX8hpihf9sp+pcqmoThh0us5VtCxx2GtLgj93ulZ32ASS3dnpLXwJUGYn4X7
         iY1Q==
X-Gm-Message-State: AFqh2krrMG4TCz1ZNKI0rDpRIxNMqWMFB8rwwwJAstdjCNQ7/+Dr0uj6
        s5NKf0mAGieHj6+vhFOpVg==
X-Google-Smtp-Source: AMrXdXssWVIkNhWI3KyO4Hgm/UiCqGRkmY9NOyHK5Nu3I/UZWQ9ZJyq3F5UOKdWBGal2v67GNFFU8Q==
X-Received: by 2002:ac8:5401:0:b0:3ac:aef8:bcaa with SMTP id b1-20020ac85401000000b003acaef8bcaamr3661547qtq.18.1673215289669;
        Sun, 08 Jan 2023 14:01:29 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:80a5:9b51:39ae:24d1:33f3:811e])
        by smtp.gmail.com with ESMTPSA id b3-20020ac86bc3000000b003ab7aee56a0sm3718441qtt.39.2023.01.08.14.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 14:01:29 -0800 (PST)
Received: (nullmailer pid 338823 invoked by uid 1000);
        Sun, 08 Jan 2023 22:01:24 -0000
Date:   Sun, 8 Jan 2023 16:01:24 -0600
From:   Rob Herring <robh@kernel.org>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Marek Vasut <marex@denx.de>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Mark Brown <broonie@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>,
        linux-media@vger.kernel.org,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Tu <shawnx.tu@intel.com>,
        Mike Pagano <mpagano@gentoo.org>
Subject: Re: [PATCH v6 3/8] dt-bindings: media: add TI DS90UB913 FPD-Link III
 Serializer
Message-ID: <167321528352.338760.2086491919796597688.robh@kernel.org>
References: <20230105140307.272052-1-tomi.valkeinen@ideasonboard.com>
 <20230105140307.272052-4-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230105140307.272052-4-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On Thu, 05 Jan 2023 16:03:02 +0200, Tomi Valkeinen wrote:
> Add DT bindings for TI DS90UB913 FPD-Link III Serializer.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  .../bindings/media/i2c/ti,ds90ub913.yaml      | 133 ++++++++++++++++++
>  1 file changed, 133 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ti,ds90ub913.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
