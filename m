Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D52422B03D
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jul 2020 15:17:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729094AbgGWNQ5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Jul 2020 09:16:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728995AbgGWNQ5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Jul 2020 09:16:57 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C6E3C0619DC;
        Thu, 23 Jul 2020 06:16:57 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id k13so3265331lfo.0;
        Thu, 23 Jul 2020 06:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GmCMT34g8ctOCOCVfFM1nrNLazMMxhc+MB6jd0U3TGo=;
        b=umpSVN09bzTJrl03wDhE2YgP69AnhrgQBqU8w9n95xuU/mhp2jW1dqD3zGl5UXgSL3
         A9wR5tNA1p2IGvh14M7R3qNCUqH9dSiHPexXp+dDJnhxeaI4f5pF1AT+Go1OYjAn+ddH
         vXWRW9TO/zGrnysXkXIK5QWlB3IjU8mci91DLWCj1YMgesOyeFt03CedbS1Lbwzwi5OW
         dECzEewa/BNzmD+zKVityDakq04OGvaRNA1dKopkBo4naWd+tWJSSuGeObJPsbSfajKQ
         yljj7Xctvtfyv6TUyk25ZTkhSxrZQqK5pqPZHvv0YH1N6jvVioEq1zFJpxZzN0Q4wf8U
         hKUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GmCMT34g8ctOCOCVfFM1nrNLazMMxhc+MB6jd0U3TGo=;
        b=NzaJzmQcw9zBaUZtuAgFID2vOurJfeODdhDyIATQbFa8DYuBDSgwKl5GEsTN50BSbt
         6Khw2ZJBjHh2VpX2y5DrKeBfxzV++gL+iL8hN7EvFjfc6wNboiGAlzYJT2QMG7EWXK70
         xwCx2xO6jn9Wc25JnadYUF3r0TVvcCZs4d/i9LeoD+0y1+m9hFT/S/x2BG6M+lAhMrXA
         VZAt962IpsValP82QN2BE+r7ACiv4UmoY8iykQeiw18rn7ZDsshID5E14pOEOc8o6xIK
         MAFdqcyurqnfS9Xj1MjaA3Vhy2as2Ino7jwoETK4UZOy9HEDXmbyKRX2Tv1F3IveDfF5
         K/jg==
X-Gm-Message-State: AOAM533sZShVu+DAsBKQpU3hzRbMnHvIA5cIYaZzluPqxrNken2/dpFi
        M75NVVgt9em/K/vHmMUZEqs=
X-Google-Smtp-Source: ABdhPJw+qE88m/u4eqT5nEXl9rJpjx85vTvdr8Lim7ln0KVNM1LpmNjHhXwKKKk9bXKH8NayUnNbDQ==
X-Received: by 2002:a19:7111:: with SMTP id m17mr2315025lfc.156.1595510215559;
        Thu, 23 Jul 2020 06:16:55 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-76-12-16.pppoe.mtu-net.ru. [91.76.12.16])
        by smtp.googlemail.com with ESMTPSA id j2sm2740719lji.115.2020.07.23.06.16.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2020 06:16:54 -0700 (PDT)
Subject: Re: [PATCH 6/7] i2c: tegra: DMA support for t186 and t194
To:     Krishna Yarlagadda <kyarlagadda@nvidia.com>,
        linux-i2c@vger.kernel.org, thierry.reding@gmail.com
Cc:     jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, ldewangan@nvidia.com,
        smohammed@nvidia.com, rgumasta@nvidia.com
References: <1595506733-10307-1-git-send-email-kyarlagadda@nvidia.com>
 <1595506733-10307-6-git-send-email-kyarlagadda@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b71ae942-6d9e-f609-f4f6-87d0ce117175@gmail.com>
Date:   Thu, 23 Jul 2020 16:16:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1595506733-10307-6-git-send-email-kyarlagadda@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Krishna,

23.07.2020 15:18, Krishna Yarlagadda пишет:
...
>  static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
> @@ -1606,6 +1618,7 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
>  	.setup_hold_time_fast_fast_plus_mode = 0,
>  	.setup_hold_time_hs_mode = 0,
>  	.has_interface_timing_reg = true,
> +	.has_gpc_dma = true,

false

>  };
