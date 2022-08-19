Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57A9E599E37
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Aug 2022 17:31:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349548AbiHSP1V (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Aug 2022 11:27:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349607AbiHSP1T (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 19 Aug 2022 11:27:19 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0DE1C6CE6;
        Fri, 19 Aug 2022 08:27:18 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id z25so6595439lfr.2;
        Fri, 19 Aug 2022 08:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=p5gHKc64IQrYIvaRf5pn4OxOQejsfeLYroqX8+JBN2s=;
        b=g2GksgmUHPPD6aYRY8RFOqoMKTAukjx1YbLYMHSP2mj0GuYfsq9SaCpOKzhOj7LuKp
         16PAqm6uRvPf4dLt2ym2eFVmFEwFfbvAU7X4Mis/K1laFgA3rC6OoV86l3hcTpWjF9td
         yeqX72Gh2XNy4Dn77lTNARquOZod3/xnkZ411KrPp1TPGbFcvV/CAAI+dOzns8laXUzV
         EVe5hwEWsZY9duiRIzh19SW0ClH/oXyiM183cwJrNaxNcxuDzE4B33Nnjn3TFMF+gEJR
         bYIodOnB8uoqk+6u4em8UR9TfRpjYmCtzXLftf+Aoww2nOjwwTCW3u+Ah6jPsedn7olo
         Ah7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=p5gHKc64IQrYIvaRf5pn4OxOQejsfeLYroqX8+JBN2s=;
        b=W3VHp5O/yQPS2aSoNgvlbomifkyMK/qQM39lm23ibR133kATeyBfC60CVG172f+s8l
         9rdB8bolGd9cdnlZ5SN19jczzntalZQWUnVyeIWLR/JuH9G6cggBHN5HNYYJu6KzYyXV
         mdLY4x5g9N8WIW47Kg1sOzOh+C6oAzxPISoQLMskbyu5ciffB2krOIF0OdcWx0GlWQOz
         hFxd6XN6TcmuVwLiuf9Q3E1GPs0MZEm48tQZ/hKw4xzipU1EXoWvJbvzlNtutAn9/4Tg
         ip6BK/1gSdOMuqWEkorV/0HX/FmMML2l4xTZTxcBq4BMs66nZZiI08xTnEwToghNY7lY
         OaAw==
X-Gm-Message-State: ACgBeo3GsXD3RCY94QOHZhojFmSF1xT9KBCXLJ6BBGb1YVWOPlJJ8jEr
        FR/ljQGaj+YWXH61hs84xOc=
X-Google-Smtp-Source: AA6agR7RyPHVh7iBKwYNtti1bimItwcTcp0zNGnx1FZ7u9a0hsofIEGuOWgh7eI4hGrxgcnE8UyaSw==
X-Received: by 2002:a05:6512:2211:b0:48a:f0c1:5d01 with SMTP id h17-20020a056512221100b0048af0c15d01mr2421234lfu.249.1660922836992;
        Fri, 19 Aug 2022 08:27:16 -0700 (PDT)
Received: from [192.168.2.145] (109-252-119-13.nat.spd-mgts.ru. [109.252.119.13])
        by smtp.googlemail.com with ESMTPSA id p4-20020ac24ec4000000b0048b3926351bsm607080lfr.56.2022.08.19.08.27.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Aug 2022 08:27:16 -0700 (PDT)
Message-ID: <89a746fd-a98e-3147-7811-33c5051c2b6d@gmail.com>
Date:   Fri, 19 Aug 2022 18:27:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH RESEND 1/2] i2c: tegra: Add GPCDMA support
Content-Language: en-US
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Akhil R <akhilrajeev@nvidia.com>, robh+dt@kernel.org,
        devicetree@vger.kernel.org, christian.koenig@amd.com,
        jonathanh@nvidia.com, ldewangan@nvidia.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, sumit.semwal@linaro.org,
        thierry.reding@gmail.com, wsa@kernel.org
References: <20220819122313.40445-1-akhilrajeev@nvidia.com>
 <20220819122313.40445-2-akhilrajeev@nvidia.com>
 <20281ca7-e597-7030-4861-5f9a3594726d@gmail.com>
In-Reply-To: <20281ca7-e597-7030-4861-5f9a3594726d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

19.08.2022 18:15, Dmitry Osipenko пишет:
> 19.08.2022 15:23, Akhil R пишет:
>>  	if (of_device_is_compatible(np, "nvidia,tegra210-i2c-vi"))
>>  		i2c_dev->is_vi = true;
>> +	else
>> +		i2c_dev->dma_support = !!(of_find_property(np, "dmas", NULL));
> 
> 1. You leak the np returned by of_find_property().
> 
> 2. There is device_property_read_bool() for this kind of property-exists
> checks.
> 
> 3. If "dmas" is missing in DT, then dma_request_chan() should return
> NULL and everything will work fine. I suppose you haven't tried to test
> this code.

Although, no. It should return ERR_PTR(-ENODEV) and then you should
check the return code.
