Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14AEB48FE3E
	for <lists+linux-i2c@lfdr.de>; Sun, 16 Jan 2022 18:54:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230456AbiAPRyN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 16 Jan 2022 12:54:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230174AbiAPRyM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 16 Jan 2022 12:54:12 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A00A1C061574;
        Sun, 16 Jan 2022 09:54:11 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id e3so46342315lfc.9;
        Sun, 16 Jan 2022 09:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+FwywsmeKxCvqz366I7pw78v5C+rzvcwSFpFisGArd8=;
        b=SHmCb9Ix2ZOU7lgCI9KWTqe91Wt4Q0kUzz3UNC7982BILZQkZgpMHOONHG+HBvE/o6
         9O5uGeLoio2EncHZvD5iftz8DnPMgYMKXwRs7/N7b7vmIH3HZj7wFvd4gbh+ghXaRpPg
         my49ZZ6J+azPqmFFhzKxpFtXCv3++jkrV3nTMQsqh+MY8HRiAlLbjEzL6tC4LB9ib7iQ
         96bAnnpp3gbMHAQgJODvHuxOegNh7cDDeKT/X7YU0sJuH4e43VHwE5HQVRgCafq6tDZb
         DHV66sX8QVCfPa4GwkBnWlFDUf1oknkNcFmFQUebfe9isHKoEzD34iq4Kur1VxaY56SM
         cH7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+FwywsmeKxCvqz366I7pw78v5C+rzvcwSFpFisGArd8=;
        b=f7ph7nJw5277gnSUjBycdcQZsiknnboAMfigwPEL4A0UcmVeH+mGO1YWRZrWAURf6W
         Fu4CqD4CFEQINPsJWa5VnWfOFuSSiH0XYXYXzRzUy3aEPAQBO81kJZP9YAkKO3Yb8Zzy
         8/aPmgG/hoNHKFDnKRzzwGTQjoPgGiFbQo07wP7qcY5YEZIt3hcCLHbuxU05208Kct0D
         g0eMlQsJmbcG8bZNt0F9FffWPlPqYrOPFOQUKEz1IU6vPIm6BO3eJH9gyhe379W9/+0S
         pjgFZD0koIvkAuEtuaSNIZC1CCqjMgzR+RJMWv258oUI8zPaGtqBndp1FJlhySA5NltY
         jNRg==
X-Gm-Message-State: AOAM532/6c9mPG6zHUIQsbpoVn6X3ttXy89+eiPzy+lfs5Lh3/J1U+72
        TlD1X1JPu7msNnFs8MDV4LkvFAn7VTs=
X-Google-Smtp-Source: ABdhPJxhoFluSDEIVijugDkxVn4Lxyg98P5p+RJ0v6ZBCHTbyRgLaGSCFwcJI9NQFGGgBz6K53ioTw==
X-Received: by 2002:a05:651c:1304:: with SMTP id u4mr5036791lja.49.1642355649594;
        Sun, 16 Jan 2022 09:54:09 -0800 (PST)
Received: from [192.168.2.145] (46-138-227-157.dynamic.spd-mgts.ru. [46.138.227.157])
        by smtp.googlemail.com with ESMTPSA id m3sm1174498lfr.60.2022.01.16.09.54.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Jan 2022 09:54:09 -0800 (PST)
Subject: Re: [PATCH 0/2] i2c: tegra: allow compiling out support for Tegra's
 special constrollers
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <cover.1642348712.git.mirq-linux@rere.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ea9ab0b7-022b-93e2-ed7d-dccfa95bd900@gmail.com>
Date:   Sun, 16 Jan 2022 20:54:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <cover.1642348712.git.mirq-linux@rere.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

16.01.2022 19:02, Michał Mirosław пишет:
> To patches that, combined, reduce I2C driver's code by ~2kB and a bit
> from runtime overhead for non-Tegra20 or non-Tegra210 builds.
> 
> Michał Mirosław (2):
>   i2c: tegra: allow DVC support to be compiled out
>   i2c: tegra: allow VI support to be compiled out
> 
>  drivers/i2c/busses/Kconfig     | 16 ++++++++++++++++
>  drivers/i2c/busses/i2c-tegra.c | 35 +++++++++++++++++++++-------------
>  2 files changed, 38 insertions(+), 13 deletions(-)
> 

2KB is a too small difference to justify the ifdefs and Kconfig entries,
IMO.
