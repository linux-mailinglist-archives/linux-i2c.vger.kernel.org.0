Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35A9755F32F
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Jun 2022 04:10:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230517AbiF2CJz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Jun 2022 22:09:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230494AbiF2CJy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Jun 2022 22:09:54 -0400
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05FD82F035;
        Tue, 28 Jun 2022 19:09:52 -0700 (PDT)
Received: by mail-il1-f169.google.com with SMTP id p14so9388890ile.1;
        Tue, 28 Jun 2022 19:09:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=KRTT6Azh9uxqOFNuSyZW507CLCYjuVxnJ4RN/7AtHio=;
        b=49f/e4pzqHX5s25pRq6HKRfoYO+hbA2T45feRHFVoX+2meOHsu3io0dIUk9ONukLcT
         S2u2Xgywx4lBuWe6LIfoT77EguWT55WN1N5jOYXtr+XLZihyVsITljEMzESAMa55OjsM
         XDhJsXRpZLygWyMa0BBoqmEYPHhoQiWGmeht49BFGmY76mu3cLZrONFUBejxIi5THzA/
         UhF7MIHC55xnvs3Mk70ZtvNd1WjdYaIw8e9/wGseqzBWuRXxQCzXKpJgy6uamIMhUQkY
         Vin0XtORKBr01m7n8huwulrhAjTDMlHWYJD0nJR5FF8QkVXcXheoVFuj5N4kYV5R9QrG
         LqGw==
X-Gm-Message-State: AJIora/cSUHhvYpjbOeUzE8pz8J0WZWvQbQri5y6qS+iob2u+mo+G0sZ
        a/rh1g5yAIwszbwW0AZKlpgCMPBIbA==
X-Google-Smtp-Source: AGRyM1vm/3awWZKf90R45i7ajA8U/kHl44mlIm8F1PM0xFI/hAAsHVC/ESKDGC20/Lctak5l6wnN8A==
X-Received: by 2002:a05:6e02:10cf:b0:2d9:2310:e6b3 with SMTP id s15-20020a056e0210cf00b002d92310e6b3mr596558ilj.212.1656468591269;
        Tue, 28 Jun 2022 19:09:51 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id m9-20020a02cdc9000000b00331fdc68ccesm6573548jap.140.2022.06.28.19.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 19:09:50 -0700 (PDT)
Received: (nullmailer pid 1403682 invoked by uid 1000);
        Wed, 29 Jun 2022 02:09:39 -0000
From:   Rob Herring <robh@kernel.org>
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org
In-Reply-To: <20220628194526.111501-2-phil.edworthy@renesas.com>
References: <20220628194526.111501-1-phil.edworthy@renesas.com> <20220628194526.111501-2-phil.edworthy@renesas.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: Document RZ/V2M I2C controller
Date:   Tue, 28 Jun 2022 20:09:39 -0600
Message-Id: <1656468579.925440.1403681.nullmailer@robh.at.kernel.org>
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

On Tue, 28 Jun 2022 20:45:25 +0100, Phil Edworthy wrote:
> Document Renesas RZ/V2M (r9a09g011) I2C controller bindings.
> 
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2:
>  - Use an enum and set the default for clock-frequency
>  - Add resets property
> ---
>  .../bindings/i2c/renesas,rzv2m.yaml           | 80 +++++++++++++++++++
>  1 file changed, 80 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/renesas,rzv2m.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/temperature/adi,ltc2983.yaml: patternProperties:^thermistor@:properties:adi,excitation-current-nanoamp: '$ref' should not be valid under {'const': '$ref'}
	hint: Standard unit suffix properties don't need a type $ref
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/temperature/adi,ltc2983.yaml: ignoring, error in schema: patternProperties: ^thermistor@: properties: adi,excitation-current-nanoamp
Documentation/devicetree/bindings/iio/temperature/adi,ltc2983.example.dtb:0:0: /example-0/spi/ltc2983@0: failed to match any schema with compatible: ['adi,ltc2983']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

