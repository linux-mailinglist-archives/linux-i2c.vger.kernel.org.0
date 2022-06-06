Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C80C53E38C
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jun 2022 10:56:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230464AbiFFH07 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Jun 2022 03:26:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230448AbiFFH05 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Jun 2022 03:26:57 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93C9C12D1E6
        for <linux-i2c@vger.kernel.org>; Mon,  6 Jun 2022 00:26:53 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id q21so27224674ejm.1
        for <linux-i2c@vger.kernel.org>; Mon, 06 Jun 2022 00:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=doPwBdHFWD14a2kAbTYFYO985iNgcJ4U7efAsJ68WJg=;
        b=e9Eet/rubQ1dAldMT20UZNWIystnpXrq8GRJof9k8RTdLUW/jUD1HGfhgGnHs8wFb6
         6igYDyujxRcRJlFuCntlt6LFyW90aNpU5MgTf2jUnPhMUXCvNEB7vjGPA060WmEVc2ZG
         RFCMMx0G5Jtbm5wiY4pevkJ0S0Vw27VLsB5eEt8hmtHuin/eRDB1K9qxhrqlTwWw8JQ6
         kqWStISJcQYsPBm4bx0ziF6Xtmx5/g5h7E3PzbwH6r9zYyWBoEH1TrozbZ4YOiiC3+K2
         gluHBMjK50vEvuW8nrFl9OTgbx07KXDG/UKG44iHxftwXkGAL+KvHW5fKdaPsKMTb1kY
         mRzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=doPwBdHFWD14a2kAbTYFYO985iNgcJ4U7efAsJ68WJg=;
        b=0/vwA0ksjlzLC6BldPM1copy+Ei1C57W/lP1hs3XGwlrNFaYImk9x1v0V9wI9KM/cn
         s/GD+qQI6Qi/L10f2rIKESJLNGxua4BVH4IilkfTDdgzN3KdKASLyZ+sfdHlU8JfUYvf
         ApP+4I3GIA2ZBRsZARf5Urr57cunmaZ+IPrMPNRhN9ld3iLOmHyO3IcepdXQh2IYMoFQ
         AuJc9F3Je8EUFYlRRxPt2IIBMBjlMyekqqg0wDnHin+VQXctBoNCMNUiKRXA2Si4Thky
         1D4qTTl945u06u2jwBjhmuvyUW56Nf2RMLOjyCwMrRaBKjt0zzOkTQxQBILFfTWngcYm
         hDXg==
X-Gm-Message-State: AOAM531HqauznEUWAvDctSNv7gec6MNxcqnGwxtXRDdPq+8xNrpf5TNn
        NrdHo6Z05Tkgib6s6dDCOv4HTw==
X-Google-Smtp-Source: ABdhPJyJOokEt0kcEBw3sSkPy6hMeFJoYm8dpZ17WrM50ttC3tQnAGNRQ3bcqQ/3RbnokzCBKZFsGQ==
X-Received: by 2002:a17:906:b18e:b0:710:26db:7a53 with SMTP id w14-20020a170906b18e00b0071026db7a53mr11557189ejy.290.1654500411748;
        Mon, 06 Jun 2022 00:26:51 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id d7-20020a056402400700b0042e15364d14sm6332688eda.8.2022.06.06.00.26.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jun 2022 00:26:51 -0700 (PDT)
Message-ID: <14eeab94-8344-2c8d-9437-ddc8e367cfde@linaro.org>
Date:   Mon, 6 Jun 2022 09:26:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] dt-bindings: i2c: qcom,i2c-qup: convert to dtschema
Content-Language: en-US
To:     Robert Marko <robimarko@gmail.com>, Rob Herring <robh@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-i2c@vger.kernel.org,
        Devicetree List <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20220604164653.79284-1-robimarko@gmail.com>
 <20220605140744.GA3416078-robh@kernel.org>
 <CAOX2RU7PHpzKUNvuv=-MyqGtgcz30qKkvx2MHNV=ehtCZGBYEA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAOX2RU7PHpzKUNvuv=-MyqGtgcz30qKkvx2MHNV=ehtCZGBYEA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 05/06/2022 18:09, Robert Marko wrote:
> On Sun, 5 Jun 2022 at 16:07, Rob Herring <robh@kernel.org> wrote:
>>
>> On Sat, Jun 04, 2022 at 06:46:53PM +0200, Robert Marko wrote:
>>> Convert DT bindings for Qualcomm QUP I2C controller to DT schema format.
>>>
>>> Old text bindings were missing usage of DMA so that was documented, as
>>> well as the max clock-frequency.
>>>
>>> Signed-off-by: Robert Marko <robimarko@gmail.com>
>>> ---
>>>  .../devicetree/bindings/i2c/qcom,i2c-qup.txt  | 40 ---------
>>>  .../devicetree/bindings/i2c/qcom,i2c-qup.yaml | 83 +++++++++++++++++++
>>>  2 files changed, 83 insertions(+), 40 deletions(-)
>>>  delete mode 100644 Documentation/devicetree/bindings/i2c/qcom,i2c-qup.txt
>>>  create mode 100644 Documentation/devicetree/bindings/i2c/qcom,i2c-qup.yaml
>>
>> This one is already done.
> 
> Yeah, I did not check linux-next before doing the conversion.
> Sorry for the noise.

Hi Robert,

Thanks for the patch. Several people are working on the bindings, so the
best is to:
1. rebase always on linux-next,
2. check if anyone else posted the patches thus the work is in progress
- use dfn keyword, like:
https://lore.kernel.org/all/?q=dfn%3Aqcom%2Ci2c-qup.txt


Best regards,
Krzysztof
