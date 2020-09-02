Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C358225B5BE
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Sep 2020 23:19:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbgIBVRF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Sep 2020 17:17:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726247AbgIBVRE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Sep 2020 17:17:04 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2D46C061244;
        Wed,  2 Sep 2020 14:17:03 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id t23so921547ljc.3;
        Wed, 02 Sep 2020 14:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9w7TjWSjut7AH8tI3qRlPXARV8i+lYRGnZwZXR1Udoo=;
        b=E5T2tg/RZBaQMjL5Ws3EVYNhltu2hHbUFaWauv6Vs/lK6ypKSSbXSkT59TnFH7bOYt
         EpeqafHcZp7EH7/G4zUxPOoUTndad7gNmvpSLtOjR6hKzuR+RrodinEKc/e7OXAnnqj0
         6kZZ/EA8ZvI+hrR3zNjDsaDle7NdoZoiGzLMMFS3m11HGOTD9PdLp3qIoQSjGhzm1Lv9
         Do5RtBwU0eC5WJzKfDWoLPgp9JYyyDJd4krE4zIhEmxEvQmsYVcDFawGTCDfOU9cjPrd
         m58xUg4Q7LDAxAPGUEeiW+NSGAN5x2FyO58Yhtnqwt0peDwAwTSN950fdoz8bqJ4IXOu
         051A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9w7TjWSjut7AH8tI3qRlPXARV8i+lYRGnZwZXR1Udoo=;
        b=BTRlpvJp+g4rnQ3S5DIRWLHGhXJf93Lpfmpz0w43d78eDRZfEKtMO29SFEmh/cf6nO
         ksDhalsSc6gYQ6GHZaZqawWcLn+h3p+lYTV5DpjKP7rY8khimN/7FVzWPsx68gRZZpas
         418MgSW0pVMAGEY5+NV1hiXRaEle6w+Y3ip4JMUeRSsypxpvL8oXwD41vdLPp03Wv+7F
         LBrVENNvOcA0KuwIrCd9/LRnmdz0d9MYsdqmKyyQ0HfF+J30LahMVJUDsuWKjnWsxqYS
         4yksW9EmcXGbgRcXGg9Tpm3+eCElQAoj6O5rTr9ywSEaTCbqa2GDTNo1Ma7MRjU3JaoB
         Al0Q==
X-Gm-Message-State: AOAM532Wz5KeGlA5AT6F8GtV4poSoSvm5YI1Q6U9ZncdJpE2HrAOI7s1
        LLpjS0IXOC92CKh1cDhdKYmdX8mwWVs=
X-Google-Smtp-Source: ABdhPJy/fWkbCVWxR/LMIarIgm8iRq1K0B2HgD3F1Jcms1H2WnZvXaKFX0YOQvKfJSmLrsswAlQfNQ==
X-Received: by 2002:a2e:8157:: with SMTP id t23mr4247138ljg.417.1599081420512;
        Wed, 02 Sep 2020 14:17:00 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id e15sm162463ljn.49.2020.09.02.14.16.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2020 14:16:59 -0700 (PDT)
Subject: Re: [PATCH v1 03/12] i2c: tegra: Clean up messages in the code
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200831202303.15391-1-digetx@gmail.com>
 <20200831202303.15391-4-digetx@gmail.com>
 <20200902204255.GB1624@qmqm.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <638ea963-f150-2947-9d32-36fe85410cba@gmail.com>
Date:   Thu, 3 Sep 2020 00:16:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200902204255.GB1624@qmqm.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

02.09.2020 23:42, Michał Mirosław пишет:
> On Mon, Aug 31, 2020 at 11:22:54PM +0300, Dmitry Osipenko wrote:
>> Use lowercase and consistent wording for all messages in the code.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/i2c/busses/i2c-tegra.c | 50 ++++++++++++++++------------------
>>  1 file changed, 24 insertions(+), 26 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
>> index 9bd91b6f32f4..efbb20049cf8 100644
>> --- a/drivers/i2c/busses/i2c-tegra.c
>> +++ b/drivers/i2c/busses/i2c-tegra.c
>> @@ -427,7 +427,7 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
>>  		return 0;
>>  
>>  	if (!IS_ENABLED(CONFIG_TEGRA20_APB_DMA)) {
>> -		dev_dbg(i2c_dev->dev, "Support for APB DMA not enabled!\n");
>> +		dev_dbg(i2c_dev->dev, "dma support not enabled\n");
>>  		return 0;
> [...]
> 
> DMA is an acronym and so I would usually write it in uppercase for grammatical
> correctness unless in a function's name.

Andy Shevchenko suggested the same thing in other reply, I'll change it
in v3. Thanks!
