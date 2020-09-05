Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AFA825EB9C
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Sep 2020 00:54:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728505AbgIEWyD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Sep 2020 18:54:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728680AbgIEWyB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Sep 2020 18:54:01 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFEACC061244;
        Sat,  5 Sep 2020 15:53:59 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id b12so5673855lfp.9;
        Sat, 05 Sep 2020 15:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Mm0fLzL9mpwJH6qOtBIsC+iX0RP5tXSBI7mTIgBB+ko=;
        b=b0dK+FM3WSNnzGu8EeSD+PT/Z5zal+7gHYGIWdphxbq0Ze31ULCXKVB9Tbv35WIr/y
         JHCPoZFoer4oqz0vnYWTgyl48bH3rG5WyTrU3lHIbOu1P6VkCZHiouGcS8Y2EZbGw1RJ
         u9gZv9MS2KBUiOPZJwzkVGZVm+xjujXJ21DZZLWE3GHED5E9Ars7mnQT0c3jwuWXwyzw
         6NtoJrdi/+JowbGCx8FUwFcgjs521n6H2ohlVSRYBaa2se6l/QIFb7zSkWHn/Ly+nquo
         5EbxoijLT7VWJKcgFWV68QtErGCgGYfAgdXeQc9cQgpVNSoV+1ltm2tjERd/j/jTHZcM
         q7Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Mm0fLzL9mpwJH6qOtBIsC+iX0RP5tXSBI7mTIgBB+ko=;
        b=qX+HPGt1ydnkxe9gq5EfsZpPTt+hdORNFQE5bUvNb299if9aCxm8rE/G9of6q/zOpj
         624qxvtalFcW9ErL//7XKU2PkdAU9ymhLZRrflp8xuF8YEiXBU7HhXzicSHx3eARRN2R
         9kt9l5O/B8y9YEqTLSPAZ7j1rSzjJAJFzYde/uh2kVD95FLYm5MW67RzsfglyoNTkj1D
         9b1gHECHlRWXw8CkIE1I3OFlztIMJzYmTNfEXtkkEutzX9mEe/bdMP2qeII1+SCPbu50
         6pjtTpdyLwwMFzo4Eeb6fPOwDy7yxPaUGms8Hlq5a8visANyAHvaEiQj7bN8N8UlYsF5
         +W1w==
X-Gm-Message-State: AOAM531sMX/pBck3cooWnuZrOOxSAuZ+EvbzkCm+kV+UuDsxqYdqDDRJ
        lS2AZzu8ipcFNBLEmCCDRACND6+YkQ8=
X-Google-Smtp-Source: ABdhPJx6VEV2buXjwab7UTyGt8ACVXT1Ud/GGOROQzk6/vNN77o3I+vM4Gi2D6bHNlHB7MY0dlwgow==
X-Received: by 2002:a19:8ad4:: with SMTP id m203mr286277lfd.183.1599346437737;
        Sat, 05 Sep 2020 15:53:57 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id 18sm3107524lfg.29.2020.09.05.15.53.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Sep 2020 15:53:57 -0700 (PDT)
Subject: Re: [PATCH v4 30/31] i2c: tegra: Clean up and improve comments
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200905204151.25343-1-digetx@gmail.com>
 <20200905204151.25343-31-digetx@gmail.com>
 <20200905224702.GD18554@qmqm.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <45bd0bc9-a3a8-c9fa-24aa-23ae7a4182c2@gmail.com>
Date:   Sun, 6 Sep 2020 01:53:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200905224702.GD18554@qmqm.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

06.09.2020 01:47, Michał Mirosław пишет:
> On Sat, Sep 05, 2020 at 11:41:50PM +0300, Dmitry Osipenko wrote:
>> Make all comments to be consistent in regards to capitalization and
>> punctuation, correct spelling and grammar errors.
> [...]
>> -	/* Rounds down to not include partial word at the end of buf */
>> +	/* rounds down to not include partial word at the end of buffer */
>>  	words_to_transfer = buf_remaining / BYTES_PER_FIFO_WORD;
>>  
>> -	/* It's very common to have < 4 bytes, so optimize that case. */
>> +	/* it's very common to have < 4 bytes, so optimize that case */
>>  	if (words_to_transfer) {
>>  		if (words_to_transfer > tx_fifo_avail)
>>  			words_to_transfer = tx_fifo_avail;
>>  
>>  		/*
>> -		 * Update state before writing to FIFO.  If this casues us
>> +		 * Update state before writing to FIFO.  If this causes us
>>  		 * to finish writing all bytes (AKA buf_remaining goes to 0) we
>>  		 * have a potential for an interrupt (PACKET_XFER_COMPLETE is
>>  		 * not maskable).  We need to make sure that the isr sees
>> @@ -800,8 +799,8 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
>>  	}
> 
> Those first letters don't look consistently capitalized. :-)

In my experience, the more common kernel style is a lowercase for
single-line comments and the opposite for the multi-line comments.
Hence, should be good. If you're meaning something else, then please
clarify.
