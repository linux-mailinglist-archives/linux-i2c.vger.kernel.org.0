Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC8B079B42B
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Sep 2023 02:01:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242638AbjIKVSX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Sep 2023 17:18:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236489AbjIKKnP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 Sep 2023 06:43:15 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BC39E6
        for <linux-i2c@vger.kernel.org>; Mon, 11 Sep 2023 03:43:10 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9a9d6b98845so1033789766b.0
        for <linux-i2c@vger.kernel.org>; Mon, 11 Sep 2023 03:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694428989; x=1695033789; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z3vNimPLrW0+Wt4d4zmRK6dCpwuFIDXGyYmvgD/P0mg=;
        b=ShaTxsmbnLgZb006PqNLiJNQoPVyQsTwmk1CnWRq1Yqg2B+QEgGMhyxLGNJwe3iUf2
         wEOTQ569E2qKGZJZStC1TWjWYo3NmHVL9pW/aO7yyjIUeF74njW6yFdzvyKC6L3Bjc0e
         dfyIWNGOt+e40I5WVwot6ndq5vKHrdgm0PbgJI66Y2YYr7XJTHx6ueC2IFUjaZUe5rZo
         3t1gEfSZ4uKUVDhro6W1UcAjS2PVfsY/qdqkzd0atMEdfo/ZuSvCBT6FCUsFXNbcAIle
         D0qxyuj17CB636MmMUvXvABn/Kw+H4QgBL+BnJ4LjbAe3tjRL0yLTfpPBCTWy5tyteKO
         8Xxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694428989; x=1695033789;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z3vNimPLrW0+Wt4d4zmRK6dCpwuFIDXGyYmvgD/P0mg=;
        b=XTxs0h6lutdevqZBZg82fo2LEyPXPNarSMLf2BxLTmB36y1QGiI4eon8IrdYTHKLde
         WLK0In+88xhl0A6ayZ3OpdoDMT9F8PiDYJ7v9OP9tb/phvA0MKsYIHJ4nneH3QCmxqLS
         aDXbNSrANEj1viWMZL8yGVKhn/090XKptX0nQvGjgxz5Y6rk5EU+9uHBsfG+4VtUxTrR
         jwwErE+iXGeQEe84MjAWlqBRwTePhbS/hmrURyGjQ6Mgb2WHQW9fer4gAhhuY2VEdcy/
         wpRQyBTWh4wqmCY57JT/jwNaRhc19nLWLudeTPh+lO7719TQcUImLS741DJljNQssdfk
         quHw==
X-Gm-Message-State: AOJu0YwRFh8iCDJJnCOlUSwoAVzjSgueDFWbmwQ2QOzAEuiWjMRP8t07
        JkFDBdEVQQ9iDdj0RIAdrCQz1g==
X-Google-Smtp-Source: AGHT+IE1IiOpuiGM75LroUXB50Fm5b0BfgDj9z7ZW0gOUkHfhlOnEPVXkKutwD4RuzyvVaxJTwIXGg==
X-Received: by 2002:a17:907:3f0b:b0:9a5:c2c0:1d0f with SMTP id hq11-20020a1709073f0b00b009a5c2c01d0fmr18437515ejc.12.1694428988898;
        Mon, 11 Sep 2023 03:43:08 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id re1-20020a170906d8c100b00993a37aebc5sm5096157ejb.50.2023.09.11.03.43.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 03:43:08 -0700 (PDT)
Message-ID: <b38632d8-6a9e-7368-3309-16edfca5d2be@linaro.org>
Date:   Mon, 11 Sep 2023 12:43:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: Add custom properties for
 MAX7357/MAX7358
Content-Language: en-US
To:     Naresh Solanki <naresh.solanki@9elements.com>
Cc:     Peter Rosin <peda@axentia.se>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230831101513.2042773-1-Naresh.Solanki@9elements.com>
 <0b7cb454-4c31-569c-7609-7931e6fb798a@linaro.org>
 <CABqG17g8QOgU7cObe=4EMLbEC1PeZWxdPXt7zzFs35JGqpRbfg@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CABqG17g8QOgU7cObe=4EMLbEC1PeZWxdPXt7zzFs35JGqpRbfg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 11/09/2023 12:31, Naresh Solanki wrote:

>>> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
>>> index 2d7bb998b0e9..fa73eadfdf7b 100644
>>> --- a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
>>> +++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
>>> @@ -71,6 +71,23 @@ properties:
>>>      description: A voltage regulator supplying power to the chip. On PCA9846
>>>        the regulator supplies power to VDD2 (core logic) and optionally to VDD1.
>>>
>>> +  maxim,isolate-stuck-channel:
>>> +    type: boolean
>>> +    description: Allows to use non faulty channels while a stuck channel is
>>> +      isolated from the upstream bus. If not set all channels are isolated from
>>> +      the upstream bus until the fault is cleared.
>>
>> Nothing improved here. As I said, please provide arguments or drop this
>> property.
> These features cannot be enabled by default because doing so may lead
> to unexpected behavior, such as bus disconnections(although that
> wasn't expected).
> These features should only be enabled after they have been validated
> by the board designer.
> Therefore, they cannot be enabled by default.

And what is needed to validate them for given board? IOW, what changes
in hardware design that it can or cannot be used?

Best regards,
Krzysztof

