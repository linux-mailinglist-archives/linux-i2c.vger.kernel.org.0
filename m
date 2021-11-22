Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 843B3458C53
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Nov 2021 11:33:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236310AbhKVKgq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Nov 2021 05:36:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236258AbhKVKgp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Nov 2021 05:36:45 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F867C061574;
        Mon, 22 Nov 2021 02:33:39 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id u3so78383964lfl.2;
        Mon, 22 Nov 2021 02:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nrxZZZTUaK5PX2ySh0+vBqyiZXpekCDZnPCBfoLVNj8=;
        b=PBRfkEeYxsKR7JApIAGoA9f/5z9fI/wiXjTBCL/PUUL1M2yf5L99Ocjs/ID34wmvxa
         ccVyhqkPjMrZv4YC2K9g8y0Kl2IwE2TDrDfFwuKfwdYzl03rFrnAtp0KdET7oL4woquF
         ya5NXRIbVvBsW6inbrBMwE2COQ5KdwVw7H+8QvYJrKtyZLgPm2weo4ZK1YkCxrL1qFgZ
         g7TRwzqICHBaHaCME6zIkKdp59ENCOXAeiL/SyD0GjqLDrkNS4HPOQY71Qeuf5OZxcs/
         YXF6rI5t9FtGjjObSRj3mJ+MkWoQa+8wwxDn3fDsNmNj9e+vUt9IrL0w9IsjoNGc1Lf3
         6plw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nrxZZZTUaK5PX2ySh0+vBqyiZXpekCDZnPCBfoLVNj8=;
        b=V5/vz1EtFUEZNXyHb/yB7be03nQB1F2lRDhBLAD5uXDe71F6eH3Ls/tSnuIhCe87w1
         +6DA50ESvwBfAUdSJ6UzYOTNn2F6bJ2fwefx9qOBFFBA+ry88mhOf5tpHwPhXB247dez
         AKKnvCQyOTuST3T7t3cc4nY+dr0F8QjxVboXXSTezZjCOE1X3CceU4QSHoF4UfIAL+n5
         dnHXbGT4sulNVXOOsqiYP+4AMDhrqE+B7QtUybMWM3xAG9AKtJwiV6qXNBFaCuOf2oeG
         J0x4vD4p8qQ25E1D1dou+/q8Xp/SBXQrkAiuWuZ4YCVeBnCfBNLBUSPBZoFs3Ay62AL9
         WbZA==
X-Gm-Message-State: AOAM531Du/Kup4/2ucWYOXP5QimecG+yTBoxtEqD1H6TZGz8kXauj5tB
        05aZGuytcG4hLuAMva/0puU=
X-Google-Smtp-Source: ABdhPJzZ/qm5LLGImo0I/3G8kIkfGaa7D9I8/JdE3U3vap72N3xDDHAzVRpK4BfX2bx0KTP6BS+BIA==
X-Received: by 2002:a2e:6a11:: with SMTP id f17mr49823727ljc.206.1637577217813;
        Mon, 22 Nov 2021 02:33:37 -0800 (PST)
Received: from [192.168.2.145] (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.googlemail.com with ESMTPSA id x4sm898633ljd.1.2021.11.22.02.33.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Nov 2021 02:33:36 -0800 (PST)
Subject: Re: [PATCH] i2c: tegra: Add ACPI support
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Akhil R <akhilrajeev@nvidia.com>
Cc:     Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian Koenig <christian.koenig@amd.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linaro-mm-sig@lists.linaro.org
References: <1637328734-20576-1-git-send-email-akhilrajeev@nvidia.com>
 <CAHp75Vfi5gw4jnJg2bmubKMB_H8s09PfNWVVZWwewuCnW5_+hg@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f213eb06-7b07-b01b-786d-4435a59d4fc3@gmail.com>
Date:   Mon, 22 Nov 2021 13:33:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Vfi5gw4jnJg2bmubKMB_H8s09PfNWVVZWwewuCnW5_+hg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

19.11.2021 17:48, Andy Shevchenko пишет:
>> +       if (i2c_dev->nclocks == 0)
>> +               return;
> Why? Make clocks optional.

This check shouldn't be needed because both clk_disable() and
clk_bulk_unprepare() should handle NULL/zero clocks without problems.
