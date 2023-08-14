Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0DA077BCF1
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Aug 2023 17:26:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230197AbjHNPZv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Aug 2023 11:25:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233018AbjHNPZ3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Aug 2023 11:25:29 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD54C10E2;
        Mon, 14 Aug 2023 08:25:27 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4fe0e34f498so7066297e87.2;
        Mon, 14 Aug 2023 08:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692026726; x=1692631526;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R8YILAp3/EDICXZPGCGGCjADGpVxhYGATqQ8GeXwGKE=;
        b=XOamVmaEUyVJSKBWvI30lLqNFH84CtHogAwMWMsoEyYzCJnRmTj16CBXkEOc66Nwm4
         vekvdEJd9RIgcCXs69Du9pbZAMlJs7GJ949wSKxh2zj00hb+VlPISzyJCKlnl8Vey1RN
         7AKTHH8+cQY40/m79Jq5oViEyjeQYJlAsbheqWKdBoUbrflBuB637Q7LpGiOBJKsx86+
         851sWzuFFFgrRxVgOlbDjYgNomGaGHyMvxdQL+nAjiZEn+wZq9GrUtvvYgIl9ip3zOZS
         sDhVhBjbqt2aDd2fhz88HWiUB1LqPYhlFsuo1MqZaCD8K/PH+6mYFxG0FcQihk7lQfxT
         Kyiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692026726; x=1692631526;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R8YILAp3/EDICXZPGCGGCjADGpVxhYGATqQ8GeXwGKE=;
        b=WvJbqIx8jFNwxU5zGFs8XqX555iwlFyyerAd9TWIbmwVVGi51hRC+O9F1SKU/ELmfJ
         1T2Dr68lUqs93nLZ/Qw8wlLEkRSkKlHr4HST/xXO5QqOh00du917g5TnOkwO12lff/kt
         ipdQBu4HUNEs9TXNQgaSQdHxyLiwS0neBLix7JYCOulfVKxqCST3+CPM5QnFaPmipJ4k
         LysvBbmikqEgabyD9Lz1CwRZGhgFj5WBAgOhMn+Ye0dTW2hIA7PRw68LhoBMfauqD2bG
         bpUMwFAq/rDtt8Tc6Ryx3KQIriGBppOGXq0zTXhURu7YlqZSdIg4657yEDtT32mDaNkA
         RFjA==
X-Gm-Message-State: AOJu0YwKtPR4vX6ciQ/CMQphg7iOpsTDiicVSmdkuLA+b5kvY7eRjaWr
        vM/POsvGZQAqeuIHalPYy+M=
X-Google-Smtp-Source: AGHT+IHhqfehopCy/2TywU8IbidZWFUIqwvUKLZ1oTB/azd9a0hwX8l1Pdk+Clx+wqeoZIx3pw9Pew==
X-Received: by 2002:ac2:514f:0:b0:4fd:d08c:fa3e with SMTP id q15-20020ac2514f000000b004fdd08cfa3emr6235024lfd.42.1692026725707;
        Mon, 14 Aug 2023 08:25:25 -0700 (PDT)
Received: from [192.168.2.145] (109-252-150-127.dynamic.spd-mgts.ru. [109.252.150.127])
        by smtp.googlemail.com with ESMTPSA id c27-20020ac244bb000000b004fb85ffc82csm1999232lfm.10.2023.08.14.08.25.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Aug 2023 08:25:25 -0700 (PDT)
Message-ID: <5594f66d-1aec-ee2f-d3d1-1185ca9cb06f@gmail.com>
Date:   Mon, 14 Aug 2023 18:25:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] i2c: tegra: Fix i2c-tegra DMA config option processing
To:     Andi Shyti <andi.shyti@kernel.org>,
        Parker Newman <pnewman@connecttech.com>
Cc:     Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <fcfcf9b3-c8c4-9b34-2ff8-cd60a3d490bd@connecttech.com>
 <20230804214902.entkn6xkklz5lh3h@intel.intel>
Content-Language: en-US
From:   Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <20230804214902.entkn6xkklz5lh3h@intel.intel>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

05.08.2023 00:49, Andi Shyti пишет:
> Hi Laxman and/or Dmitry,
> 
> On Thu, Aug 03, 2023 at 05:10:02PM +0000, Parker Newman wrote:
>>
>> This patch fixes the Tegra DMA config option processing in the
>> i2c-tegra driver.
>>
>> Tegra processors prior to Tegra186 used APB DMA for I2C requiring
>> CONFIG_TEGRA20_APB_DMA=y while Tegra186 and later use GPC DMA requiring
>> CONFIG_TEGRA186_GPC_DMA=y.
>>
>> The check for if the processor uses APB DMA is inverted and so the wrong
>> DMA config options are checked.
>>
>> This means if CONFIG_TEGRA20_APB_DMA=y but CONFIG_TEGRA186_GPC_DMA=n
>> with a Tegra186 or later processor the driver will incorrectly think DMA is
>> enabled and attempt to request DMA channels that will never be availible,
>> leaving the driver in a perpetual EPROBE_DEFER state.
>>
>> Signed-off-by: Parker Newman <pnewman@connecttech.com>
>> ---
>>  drivers/i2c/busses/i2c-tegra.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
>> index bcbbf23aa530..dc6ed3a8d69e 100644
>> --- a/drivers/i2c/busses/i2c-tegra.c
>> +++ b/drivers/i2c/busses/i2c-tegra.c
>> @@ -442,7 +442,7 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
>>     if (IS_VI(i2c_dev))
>>         return 0;
>>
>> -   if (!i2c_dev->hw->has_apb_dma) {
>> +   if (i2c_dev->hw->has_apb_dma) {
>>         if (!IS_ENABLED(CONFIG_TEGRA20_APB_DMA)) {
>>             dev_dbg(i2c_dev->dev, "APB DMA support not enabled\n");
>>             return 0;
> 
> Can I have your opinion here, please?

The patch looks good, thanks Parker for fixing it. I'll be able to test
it only sometime later and let you all know if there will be any
problem. Previously I haven't noticed any Tegra I2C regressions, maybe
we should change that dev_dbg to dev_warn.

