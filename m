Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 191A346EC82
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Dec 2021 17:04:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240757AbhLIQII (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Dec 2021 11:08:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236647AbhLIQIH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Dec 2021 11:08:07 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28CDAC061746;
        Thu,  9 Dec 2021 08:04:34 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id m12so9711089ljj.6;
        Thu, 09 Dec 2021 08:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=VyNNZFntqq/7S368iziv68PH8JNo+/JFrth8MiQPnN0=;
        b=IA7AoXxTmmSQDOR+7JKZHyzbrQBtcmUHlvjNOsI6VhwUlOOkWTKICCOXFWDtkJ5+9I
         zmOVovEwnkRPBJXuZusPYkhCOLHcCgFyE3xc/D0BrQ00tfWhCmYJJmylb1/Y6fqP08r4
         VtKTR9+q0cQqyn7osxibjswsFTnwV8iUVhUnqyGnYlwBNoMD36ugcWUATRYKTXR+EOBQ
         9Knz1bXER1N69YwSURq1/WRV9wNnH1jlUXPvem/b6QE7oAMoy997fsL6Z/0qTpEX9nmS
         INuhBlkVetXa9YG9Rht9GQgAMN1x5HZzyYFVQZm2Ut1XbKhxW0rDJG6vAPYZ3624XIpL
         vRfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VyNNZFntqq/7S368iziv68PH8JNo+/JFrth8MiQPnN0=;
        b=BIfp7Z8UIxalEDd5i/jZPGZ5p4pCjFVDONr/UxhCWVwB56+xPXC5tmISEfGwqCQTiu
         fbn0Fg+C/mxD5MSWXmY6HWQ/xqNV6dWCs9y9Hxx8B3325XoG5UAQW5XjCV/RCSAElVmc
         m9kWTqZKUvRZkmlb4q9eNKCg+T5sscr3QSc3FkOf3xZCVJeVtt9+J5q5TUSMkmjbEeSx
         IZqOgt4wOj7huKKWlU81PaSVMp47Lcq8inb4mAzmUCyOdJ00NxYzxiBIpfQ7vS9vRGKa
         AjYJ6isLyQ/u28fYKNluZ/gMHNg61C6Cq8nh9sUClN3u+TtPJma481MPZ6n8b4GjBMJZ
         SsHA==
X-Gm-Message-State: AOAM530gfTJ1Smcz6l5vR1pDzOCZx9JUQr7j76C9h7TUDwAL8wmUChog
        5BhDLwqvdC6kaF4OZWqL888XBUpghDM=
X-Google-Smtp-Source: ABdhPJyjIVIwTFb/jRVG1s/HtU+6iq+SlVSeTRgCyq6BgyCqa/f3O4tShJ7SxaDdE4z6Q6IQHg5qYA==
X-Received: by 2002:a2e:aa14:: with SMTP id bf20mr7025963ljb.376.1639065872006;
        Thu, 09 Dec 2021 08:04:32 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.googlemail.com with ESMTPSA id a23sm16158ljh.140.2021.12.09.08.04.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Dec 2021 08:04:31 -0800 (PST)
Subject: Re: [PATCH 0/2] Add SMBus features to Tegra I2C
To:     Akhil R <akhilrajeev@nvidia.com>, andy.shevchenko@gmail.com,
        christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
        jonathanh@nvidia.com, ldewangan@nvidia.com,
        linaro-mm-sig@lists.linaro.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-tegra@vger.kernel.org, p.zabel@pengutronix.de,
        sumit.semwal@linaro.org, thierry.reding@gmail.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org
References: <1639062321-18840-1-git-send-email-akhilrajeev@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e3deea6a-3854-e58c-0d27-602413f2a496@gmail.com>
Date:   Thu, 9 Dec 2021 19:04:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1639062321-18840-1-git-send-email-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

09.12.2021 18:05, Akhil R пишет:
> Add support for SMBus Alert and SMBus block read functions to
> i2c-tegra driver
> 
> Akhil R (2):
>   dt-bindings: i2c: tegra: Add SMBus feature properties
>   i2c: tegra: Add SMBus block read and SMBus alert functions
> 
>  .../devicetree/bindings/i2c/nvidia,tegra20-i2c.txt |  4 ++
>  drivers/i2c/busses/i2c-tegra.c                     | 54 +++++++++++++++++++++-
>  2 files changed, 57 insertions(+), 1 deletion(-)
> 

How this was tested? This series must include the DT patch. If there is
no real user in upstream for this feature, then I don't think that we
should bother at all about it.
