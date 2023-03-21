Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2A966C3BAB
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Mar 2023 21:22:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230233AbjCUUV6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Mar 2023 16:21:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230231AbjCUUVy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Mar 2023 16:21:54 -0400
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99620F954;
        Tue, 21 Mar 2023 13:21:07 -0700 (PDT)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-177b78067ffso17439034fac.7;
        Tue, 21 Mar 2023 13:21:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679430046;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tr/mEOP1gdo0kbIX9o5TsA3+wuyEzE6FJfZm+mWcOCU=;
        b=lGL9qFpf1QkcZ9XKAsFhfQNzPxYYnahi7HjqZh6LHz9m73iQHoVB0vfJePWoAEXUV0
         onleX3Wxhs7LkSTivUdFpZsX0rRVNcpRjo+F6o30cmERohby0WrqYRYcSiOOq6SH9IMI
         eOe0opCc2g4DqxhycrKslQsHd8VTsnbxVreu7+0fsTIkEGbu9q9Si4p0t9E819Elwt0B
         6soKAP7S/9nQQS4hAD4e7+57TPume1tEqaiIEmZNtCyC5maBE4pTFe5lPZmfFuz8Hd05
         pjq8b2ynraTMO4X/2o7/EItIxP9Zwxp5A8Pqkxq/x+qHT+73DKwSXxYZCtTbWYrsP4rd
         jiNg==
X-Gm-Message-State: AO0yUKVQ9MmPtkwlV+hSdhMUURtRJvJBEqUNE9pgE92IE/ghbvv4AduR
        EX9gXA1gj5gU0O7KFKLVffy8W3uIAA==
X-Google-Smtp-Source: AK7set+ny0Rr0P23G6ruMJs7scXjUPRL5tb83IAMn90YZgf2owqjpvtOuI0IARblE82e9uM8ITUepQ==
X-Received: by 2002:a05:6870:d20a:b0:177:a9e8:72bf with SMTP id g10-20020a056870d20a00b00177a9e872bfmr187604oac.10.1679430046366;
        Tue, 21 Mar 2023 13:20:46 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id e13-20020a056830200d00b0069dbc293196sm5521607otp.32.2023.03.21.13.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 13:20:46 -0700 (PDT)
Received: (nullmailer pid 1499691 invoked by uid 1000);
        Tue, 21 Mar 2023 20:20:45 -0000
Date:   Tue, 21 Mar 2023 15:20:45 -0500
From:   Rob Herring <robh@kernel.org>
To:     Lars-Peter Clausen <lars@metafoo.de>
Cc:     devicetree@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michal Simek <michal.simek@amd.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: i2c: cadence: Document `fifo-depth`
 property
Message-ID: <167943004465.1499409.2418312435112481551.robh@kernel.org>
References: <20230317145441.156880-1-lars@metafoo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230317145441.156880-1-lars@metafoo.de>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On Fri, 17 Mar 2023 07:54:39 -0700, Lars-Peter Clausen wrote:
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
> Changes since v1:
>  * Remove quotes around "/schemas/types.yaml#/definitions/uint32"
>  * Add `enum` describing valid values
>  * Use `fifo-depth` instead of `cdns,fifo-depth`
>  * Use `bytes` instead of `words` for the property unit
> ---
>  Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

