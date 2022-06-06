Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CC5353EB37
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jun 2022 19:09:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237819AbiFFMx7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Jun 2022 08:53:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237817AbiFFMx6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Jun 2022 08:53:58 -0400
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAA1024F33;
        Mon,  6 Jun 2022 05:53:56 -0700 (PDT)
Received: by mail-io1-f44.google.com with SMTP id q76so6856487iod.8;
        Mon, 06 Jun 2022 05:53:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=17BV3B6L8cFXi6P8k2mlHJRfIyCAzA1j0HpV6C5Sgr4=;
        b=vIvlJg37tWzFFdtJSLmdsXs8JFoZF0vAF/3CayyMQpRqKEJP9m4yxKH9F2pGibscg8
         X40GTqSNl6AA3RC2/LmL3ugxzBM++vNg/AJYhmtVWM18QICo5nA7j5noLJC+z5lq7lef
         FBw8ZbnptIXM9illUiNNR3SyQSL/WEUccvFjHaqrqHrjLMguwIe09c1R4a77AKt8k6JB
         ePV5gWG2zQQlnCx18E6tHKjt2xSIk8UY7Y5CwRjJU/n3TL8X8WM1zOU9rB5rlfmj25pQ
         +m+tSFaXZHQwxzFmze2ZeVhAr5ie3QJIc3xKci4s7Bps4ypFM5Xkzt0Lq4fnssEqtFbw
         vPqA==
X-Gm-Message-State: AOAM533/BgjQ2hZ7qMwODxt2nlXLqlTAG8T1kXs96xXGFTLxVoqxP0Jf
        pjW57aZJvuytRzvzJKMeVw==
X-Google-Smtp-Source: ABdhPJzYHZC19S1AhARuV7jAx+W2Vt0Gp0lgn2/qiWTc/bIBDcXHU3jjuO1kj7hyLyBz9izNeyariw==
X-Received: by 2002:a5d:9a13:0:b0:668:94ba:46ab with SMTP id s19-20020a5d9a13000000b0066894ba46abmr10727628iol.155.1654520035880;
        Mon, 06 Jun 2022 05:53:55 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id z5-20020a056e02088500b002d1883dc283sm6234342ils.78.2022.06.06.05.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 05:53:55 -0700 (PDT)
Received: (nullmailer pid 534470 invoked by uid 1000);
        Mon, 06 Jun 2022 12:53:53 -0000
From:   Rob Herring <robh@kernel.org>
To:     mail@conchuod.ie
Cc:     Steve Twiss <stwiss.opensource@diasemi.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        linux-riscv@lists.infradead.org, Andrew Lunn <andrew@lunn.ch>,
        linux-i2c@vger.kernel.org,
        Support Opensource <support.opensource@diasemi.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        devicetree@vger.kernel.org,
        Conor Dooley <conor.dooley@microchip.com>,
        Atul Khare <atulkhare@rivosinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
In-Reply-To: <20220605133300.376161-3-mail@conchuod.ie>
References: <20220605133300.376161-1-mail@conchuod.ie> <20220605133300.376161-3-mail@conchuod.ie>
Subject: Re: [PATCH v1 2/6] dt-bindings: i2c: convert ocores binding to yaml
Date:   Mon, 06 Jun 2022 07:53:53 -0500
Message-Id: <1654520033.511603.534469.nullmailer@robh.at.kernel.org>
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

On Sun, 05 Jun 2022 14:32:57 +0100, mail@conchuod.ie wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Convert the open cores i2c controller binding from text to yaml.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../devicetree/bindings/i2c/i2c-ocores.txt    |  78 -----------
>  .../devicetree/bindings/i2c/i2c-ocores.yaml   | 132 ++++++++++++++++++
>  2 files changed, 132 insertions(+), 78 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-ocores.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-ocores.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/i2c/i2c-ocores.example.dtb:0:0: /example-0/i2c@a0000000/dummy@60: failed to match any schema with compatible: ['dummy']
Documentation/devicetree/bindings/i2c/i2c-ocores.example.dtb:0:0: /example-0/i2c@b0000000/dummy@60: failed to match any schema with compatible: ['dummy']

doc reference errors (make refcheckdocs):
Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/i2c/i2c-ocores.txt
MAINTAINERS: Documentation/devicetree/bindings/i2c/i2c-ocores.txt

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

