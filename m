Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F73734EDF2
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Mar 2021 18:34:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231874AbhC3Qdo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Mar 2021 12:33:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231532AbhC3QdO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Mar 2021 12:33:14 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 177C2C061574;
        Tue, 30 Mar 2021 09:33:14 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id r20so20605503ljk.4;
        Tue, 30 Mar 2021 09:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CT8db4cvO7S02JvPSHxU5rkG2mfIf4ddG0qsyFVMwQg=;
        b=mYtNOivmhosBZV9pv9FPhOg6FFD+pM7ldsuKQzXr7p7pN6zuP0nFJSRyMX9EcUKFM7
         iggu3rh8l3o/6NHebtNDsK1ENf8iI7IS3jnrOr+0Re0DaZXQAyvc0hVT1KUsHWfMzFYt
         yNrpFyMlV0zD4cOSXOvwJqkq1npPS9bLvSb+jRUbGvumByujBqp7DJZu++PrBOwslY83
         eQRocwOMM/bAGE0PO0VNyUPngEZv6wCdaOL8ZDfzA8vz7aMXVjznX3HKiMVH0ZCdrWxj
         uHV8CrDjt2EliaF6h3CnUwkwQypNNtPMlj5iBgGg+scKNveI+3/b7PpfFHo7SNf4pv55
         7HgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CT8db4cvO7S02JvPSHxU5rkG2mfIf4ddG0qsyFVMwQg=;
        b=nldW6lJYuDYgzeE85RHG3RMDWndCfHPTqd12eNxRdYv64WEL+RWso9DWL9n9MmxzHL
         Lg1Z3Q+w3OZy9ALcVzRRLSb5659WVgqznQoLvPwbtZKcCM1q+RSk/5Pt7Z6e4vTwfc/G
         71FklMqmf/ejpWdSGe1I35ioJKaVw22/dL9wVGh85g1tExbjgvc4dA8cIUEIcaEZ97bT
         NNx+8rQm6F64eza73bXDcpRYhdKBpjIwJtZe2q3D3c/quVD8yjcMfj38APtHOUz3aI1F
         ja4jyRh86ysu7ZCHBLU1ewYUU3No7hqvbAQ+19Vrga+DDSnurT3ol1bIrfU+WPGYTrEb
         xlXQ==
X-Gm-Message-State: AOAM531vmz2AhF8qn/8ihu8CR0lrfuk/SURgpZHZzoOp5eapIrn6MrYd
        vVHYLfYMjrlOlX8TOQ+786I=
X-Google-Smtp-Source: ABdhPJymTtBBXGNFYKmCOj16/tNmr/vkk/fDO+rYKifgTio/eBbOMNYIW9Ui9B361DJ/bQJMEJwmUA==
X-Received: by 2002:a2e:581d:: with SMTP id m29mr22237461ljb.97.1617121992676;
        Tue, 30 Mar 2021 09:33:12 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-98.dynamic.spd-mgts.ru. [109.252.193.98])
        by smtp.googlemail.com with ESMTPSA id t13sm2847634ljk.47.2021.03.30.09.33.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Mar 2021 09:33:12 -0700 (PDT)
Subject: Re: [PATCH v5 3/5] i2c: add support for HiSilicon I2C controller
To:     Yicong Yang <yangyicong@hisilicon.com>, wsa@kernel.org,
        andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org,
        Sergey.Semin@baikalelectronics.ru, linux-kernel@vger.kernel.org
Cc:     treding@nvidia.com, jarkko.nikula@linux.intel.com,
        rmk+kernel@armlinux.org.uk, song.bao.hua@hisilicon.com,
        john.garry@huawei.com, mika.westerberg@linux.intel.com,
        prime.zeng@huawei.com, linuxarm@huawei.com
References: <1617113966-40498-1-git-send-email-yangyicong@hisilicon.com>
 <1617113966-40498-4-git-send-email-yangyicong@hisilicon.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <58a43540-155c-36d0-94ca-453313dc005c@gmail.com>
Date:   Tue, 30 Mar 2021 19:33:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1617113966-40498-4-git-send-email-yangyicong@hisilicon.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

30.03.2021 17:19, Yicong Yang пишет:
> Add HiSilicon I2C controller driver for the Kunpeng SoC. It provides
> the access to the i2c busses, which connects to the eeprom, rtc, etc.
> 
> The driver works with IRQ mode, and supports basic I2C features and 10bit
> address. The DMA is not supported.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>  drivers/i2c/busses/Kconfig    |  10 +
>  drivers/i2c/busses/Makefile   |   1 +
>  drivers/i2c/busses/i2c-hisi.c | 506 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 517 insertions(+)
>  create mode 100644 drivers/i2c/busses/i2c-hisi.c
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
