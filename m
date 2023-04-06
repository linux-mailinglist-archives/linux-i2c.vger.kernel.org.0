Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA2566D9085
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Apr 2023 09:36:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233044AbjDFHgn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Apr 2023 03:36:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232896AbjDFHgm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Apr 2023 03:36:42 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC454128
        for <linux-i2c@vger.kernel.org>; Thu,  6 Apr 2023 00:36:41 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-932072d4c00so123301366b.1
        for <linux-i2c@vger.kernel.org>; Thu, 06 Apr 2023 00:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680766600;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ijq1sQSgXRjCVw0Zbz7ioCZmIB2M5yer8Xo5BpM0JvQ=;
        b=ohMvTjszXNbfst0u8uh1G4YknBXKl6WA5DNnJ9KiD7zjy3IYj2/5nNpeu6C2Jcq7WF
         R8xOf8NOq0HB4VKrt6596DB7ZgLmU6+sHk9X2ZjKG2UoTd57j8RJpzFis2hgJA1SutAM
         yeXKSEuQl/dGFuWQHiy8RG+5Y4K7k9d9C1zU1QpZglQaqQVK7BjqFzprjKAj7gNAk321
         kUmlWovWOPZlhDt5nvllqNbz7oEnE8OCiDTwn2CkBtOLlPoGMAXby1ZWn2m0wOgA7FXo
         /GGLof4fm4EdSP/rm/yMYve6xjUh1l2GmxHq13fhSq/Y63Ws6Fo8FHLws1fIpKQMVx9Q
         yZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680766600;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ijq1sQSgXRjCVw0Zbz7ioCZmIB2M5yer8Xo5BpM0JvQ=;
        b=Nn//sL9LPqzzlKSkHLPQsKbEZ8XTtUoMBbSD+XLZV+ulxAlsFaYdLH38S5ECaF2QUx
         vNYxT0XLufCZs31yoau58mpBIiYeT5b1Ohh2dNmwgD5Ml2jQIIu6wNjD+z8lKiYLZCud
         ihR9K5z46XZaEfxiPSGYudr4lWwJbWbTZGVn1MYF0okqEEyEOYYVlI7V/UwPo/xypgSs
         dTYUc53NclN8fmcfoB6RvzkAL9zvofC8xwoaBdp3I/qDMfuNenGKcdjsAQseKtmFdKb+
         BF1RO5DqCzrOlREQ7FrCHgqt0+YvhW7POpy+cKQ4P/niP1KIpk32kisdNLHhx1wC4Lvs
         ll6g==
X-Gm-Message-State: AAQBX9e382WnLGtF9MmiR1D1gDhAMFRyBbSp8e97SHHS3NcD5NZIBv4H
        TVIC2/uBc1/6ZuNQRrHkLZGP+g==
X-Google-Smtp-Source: AKy350bk+DZPdYGsRNi+j77n2jK6BivgHWKBNISxMdpVatnWSqCJmwrkgIofxzZ998QwCxJ02zv4WA==
X-Received: by 2002:aa7:d78b:0:b0:500:2cac:332c with SMTP id s11-20020aa7d78b000000b005002cac332cmr3675247edq.25.1680766600157;
        Thu, 06 Apr 2023 00:36:40 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed? ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
        by smtp.gmail.com with ESMTPSA id i17-20020a17090671d100b0092973e209f2sm433340ejk.109.2023.04.06.00.36.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 00:36:39 -0700 (PDT)
Message-ID: <40f1ca77-7f7a-dc51-1137-45664a6ef2a1@linaro.org>
Date:   Thu, 6 Apr 2023 09:36:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v9 1/2] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Content-Language: en-US
To:     Ryan Chen <ryan_chen@aspeedtech.com>, jk@codeconstruct.com.au,
        openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-i2c@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-aspeed@lists.ozlabs.org
References: <20230405022825.333246-1-ryan_chen@aspeedtech.com>
 <20230405022825.333246-2-ryan_chen@aspeedtech.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230405022825.333246-2-ryan_chen@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 05/04/2023 04:28, Ryan Chen wrote:
> Add ast2600-i2cv2 compatible and aspeed,global-regs, aspeed,enable-dma
> and description for ast2600-i2cv2.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  .../devicetree/bindings/i2c/aspeed,i2c.yaml   | 52 +++++++++++++++++--

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

