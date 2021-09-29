Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19A5A41BFC5
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Sep 2021 09:20:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244568AbhI2HVv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Sep 2021 03:21:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244561AbhI2HVv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Sep 2021 03:21:51 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55157C06161C;
        Wed, 29 Sep 2021 00:20:10 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id z24so6628224lfu.13;
        Wed, 29 Sep 2021 00:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ivSjBMiknUtK/G9F8IN6EmQkvTCaKoqitHBmZt+NYuI=;
        b=A3GkN/ZPVr5HhPbvPb1ssCp0DS8U8LPttpuScBxNtOn8myqvp6vvqJtIxC1nkm6vuX
         Hohegugl2oiYytx51mM9J7+9yFQTiskIAoUauQbsBYdFhdsHD9jt71CptkbzMe0iUwtg
         IKM1J7vGGMk30s7mDrvY/yXf5Nas8hMhRQzBltR599SYyhTPhn6di1Y78wxzhF5/6H5j
         EYg315JFS1xKdHqNAjXPGPzPRX7NVtJJAZ5KV/LxW9VeUt1edwIvSGiZjbT3wSOFr+CX
         YPdPCaVCmG3obbN2yaM4u5yEVh14LnnlqiU7J5Jhq2WhCfKtUG7vZNWilKqA/L5jTKEd
         12ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ivSjBMiknUtK/G9F8IN6EmQkvTCaKoqitHBmZt+NYuI=;
        b=DS3zKGWKRF7n3hD5Wn6pAk7vSmrweIrJZTUEUfUnenA0o12EQMGm/3o2q2/6S2i/kZ
         GE9hUUKriZTPT7dp52NykmxP4OHE0taSvc6djf+ySmXHvoZHo3EAHkI7UwdFRZOHrfqT
         +TaNSC5iPhfKWdCKg2Q5+YwK2j0VVvmrjONLMMo1w7Mfz7MyG69jXXSQ/WZIgDBmt1Oi
         mBcZ7WElecQxPhhTN6Tp5eM+0nkCW4zi/yr5zOPGmJ1CzVkz5e+J+Qm/jEeEzUCrC4hN
         M+L8PMdBTR9NdwFmqEvBBATXxg3YP4QIj0UjcESzk3pG+Re1xKo94B7T42ILS9zHGMNq
         rdrQ==
X-Gm-Message-State: AOAM531RbLzn9L7ZnKr4FXhfd98vqM80FMTy6Wplg6gB3EkJvgShP3ju
        FGSFcSW7GcZmGxUnVd+UIsI=
X-Google-Smtp-Source: ABdhPJx//GZQ7qn0vbjndvTJFoA+3YFBOWPisLoTOPDqYfUy3mbnT03pMy6AoAFXomwERV5GYR8MDw==
X-Received: by 2002:ac2:4466:: with SMTP id y6mr6156047lfl.278.1632900008781;
        Wed, 29 Sep 2021 00:20:08 -0700 (PDT)
Received: from [192.168.2.145] (46-138-80-108.dynamic.spd-mgts.ru. [46.138.80.108])
        by smtp.googlemail.com with ESMTPSA id l11sm144491lfg.39.2021.09.29.00.20.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Sep 2021 00:20:08 -0700 (PDT)
Subject: Re: [PATCH v1 2/2] i2c:busses:Read and Write routines for PCI1XXXX
 I2C module
To:     LakshmiPraveen Kopparthi <LakshmiPraveen.Kopparthi@microchip.com>,
        wsa@kernel.org, andriy.shevchenko@linux.intel.com,
        treding@nvidia.com, mirq-linux@rere.qmqm.pl, s.shtylyov@omp.ru,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     UNGLinuxDriver@microchip.com
References: <20210929062215.23905-1-LakshmiPraveen.Kopparthi@microchip.com>
 <20210929062215.23905-3-LakshmiPraveen.Kopparthi@microchip.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ff447184-b510-4e70-c941-1f0c5b7d0fb5@gmail.com>
Date:   Wed, 29 Sep 2021 10:20:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210929062215.23905-3-LakshmiPraveen.Kopparthi@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

29.09.2021 09:22, LakshmiPraveen Kopparthi пишет:
> Read and Write callbacks for PCI1XXXX I2C adapter is added.
> 
> Signed-off-by: LakshmiPraveen Kopparthi <LakshmiPraveen.Kopparthi@microchip.com>
> ---
>  drivers/i2c/busses/i2c-mchp-pci1xxxx.c | 485 +++++++++++++++++++++++++
>  1 file changed, 485 insertions(+)

Why this is a separate patch?
