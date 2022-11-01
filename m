Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35659614FAD
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Nov 2022 17:47:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231147AbiKAQrM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Nov 2022 12:47:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230429AbiKAQrG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Nov 2022 12:47:06 -0400
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB78F1D0E2;
        Tue,  1 Nov 2022 09:47:04 -0700 (PDT)
Received: by mail-oi1-f178.google.com with SMTP id g10so16488785oif.10;
        Tue, 01 Nov 2022 09:47:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rUcp/AsVKXjzi7CH4N3yh/566vn8MV4w6KLDE9MLwyY=;
        b=Pn4I6iveEJxVVrmP5o6+U/k7mb8dgvywBCMxhw3EAAyTEF6/CBC9qxkJqWY+2IoAjs
         GhuHORC9SBPAZDNrqxG9RQxyLY0QqxGgakLbLQju70OhSJ/rbDWQi542znkMr64cigza
         YDzsPNz2VaoVdsK+0Ic+X+BJobpFs8CkD/iHdzQzX+Irf8J3B87SqUudO87B8nEx7jUy
         t1NkXcT7J/Q7/Y+JjYUbkfNBtEBT231iLxkAGt5kqmnQvQ6QzYU/dOZbonwt3LWgFcJ/
         OnzbPxujqyS7BdwLOgMA5isanG+jr2ZkV/ZHFTfwFI3aJH5G8IJaNB+zRF95SJTg15zZ
         MSOw==
X-Gm-Message-State: ACrzQf2ym5mLCzkPrljyi0wgT71rWBklsiE3eJz4Q2QYlMqDY8qCFI0B
        wPgYYcU7/AEaxtviYUib1Q==
X-Google-Smtp-Source: AMsMyM47HiWLSlaUkjtKB4gprUP62Ly9+7eQ4nSdrH/XTp4stI6jSYYUtwRgMNdyLPa3tDDn53QVuw==
X-Received: by 2002:a05:6808:1188:b0:351:5f92:3c52 with SMTP id j8-20020a056808118800b003515f923c52mr19023088oil.196.1667321224030;
        Tue, 01 Nov 2022 09:47:04 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id a25-20020a056870a19900b0012d6f3d370bsm4676654oaf.55.2022.11.01.09.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 09:47:03 -0700 (PDT)
Received: (nullmailer pid 1510961 invoked by uid 1000);
        Tue, 01 Nov 2022 16:47:01 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Peter Rosin <peda@axentia.se>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org,
        satish.nagireddy@getcruise.com, linux-kernel@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        devicetree@vger.kernel.org, Vladimir Zapolskiy <vz@mleia.com>,
        linux-i2c@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Wolfram Sang <wsa@the-dreams.de>
In-Reply-To: <20221101132032.1542416-5-tomi.valkeinen@ideasonboard.com>
References: <20221101132032.1542416-1-tomi.valkeinen@ideasonboard.com>
 <20221101132032.1542416-5-tomi.valkeinen@ideasonboard.com>
Message-Id: <166732089137.1505855.15948200849406729684.robh@kernel.org>
Subject: Re: [PATCH v4 4/8] dt-bindings: media: add bindings for TI DS90UB913
Date:   Tue, 01 Nov 2022 11:47:01 -0500
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On Tue, 01 Nov 2022 15:20:28 +0200, Tomi Valkeinen wrote:
> Add DT bindings for TI DS90UB913 FPDLink-3 Serializer.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  .../bindings/media/i2c/ti,ds90ub913.yaml      | 127 ++++++++++++++++++
>  1 file changed, 127 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ti,ds90ub913.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/media/i2c/ti,ds90ub913.example.dtb:0:0: /example-0/serializer/i2c/sensor@37: failed to match any schema with compatible: ['ovti,ov10635']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

