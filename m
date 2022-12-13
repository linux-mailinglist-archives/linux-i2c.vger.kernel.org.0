Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C83064BD05
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Dec 2022 20:17:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236025AbiLMTRL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Dec 2022 14:17:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236783AbiLMTRE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Dec 2022 14:17:04 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5766C625C
        for <linux-i2c@vger.kernel.org>; Tue, 13 Dec 2022 11:17:03 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id p8so6548799lfu.11
        for <linux-i2c@vger.kernel.org>; Tue, 13 Dec 2022 11:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qNFlupRNay7QtBN1gYgAwepn8MTKWIgiDFJfAaHmsaE=;
        b=HqncM7Q19slsaUK8jTLvD50q5GQpnTnnBLmJjh8atlwWgPnDiwC3M8hXC5krKDc5dS
         15Pw3m1kbpTJ3XCR+jJjV7U0QtxzWee3Y38e/qNhwSpXsGi0oRd+oaoRKcugvLZaxT06
         ImbojyURPjn/SkxP1ogKIwMz0qDAMSA6RJv7SXOfIHf785VsyS3+AltV3F4AxUoHO7K0
         v55ZDFZnZ+aRx51EKg5kLRSTVqzHF10e8VdSbnf96TgR+PDfbWWiaoNOQUU2NvUdjoiY
         spPgHNneyb3jxtNYtPMN1UGsY5UTnwr5DQL5A0d7zCFVOSTiX3VtrK3lwOhUiPm34fKt
         /E/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qNFlupRNay7QtBN1gYgAwepn8MTKWIgiDFJfAaHmsaE=;
        b=sOeI9D448jv6fHiR5ANw10Ek+cYhaC+DLt2+ngodJKY2CDpKdM8yKh6IU+n661xTnw
         pCDcRkC51hKneiY4ny0q0HyJj1OwlZwegRr2wrlD6MYyUGql/iB61u9MfXbOFVQ0ofkZ
         SWbkGmjhvSXPcXwuAxklp+ciqqAsB0eMRuI2fgKIZDY16LQkjjfauucUzWypyGAG5DeW
         yQRI5o3SWhC1B3MrW5QrQSJ1C8s24UKKEKKZS1yuCS73jzoEvxlEY9/t+q5mBwXjUdc1
         VzGns9zUpx4VUamIu/QVsbCDhUJACcT/EhxljFFOJ7jiGZpJqTgAjNsfCjIUr0Ar35e5
         Eyyw==
X-Gm-Message-State: ANoB5pnlYrQ11dCNxlW79ILrEiwEgcq9ht2/h4tYJQJkSN/pOQ5JuH29
        kr2LxHU9SWaaminMZkL7hOmXRA==
X-Google-Smtp-Source: AA0mqf78OGRZNv2p3To8XTH7hJMvF9CJYStMqeqmnG4Fk0Pq67mOWBidvvzX1YI2TueLoxgmk7pQYg==
X-Received: by 2002:ac2:4283:0:b0:4a4:68b7:deb7 with SMTP id m3-20020ac24283000000b004a468b7deb7mr5457333lfh.19.1670959021812;
        Tue, 13 Dec 2022 11:17:01 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id q23-20020ac25297000000b004b5821219fbsm478726lfm.60.2022.12.13.11.17.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Dec 2022 11:17:01 -0800 (PST)
Message-ID: <1057d0b2-9003-7144-74e0-d4bde1e9b39b@linaro.org>
Date:   Tue, 13 Dec 2022 20:17:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 6/6] i2c: qcom-cci: Deprecate duplicated compatibles
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221213183305.544644-1-konrad.dybcio@linaro.org>
 <20221213183305.544644-6-konrad.dybcio@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221213183305.544644-6-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 13/12/2022 19:33, Konrad Dybcio wrote:
> Many compatibles have been introduced, pointing to the same config data.
> Leave a note reminding future developers to not do that again.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
> Changes in v2:
> - new patch
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

