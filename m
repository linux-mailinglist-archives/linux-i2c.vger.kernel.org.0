Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC7F84B76A3
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Feb 2022 21:49:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243807AbiBOTtk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Feb 2022 14:49:40 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243805AbiBOTte (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Feb 2022 14:49:34 -0500
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCDC366AD3;
        Tue, 15 Feb 2022 11:49:23 -0800 (PST)
Received: by mail-io1-f52.google.com with SMTP id i62so25308454ioa.1;
        Tue, 15 Feb 2022 11:49:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=OERlIHIb6ddcezTHhRkNJ0kzSHHK7RS652vYEofOceg=;
        b=IWceMVm04uqMoNohzExRep+g4j2+xz5o4gXFsrTP9kbbXFxpzV+1w3qxrOdX/V77PD
         xivjHcEMCDa49pWEGDgFvB1PBUVZI6cXLZaGPcdfed1lFun6v6S+Yl81gwxpEFSBqUYT
         Q/QjWICUY9zFnPSX3J9Y/+VceJssmv12K5qPEhsaLzWLdJgdLxDo+nnEBEXlYh2+PPl0
         PalskocXMHIGmg5Ut371R17xW0EQdEC726Wz42Wh4LYj3GAPXjoshDWabfli0zyjacZ7
         r2SZ5/xrtrzic1Go90ttUErt+ENweuXcu55VWgLd0YezlzqsSmvcGF1DKt5+3SFgtNsp
         f36g==
X-Gm-Message-State: AOAM5339qEWcq39c+Nk/YZjYS2E5sWv45C6ObaaoUsxDSWZXtcVRU86J
        uJ2463jV+wlf6/pS8lfwhkMW+C98PA==
X-Google-Smtp-Source: ABdhPJyyTThxHQBY7Gwwd6kXiv65mjh+/XyPt67kwPmTGSVCZsScbFtMiRMoIHT3LxW+YnJZ3pKewg==
X-Received: by 2002:a05:6638:40a8:: with SMTP id m40mr298313jam.213.1644954563186;
        Tue, 15 Feb 2022 11:49:23 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id y3sm9439335iov.29.2022.02.15.11.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 11:49:22 -0800 (PST)
Received: (nullmailer pid 3813675 invoked by uid 1000);
        Tue, 15 Feb 2022 19:49:18 -0000
From:   Rob Herring <robh@kernel.org>
To:     Patrick Rudolph <patrick.rudolph@9elements.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
In-Reply-To: <20220214103116.68472-2-patrick.rudolph@9elements.com>
References: <20220214103116.68472-1-patrick.rudolph@9elements.com> <20220214103116.68472-2-patrick.rudolph@9elements.com>
Subject: Re: [v5 1/3] dt-bindings: i2c: Add Maxim MAX735x/MAX736x variants
Date:   Tue, 15 Feb 2022 13:49:18 -0600
Message-Id: <1644954558.103393.3813674.nullmailer@robh.at.kernel.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 14 Feb 2022 11:31:14 +0100, Patrick Rudolph wrote:
> Update the pca954x bindings to add support for the Maxim MAX735x/MAX736x
> chips. The functionality will be provided by the exisintg pca954x driver.
> 
> While on it make the interrupts support conditionally as not all of the
> existing chips have interrupts.
> 
> For chips that are powered off by default add an optional regulator
> called vdd-supply.
> 
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> ---
>  .../bindings/i2c/i2c-mux-pca954x.yaml         | 44 ++++++++++++++-----
>  1 file changed, 34 insertions(+), 10 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml: allOf:1:then:properties:interrupts: 'maxitems' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'type', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml: ignoring, error in schema: allOf: 1: then: properties: interrupts
Documentation/devicetree/bindings/i2c/i2c-mux.example.dt.yaml:0:0: /example-0/i2c/i2c-mux@70: failed to match any schema with compatible: ['nxp,pca9548']
Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.example.dt.yaml:0:0: /example-0/i2c/i2c-mux@74: failed to match any schema with compatible: ['nxp,pca9548']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1592439

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

