Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8518A258DD7
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Sep 2020 14:04:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727924AbgIAMEJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Sep 2020 08:04:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726928AbgIAMD6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Sep 2020 08:03:58 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA239C061244;
        Tue,  1 Sep 2020 05:03:23 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id z19so359635lfr.4;
        Tue, 01 Sep 2020 05:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yqgydO8pVexduRrHyF4+etAinhWYfI4X4YaMfoX6cu4=;
        b=mK2/sFCnPbFjpT38ktp0LzS2hAKUMne9uAWmlXGAB17GeJZ3hfxmmvH7iJvxpVvqzy
         wUXlKHC+HngQWsOqAzIFxx9f7ehzCIuHp1sAWf9mwt/8jYUQ+T1HFQWsB6r3a+HParfg
         k4fl0vq8KwDKUnlDtWaEzX8ovHP5YqTG6wot0IwW6t7GseRi9amJZaAVBL8bFw3CE8Ly
         gy+Pb9m/6bE0pMZRljc8U2eOUG71jDeXhuFS8YtJlIWQLFdYLEgOIIsG4a32HOFhlNzc
         yP1tWCrHkXyihkcH57a7q1P4jb4XAcVS1bh07Isrg97RqPxCazze10zlgyI+VujxD2VK
         ghEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yqgydO8pVexduRrHyF4+etAinhWYfI4X4YaMfoX6cu4=;
        b=BGTuYKPDDsg2nSP32vthFRio7yIJgcco1bUd6/HtAyso0JrfS/kImwJcC/ueEpG2pk
         gU+0Jc4rr+faOovlAwh09b8pCcKM3VrIOiACYlYOJsWD7vjWYxbAH3IGL3jtXhCte6Vu
         5vn4lm1Ouvwqx4+CjNU5v7pIT/ryds0CLrcCQWRNfj3U4JHMRyVmErf/bs2csW5kn3xn
         UC0DBvRBh96OBzQ2s5/xeTqjtsci68Qqqu3MSpLkaH5l/mpGzVXUUoaGuTGk9GYfd16/
         MNHaybrKNXGIhgGxztr4K2HAAu8mxfMnZHGMqh0d2XGS3UVx2+RwzbfxBBRnfW6eA2Fe
         V/gQ==
X-Gm-Message-State: AOAM5337up+X+qEkcaopJKD65le96d/qnpNvgWepkxOPNn/t7MUD+AdW
        DFK/T6o06nuFc5AmHpsT707yrjq+hG8=
X-Google-Smtp-Source: ABdhPJw6NRBIQkGM/lVrzFTyA/HCVLYkaeLiPnIZG5kbQH0pGqCxE2KRQUz8ruCNn615tkJdtrb/tw==
X-Received: by 2002:ac2:5547:: with SMTP id l7mr429877lfk.153.1598961801896;
        Tue, 01 Sep 2020 05:03:21 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id j10sm241221lfh.37.2020.09.01.05.03.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2020 05:03:21 -0700 (PDT)
Subject: Re: [PATCH v1 03/12] i2c: tegra: Clean up messages in the code
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200831202303.15391-1-digetx@gmail.com>
 <20200831202303.15391-4-digetx@gmail.com>
Message-ID: <e31b01de-9e9c-e153-ca98-3d49df2ba356@gmail.com>
Date:   Tue, 1 Sep 2020 15:03:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200831202303.15391-4-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

31.08.2020 23:22, Dmitry Osipenko пишет:
> Use lowercase and consistent wording for all messages in the code.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 50 ++++++++++++++++------------------
>  1 file changed, 24 insertions(+), 26 deletions(-)

I'll prepare a v2 because today noticed that there are couple places in
the code that I missed to change in this patch. I'll also add couple
more patches.
