Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6665614FA8
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Nov 2022 17:47:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230514AbiKAQrH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Nov 2022 12:47:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229667AbiKAQrG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Nov 2022 12:47:06 -0400
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A6F81D0DB;
        Tue,  1 Nov 2022 09:47:03 -0700 (PDT)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-1322d768ba7so17422838fac.5;
        Tue, 01 Nov 2022 09:47:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BIzuXcKS3sONSW7JFOeh1pwymKLeB0GlLn3bzPnuM0I=;
        b=fyAZZY2jc2A7GZcE4GU4zNgTICLZnpG3rNL9VqhoEtN5TtCRnXK5pvekafciMDA/i1
         HhxmpfRPY+h5cFhIoGH9aYs7Tl13+MeubP1q5hdxQyslWqRUGm8lFgHHd/q3tk0lypxS
         dFia3WhRdjWtbG9JkohGPBYzChbLhdsS8wR/9ToVwYK0nSZMdwxYHmiDScbCY120dWlM
         jDjpgSTSyrjE8kT67V7LXJoSLbrF6jmTXIrIk5O1YVv9jJ8h5Yx4PFP/Foa2SGu0j8FY
         SDvUhAM4ZhcEhI+TGxukBJluU3q2NaDkyrgE7VHudD2USXc4/5k4k56UYmYcKWaM1hqr
         Q4Jg==
X-Gm-Message-State: ACrzQf17XfAMsnUwy/4aeOpXiataAMs+Ed+Kle09X696es/Cd04t2zb6
        uKzsRCqu5Iz8NSwtQgmlmQ==
X-Google-Smtp-Source: AMsMyM7lp8EsCJqeliXvjW+t2J/m4oa+gFo7oJ+bKlLl9jU9B3EANpcpP0nRvpefrNYj8bANdFgTOQ==
X-Received: by 2002:a05:6870:538a:b0:132:756f:2c98 with SMTP id h10-20020a056870538a00b00132756f2c98mr21402710oan.134.1667321222337;
        Tue, 01 Nov 2022 09:47:02 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id x1-20020a4ad041000000b004956ee06cadsm3563259oor.43.2022.11.01.09.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 09:47:01 -0700 (PDT)
Received: (nullmailer pid 1510963 invoked by uid 1000);
        Tue, 01 Nov 2022 16:47:01 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     satish.nagireddy@getcruise.com,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Rob Herring <robh+dt@kernel.org>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>, devicetree@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>, linux-i2c@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20221101132032.1542416-6-tomi.valkeinen@ideasonboard.com>
References: <20221101132032.1542416-1-tomi.valkeinen@ideasonboard.com>
 <20221101132032.1542416-6-tomi.valkeinen@ideasonboard.com>
Message-Id: <166732089221.1505888.7237744166599431286.robh@kernel.org>
Subject: Re: [PATCH v4 5/8] dt-bindings: media: add bindings for TI DS90UB953
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


On Tue, 01 Nov 2022 15:20:29 +0200, Tomi Valkeinen wrote:
> Add DT bindings for TI DS90UB953 FPDLink-3 Serializer.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  .../bindings/media/i2c/ti,ds90ub953.yaml      | 120 ++++++++++++++++++
>  1 file changed, 120 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.example.dtb:0:0: /example-0/serializer/i2c/sensor@21: failed to match any schema with compatible: ['sony,imx390']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

