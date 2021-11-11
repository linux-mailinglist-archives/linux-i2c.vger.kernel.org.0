Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08E5E44D8B5
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Nov 2021 15:57:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233676AbhKKPAZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Nov 2021 10:00:25 -0500
Received: from mail-ot1-f54.google.com ([209.85.210.54]:43884 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232565AbhKKPAW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 Nov 2021 10:00:22 -0500
Received: by mail-ot1-f54.google.com with SMTP id h16-20020a9d7990000000b0055c7ae44dd2so9184692otm.10;
        Thu, 11 Nov 2021 06:57:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=64/gMeluDh46xQANFHjT+1DBqKjidRINOKcAP65+XLA=;
        b=4beWPldknEpdN46L+5opDWSb8XNcCrE4sif4pQGQIm8/qR64eRMjR36mzledAJNDJo
         v7ojcDjIBdhpVsQXWUlbgHUyw2kGNzK1mEwDM+6GM3Aw3f2AMM/7Na141qqIJH1U26UW
         9NLPHq6GA3720rEMmZERbeIPGepaX1Nvqam7xOlVDXV+AYrtWe40xhAHVG13rLKVO6Ni
         eVRpkoaQZju5zYiWRtg5ULWd5L3a5U6Pr1fez9kZjcARkI+d2S6k9UO2Ai5jbcxlTlxM
         vlLPdwPGXt/rOvaRhBX2EIjttfy0+q5kI2cJBCIAPZie/8e95xEESf8UXL+biApGXHd9
         IcBg==
X-Gm-Message-State: AOAM532/6vTwTaxRg9ZuPnfAZRY9Xd7HvZpgEFw32hPbZEPG6OmdI7ck
        WpzZd8za7O4gBUWXPM1quw==
X-Google-Smtp-Source: ABdhPJw/R+Mjewhuy/cboJpMNmZlgIh2IRZTJ82ScnNL4x3sE567kKqKxWKBtD27mha3LodQ/D2z+g==
X-Received: by 2002:a05:6830:1dab:: with SMTP id z11mr5974863oti.103.1636642652099;
        Thu, 11 Nov 2021 06:57:32 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id 9sm695269oij.16.2021.11.11.06.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 06:57:31 -0800 (PST)
Received: (nullmailer pid 3774083 invoked by uid 1000);
        Thu, 11 Nov 2021 14:57:26 -0000
From:   Rob Herring <robh@kernel.org>
To:     Fabien Parent <fparent@baylibre.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Qii Wang <qii.wang@mediatek.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-i2c@vger.kernel.org
In-Reply-To: <20211110194959.20611-1-fparent@baylibre.com>
References: <20211110194959.20611-1-fparent@baylibre.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: i2c: i2c-mt65xx: convert doc to yaml schema format
Date:   Thu, 11 Nov 2021 08:57:26 -0600
Message-Id: <1636642646.887422.3774082.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 10 Nov 2021 20:49:56 +0100, Fabien Parent wrote:
> Convert the binding documentation for i2c-mt65xx driver to the
> YAML schema format.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
> 
> v3:
> 	* rebased: added new compatible since last revision + added vbus-supply
> 		description
> 	* added clock-div description
> 
> v2:
> 	* write compatibles in a more compact way
> 	* set the node pattern to be "^i2c@[0-9a-f]+$" instead of
> 		"^i2c[0-9]*@[0-9a-f]+"$
> 
>  .../devicetree/bindings/i2c/i2c-mt65xx.txt    |  51 ---------
>  .../devicetree/bindings/i2c/i2c-mt65xx.yaml   | 106 ++++++++++++++++++
>  2 files changed, 106 insertions(+), 51 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml: properties:vbus-supply: '$ref' is not one of ['description', 'deprecated']
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml: properties:clocks: {'minItems': 2, 'maxItems': 4, 'items': [{'description': 'Controller clock'}, {'description': 'DMA clock'}, {'description': 'ARB clock for multi-master when a bus has more than one i2c controllers'}, {'description': 'PMIC clock. Only when mediatek,have-pmic is set.'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml: properties:clock-names: {'minItems': 2, 'maxItems': 4, 'items': [{'const': 'main'}, {'const': 'dma'}, {'const': 'arb'}, {'const': 'pmic'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml: ignoring, error in schema: properties: vbus-supply
warning: no schema found in file: ./Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
Documentation/devicetree/bindings/i2c/i2c-mt65xx.example.dt.yaml:0:0: /example-0/i2c@1100d000: failed to match any schema with compatible: ['mediatek,mt6577-i2c']

doc reference errors (make refcheckdocs):
Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
MAINTAINERS: Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt

See https://patchwork.ozlabs.org/patch/1553583

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

