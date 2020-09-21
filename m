Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B52372728AC
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 16:46:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728049AbgIUOoo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 10:44:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727965AbgIUOom (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 10:44:42 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E225BC061755;
        Mon, 21 Sep 2020 07:44:41 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id 77so6996365lfj.0;
        Mon, 21 Sep 2020 07:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VBmGKsH4HXBysaC98/3xCnOtRsPHJTpyWV8wSKmKAjM=;
        b=BFVZcoCXkbqbquKK2sSGrqLtZKU9hzgIVQ2eHQpno/78sfx38zmfBEIhAH1oOuaatm
         lX7GOmadwj/QomMTDwgUyLyExg3FoHj9ReuFspSZ8IyUmt4YBN3NEMi+mScNFnEg8gtK
         4i5re2ZtmX2gYb2MANPMa3upP1zoLp3CFzZI6PTnBuhH6DNKdeLs2f6e8/buiPyfMA/P
         0Wof0+d7k2Gs33gLKi16XEihTtQa8nhfqQ5p3WBJjmYa9MwZeeqEsQyMhLuLvY8MHbHI
         V+EK2A+4HlnMfzeu7lygDLb7KCjca8QCFnR//FPG56cetY8StplXI7REZUHw3JQ2VlyD
         u4Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VBmGKsH4HXBysaC98/3xCnOtRsPHJTpyWV8wSKmKAjM=;
        b=dBd0idAccgsOt+tbUfbgWH3RekJ+ZDJ8/ERJQcFzwmCzmcudISwzjaZFSPS0UImJHO
         4YPEeabfmDwezU607MGVXOTbdKetYen+yusw9+C8XT/L38VMHxqKisPJg+Wm9x9qGS0i
         xEpgaaY3O0FyvUMmUiOAVClHO/EHb9XdBXPZeWdwJ6JHyKbBrfNvu5awxclSczPceHuT
         PQ112Zmamqoa0lOBJauQTHeaHaYxFMMdZ+WiglFIrjfhGDyISrr5PNFQc+524g3osoZ7
         sanqceddodN3nvIbDcNhodhmISp1zrXdf4/M6nA+dDQTf3gHaY5K702ZaGPoBIf7XUsh
         yK1Q==
X-Gm-Message-State: AOAM532rGqWEWilRcEh7cdDx+UPU0Tz2trKrnfIQLOPpj/Q6zC7eYqph
        tyqMZg/dvQ0n1lqX5jFsfNXCqTa7H4A=
X-Google-Smtp-Source: ABdhPJz5SLAxXZRgZVYvNQwvj6rRLaz1d+7HanqGVKxv0Y8w2q0awvZO/dcXQiZTg5zyIAQogBIZTg==
X-Received: by 2002:ac2:593b:: with SMTP id v27mr116180lfi.338.1600699480014;
        Mon, 21 Sep 2020 07:44:40 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id x5sm2765162ljh.127.2020.09.21.07.44.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2020 07:44:39 -0700 (PDT)
Subject: Re: [PATCH v7 12/34] i2c: tegra: Use clk-bulk helpers
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-13-digetx@gmail.com> <20200917113846.GX3515672@ulmo>
 <175e7f54-36f0-32c6-35a3-14c5b5e89e95@gmail.com>
 <20200921111257.GF3950626@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7b3b9e21-f8c8-eebb-85bb-af62fc204f10@gmail.com>
Date:   Mon, 21 Sep 2020 17:44:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200921111257.GF3950626@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

21.09.2020 14:12, Thierry Reding пишет:
> On Thu, Sep 17, 2020 at 06:01:56PM +0300, Dmitry Osipenko wrote:
> [...]
>> It's still possible to add the clk-num checking, but it should be
>> unpractical. We could always add it later on if there will be a real
>> incident. Do you agree?
> 
> There's also clk_bulk_get(), which allows you to specify the number of
> clocks and their consumer IDs that you want to request. That seems like
> it would allow us to both avoid the repetitive calls to clk APIs and at
> the same time allows us to specify exactly which clocks we need. Would
> that not work as a compromise?

I'll change to use clk_bulk_get(), thanks.
