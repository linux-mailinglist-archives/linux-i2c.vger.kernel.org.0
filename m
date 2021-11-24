Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B818445C985
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Nov 2021 17:05:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242574AbhKXQIc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Nov 2021 11:08:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229849AbhKXQIb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 24 Nov 2021 11:08:31 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD832C061574;
        Wed, 24 Nov 2021 08:05:21 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id b1so8438914lfs.13;
        Wed, 24 Nov 2021 08:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XaZL1gqGefL3we/nKaFes+6q80QBPA1qm8dyiAwLJtk=;
        b=JvocAoplJmBKFZX3YppjDDIfPCn6erSoH/8cS7ieRxpQvQU9lkBGkVm/twRJKwnLhu
         I3BawiPYHkOHcDVlzVnkPhrkWTWKwxw+ZCKJIQTMWvN4H09wJnKg/7wBq/6yyB/reMHA
         8bkNbqQHBWnpBQc7yJBzYiNsqDKjuoRVm5cYDqha+zcWXW5W64aR2B9TSsisc4JX4Jno
         PUBqy+Docg631q5XAV1+VX1TPXXgnViDug3VSGocGH44cyDbXvBEX/eRpH5oDJIwO1or
         mVXtQd9ICqWNgl18w6E6hbGq8KSnJ4sGIrdjJLiXOTIomzt9KvYWlIVJc2hzJ0eP+bnP
         Sw1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XaZL1gqGefL3we/nKaFes+6q80QBPA1qm8dyiAwLJtk=;
        b=BUvFmY91WEQ92+nwjQJCZ3RAXzN19kTkGrEqZQd+6syMiCCGYZEKfdXDNdaS+CKxNZ
         ee19CWbI+NUo+oGkjXu5kE9B+3eRU+HucTkQVeAcGR1tiyK1SAQ8M8V4L6mzVBG/wdnM
         LqBxA0nB2AF8OwfnDGxTE64udMgR60N0TDA9n7krb4FKyZykLr890Mo/25ZeWr6acVzm
         39TH2GSirUS9IK/eMCXBXa3i79p9JnqWOYCcJfZWG2yVUjRPRn8bCq0frwOSPemWXfkJ
         OkhVuPGaT9LoHh22JHUgiJGtC31tOgayfK+REmdqRXWrtcTHF6gQqr8G7k8x0ZMgDQB+
         3JCA==
X-Gm-Message-State: AOAM532kyKmue0y4xyhyr7CQ47OeJNwj4z+y/xDff8om9GRBEe33tV1A
        MFB30NB92Bug3BHCS+wPPao=
X-Google-Smtp-Source: ABdhPJxrdgHea8Krc6d9ZfZFMLQzyWZ6L75uGZec6KisbMsGo8JOFKZjsX4oRJUwAnPRr3c0zWOsZw==
X-Received: by 2002:a19:5e59:: with SMTP id z25mr16017187lfi.686.1637769919078;
        Wed, 24 Nov 2021 08:05:19 -0800 (PST)
Received: from [192.168.2.145] (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.googlemail.com with ESMTPSA id e14sm25124lfs.150.2021.11.24.08.05.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Nov 2021 08:05:18 -0800 (PST)
Subject: Re: [PATCH v2] i2c: tegra: Add ACPI support
To:     Akhil R <akhilrajeev@nvidia.com>,
        "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
        "christian.koenig@amd.com" <christian.koenig@amd.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>
Cc:     Shardar Mohammed <smohammed@nvidia.com>
References: <1637328734-20576-1-git-send-email-akhilrajeev@nvidia.com>
 <1637651753-5067-1-git-send-email-akhilrajeev@nvidia.com>
 <eebf20ea-6a7f-1120-5ad8-b6dc1f9935e6@gmail.com>
 <BN9PR12MB5273A7628D80076F4EF2CC69C0619@BN9PR12MB5273.namprd12.prod.outlook.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b06a5072-f0f4-c9f9-f9a2-8d76b4432415@gmail.com>
Date:   Wed, 24 Nov 2021 19:05:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <BN9PR12MB5273A7628D80076F4EF2CC69C0619@BN9PR12MB5273.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

24.11.2021 10:18, Akhil R пишет:
>> *i2c_dev)
>>>               i2c_dev->is_vi = true;
>>>  }
>> How are you going to differentiate the VI I2C from a non-VI? This doesn't look
>> right.
> This patch adds the ACPI support to only non-VI I2C. The device_ids in match table
> are added accordingly. I suppose, of_device_is_compatible always returns false as 
> there is no device tree. 
> Agree with the other comments.

Will the VI I2C have a different ACPI ID or how it's going to work?
