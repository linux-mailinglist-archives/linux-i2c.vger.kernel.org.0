Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C5EC25A0D5
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Sep 2020 23:37:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728254AbgIAVhf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Sep 2020 17:37:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728179AbgIAVhe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Sep 2020 17:37:34 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78F01C061244;
        Tue,  1 Sep 2020 14:37:32 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id v12so3342972ljc.10;
        Tue, 01 Sep 2020 14:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5T+g9DRQqay2PabjlLSj/X2sJw2Dpph5rvQ4ZUvPnIs=;
        b=n+1Am0Apg9IabuusVP/4fVRuYgL9+tynHNQeQp6G8FjopV6kJilZ9INYZ5haBgkKK8
         YuMIwjomp3ceqS9sq65t7uQOcAY5qgrKjblohnoTLNAAnZ8DY461wlHomP/fHf00/3js
         CKStdJlP1m7pjmNbC7iODcvjDINXvqByV7Pbje6fXsYdXhUJUVU+/0GK5SbtiuzUMDhm
         ViRaDoteJVjkj+FHVrUwQpDkz9wJoCV1sApSzBgEee7woo8tIrW+UpFiyg2arOfJ8/lZ
         4Lcgo5ntl8IchBKcl3T6WlkwqUptffEgYdy8+OOe64fZJFxc/LbmD8wXvPUMN1EjHnLd
         l8IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5T+g9DRQqay2PabjlLSj/X2sJw2Dpph5rvQ4ZUvPnIs=;
        b=pWdNnys3Xbp3rJzULFb7EC3rW+tounVFfEip0c7ypvSzXQNQih5l9FXyn28zknW9iC
         dF5Xj18pMHV6yy4CWqZMdEvaQQwb2pWndl9CXwDJaa/8LqwgWfkZmDcpm0TVWd2xqsn8
         ouBfwNoVu+OqlgCCFqIHS1MsObHu75/1Rge5xyPUN95au+a91tT7egupP+xesJAz+zIW
         KBLHrvglV0GCpagOu4clHXzkvmHBsp86A9mdBGAnpw8cAcq8GJKaNyPBf908fR8AEgAR
         HK1xnHxYhNvZ86NYNqaagiu8+EfxpgIGGEqWDq/JSnzah2volP+2r0EkOvORx1oTrWfx
         etAg==
X-Gm-Message-State: AOAM531VqEPi1wDWTNkzsxtsZkbMkZnbGMmGyDrwRH9WUgD/Lxpy8IBy
        uCddA97+tKWJlODRS49ixrejQcVPyuA=
X-Google-Smtp-Source: ABdhPJzuf3UbN7Jo3MJq20m+YQboZeEgPiVQkb3uTbaNUrUPHCOAN+2A/DNI61e1hV8L69sfLamkOg==
X-Received: by 2002:a2e:9643:: with SMTP id z3mr1710770ljh.282.1598996250679;
        Tue, 01 Sep 2020 14:37:30 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id l15sm521755lje.16.2020.09.01.14.37.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2020 14:37:30 -0700 (PDT)
Subject: Re: [PATCH v2 03/17] i2c: tegra: Clean up messages in the code
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20200901211102.11072-1-digetx@gmail.com>
 <20200901211102.11072-4-digetx@gmail.com>
 <CAHp75Vf9ETJMibQGe4Nx7n4703GtgO1XBsE1yGwsk3TaSPTDHw@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <9bc715d3-3065-d705-7349-5aacdac7cbbc@gmail.com>
Date:   Wed, 2 Sep 2020 00:37:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Vf9ETJMibQGe4Nx7n4703GtgO1XBsE1yGwsk3TaSPTDHw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

02.09.2020 00:23, Andy Shevchenko пишет:
> 
> 
> On Wednesday, September 2, 2020, Dmitry Osipenko <digetx@gmail.com
> <mailto:digetx@gmail.com>> wrote:
> 
>     Use lowercase and consistent wording for all messages in the code.
> 
> 
> Why? DMA is an abbreviation and reads in capital letters. FWIW, I don’t
> like bending English grammar.

The idea is to make messages to look less "noisy" in a log. Although, I
don't have strong preference in regards to the style and keeping the
capitalization of abbreviations would be okay too. All I really care
about is to make all messages to use one common style.

I'll consider returning the capitalization in the next revision, thank
you for the input!
