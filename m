Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81B684F0A9F
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Apr 2022 17:27:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232531AbiDCP26 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 3 Apr 2022 11:28:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359154AbiDCP25 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 3 Apr 2022 11:28:57 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B54F38BD7
        for <linux-i2c@vger.kernel.org>; Sun,  3 Apr 2022 08:27:03 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id l7-20020a05600c1d0700b0038c99618859so6252558wms.2
        for <linux-i2c@vger.kernel.org>; Sun, 03 Apr 2022 08:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=PFOxZJSIkEuRH7+x+0E7FGzZMvu81a++E+04w4EdYOo=;
        b=mLe1nqkQm/WYDjmgYHzH1IzfEKGbK1xN5PwsgbVBKMBp1HHksMKX75/H3nsXQvyf7P
         kN0TerGSv75TtEEYvCTLz09V/2NoU90j/dKSesSkNNfZTVSTa6aVueIBe0yBwEJtmBJD
         piKKhWpRPhw9PjRK6w+X/yINhjKBK0Pqymkp3FxLe1SKwsLFL7wWY0KTTc9KhQz1gJMe
         Jp/vHm3A2DlN5EGLconoPDU8nzasfLDrSaazxcs1Y5+kHljBxuR80JuUCssK4bLXdebJ
         sAGeD2wK/7qGaJ5kV1YyDVLk8ukOGSGuewKmAFG/iBCVMtvO9ibA/jtMnNBGunuwlQpw
         VWkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=PFOxZJSIkEuRH7+x+0E7FGzZMvu81a++E+04w4EdYOo=;
        b=c6PlqG5WwzC2KGDCFbppAMH1qWHg5A7BKBgXsKX2qOzOKmHoLmA3fw7G0b65g4x30l
         s8n3gSteiQasClZOoUCG+jBReNHTwBPPnkwT4JCoR7qe332biRhQiphoeBFWmCzlqvbN
         GQVonm7dL4I8NSXdW9xZkFQyD0tGChnOUxHPy47W7LRnAAaMcd33hZMGJDDVag1cxLQc
         nULAev6dOhFKxbHxnwwJppRwS8QM85zz6NDpSGTNct/MtIWHV40vcZmDsg4/xUQ3BXn5
         Ah9b8ymj3/lOetWlhl4Z48z2i8HR1h5hrHhARmJpr1275sZUMhvtvk0X1Ek78bbpQVdB
         MgQg==
X-Gm-Message-State: AOAM533zvNtXamHz2lkhlC6rlxwgneAj0gOA4mpAhe7rz0H6Vzo7ONDd
        PY4C4GzE1mACioS1Tt0gvDingQ==
X-Google-Smtp-Source: ABdhPJztd+cseoQHkVMvguQ0dw29taCQ0Lt/J3+7YmYNbllOxEZX5RY+QxuLkxBYOKT1w2v/60agvg==
X-Received: by 2002:a05:600c:2304:b0:38e:4748:d902 with SMTP id 4-20020a05600c230400b0038e4748d902mr14136111wmo.177.1648999621575;
        Sun, 03 Apr 2022 08:27:01 -0700 (PDT)
Received: from [192.168.0.172] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id i15-20020a5d584f000000b00204171ba528sm6876940wrf.109.2022.04.03.08.27.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Apr 2022 08:27:01 -0700 (PDT)
Message-ID: <5ef9de4c-59e0-5652-1755-6ec373c34fff@linaro.org>
Date:   Sun, 3 Apr 2022 17:27:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 7/9] dt-bindings: serial: qcom,msm-uartdm: convert to
 dtschema
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-spi@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Kuldeep Singh <singh.kuldeep87k@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-serial@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
References: <20220402184011.132465-1-krzysztof.kozlowski@linaro.org>
 <20220402184011.132465-8-krzysztof.kozlowski@linaro.org>
 <1648995636.595500.3013369.nullmailer@robh.at.kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1648995636.595500.3013369.nullmailer@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 03/04/2022 16:20, Rob Herring wrote:
> On Sat, 02 Apr 2022 20:40:09 +0200, Krzysztof Kozlowski wrote:
>> Convert the Qualcomm MSM Serial UARTDM bindings to DT Schema.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  .../bindings/serial/qcom,msm-uartdm.txt       |  81 -------------
>>  .../bindings/serial/qcom,msm-uartdm.yaml      | 112 ++++++++++++++++++
>>  2 files changed, 112 insertions(+), 81 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/serial/qcom,msm-uartdm.txt
>>  create mode 100644 Documentation/devicetree/bindings/serial/qcom,msm-uartdm.yaml
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/serial/qcom,msm-uartdm.example.dt.yaml: serial@f991e000: dma-names:0: 'tx' was expected
> 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/serial/qcom,msm-uartdm.yaml
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/serial/qcom,msm-uartdm.example.dt.yaml: serial@f991e000: dma-names:1: 'rx' was expected
> 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/serial/qcom,msm-uartdm.yaml

My bad, I'll fix it.

> 
> doc reference errors (make refcheckdocs):
> Warning: Documentation/devicetree/bindings/soc/qcom/qcom,gsbi.txt references a file that doesn't exist: Documentation/devicetree/bindings/spi/qcom,spi-qup.txt
> Warning: Documentation/devicetree/bindings/soc/qcom/qcom,gsbi.txt references a file that doesn't exist: Documentation/devicetree/bindings/serial/qcom,msm-uartdm.txt
> Documentation/devicetree/bindings/soc/qcom/qcom,gsbi.txt: Documentation/devicetree/bindings/spi/qcom,spi-qup.txt
> Documentation/devicetree/bindings/soc/qcom/qcom,gsbi.txt: Documentation/devicetree/bindings/serial/qcom,msm-uartdm.txt

These should be fixed in last patch in series where I convert the
qcom,gsbi.txt to YAML.

Best regards,
Krzysztof
