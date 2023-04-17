Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 692936E4979
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Apr 2023 15:11:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231296AbjDQNLn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Apr 2023 09:11:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230499AbjDQNLa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 17 Apr 2023 09:11:30 -0400
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F6DFBB94;
        Mon, 17 Apr 2023 06:10:51 -0700 (PDT)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-187f76c50dbso1714372fac.10;
        Mon, 17 Apr 2023 06:10:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681737030; x=1684329030;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xtZGasXv9C7Ge2QWI6k5UgJ2d5nkIFCB+5qLTT/nVfk=;
        b=h/Uh5hUEASajduHQd0p1caYizGia0gOSBvzba72bH5cseU++xJpWqZPCupV0AztPzJ
         zzntzVAsj0HetH6HgQthUEfzlH6Q7ehI9W6tLhSwBr2V3syxxRc/bSnWWANESbITbPPZ
         UxPZncqNanFssTj2ZMQ4x+/Wt8kOQNT0VZr3vOM8kLEVDxvGCbZ4RoYv+HMlFhZEZG2r
         FxN7S+Gplz62yh82OZiFaR4rGh3xI6c4VmVdNtuBBJP3eLhRuW+Ttua8mC5uvT0EUcOI
         t2NH2b+PrcxP+vZu6dGuP1idnIY3VY+IisQIXpKITbMPUnTv7j80RcuX3o6u+FMwkTyO
         OxEg==
X-Gm-Message-State: AAQBX9f5APTqc5lJq+Oh/MHAXb60sf2eDNqsxzDEikddZGpfnBjiF+sJ
        I/v+V7HarD8IdD2w2uo9ig==
X-Google-Smtp-Source: AKy350Z3w0CjpBv/bSJS7p2s+vYJva0zzvbCznrDfyKOIBrsleV0opbnMsnYoNw0OJfBleJ+sh2bMw==
X-Received: by 2002:a05:6870:d1c7:b0:187:9c57:90c5 with SMTP id b7-20020a056870d1c700b001879c5790c5mr8732256oac.1.1681737029758;
        Mon, 17 Apr 2023 06:10:29 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id l9-20020a05687014c900b001806f2ac9a6sm4491284oab.47.2023.04.17.06.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 06:10:29 -0700 (PDT)
Received: (nullmailer pid 2588785 invoked by uid 1000);
        Mon, 17 Apr 2023 13:10:27 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Patrick Rudolph <patrick.rudolph@9elements.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Peter Rosin <peda@axentia.se>
In-Reply-To: <20230417104801.808972-2-patrick.rudolph@9elements.com>
References: <20230417104801.808972-1-patrick.rudolph@9elements.com>
 <20230417104801.808972-2-patrick.rudolph@9elements.com>
Message-Id: <168173527787.2535638.15636356972148474152.robh@kernel.org>
Subject: Re: [PATCH v12 1/4] dt-bindings: i2c: Correct interrupt support
Date:   Mon, 17 Apr 2023 08:10:27 -0500
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


On Mon, 17 Apr 2023 12:47:57 +0200, Patrick Rudolph wrote:
> Only some of the PCA954x compatible ICs have interrupt
> capability, but the binding advertises it on all ICs.
> 
> Sync the dt-binding with the driver and only advertise it on:
>  - nxp,pca9542
>  - nxp,pca9543
>  - nxp,pca9544
>  - nxp,pca9545
> 
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> ---
>  .../bindings/i2c/i2c-mux-pca954x.yaml         | 20 ++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml:66:1: [error] duplication of key "allOf" in mapping (key-duplicates)

dtschema/dtc warnings/errors:
make[1]: *** Deleting file 'Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.example.dts'
Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml:66:1: found duplicate key "allOf" with value "[]" (original value: "[]")
make[1]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml:66:1: found duplicate key "allOf" with value "[]" (original value: "[]")
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml: ignoring, error parsing file
make: *** [Makefile:1512: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230417104801.808972-2-patrick.rudolph@9elements.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

