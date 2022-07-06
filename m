Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 520725692E6
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Jul 2022 21:55:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233409AbiGFTzd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Jul 2022 15:55:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230285AbiGFTzb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Jul 2022 15:55:31 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2ED017594
        for <linux-i2c@vger.kernel.org>; Wed,  6 Jul 2022 12:55:30 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id u14so19774091ljh.2
        for <linux-i2c@vger.kernel.org>; Wed, 06 Jul 2022 12:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=1cggqdheLf5tx5a4RWqD6gQP3vfX6AayXoHRI5JqNGE=;
        b=mxx0NhRQGF1roPP4zUR+jS909if3vve2lCYvqaCEj0o8N8iN2WWvFZrCj72oW4VAJl
         4A4EHkuGXvb/iMt+FKYOYSXXnkfZB7wk/vxowFPjLKoFPuJkBcoqSykKDWFYoC6gtITD
         +lMVqMSTotP+JkO8YToXGVnCZEcFtpp0R0HeHuy8ZLpnv3m/QlxJ9/CSQhJ+19e5gptB
         nUU6Al/QL71JK8UOiq5xICi46Qv/8rYBqAHS7HWJc3qqeGhjpu7qdMJROatRzOxrZYyr
         MoebsfkQ8tAE90yRHltpvsxyIYZ+TK7Gkv9Dv8Mkmf6H2nllsdO/KwBY9AYisOcj4KMW
         xJyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1cggqdheLf5tx5a4RWqD6gQP3vfX6AayXoHRI5JqNGE=;
        b=1BFRfRrKcWNNNadOM9SoLdGMa8eNoKsLlSu4ecJIntgz0xsDf0JiN1/ixIyAmGaU/j
         ckFDk8KsVVeK87ND0htZVebUYnx2dsk5t1Se7nSOlTxpgP00f18cRqsel7TBWFpIAjwf
         yvvAf0FLH5uld1bq2dX+yqk3S3u8Rue+VxrJ2SQzYHSLK8806qf3cWEwWCPT3s0/nk9g
         8vMzTJPHfhpY0JwbCTm/sALrp44DQYnnuxo3PPAphNO7aqNuYA9fHXPCfS507w6ewwkh
         MkGefTQSHZyMNdQ52dZ/q65CRW2r7K8A+kUVaxqMz4V4hxdpGIBBpLEhaxhy0Q9xSAaV
         SCDg==
X-Gm-Message-State: AJIora8oe+xDJ2XJynnQKJbRe+bqMb1/f8yRQTcmC5zj9TioIJ7Qjtz6
        GOGesG+/Y86XTa1SHdGhsQ9LQg==
X-Google-Smtp-Source: AGRyM1vnBn9IH/IF7sLcDzjlPr71ImIMk5XqA2RucdlxyWgmXqAt0KV2/I5NtaX1BUqu46ajylefPg==
X-Received: by 2002:a05:651c:2317:b0:25b:fc32:906a with SMTP id bi23-20020a05651c231700b0025bfc32906amr19597103ljb.445.1657137329221;
        Wed, 06 Jul 2022 12:55:29 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id p11-20020a056512234b00b0047f6b4a53cdsm6413232lfu.172.2022.07.06.12.55.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 12:55:28 -0700 (PDT)
Message-ID: <a965913e-39ba-640a-0d36-2bf7ecc10e94@linaro.org>
Date:   Wed, 6 Jul 2022 21:55:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/1] dt-bindings: i2c: i2c-rk3x: add rk3588 compatible
Content-Language: en-US
To:     Wolfram Sang <wsa@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-i2c@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, kernel@collabora.com
References: <20220623163136.246404-1-sebastian.reichel@collabora.com>
 <2664d6a7-ee4b-9cfa-800e-e97522e3986c@linaro.org> <YsXjrUVbGIObUroU@shikoro>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YsXjrUVbGIObUroU@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 06/07/2022 21:34, Wolfram Sang wrote:
> On Sun, Jun 26, 2022 at 10:22:09PM +0200, Krzysztof Kozlowski wrote:
>> On 23/06/2022 18:31, Sebastian Reichel wrote:
>>> Just like RK356x, RK3588 is compatible to the existing rk3399 binding.
>>>
>>> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
>>> ---
>>>  Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml | 1 +
>>>  1 file changed, 1 insertion(+)
>>
>> That's still some old tree you are based on...
> 
> What do you mean by that?

The patch was sent to not updated email, so I assume it was based on
something before v5.18. Could be relevant, could be not, but it raises a
question what was a base this (and other Rockchip) series. :)

Best regards,
Krzysztof
