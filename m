Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A40CB25EB7C
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Sep 2020 00:36:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728713AbgIEWg1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Sep 2020 18:36:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728727AbgIEWgZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Sep 2020 18:36:25 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FA80C061244;
        Sat,  5 Sep 2020 15:36:23 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id a15so12008238ljk.2;
        Sat, 05 Sep 2020 15:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wIgbCe+me6m/O/hCjjtMhyNJ1DzGS8TtOXQnp4EnPpc=;
        b=hul0flwEwmUqgO6VhLHCqWqaMDOs5epAdmW0VnRXtDVG2gCUXITZGAGhxiKSOzLAFw
         ZJ97VfqEmdxTCuBMu8sO4ccIrWQIzeJy0JT7yPfY8xDCFCKbS9IFy5fTXTYsM8Fp0gif
         H98FTbzD2DloduoJWVtyiAzeyxdZ2WRSVuo5GApziIAouaWn9ODvgbVmVmpAP41Lpzex
         14tULhyaO7eakDwuYzEZyTKh7hYnLBA0xJjre9rcROUNeeEWa+mk2PDyoXjUdjYTg1z2
         yTxKxVEJum8skaAScAyO4IWCCCbkvj8UU7wk6BnaABue2EJ/jaXKxUsAuHfwA1jQ9ks5
         818Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wIgbCe+me6m/O/hCjjtMhyNJ1DzGS8TtOXQnp4EnPpc=;
        b=hqTtbTqYSjw1u5QaKctdPMDBfcN3kh4qu32ZYbIdlnZ3VpY5x3Jrpi4a3in9+cz/07
         BF9gwpMNK4SYaH0ZsJi7SMNVKfR5lEme5Ej3U2r4cJxeTN7AHA97oxmXqVMkJtnAnyFc
         hurB3B4Q8+mqWvO5Nb1O2dCsbVqMGBbveMmwsFW+mTV4Abnd1rv5Fxixl8jignYUHRyM
         1EQudsNF9BtWJFIBSzm3fNf4R4n5bxDw7s0PqVYyIB0WK3bIlF97ryZIX/TuU7Uj2t7a
         W14VHGWIJ54xx3wMX5sbQ04o0ypz+cca2P7ozWDBici1nOTdBTbRpRSbcmR4SGTvRlH7
         PBnA==
X-Gm-Message-State: AOAM531rIt2CJkQLE0o1EOKdxS7IhAUl8bW0cfsDBfxUwcWcbVOzrQBx
        rudUCsq6aa8zUdHe9l56Y6syZTtWYwY=
X-Google-Smtp-Source: ABdhPJw6FexgpuxJhF9GDPtLS9E9EAb+J6ML8Qr7A2QP/Kmio+lfu/hQvriWTAaS497MVUtVUAJZTA==
X-Received: by 2002:a05:651c:1032:: with SMTP id w18mr7029893ljm.238.1599345381770;
        Sat, 05 Sep 2020 15:36:21 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id v18sm2856633ljd.51.2020.09.05.15.36.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Sep 2020 15:36:21 -0700 (PDT)
Subject: Re: [PATCH v4 16/31] i2c: tegra: Remove "dma" variable from
 tegra_i2c_xfer_msg()
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200905204151.25343-1-digetx@gmail.com>
 <20200905204151.25343-17-digetx@gmail.com>
 <20200905222323.GC18554@qmqm.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7587704b-7bc1-d6a9-19b4-befcbcbce26c@gmail.com>
Date:   Sun, 6 Sep 2020 01:36:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200905222323.GC18554@qmqm.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

06.09.2020 01:23, Michał Mirosław пишет:
> On Sat, Sep 05, 2020 at 11:41:36PM +0300, Dmitry Osipenko wrote:
>> The "dma" variable of tegra_i2c_xfer_msg() function doesn't bring much in
>> regards to readability and generation of the code, hence let's remove it
>> to clean up code a tad.
> [...]
>> --- a/drivers/i2c/busses/i2c-tegra.c
>> +++ b/drivers/i2c/busses/i2c-tegra.c
> [...]
>> +	if (i2c_dev->is_curr_dma_xfer) {
> [...]
> 
> In this case I like the previous code better: just because there are
> less letters to read. :-)

Besides readability, I also don't like much that the is_curr_dma_xfer is
initialized in tegra_i2c_xfer_msg() and then could be overridden by
tegra_i2c_config_fifo_trig(). In a result the "dma" variable confuses me
since it's not instantly obvious why it's set after
tegra_i2c_config_fifo_trig().

Looking at the final result, I think it's better to have the variable
removed. It makes code more consistent, IMO.
