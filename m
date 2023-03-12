Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 404A46B66E5
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Mar 2023 14:46:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229638AbjCLNpf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 12 Mar 2023 09:45:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231158AbjCLNpK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 12 Mar 2023 09:45:10 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA6544DE3C
        for <linux-i2c@vger.kernel.org>; Sun, 12 Mar 2023 06:44:50 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id cn21so8491719edb.0
        for <linux-i2c@vger.kernel.org>; Sun, 12 Mar 2023 06:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678628689;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KbMZJnirmlCKS4zMh68O2ig0pYgKhtCGTM1+G1KObrg=;
        b=DXgHIAoSCsCuHyVLIkbS6zSi5sWkNBLlFp2PIqt/AT9osywqWWeTfWYAEW8npGZjyG
         WZ9TEqCqJEg3hhVuPiTJ2+K25lDEgQc12SvaOgiGKTksJtu/cCV5H0P4ruOFM7zZ2iv4
         MGbdUGf/f6F77bntbmobCBcgoAUrfKrBBOqEYVJ9nkvsH9c212Msw+Ckj8rm1sxs3vD+
         EQpkxDWdH2Doc5YvD85RU7C8wDsyzIy/TxxJTh9sqW/ba5fZ1Md+skA2N7tsirlgAmeo
         7+tZHku8CJDdXh2+5+t3W7J6kQWnzHdOYGaFnha9dfsecm3BFAh9XaFPnEqdIxbjoYNj
         zRMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678628689;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KbMZJnirmlCKS4zMh68O2ig0pYgKhtCGTM1+G1KObrg=;
        b=ktSGKPDNsfngnnWf7pMrn4cf21wOg5emfbb+jeG188KaXsJAhWRFHFc9VjyLgSp0uv
         Bs7FRncGoBW7qX/doVlfNpKfx17buEPBDdmZrE8CYEuPeebLoFBL6q5qIuRUc8R1t3AI
         VSaONm4zeOUYuIBCYfwWN6Up37YTwPRgqA3P+CpzCw2aATk4Uouv4kXpQW+gLvH8TjRw
         Uzu1RxCO0qTkvACbP4yp+oYBOTjUMyfDqAJWu28n1uxBzfPuJmd+G/c3iknE+cftEzTg
         Evlvkvh0fN2ezOZuBkNh+HXnY5blj73rVjSuvidrPkpzjMcE1/Jz9CM6YaRR1oUudJWJ
         jIoQ==
X-Gm-Message-State: AO0yUKWrK8VzAH0LX9DANWy10gNgGCXD0GOuNLzaye6+G5ES3KPG01hF
        8Qz7La8hJSZFvP10ESwJWiBdCA==
X-Google-Smtp-Source: AK7set+dmT1UNk8s4QIA5xdiGzs2ee3MFK8ZRRn8Dx1L8PUc3w+S94rzWwTf+3LP/3gEjgHBc/p6Fw==
X-Received: by 2002:a17:906:4783:b0:8f6:dc49:337f with SMTP id cw3-20020a170906478300b008f6dc49337fmr41183414ejc.43.1678628689144;
        Sun, 12 Mar 2023 06:44:49 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d9f6:3e61:beeb:295a? ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id wu5-20020a170906eec500b00927b85e48b0sm397962ejb.111.2023.03.12.06.44.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Mar 2023 06:44:48 -0700 (PDT)
Message-ID: <e83ccb7d-cc08-181b-e354-af6b1de34ff3@linaro.org>
Date:   Sun, 12 Mar 2023 14:44:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] i2c: mpc: Use the i2c-scl-clk-low-timeout-ms property
Content-Language: en-US
To:     Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Ryan Chen <ryan_chen@aspeedtech.com>
References: <20230312131933.248715-1-andi.shyti@kernel.org>
 <20230312131933.248715-3-andi.shyti@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230312131933.248715-3-andi.shyti@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 12/03/2023 14:19, Andi Shyti wrote:
> Now we have the i2c-scl-clk-low-timeout-ms property defined in
> the binding. Use it and remove the previous "fsl,timeout".
> 
> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-mpc.yaml | 12 ++++++------

Ah, and I forgot: bindings are always separate patches from driver
changes. Cannot be mixed.

Best regards,
Krzysztof

