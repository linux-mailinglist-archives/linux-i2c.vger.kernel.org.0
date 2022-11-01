Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A684614FA6
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Nov 2022 17:47:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230333AbiKAQrG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Nov 2022 12:47:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230378AbiKAQrF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Nov 2022 12:47:05 -0400
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 774551D0E4;
        Tue,  1 Nov 2022 09:47:01 -0700 (PDT)
Received: by mail-oi1-f171.google.com with SMTP id r76so9959654oie.13;
        Tue, 01 Nov 2022 09:47:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fYumMmBO6HjgRvIQAJ2hwPWWmhMFEbaog8ld//Nv0V0=;
        b=BzoM0tb/Sv8eis/M/zszsymk+V+VQOiaqO3JjHtMLtbq5PIz8smoOdY8BCewzruL8m
         Fo0wloSV9SkOd8DLbCdXW3uKuLbpngttJjjNT+XVZwLlhBwFzIAka4L8Hrc/zVFTVS+C
         xcySSWG+Wjh7dGxW0quzDP5Eav1up34fWXbdDGwDwWm1LbJxpX04UwO7HsBX1rVo5kkb
         HuEGjkT6PhuEZ1fBFZDRLvlr3FGmFWOFs6EuQfP4KKRathghkAqShyUoegX9KAgbIGw/
         Ee5k4s6p1iw5aadS0jfw3333OB3lWP3u9PpE5WbkafcIDMtGknPXjvRn06TXMqthh6Al
         WZxg==
X-Gm-Message-State: ACrzQf2uNGpxLJG/B5/bE6z0TQXP/D/tz/pJ//FzpdArFLZ81uiKKiji
        FSzo5mz9k4lapaOKVjxGiw==
X-Google-Smtp-Source: AMsMyM4PbA3HSWKVH6R+0DDedDNrLvhBEJWEHM46hOFjsQBbQycrRMZx30g2P8uNgm3QutFdIsrBpA==
X-Received: by 2002:a05:6808:1717:b0:333:513e:650e with SMTP id bc23-20020a056808171700b00333513e650emr10540693oib.23.1667321220564;
        Tue, 01 Nov 2022 09:47:00 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id i21-20020a9d68d5000000b006619295af60sm3974230oto.70.2022.11.01.09.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 09:47:00 -0700 (PDT)
Received: (nullmailer pid 1510958 invoked by uid 1000);
        Tue, 01 Nov 2022 16:47:01 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Vladimir Zapolskiy <vz@mleia.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        satish.nagireddy@getcruise.com, linux-kernel@vger.kernel.org,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Mark Rutland <mark.rutland@arm.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
In-Reply-To: <20221101132032.1542416-4-tomi.valkeinen@ideasonboard.com>
References: <20221101132032.1542416-1-tomi.valkeinen@ideasonboard.com>
 <20221101132032.1542416-4-tomi.valkeinen@ideasonboard.com>
Message-Id: <166732089051.1505805.10778018710212433201.robh@kernel.org>
Subject: Re: [PATCH v4 3/8] dt-bindings: media: add bindings for TI DS90UB960
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


On Tue, 01 Nov 2022 15:20:27 +0200, Tomi Valkeinen wrote:
> Add DT bindings for TI DS90UB960 FPDLink-3 Deserializer.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  .../bindings/media/i2c/ti,ds90ub960.yaml      | 392 ++++++++++++++++++
>  1 file changed, 392 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.example.dtb:0:0: /example-0/i2c/deser@3d/links/link@0/serializer: failed to match any schema with compatible: ['ti,ds90ub953-q1']
Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.example.dtb:0:0: /example-0/i2c/deser@3d/links/link@0/serializer/i2c/sensor@21: failed to match any schema with compatible: ['sony,imx390']
Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.example.dtb:0:0: /example-0/i2c/deser@3d/links/link@1/serializer: failed to match any schema with compatible: ['ti,ds90ub913a-q1']
Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.example.dtb:0:0: /example-0/i2c/deser@3d/links/link@1/serializer/i2c/sensor@30: failed to match any schema with compatible: ['ovti,ov10635']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

