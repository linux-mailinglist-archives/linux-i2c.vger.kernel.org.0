Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BFBF26E59D
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 21:55:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727301AbgIQPCi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 11:02:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727895AbgIQPCN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 11:02:13 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44A03C06174A;
        Thu, 17 Sep 2020 08:02:11 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id u8so2551021lff.1;
        Thu, 17 Sep 2020 08:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Zf8LlMvARovBrXzEO3HGREgydqWfx6EFuxhl0p18t9M=;
        b=bWfWENMbnY7oAESDMK/5HIeZH+4SMkw+cKWYVu872dDh4WRDPkYSDnqAyWS7XrJI5S
         43fOelLkJDcI5oNvN9q8MnYlM7yJqVi3ISe+kaWiiOpPFieUTHZaBlXTi3Xh9ewo0umk
         4NnNZQagOi+NuSXn16v9KGHaool4x4o9sHzZUiwepA8qqzm47X8SfgwGLJSJTq4PsO/0
         3cLRvEj915Kdgpb0k7lNQGSSsnn+xIyOSWNxpL1UJ8y4GwkLDrgNOq63ib/xVINrXClY
         wuWks3dHyBDd/DYmQcTcEoDe3jJllUClN77IKjHbSAJhH9wtXaHQSpMGjAg10NdzVwhD
         lLrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Zf8LlMvARovBrXzEO3HGREgydqWfx6EFuxhl0p18t9M=;
        b=GOTwF2IvHxHj5S1bICelD+YUWWGCxLyzsH73BVhmHUSjWejrlPu3OoSW92DwKQxi4A
         ZNmCLDJO8Bgjor04AmiTry5GaxAgszCM+6014IRQmN1iyxliLcJY3C6xOtHovt/yaqw5
         /+GgOHg9VdjFP3W9v6HzwQ8Lf4tn641hClYSl0L1XckbO1dOHhhJK4+I4KgrcL4DoyUv
         W3Dbzn3mifDSDeDTbE4h/qsceQ5AGgNbkdbRVOiaNrozUNjkuo+N5Uq86hsA7VkisnBN
         /f9DOVLk8sBOeBQ1uNkTWKlhCCCZtWfHkwdmLbOybHtUMSF1r36QmwiRz6X0DDX+DGz8
         eiYA==
X-Gm-Message-State: AOAM531ZodsbWzAO0aw+DxOJ1yqsdqalcZsd4FhPXES4GmX5GJzp+imJ
        9owqSDrR4aWEuhkwSrGyPw0MP/w5edE=
X-Google-Smtp-Source: ABdhPJzSWl0onN9HET3Zo/m17BMIUfZvlq1W1X+EU44Et8YZbkGoe6j3GWcWK5tpHDOtPnWtZpIR+w==
X-Received: by 2002:ac2:419a:: with SMTP id z26mr8915043lfh.537.1600354929588;
        Thu, 17 Sep 2020 08:02:09 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id f2sm5279330lfm.208.2020.09.17.08.02.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2020 08:02:09 -0700 (PDT)
Subject: Re: [PATCH v7 32/34] i2c: tegra: Clean up and improve comments
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-33-digetx@gmail.com> <20200917123208.GK3515672@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <11a29706-0870-792e-d5d5-7c0d1f402281@gmail.com>
Date:   Thu, 17 Sep 2020 18:02:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200917123208.GK3515672@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

17.09.2020 15:32, Thierry Reding пишет:
...
>>  /**
>> - * struct tegra_i2c_hw_feature : Different HW support on Tegra
>> - * @has_continue_xfer_support: Continue transfer supports.
>> + * struct tegra_i2c_hw_feature : per hardware generation features
> 
> I think that space before ':' can go away. Although that's preexisting,
> so could also be a separate patch, I guess.

I haven't even noticed that!
