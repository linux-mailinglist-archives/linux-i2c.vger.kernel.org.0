Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92C4B55B40A
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Jun 2022 22:23:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231949AbiFZUWO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Jun 2022 16:22:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230205AbiFZUWN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 26 Jun 2022 16:22:13 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B3E4327
        for <linux-i2c@vger.kernel.org>; Sun, 26 Jun 2022 13:22:12 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id g26so15008734ejb.5
        for <linux-i2c@vger.kernel.org>; Sun, 26 Jun 2022 13:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=CFqK1V3cErjaAHUi1wVf54BeaI6dfHIkhreLhTzkKhE=;
        b=XNUfVtVTdbA8jHcHt6Z+q49J10viGxiiMyhgBJoaJPQRSQCBTGmIu1JTBQFdqQwMrd
         Ehx/mZyNMQIHdr+gx3Hq0kmlze/t7RcOtOqWfwusKTAy9QQJErGdUg2Ts+fuWhZOyDqU
         dVkCZ2eA+KDATDoULDA91lQypBqhPJlcya4/uvbs39geqB0wPDnxuY6s5xr6ko6xunKr
         9LccvJxlPV6I1JlKGCTB1iTjr5eCLaAcRHQkPWiAX+rJCNM9NDNsagNfC8xz3ofqiptZ
         Nwu47eZcEy11sbP9CZwx0XQ3gdPYmVAZanxqS5K+gQljoPqWM16zT1wP/WRjtmnZ1m4M
         yjzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=CFqK1V3cErjaAHUi1wVf54BeaI6dfHIkhreLhTzkKhE=;
        b=Ap5bTc3d2Mu9DeAfcE5BeM2haPy1KD/X2zGBQWElsswmLp+HaoKS0mwNPwvbAxEvAY
         p+ctLaGjW9cX6Jv3FsE35jJcyAjGWXjYrf70K5qBsNScwo81tvar6KBAPgNEHRhlqI43
         ozBDOQCK5pnuqYWKY2sP8wFqu0I03DeWptHCkXHck7ke7hIM0j3/Eja0EVhulDo5hoVY
         0ZsOUAnELb6VZnhCEuhqdx/LG8deYphT+PokYQEPiBx72q/NxTVE3Tc+vxAf+0zvLXOX
         mOHseXDy+mFL2Y/6F4xg/pj2KtnHUsChyoinPbiDb7P/ksY+iPmoHUAqX+dprNOfXYjz
         yUGQ==
X-Gm-Message-State: AJIora+xUq1ST+jsUlUyjmNlUpLBpxmaKIXDPZjfKYzzQUvGSWkcBnqU
        NVrsqUz0wHw8NI/u8gukuw+IUQ==
X-Google-Smtp-Source: AGRyM1vF/vKQ4ZLuDAv5NOU1Htj1Ux0JtWufYoYZ1hA9YJiOfOK3ovbVgnJ1ZeS/3zsGyZ7FiptJ6A==
X-Received: by 2002:a17:907:3da0:b0:722:df7b:1d23 with SMTP id he32-20020a1709073da000b00722df7b1d23mr9392521ejc.574.1656274931169;
        Sun, 26 Jun 2022 13:22:11 -0700 (PDT)
Received: from [192.168.0.245] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id h1-20020a1709063c0100b006feec47dae9sm4100547ejg.157.2022.06.26.13.22.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jun 2022 13:22:10 -0700 (PDT)
Message-ID: <2664d6a7-ee4b-9cfa-800e-e97522e3986c@linaro.org>
Date:   Sun, 26 Jun 2022 22:22:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/1] dt-bindings: i2c: i2c-rk3x: add rk3588 compatible
Content-Language: en-US
To:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        kernel@collabora.com
References: <20220623163136.246404-1-sebastian.reichel@collabora.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220623163136.246404-1-sebastian.reichel@collabora.com>
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

On 23/06/2022 18:31, Sebastian Reichel wrote:
> Just like RK356x, RK3588 is compatible to the existing rk3399 binding.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml | 1 +
>  1 file changed, 1 insertion(+)

That's still some old tree you are based on...

Best regards,
Krzysztof
