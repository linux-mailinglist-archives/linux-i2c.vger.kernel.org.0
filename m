Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 127DA492F6C
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jan 2022 21:34:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233125AbiARUeC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Jan 2022 15:34:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349215AbiARUeC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Jan 2022 15:34:02 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4A90C061574;
        Tue, 18 Jan 2022 12:34:01 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id s30so169723lfo.7;
        Tue, 18 Jan 2022 12:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=4KiSRYNU3dEoSIxZgfjmsEi9gh2lmzCxmuoV7SZWZUc=;
        b=C0vcenroANcLWxZ4utwH2h1z5RHY8FPUk7RDDoqeXCZOCeb5tN+2JcPTsbqiEC0ClU
         tLsGeQrhivj7yvAK+HpKHWSOPXEWvq3N2SGVjl+afF8uJbliVKgQTcPenIGTIAJTEJlL
         3fD7GTNpevJiPx7PTIdnLEssZRKVGdZ31DHv5uzyS0Fc6AqB3Ze3M/Q802jccgU84CCF
         uFFAIhJFmMoKP4wBAc6X6qg5hP0+haYb0cNS3i7Om8asOl2rSDa8puX4oUCLRjBvPpWl
         YPBKEuPGsxdOTpa+91TWuh0tfc7I5rPrPqpxn8egHNsImHVQtRaEeOg7zSmlgO4U+gLR
         N9ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4KiSRYNU3dEoSIxZgfjmsEi9gh2lmzCxmuoV7SZWZUc=;
        b=fD11rbtYG8/3kIvZmw1bkYb2Spo2sVofqyrFsPwDJtmXoEHAjwxiyGqn6sz8ZuCb3d
         9xLnrdQwRl64CQp8LHwhsVSljPYhkNLYB+7S95oQhmUoOy51gPKljm0VBJ/gK7jrgheT
         vZjaeDquufC4XsZMwBzeKEiD7QBVEfiYDnxC8LnD5htOM3MwuVL8d3/JjARBFt+m9ZdM
         nay2ay/MjVhK3v0f/JI9L6FyfHxVh5Fi4MTuBH1IVWpwG66ym9mPhwyhjY9B1Rs+volx
         GTXO+EGyiAaIbuOwJnNIXrTr8vuOKHbRj6tfbt7mRWw+eMmeO55N6A0iRZ9J1esWDSzC
         c5xQ==
X-Gm-Message-State: AOAM5325z316mrZjrFxfvaMgwMTv2VEyFj95AEAd3vPT6AztHSPWj53g
        Z5XuiTCOa+uG3JCXvdG3sbY=
X-Google-Smtp-Source: ABdhPJzVbPv/I+bzGSNNcJwxDdPU7QQyaFKs3K9fZA4PGy9r5uq799uf4EkK+Ci9WyqbK/lJroiCpA==
X-Received: by 2002:a05:6512:1148:: with SMTP id m8mr17949894lfg.424.1642538040156;
        Tue, 18 Jan 2022 12:34:00 -0800 (PST)
Received: from [192.168.2.145] (46-138-227-157.dynamic.spd-mgts.ru. [46.138.227.157])
        by smtp.googlemail.com with ESMTPSA id e26sm1795901lfn.159.2022.01.18.12.33.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jan 2022 12:33:59 -0800 (PST)
Message-ID: <522fa061-4d4b-a135-51bd-e265b2476b93@gmail.com>
Date:   Tue, 18 Jan 2022 23:33:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/2] i2c: tegra: allow VI support to be compiled out
Content-Language: en-US
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1642535860.git.mirq-linux@rere.qmqm.pl>
 <fd14f1e81691f9655ea2ad58692df94dd2830230.1642535860.git.mirq-linux@rere.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <fd14f1e81691f9655ea2ad58692df94dd2830230.1642535860.git.mirq-linux@rere.qmqm.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

18.01.2022 23:00, Michał Mirosław пишет:
> Save a bit of code for older Tegra platforms by compiling out
> VI's I2C mode support that's used only for Tegra210.
> 
> $ size i2c-tegra.o
>    text    data     bss     dec     hex filename
>   10385     240       8   10633    2989 i2c-tegra.o (full)
>    9617     240       8    9865    2689 i2c-tegra.o (no-dvc)
>    9389     240       8    9637    25a5 i2c-tegra.o (no-vi)
>    8617     240       8    8865    22a1 i2c-tegra.o (no-vi,no-dvc)
> 
> ---
> v2: remove KConfig symbol as per Dmitry Osipenko's suggestion.
>     (Assuming that for Tegra210 the VI part will be used anyway.)
> 
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>


