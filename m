Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54B63222CB3
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jul 2020 22:25:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725926AbgGPUZX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Jul 2020 16:25:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725921AbgGPUZW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Jul 2020 16:25:22 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5285BC061755;
        Thu, 16 Jul 2020 13:25:22 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id d17so9810950ljl.3;
        Thu, 16 Jul 2020 13:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2B3j92dSMko8J2wSzj/MTkQ80Lgndi5SU2LXd/AvSxg=;
        b=fKlGp8tNNQTRc2pZ/k7DJXl/e+y+EMOltfn0ctkc5TBjudSyx4+OmmzC1cPseIz5TZ
         EhZ7SkVqtunfTCqDyTjnpz6enopRHyyFyicsv7j+SU1XozXwrLzP+j84rkTbX/9c5yag
         rydqve0KDjL7dKEwcDpd7oSgHp+Ato4HPEAvlKdEJp63yTjr7a1wUlMCNrz5gRc/dz4x
         2INFC8HTbOhvfnn7RMjv05K2XU/hrDQnPf1WHFo3IUn+hoRW3w23q+wrNabjbG+6zZ/H
         SjLTz7a4dTsXazlzCfKd8IPqfa0/ZL/rt7Nt/RE3iqc6VFScfw5RosF/CBvwsshburFx
         7zig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2B3j92dSMko8J2wSzj/MTkQ80Lgndi5SU2LXd/AvSxg=;
        b=HXcHexAI6XI+zJ5SeO782Wwr1vCJ2LnwgfuEpwlubaEHYNQgmHzSYj14C0xRWNCvGN
         L0GxIcohiFiZKyCjY8wkAlvkXkAAljhUCLBcXH8rTiAHzRyOsdyEjR8KriEwsBCrcgfx
         JDWcKRH1EDkNAJ2fndmW1r/Oha+h1ZbsoASn7UquqilekY3qMAkAyX7Cc8bbqzYeIE4C
         OuzwjKxgNVcG4RUGK8FMu0ybQSChSFGlv6Ay9aFuREPfEoHPmPyIWve7xaXRx6i5dEe6
         Y2N2KYhq0LvSz1LHUwW55fL9CT5sClakkXeNDRrozp01vneisoyABE3UA3M8PiUpPBfd
         f9cA==
X-Gm-Message-State: AOAM530B2Ii4eybm7t8mhOLY6KoMC9gL/UjwYv3AVl6dCwylaRuJ7zLz
        4Ot9MNfWYI1Dn71l547hTB8ixMj+
X-Google-Smtp-Source: ABdhPJyy6GDksC2tHtwyAvGIf4mNUlDUF9P1X/kNsZoQJmE7dlwHaYHrNOQbrgaWGK4EiTSpdMRW7A==
X-Received: by 2002:a2e:92d7:: with SMTP id k23mr2566872ljh.117.1594931120478;
        Thu, 16 Jul 2020 13:25:20 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-76-4-184.pppoe.mtu-net.ru. [91.76.4.184])
        by smtp.googlemail.com with ESMTPSA id j26sm1396678lfm.11.2020.07.16.13.25.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2020 13:25:19 -0700 (PDT)
Subject: Re: [RFC PATCH v3 04/18] i2c: tegra: Remove NULL pointer check before
 clk_enable/disable/prepare/unprepare
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, robh+dt@kernel.org,
        helen.koike@collabora.com
Cc:     sboyd@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <1594786855-26506-1-git-send-email-skomatineni@nvidia.com>
 <1594786855-26506-5-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <16e08405-8b71-e427-e675-6499e012a5b6@gmail.com>
Date:   Thu, 16 Jul 2020 23:25:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1594786855-26506-5-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

15.07.2020 07:20, Sowjanya Komatineni пишет:
> clk_enable, clk_disable, clk_prepare, and clk_unprepare APIs have
> implementation for checking clk pointer not NULL and clock consumers
> can safely call these APIs without NULL pointer check.
> 
> So, this patch cleans up Tegra i2c driver to remove explicit checks
> before these APIs.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---

Thanks!

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
