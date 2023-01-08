Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFE8A661A4F
	for <lists+linux-i2c@lfdr.de>; Sun,  8 Jan 2023 23:04:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233036AbjAHWEK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 8 Jan 2023 17:04:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234280AbjAHWEG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 8 Jan 2023 17:04:06 -0500
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC4AADFB6;
        Sun,  8 Jan 2023 14:04:05 -0800 (PST)
Received: by mail-qt1-f182.google.com with SMTP id a16so6481863qtw.10;
        Sun, 08 Jan 2023 14:04:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=smqVhBr4nX6YYx3MjyPWcwtdavnXwnQDL87iFXCE9Ww=;
        b=F1t0MoA04J5G38OvskvjxzPJD2lz/CORwIMmhPv0Hr/joGytGRocebCkWqZO0D5R9y
         eDzBSlvTIsfrFcoXKToD5myYGcJEkYLNV0bY8jzsH0jtc7cAWpWYH+kZeuRcsLatkZmi
         doKZ+FXh63TBeJrjIA2WgBZ2MLZJGMEB/Ni+JvSzPfw9jkG9JKqCbhLHnYp37eQJij9s
         +TU15AVzQSjVdnPQ8Fz3Aw3GOKyEneCeMPidjnYr70HyEE7uh2DXyuwPsa579n25XStC
         n2fm+Mzw2S0LLdQ769GHZaAr2f44mAjPBVbYAy0sbld7WrWLFH/9Sb/PxM6XeVxgvpWC
         RGcw==
X-Gm-Message-State: AFqh2kpLNm9k3IYta1ybOpJKoa+l9rsHa4wqz/3shxxxH/8gZ4wZPkwD
        jrTflYln1oGRfwRKjpBm5Q==
X-Google-Smtp-Source: AMrXdXs+JUGxh8nZuc8LmC5/3p1Vo/axLoxvWGuJFwFUL1dvvOM5hmtfzWKeJ+EcwlaO2dBC5ee6BA==
X-Received: by 2002:a05:622a:418b:b0:3a8:2f65:6ccb with SMTP id cd11-20020a05622a418b00b003a82f656ccbmr74733334qtb.65.1673215444977;
        Sun, 08 Jan 2023 14:04:04 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:80a5:9b51:39ae:24d1:33f3:811e])
        by smtp.gmail.com with ESMTPSA id f1-20020ac81341000000b003a6a19ee4f0sm3698555qtj.33.2023.01.08.14.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 14:04:04 -0800 (PST)
Received: (nullmailer pid 341683 invoked by uid 1000);
        Sun, 08 Jan 2023 22:04:00 -0000
Date:   Sun, 8 Jan 2023 16:04:00 -0600
From:   Rob Herring <robh@kernel.org>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Shawn Tu <shawnx.tu@intel.com>, Marek Vasut <marex@denx.de>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Mike Pagano <mpagano@gentoo.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Peter Rosin <peda@axentia.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: Re: [PATCH v6 4/8] dt-bindings: media: add TI DS90UB953 FPD-Link III
 Serializer
Message-ID: <167321543969.341610.2316098067478436643.robh@kernel.org>
References: <20230105140307.272052-1-tomi.valkeinen@ideasonboard.com>
 <20230105140307.272052-5-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230105140307.272052-5-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On Thu, 05 Jan 2023 16:03:03 +0200, Tomi Valkeinen wrote:
> Add DT bindings for TI DS90UB953 FPD-Link III Serializer.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  .../bindings/media/i2c/ti,ds90ub953.yaml      | 134 ++++++++++++++++++
>  1 file changed, 134 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
