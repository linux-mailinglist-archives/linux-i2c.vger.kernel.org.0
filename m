Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50BF568C3F9
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Feb 2023 17:58:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230352AbjBFQ6m (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Feb 2023 11:58:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230280AbjBFQ6j (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Feb 2023 11:58:39 -0500
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B37E629419;
        Mon,  6 Feb 2023 08:58:38 -0800 (PST)
Received: by mail-oi1-f180.google.com with SMTP id p185so10290108oif.2;
        Mon, 06 Feb 2023 08:58:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d5HsWLvQOuHFKzGWoHB2eju1CyQHrR5+UaXJ/E9U2eU=;
        b=VCT6O3mYqXZFeIokTsDMwk9q872Bz0pRtvtHiyaw7LEFA+l+G4psyERMpNPm56jK/M
         p5+vEgbdKPOng6kQhgcb//jdSYvIfOMZzrsvkEQ7c0apfAi4vLO2SXWT5898qW3IliXt
         Uv7pF6BKvjAL1n7Xfk+cKAZQPZIa6UGFsH0aY+/v9VmXVXJM48Cpkmd3in/7zMylsJc+
         gIcIv0BvtDBBdUiggT8BDRq3Rt1+S1aQuJRqIP2TaMMbOxLiY0dFhUUN/djpvlPWNsfh
         fWGnwhfaepf/umpCW7C3WGWqsYRq/SRtDS7u8t49soJF7ZILz2V67Lb2cFuBdCBeN7ql
         1HwA==
X-Gm-Message-State: AO0yUKUAEym3DVyNJA+JIO3rXNTRecNsee8Ppphqn676fdNBoiF0Yymq
        yo3NBuHzyg71d/f4Bmz8bg==
X-Google-Smtp-Source: AK7set9nRPAIxHlnzSBT2PS1eSMOfZARnW082uMttgb0GupUOnsY2r4h+qvGUhNDO3WfoyVyRoJ1JA==
X-Received: by 2002:a05:6808:1448:b0:378:5a94:8b22 with SMTP id x8-20020a056808144800b003785a948b22mr12326300oiv.47.1675702717513;
        Mon, 06 Feb 2023 08:58:37 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id b10-20020aca220a000000b0037ac16ea874sm4354964oic.10.2023.02.06.08.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 08:58:37 -0800 (PST)
Received: (nullmailer pid 223060 invoked by uid 1000);
        Mon, 06 Feb 2023 16:58:36 -0000
Date:   Mon, 6 Feb 2023 10:58:36 -0600
From:   Rob Herring <robh@kernel.org>
To:     Lars-Peter Clausen <lars@metafoo.de>
Cc:     Wolfram Sang <wsa@kernel.org>, Michal Simek <michal.simek@amd.com>,
        Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: i2c: cadence: Document
 `cdns,fifo-depth` property
Message-ID: <20230206165836.GA216424-robh@kernel.org>
References: <20230205230208.58355-1-lars@metafoo.de>
 <20230205230208.58355-2-lars@metafoo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230205230208.58355-2-lars@metafoo.de>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Feb 05, 2023 at 03:02:08PM -0800, Lars-Peter Clausen wrote:
> The depth of the FIFO of the Cadence I2C controller IP is a synthesis
> configuration parameter. Different instances of the IP can have different
> values. For correct operation software needs to be aware of the size of the
> FIFO.
> 
> Add the documentation for the devicetree property that describes the FIFO
> depth of the IP core.
> 
> The default value of 16 is for backwards compatibility reasons with
> existing hardware descriptions where this property is not specified and
> software has assumed that the FIFO depth is 16.
> 
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> ---
>  Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml b/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
> index 2e95cda7262a..3daa2fa73257 100644
> --- a/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
> +++ b/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
> @@ -38,6 +38,12 @@ properties:
>      description: |
>        Input clock name.
>  
> +  cdns,fifo-depth:

We already have:

fifo-size
rx-fifo-size
tx-fifo-size
fifo-depth
tx-fifo-depth
rx-fifo-depth

And we have cdns,fifo-depth too (among other vendor specific ones), but 
pick a non-vendor specific one.


> +    description:
> +      Size of the data FIFO in words.

What's the word size? Use bytes.

> +    $ref: "/schemas/types.yaml#/definitions/uint32"
> +    default: 16
> +
>  required:
>    - compatible
>    - reg
> @@ -57,4 +63,6 @@ examples:
>          clock-frequency = <400000>;
>          #address-cells = <1>;
>          #size-cells = <0>;
> +
> +        cdns,fifo-depth = <8>;
>      };
> -- 
> 2.30.2
> 
