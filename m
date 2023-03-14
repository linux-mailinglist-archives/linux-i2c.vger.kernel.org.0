Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 356306B9790
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Mar 2023 15:19:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229765AbjCNOTL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Mar 2023 10:19:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229673AbjCNOTJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Mar 2023 10:19:09 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7730E149A0
        for <linux-i2c@vger.kernel.org>; Tue, 14 Mar 2023 07:19:07 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id j11so62700791edq.4
        for <linux-i2c@vger.kernel.org>; Tue, 14 Mar 2023 07:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678803546;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tzwhm0LPrsueJQUzNpmDvfEU1erjGiAua9OJJ0vez5U=;
        b=ry8akAUPiIY8CIFco0HZfHacY9Crzbgwhm363n62QRFryL6jYzwo4m9AW3wfELkm6C
         csHVaHnnOnAdgfbyedV7UpIY3bKxizCdcB2PevlEIAIW+BDwXmUHgNaI9X7EgdLBVzi/
         SlJSw8aEdqp5YWGYIO5XySZ+XTFu5GhwD9Q0D9G2fmcBwkyhqgdQiaXKxV3o0lpkVobI
         aGB4qSPsXDZZvuHyLaQeVqmlf36VZv1c0hXwAQquserj2cKTxA5fZrnEZzXDny40TGiU
         cjhdb/500vPvavqmqLWJvEz1ZJbrQsWi5EI0J7flZ+dxXus51m5GUd2oPVHEou7t7tch
         zNIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678803546;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tzwhm0LPrsueJQUzNpmDvfEU1erjGiAua9OJJ0vez5U=;
        b=i2VZuJg6Z9OSHEZm387VLhmXYpQEAliN9ztESZ0FNsWk3MkbiDaxdR9ZuV2bVKymT9
         QDkJsEJio3rxHVOWROsE5lO82s5CjY9lj/8XsQYolA3UPoD14y/4DFhfMTGpS8yvxgTX
         DyFTG+ehWeqBvXgJ/g2U0f9SBsjK1vh1XtFPDC6LaGfPzJs+pnWp5an7H8u3QL9TaDB4
         FKlkAhYcyH7mFO+kEZFiYfC9KGNFedVDLa65Yt4EC2f4xBUgRj8lVoQwk0SsIQ6x9G9D
         Ij6lqrRabM3FQtNvaaLwiKGfTTKD8OaLAySYTLc3HPYlVnbx0PGlilunfyv+GARzXukw
         HP/g==
X-Gm-Message-State: AO0yUKUdTo4VCwbhoKN3IOINMXRX3yHdQRDxKFbf3SfyaRMsfV8MK73U
        WGZYkiTjdX/UKCi6McT7WsuVDg==
X-Google-Smtp-Source: AK7set8aL4PQ9QF8IDj4skxLN9UJXh6bArs/MRV2sCe1hNkSmXxHrlrmqgg3M0MMY3Rx4aJxHiYqpg==
X-Received: by 2002:a17:906:e093:b0:921:a224:cd15 with SMTP id gh19-20020a170906e09300b00921a224cd15mr2629062ejb.15.1678803545955;
        Tue, 14 Mar 2023 07:19:05 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:59be:4b3f:994b:e78c? ([2a02:810d:15c0:828:59be:4b3f:994b:e78c])
        by smtp.gmail.com with ESMTPSA id lf28-20020a170907175c00b00923221f4062sm1208885ejc.112.2023.03.14.07.19.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 07:19:05 -0700 (PDT)
Message-ID: <8fec16af-c8a9-36b9-ff78-f5dde944c4f0@linaro.org>
Date:   Tue, 14 Mar 2023 15:19:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/3] dt-bindings: i2c: mpc: Mark "fsl,timeout" as
 deprecated
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc:     linux-i2c@vger.kernel.org, Ryan Chen <ryan_chen@aspeedtech.com>,
        Wolfram Sang <wsa@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
References: <20230312233613.303408-1-andi.shyti@kernel.org>
 <20230312233613.303408-2-andi.shyti@kernel.org>
 <167880254331.25515.17901856481962486896.robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <167880254331.25515.17901856481962486896.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 14/03/2023 15:10, Rob Herring wrote:
> 
> On Mon, 13 Mar 2023 00:36:11 +0100, Andi Shyti wrote:
>> Now we have the i2c-scl-clk-low-timeout-ms property defined in
>> the i2c schema.
>>
>> Mark "fsl,timeout" as deprecated and update the example.
>>
>> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
>> ---
>>  Documentation/devicetree/bindings/i2c/i2c-mpc.yaml | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/i2c-mpc.example.dtb: i2c@3100: Unevaluated properties are not allowed ('i2c-scl-clk-low-timeout-ms' was unexpected)

That's expected as it depends on:
https://github.com/devicetree-org/dt-schema/pull/102

Best regards,
Krzysztof

