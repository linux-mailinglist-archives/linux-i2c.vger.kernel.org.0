Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB64A49230E
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jan 2022 10:46:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230154AbiARJqn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Jan 2022 04:46:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230116AbiARJqm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Jan 2022 04:46:42 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DBCEC061574;
        Tue, 18 Jan 2022 01:46:42 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id p27so56573785lfa.1;
        Tue, 18 Jan 2022 01:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=WpZ8j8uhqHu3qo3N42PIbnIhYCkTR89g6u/jXljqcvY=;
        b=piOTROQlx9b0Wv1YUfblJ3kAkIs7iGdJxr7cQb5BQOPMY01a4p1DyzOQC1AV8+pKO1
         BwJ6JeWI7Qsj8ePi3I6fz7a7aE4XGYWgRU2d6ofRX2mxZfolov/7hMC2pj5soFM/Le22
         2ve0cimnhhfY9fMvK/kzF2/+WTpjJryoocHIwVMk/7nk02jacBwatEkTyWlK75uKkqfL
         efVMDPI/O32Qv4mIx7stzsUnSPbA40wzEDDdSv4yaJ4rIr+4UdSHxUqyWj0+9CbcNKCw
         n170Cmcju5sdhgpwnBTLc06sIwReFL680dnLbdUzz6qght+BkV1mA8MJeEj7QcKQdGDZ
         NTYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=WpZ8j8uhqHu3qo3N42PIbnIhYCkTR89g6u/jXljqcvY=;
        b=56YWy79d72Nvs3E7JkdhrgUZNOoK17ywAjMXTOgL8mZLyW5Cn8wiXR+qZumPvw7Hll
         DghBO6nOZ8JCNli4UEEeEVRPfZv3WHDD/UV5JTPMVx5lSaV2tjr4ez2FZ3KpxW6ZMSEA
         1p8DFEhdBtgbooo09f/Vxi4Bu0pQWRhw6eXhj0SYkDuR1G3JhZyRcH2OeIV5sfxY5aC+
         /zkRck2RYGhWOyzkrQCVSmDsfjHnK2Slr0G59HItL8Uqo+LBRLdJcONpze4ifZpju/0y
         IYlMdQWF2Q68sVjKJjwbwNGnYPb6/zUiIRZ0P3U5H1+aa5aP+yBTu+ekmzi2UiQoAkoR
         FX4Q==
X-Gm-Message-State: AOAM533V9ZYRJI9TzRYjC9O0Fp/sVWAjUfOZ47iXXbr+N/Fsn39rajWE
        hphsmOemUrK/ODFB54pq2Mg=
X-Google-Smtp-Source: ABdhPJwWCFBuL+15nB4rou/LU6CdgWeovXuCAGKWyr9Y7K+u0nvzODgtV//Zx2YjmvFLRaHLH0CGMg==
X-Received: by 2002:a05:6512:280a:: with SMTP id cf10mr16945480lfb.539.1642499200918;
        Tue, 18 Jan 2022 01:46:40 -0800 (PST)
Received: from [192.168.2.145] (46-138-227-157.dynamic.spd-mgts.ru. [46.138.227.157])
        by smtp.googlemail.com with ESMTPSA id t13sm1585699lji.57.2022.01.18.01.46.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jan 2022 01:46:40 -0800 (PST)
Message-ID: <1db263bb-c424-16b2-d435-2c5429eb7bb9@gmail.com>
Date:   Tue, 18 Jan 2022 12:46:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] i2c: tegra: allow DVC support to be compiled out
Content-Language: en-US
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <cover.1642348712.git.mirq-linux@rere.qmqm.pl>
 <87d646818e2605dad62f82d73f8db3f61e70e1f0.1642348712.git.mirq-linux@rere.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <87d646818e2605dad62f82d73f8db3f61e70e1f0.1642348712.git.mirq-linux@rere.qmqm.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

16.01.2022 19:02, Michał Mirosław пишет:
> {
>  	{ .compatible = "nvidia,tegra114-i2c", .data = &tegra114_i2c_hw, },
>  	{ .compatible = "nvidia,tegra30-i2c", .data = &tegra30_i2c_hw, },
>  	{ .compatible = "nvidia,tegra20-i2c", .data = &tegra20_i2c_hw, },
> +#if IS_ENABLED(CONFIG_I2C_TEGRA_DVC)
>  	{ .compatible = "nvidia,tegra20-i2c-dvc", .data = &tegra20_i2c_hw, },
> +#endif

You can use IS_ENABLED(ARCH_TEGRA_2x_SOC), and similar for T210. Then
you won't need to add new Kconfig entries.
