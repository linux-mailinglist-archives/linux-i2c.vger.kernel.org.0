Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DF1E4AB15E
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Feb 2022 19:46:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241954AbiBFSqs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Feb 2022 13:46:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232836AbiBFSqs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Feb 2022 13:46:48 -0500
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48FB1C06173B;
        Sun,  6 Feb 2022 10:46:47 -0800 (PST)
Received: by mail-oo1-f52.google.com with SMTP id v17-20020a4ac911000000b002eac41bb3f4so11293843ooq.10;
        Sun, 06 Feb 2022 10:46:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=FNvvSF/XGKK6zmkaAdsGDR7wXk1nrQ8gxJ4ArdT4S0s=;
        b=C4G7iv5rJSPp7zCZs+10PDBvLco60oyHERmALmswQlB/+4c8HqscsHNKc0HR4cDr9J
         GyXckvshD+qnyhHHMQIFUiT6sdgTuJCj4vb//JydQP2Jzb7sxa38jq1y8XQZQ25KbGHR
         e0a+lYKLX+GNJhbKqh53CzWVIl+W/9Nlzc0XTE5XiozQUxi5dIXirs7CLr6BAymQPgQ8
         T+nXCjpYWyc2xAG7He1emmDjRPkrXSBEyc8C+1XycOqux6L4S0xFgw4N/vaTbF8nk2Uy
         x6vPA1iR+iTK4XPpt9BIdsRpjs2ZH06/k7/XjtEaXOBOTJOW3Ta5tCARSQjVtv/hdDu4
         rVwA==
X-Gm-Message-State: AOAM5334b26qUTTUAukSwaDeSCK0kEQDaK81jViXqP+LLGNeTygU+nVt
        SoVPngZuuHnfU0nHRtpO2w==
X-Google-Smtp-Source: ABdhPJyygVn+coOiAAa9SX41FonfloJDi8YPPOaW3QvJEzjcIz4SXPLYTfAFsXCfBZinTyUjb0xxfQ==
X-Received: by 2002:a05:6870:76ae:: with SMTP id dx46mr2598733oab.17.1644173206566;
        Sun, 06 Feb 2022 10:46:46 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id m7sm3129558ots.32.2022.02.06.10.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Feb 2022 10:46:45 -0800 (PST)
Received: (nullmailer pid 2818867 invoked by uid 1000);
        Sun, 06 Feb 2022 18:46:44 -0000
From:   Rob Herring <robh@kernel.org>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     matti.vaittinen@fi.rohmeurope.com,
        Jacopo Mondi <jacopo@jmondi.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Peter Rosin <peda@axentia.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-i2c@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>
In-Reply-To: <20220206115939.3091265-5-luca@lucaceresoli.net>
References: <20220206115939.3091265-1-luca@lucaceresoli.net> <20220206115939.3091265-5-luca@lucaceresoli.net>
Subject: Re: [RFCv3 4/6] media: dt-bindings: add DS90UB954-Q1 video deserializer
Date:   Sun, 06 Feb 2022 12:46:44 -0600
Message-Id: <1644173204.724898.2818866.nullmailer@robh.at.kernel.org>
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

On Sun, 06 Feb 2022 12:59:37 +0100, Luca Ceresoli wrote:
> Describe the Texas Instruments DS90UB954-Q1, a 2-input MIPI CSI-2 video
> deserializer with I2C Address Translator and remote GPIOs.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> 
> ---
> 
> Changes RFCv2 -> RFCv3:
> 
>  - rewrite in yaml
>  - use new layout based on remote-chips under the main deser node
>  - new clock configuration based on common clock framework
> 
> Changes RFCv1 -> RFCv2:
> 
>  - add explicit aliases for the FPD-link RX ports (optional)
>  - add proper remote GPIO description
> ---
>  .../bindings/media/i2c/ti,ds90ub954-q1.yaml   | 235 ++++++++++++++++++
>  MAINTAINERS                                   |   6 +
>  2 files changed, 241 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ti,ds90ub954-q1.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/i2c/ti,ds90ub954-q1.yaml: properties:reg-names: {'description': 'Names of I2C address used to communicate with the chip, must match\nthe "reg" values; mandatory if there are 2 or more addresses.\n"main" is the main I2C address, used to access shared registers.\n"rxport0" and "rxport1" are the I2C alias to access FPD-link RX\nport specific registers; must not be used by other slaves on the\nsame bus. "ser0" and "ser1" are the I2C alias to access the remote\nserializer connected on each FPD-link RX port; must not be used by\nother slaves on the same bus.\n', 'minItems': 1, 'maxItems': 5, 'items': [{'const': 'main'}, {'const': 'rxport0'}, {'const': 'rxport1'}, {'const': 'ser0'}, {'const': 'ser1'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/i2c/ti,ds90ub954-q1.yaml: ignoring, error in schema: properties: reg-names
Documentation/devicetree/bindings/media/i2c/ti,ds90ub954-q1.example.dt.yaml:0:0: /example-0/i2c@0/deser@3d: failed to match any schema with compatible: ['ti,ds90ub954-q1']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1588972

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

