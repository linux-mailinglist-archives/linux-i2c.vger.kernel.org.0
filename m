Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CD4D492F6A
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jan 2022 21:34:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349064AbiARUeC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Jan 2022 15:34:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233125AbiARUeB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Jan 2022 15:34:01 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02CE5C061574;
        Tue, 18 Jan 2022 12:34:01 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id p27so281722lfa.1;
        Tue, 18 Jan 2022 12:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=YOoXZ5fmqgf47wT9od2Gk2XcnDz6yNAacGEgIzOL5RU=;
        b=DpeLAj85OBU+lLCoFpKnluQI+gaehDVbhIKjBUFf2mhLl7+MCCORlnJXIwxeuL8k2x
         0asRtfUT6alcz+mKPhdWENMUPftQ2Z3zHPWf4WBFx8rYwhzksbcQBPEQkNkgsWGDWdNr
         /cA3iMpwF2xgLN898GAdqMjdisQghHl9N2CEEKp5eFKYinhs6XRFB9KGbDNTNEBK256W
         2PVPiB8yAvsFpIhsYVZzLiSRQP7laIPzdd8Z4+1jIOeyYAr4zjZFjsYjBAAVDhY0mAYI
         e8pi8XsFyPYye1mo6yyHXIkzQOdsNfNcnV2A5osCXGbPW32zQHkpgtC74Tte9C1erxPn
         j9PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=YOoXZ5fmqgf47wT9od2Gk2XcnDz6yNAacGEgIzOL5RU=;
        b=tyBtoO1DD1aQxC/JlWBo74LHEkdjFxyk4l/cmOO7OSUzZ7BVCNTMEigybGpEzV83na
         6GNsifd/QcPUVWaVTdsydyX7PexkiX1TbPsZIQjJyy6FOpFR5coXQY/lc33D368gYZBY
         9G7ayk0EzoKhTCKM+JBvDLIAmrG8uoRUgHXUWoJ9MZDhgjlCA7QVoByVjBiMfpFSoU4y
         KmLUsJ3CBU4cWjMMebLe5zfg2VSFEE344WZl0Qhy7+i0tiy7RoTHIhJC6Z3HSS8pt3rg
         xzeyG6420EXQLCahSNonGxpw5btXLwTsT9WvBVPOtY9ClLUFeis9AJKZ1DFNoh5Itedc
         k9JA==
X-Gm-Message-State: AOAM531McszjS4ytSqqaWvHQNrg8YZQ+9Bn8JgBUu+y5OVF2QXIdB+Cb
        C+kbH6QdKpApQ5Ryh3NXMxUjnu7NXzw=
X-Google-Smtp-Source: ABdhPJzK7GKEaRKeU+FMnGENA+1pskWCzbefH8oZt/0UyM5JCFADc/h5ILb3ck3VZ32oJudLDkgdSA==
X-Received: by 2002:a05:651c:199e:: with SMTP id bx30mr6761209ljb.415.1642538039413;
        Tue, 18 Jan 2022 12:33:59 -0800 (PST)
Received: from [192.168.2.145] (46-138-227-157.dynamic.spd-mgts.ru. [46.138.227.157])
        by smtp.googlemail.com with ESMTPSA id p15sm1310350lfc.150.2022.01.18.12.33.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jan 2022 12:33:58 -0800 (PST)
Message-ID: <b86fb2be-289c-dcb1-df3b-63171b8a050b@gmail.com>
Date:   Tue, 18 Jan 2022 23:33:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/2] i2c: tegra: allow DVC support to be compiled out
Content-Language: en-US
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1642535860.git.mirq-linux@rere.qmqm.pl>
 <ebe847bb25016e743c28bd38a10c966b04b06cc8.1642535860.git.mirq-linux@rere.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <ebe847bb25016e743c28bd38a10c966b04b06cc8.1642535860.git.mirq-linux@rere.qmqm.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

18.01.2022 23:00, Michał Mirosław пишет:
> Save a bit of code for newer Tegra platforms by compiling out
> DVC's I2C mode support that's used only for Tegra2.
> 
> $ size i2c-tegra.o
>     text    data     bss     dec     hex filename
> -  10385     240       8   10633    2989 i2c-tegra.o
> +   9617     240       8    9865    2689 i2c-tegra.o
> 
> ---
> v2: remove KConfig symbol as per Dmitry Osipenko's suggestion.
>     (Assuming that for Tegra20 the DVC part will be used anyway.)
> 
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
