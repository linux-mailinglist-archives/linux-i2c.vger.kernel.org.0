Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A59BB1CE2AA
	for <lists+linux-i2c@lfdr.de>; Mon, 11 May 2020 20:27:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731175AbgEKS1i (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 May 2020 14:27:38 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:44625 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729772AbgEKS1h (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 May 2020 14:27:37 -0400
Received: by mail-ot1-f67.google.com with SMTP id j4so8345490otr.11;
        Mon, 11 May 2020 11:27:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8XrifLV0oFLLyLn6BjacaXHOgkoMzKo1Zf9sFmdQHNs=;
        b=G60V4HPihHQCP5D/9xCTwgJrRKG8R/57MdgMZOcVIwObqbi6ROz+5gXSf7gINf/3A3
         orGsLBOxigH5QEpMMBcwboxroHURQU4SoZ19t6KUoAa/ot+n78DYV7dpGTJIq/ubSfjd
         YM2ooaMFqyX0d2zoyO4isBgq9J7YAy9Zc6wiwlsU0MbjYwX4fMgQD8fh74Osr282uKNR
         yvtCvdBIi4ZVBMsdmur8p7JbhNLtrxuYDVamjkd7J8IKQ2YQtdeiL9JxliA/HtN+TZhs
         sGPW22qITz7sFqHGvcnVxau1qNC5KRU/tfJZUpfAURT/+IVPOfHs9GLCj/Y3troImh1O
         oSAw==
X-Gm-Message-State: AGi0PuZmfpy+032aeRoH13wmhP17E7Eat9Xpx0oXS7J33OFZWwHoGrWJ
        54r/oAi7S529GnBBdVXcKw==
X-Google-Smtp-Source: APiQypIEDiszqremOLj3ZVCWNAGbs747WHBAa7K2a7Gvw2bUX1jdvt5C7wSdJKYiwrOZmAnZ6GAWZg==
X-Received: by 2002:a9d:2264:: with SMTP id o91mr13983559ota.258.1589221656049;
        Mon, 11 May 2020 11:27:36 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j186sm4802742oia.31.2020.05.11.11.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 11:27:35 -0700 (PDT)
Received: (nullmailer pid 19748 invoked by uid 1000);
        Mon, 11 May 2020 16:09:49 -0000
Date:   Mon, 11 May 2020 11:09:49 -0500
From:   Rob Herring <robh@kernel.org>
To:     Tali Perry <tali.perry1@gmail.com>
Cc:     tmaimon77@gmail.com, devicetree@vger.kernel.org,
        robh+dt@kernel.org, benjaminfair@google.com, kfting@nuvoton.com,
        openbmc@lists.ozlabs.org, andriy.shevchenko@linux.intel.com,
        wsa@the-dreams.de, avifishman70@gmail.com, venture@google.com,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-i2c@vger.kernel.org, brendanhiggins@google.com,
        yuenn@google.com, ofery@google.com
Subject: Re: [PATCH v10 1/3] dt-bindings: i2c: npcm7xx: add NPCM I2C
 controller
Message-ID: <20200511160949.GA19364@bogus>
References: <20200510102330.66715-1-tali.perry1@gmail.com>
 <20200510102330.66715-2-tali.perry1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200510102330.66715-2-tali.perry1@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, 10 May 2020 13:23:28 +0300, Tali Perry wrote:
> Added device tree binding documentation for Nuvoton BMC
> NPCM I2C controller.
> 
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> ---
>  .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml     | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml: properties:compatible: [{'const': 'nuvoton,npcm7xx-i2c'}] is not of type 'object', 'boolean'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml: properties:clock-frequency:enum: False schema does not allow [100000, 400000, 1000000]
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml: properties:clocks: {'maxItems': 1, 'items': [{'description': 'Reference clock for the I2C bus'}]} is not valid under any of the given schemas (Possible causes of the failure):
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml: properties:clocks: 'maxItems' is not one of ['type', 'description', 'dependencies', 'properties', 'patternProperties', 'additionalProperties', 'unevaluatedProperties', 'deprecated', 'required', 'allOf', 'anyOf', 'oneOf', '$ref']

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml: properties:clock-frequency: 'maxItems' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'default', '$ref']
Documentation/devicetree/bindings/Makefile:12: recipe for target 'Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.example.dts' failed
make[1]: *** [Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml: ignoring, error in schema: properties: compatible
warning: no schema found in file: ./Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml: ignoring, error in schema: properties: compatible
warning: no schema found in file: ./Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
Makefile:1300: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1287083

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

