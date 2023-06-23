Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7CE873B6FA
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Jun 2023 14:18:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229961AbjFWMSh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Jun 2023 08:18:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjFWMSg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Jun 2023 08:18:36 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5CBD1BE4
        for <linux-i2c@vger.kernel.org>; Fri, 23 Jun 2023 05:18:35 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-311153ec442so565581f8f.1
        for <linux-i2c@vger.kernel.org>; Fri, 23 Jun 2023 05:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687522714; x=1690114714;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dnPiqjG3OPOmyc7adyYYb3NKpVfdEsOAl/S0ccRvR2w=;
        b=koxvr4AjRIqkEmpEUNSwsradqyfHxzx6xs0NLhcGr5yRdRkCod01eJDdGt/neV3rqC
         Ggpq1HADBLhQVFxleC/qy+3bhPZRMv5Kb/2M2WQ242VZVhwODctY/uU0bYFx3vi+0Al1
         uoJsGFgXRETZbIUuAG2E713TvUB/wYxM8jtpGA7QIA1KiCZtQlMFYpImS9WbDmH0Co3O
         oo2EUfHInlqfoFm66kUhskMwkwnuHJfd90X4w6vxXvXEN1eYG5MwM7xceTtvPr+H8yP+
         B1kb6cRjTF6k2iwjaGnNavAQiMZYGJxNmrODxSEUGKgDGd8lIs1VOCnytqRYgR7zUy6r
         IooQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687522714; x=1690114714;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dnPiqjG3OPOmyc7adyYYb3NKpVfdEsOAl/S0ccRvR2w=;
        b=HkrPOB3PzI2C9CwNPgbY0xBcM7KwHlDEgcQZ+eVgtr+yk9HT6aZzbgzBit0Uu13D5R
         DTkinsIiDtWTe77wQ2BvecpVqEvGAAbkmGH1+g63mo0xNZeYPbixXRaQKQVvw/uYacG3
         xAa+Ox9eEiynd3x0vxCVghphB3DWxOoDJoML7PA7myMkQoFupg+QQLaGN6xvK6Uqg5WG
         65MGLrrriy6qbOCrLM4NKpleQObZ8cOEUva9Sisyq73EdE3nsfeKp+UAPKR23JLBMSB6
         Kp0fnbLc6d4pgPTrndiJn+FX4pPTw4LQ0POFU/Bem94r5UDyBo3964Uom1aIYadaii9f
         8uEQ==
X-Gm-Message-State: AC+VfDwXg36t0oO1fhzyNwUHbs+ic1Ut5fylwD7t6fiKuAwqHvpnp1Pw
        iXQAhfj4Bm0eLELrKB2MC6jt8Yjoyy+lRFDc72o=
X-Google-Smtp-Source: ACHHUZ6JMm/14X2+BL+xk/PNNAhH198yI6QxR9G42ATYYeB1LCAfGp5ZJ5zrp3xopADAsvFyYOUwAg==
X-Received: by 2002:a5d:5689:0:b0:30a:900b:6bf4 with SMTP id f9-20020a5d5689000000b0030a900b6bf4mr24254442wrv.0.1687522714307;
        Fri, 23 Jun 2023 05:18:34 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id f4-20020a5d58e4000000b00311299df211sm9480256wrd.77.2023.06.23.05.18.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jun 2023 05:18:33 -0700 (PDT)
Message-ID: <9189aad9-5053-81e1-b0f3-9b585d75734d@linaro.org>
Date:   Fri, 23 Jun 2023 14:18:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 04/15] i2c: busses: exynos5: Use devm_clk_get_enabled()
Content-Language: en-US
To:     Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
References: <20230611225702.891856-1-andi.shyti@kernel.org>
 <20230611225702.891856-5-andi.shyti@kernel.org> <ZJVuDEa/7IBwAusj@shikoro>
 <20230623114803.rvzxjb7iatr6jlvu@intel.intel>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623114803.rvzxjb7iatr6jlvu@intel.intel>
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

On 23/06/2023 13:48, Andi Shyti wrote:
> On Fri, Jun 23, 2023 at 12:03:56PM +0200, Wolfram Sang wrote:
>>
>>> -	clk_unprepare(i2c->clk);
>>> -	clk_unprepare(i2c->pclk);
>>
>> Are you sure we can use devm_clk_get_enabled() here which calls
>> clk_disable_unprepare() on remove and not clk_unprepare()?
> 
> Unless I am missing something, I think so. This is what the
> driver does, gets the clock and enables it.
> 
> I don't know why there is just unprepare() and not
> disable_unprepare() in this function.

Your code is not equivalent and does not explain why. Pure
devm_clk_get_enabled() conversion should be equivalent.

If original code was correct, your patch will cause double clk disable.
If original code was not correct, your patch silently fixes it without
explaining that there was a bug.

Did you test the patch, including the unbind path?

Best regards,
Krzysztof

