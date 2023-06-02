Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19FAA71FA2B
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Jun 2023 08:37:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233842AbjFBGhE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 2 Jun 2023 02:37:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233840AbjFBGhD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 2 Jun 2023 02:37:03 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D15013D
        for <linux-i2c@vger.kernel.org>; Thu,  1 Jun 2023 23:37:02 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-51491b87565so2504981a12.1
        for <linux-i2c@vger.kernel.org>; Thu, 01 Jun 2023 23:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685687821; x=1688279821;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j8B89gs1kz6Nc5gDyIqOsOPOnnDBPwHRlL6fFoA/CCs=;
        b=gJA2+snCW3TIYsW3bvXgyw/RBrbOgMBV3YyiZSGa7BGX97W+Hxvb9Yqq8s1zkwvIjP
         Ps0gKDMYeBdd5VFle0EBqiMbSb2TmJF4QTSlSJTRDNg7C1yABWxeQdjwd7f1vnlb0tTP
         v95TAlzF+1+/V/IEMSjelWLK6OXvuAN4R1FKN8JjBnwJsgGDqbgVfdgnJxOFRGZzzYgY
         fGhAIUtYXJybxtEEuslHz2bvveZifumj4x+rETv8Sb1qRM8UjBDEl2f7JPS/WPxEpKch
         tMjHtQwBkDQjXihyJ+r2CWEhtkfjLm+hxh909MWrMZqnPC79fLqRwaIwtlLR/1a+kFah
         DR/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685687821; x=1688279821;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j8B89gs1kz6Nc5gDyIqOsOPOnnDBPwHRlL6fFoA/CCs=;
        b=jBSWnNlhB7w4xhgvkaZ81598Rnjyt1H77jNMZUnoSFMozbEhR5xtu6xFSuA7tElDf7
         CI/fbeBCBt3HmSaIbZEsMD3+kBtM0MCnZHbqSyg259iPSXgLW3JLkhOqzU7HgRPal8/e
         1kNiJ49Y4O1SkMkmsXw5jVf1M5OTeIZhJSpxHj1hi1P6g5/sBotyE9AlOvevKMFwS+Pj
         70UjIVlmYvcdVanBYJSf1NJLasmHJP7yUq87pxIAH/b8oeP5E6LZKanDE0dHN/pJdVDU
         iD8i/7pGuXBWu4yWm6E1e+IElLygLT9i0pGW1iEsgMoQvIOLeDeKbX/JE6xCn+xAPjpV
         fkbQ==
X-Gm-Message-State: AC+VfDzDVKwqejtTh7fpKFzwkFeeQKdgJ8MPg/zyboyPijlHMLgrME5/
        u61rOrebArg0EcxBjYTX/uH51Q==
X-Google-Smtp-Source: ACHHUZ60woVds4Uu8wYQ9pBzvU/jcQ2PEQE9mtzcCHqayBIP/AuXky1IVY2C6ig+y2XPBsjZAEWIfg==
X-Received: by 2002:a17:907:160d:b0:974:1c91:a751 with SMTP id hb13-20020a170907160d00b009741c91a751mr10782730ejc.29.1685687820850;
        Thu, 01 Jun 2023 23:37:00 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id bq24-20020a170906d0d800b0097436a54b4bsm385136ejb.0.2023.06.01.23.36.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 23:37:00 -0700 (PDT)
Message-ID: <7613da9d-e491-2e0b-d234-6009ae2bcb0f@linaro.org>
Date:   Fri, 2 Jun 2023 08:36:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2] MAINTAINERS: Add myself as I2C host drivers maintainer
To:     Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230601190427.21388-1-andi.shyti@kernel.org>
 <20230602012100.1096488-1-andi.shyti@kernel.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230602012100.1096488-1-andi.shyti@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 02/06/2023 03:21, Andi Shyti wrote:
> I will help Wolfram out with the i2c controllers patches.
> 
> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Good luck!


Best regards,
Krzysztof

