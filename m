Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4725A71EFD2
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Jun 2023 18:55:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231359AbjFAQyk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Jun 2023 12:54:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232146AbjFAQyM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 1 Jun 2023 12:54:12 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75E9E19F
        for <linux-i2c@vger.kernel.org>; Thu,  1 Jun 2023 09:54:08 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-96f818c48fbso154367866b.0
        for <linux-i2c@vger.kernel.org>; Thu, 01 Jun 2023 09:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685638447; x=1688230447;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=opz6VtahvCDdjyoo3Ecdy1ZlcAUEXCiP9UvfN37Ndpk=;
        b=LWiOQG5gf2rvyRCi1hD+vLSYQSgpTH/vSRYQQhyNujIB/uPUK2XWADRlsvTql/4J82
         BF2ybxrrQpTSvzQEwyxf22vytjqI225LKfzVGpHfDeHTVCI1DUka6VH7rTVPKJkqLdaa
         3ZuJDNavqa52M9MqOU5RA9FWijgAoecjc72kyQ9uckeTvgyDm7jepG08wZvR/cnI5U8C
         JnYsaTggc3a7wTwzU8FHddVovstp29IQQqjUvPsMzhVyJ5VGyDTDsOfTzfDaKO3aUX6K
         6MQ8kenQ+HDkoAyDnOW+cdmWNNUThF0ZOdb1qhghqu/U9VOeO09+v4OneIN3iRFWWWly
         6Eqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685638447; x=1688230447;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=opz6VtahvCDdjyoo3Ecdy1ZlcAUEXCiP9UvfN37Ndpk=;
        b=Vq+xJbNq1yP8LXZXNSauQSIWExBhBRrt6H9KSo3e6OVjhOlk5tuBtSklEGFuVji7it
         R2hFwF71faDvdOBxXUrgvDwqZgMsz/d5OwPuS4naFbU6e4laUWU213dgE6QPezPypRPy
         /9EHKkL5+zAaxbEC0e/DB5FsVLZrjAPL211Od6pwZfWX4GBnS9ZBq0lSTpR0YNKqLA6h
         hlZylhfKFGSH+HG5+f3R+oRcPhkbYD/5ii7QJv1Y8M1PU5cH/kfXjSR0UAfveG4ear2P
         PQ7FP+3T7e9fKeMRckVSMvN0MlJfbxSXdrhrnSzpzOrMPA1yrFZvIRbvu3/aWU5qytFj
         UWSQ==
X-Gm-Message-State: AC+VfDyEuS7AHHBwL/hmKm77VEtWevpcEm0Jl6y2RTE41LJe6c6Dmhxv
        je5eqpH2W5SP5kwOEjZKRhoH/A==
X-Google-Smtp-Source: ACHHUZ6Ib6fkHHOhU4CvPzpBJDbe8lHmjCmfmV5pzq4uXm82lIkWnme3xzB+iaqpqS1+gQ5oQcjPPQ==
X-Received: by 2002:a17:907:6e11:b0:958:801b:9945 with SMTP id sd17-20020a1709076e1100b00958801b9945mr8590711ejc.31.1685638446879;
        Thu, 01 Jun 2023 09:54:06 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id j13-20020a170906474d00b0096a5d341b50sm10759628ejs.111.2023.06.01.09.54.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 09:54:05 -0700 (PDT)
Message-ID: <12fea13e-e2c3-487f-8d2b-cfd320c98ba7@linaro.org>
Date:   Thu, 1 Jun 2023 18:54:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] dt-bindings: i2c: i2c-mt65xx: add additional clocks
Content-Language: en-US
To:     Daniel Golle <daniel@makrotopia.org>, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Qii Wang <qii.wang@mediatek.com>,
        Sam Shih <sam.shih@mediatek.com>
Cc:     =?UTF-8?B?6YOt5bCP5qGl?= <joe@gainstrong.cn>
References: <5f15212060f82fb94239174c4e4b46c151645fe8.1685549360.git.daniel@makrotopia.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <5f15212060f82fb94239174c4e4b46c151645fe8.1685549360.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 31/05/2023 18:10, Daniel Golle wrote:
> Add pck and mck clocks which are needed to access I2C registers on MT7981.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> index fda0467cdd954..550795f6573c5 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> @@ -78,6 +78,8 @@ properties:
>        - const: dma
>        - const: arb
>        - const: pmic
> +      - const: mck
> +      - const: pck
>  

Adding names does not magically add the clocks. This wasn't tested.

Best regards,
Krzysztof

