Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E1B653A236
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Jun 2022 12:13:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351675AbiFAKNF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Jun 2022 06:13:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351990AbiFAKMp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 1 Jun 2022 06:12:45 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F22B4B425
        for <linux-i2c@vger.kernel.org>; Wed,  1 Jun 2022 03:12:36 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id b8so1464203edf.11
        for <linux-i2c@vger.kernel.org>; Wed, 01 Jun 2022 03:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=OGHEh5EflFJ5JP3LQKty6QMpN7VhyP1gug8Yda8OW5A=;
        b=RdNA06eZU3yur7GOEDYb/UfDCCZsD85cyaXv5fd/COilGbz32N1RnyYy1z8gcwDzkY
         mAVL49ZJa57+GiLqP6rh2AGmpF8gqhrRsXiys799/vPHu0F2re5olFzUntYNr45K98Of
         IvfZ0COVWTtulHvL2/uNU/wARd3MbMn8PJMnhD9FDes0cd4hB4Fm01kmWpL7n/2TsKN1
         6Y6UL1QXpu5HgehbvpAToUxztbyruB1E0Jw53mKfHg9a4gGeZcz4G5lMKLn67rO8ipla
         QAu5clsvjq2bNfKqwPAXMTT8nA1D22YnF30L1q5El2UGtHD+vSF1E0cIoVf36llXBhl3
         ff2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=OGHEh5EflFJ5JP3LQKty6QMpN7VhyP1gug8Yda8OW5A=;
        b=YAyBgWSW+KciUThqmTJV7tqKODbLCCPxbvS7H/k4+K1sOwo9pZZ5VEp1Y+bsddyZX9
         NLNqPEhZooqizycqnf4mDSdGXNfClIs3BRvBWHVRFDJqQJlANR8Cn1W6AXATfot/Gae9
         h+JeqSliL9gX3n8/ziDmiZ3r1zBuwlUSyTg6mTtJv20anWZYSsI3aKwmNNuyzq4ACvuQ
         5o/6njwDUiPWLHk370ufDWwMM79yFKXMrkLnMdP79IEuHbc/P02wjvBoWYrf3ohoFj/w
         HyPifqmM9QCxtFyi56w8OZ+qWJ8YEmnxnaZAYKy8b3IJq3aIvd+Q0EisX2T5/0ocAS/+
         l22A==
X-Gm-Message-State: AOAM531fBnUVePy74pCfuABDPrdLwILgJqmz0tlfKQOPzDIBfHhUeiE8
        ob4A7S5LNliUiZD29Q33yQ1GEw==
X-Google-Smtp-Source: ABdhPJz1Iw3aklyf+Hl4aU2S4N3wtkB5v1M5a6xE+R+Ctu54ed/8biBVX/Tgf6wfycHD4EafkrobCg==
X-Received: by 2002:a05:6402:424b:b0:42b:3871:75fa with SMTP id g11-20020a056402424b00b0042b387175famr58104048edb.92.1654078355157;
        Wed, 01 Jun 2022 03:12:35 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id e26-20020a50ec9a000000b0042ad0358c8bsm721575edr.38.2022.06.01.03.12.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 03:12:34 -0700 (PDT)
Message-ID: <c6b6b255-0793-c833-8af5-2e2c98c71db7@linaro.org>
Date:   Wed, 1 Jun 2022 12:12:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 10/17] dt-bindings: serial: mediatek: add MT8365 bindings
Content-Language: en-US
To:     Fabien Parent <fparent@baylibre.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org,
        qii.wang@mediatek.com, matthias.bgg@gmail.com, jic23@kernel.org,
        chaotian.jing@mediatek.com, ulf.hansson@linaro.org,
        srinivas.kandagatla@linaro.org, chunfeng.yun@mediatek.com,
        broonie@kernel.org, wim@linux-watchdog.org, linux@roeck-us.net,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-iio@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20220531135026.238475-1-fparent@baylibre.com>
 <20220531135026.238475-11-fparent@baylibre.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220531135026.238475-11-fparent@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 31/05/2022 15:50, Fabien Parent wrote:
> Add binding documentation for the MT8365 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  Documentation/devicetree/bindings/serial/mediatek,uart.yaml | 1 +
>  1 file changed, 1 insertion(+)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
