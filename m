Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45ECD25B825
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Sep 2020 03:12:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726312AbgICBMT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Sep 2020 21:12:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726377AbgICBMR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Sep 2020 21:12:17 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FA59C061244;
        Wed,  2 Sep 2020 18:12:16 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id e11so1454264ljn.6;
        Wed, 02 Sep 2020 18:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HWyY2LFPccisa6ogmHUBexCKCnlNWwIX+nu+DoCYsmE=;
        b=guqaV0S4Ftuo9redYgE2a8Zz9W5ZSsmbGAWy799wCCYoKEW67OHNdroEs3VvNnqlTN
         D2kVVURzkkDEDdbvx+GA/LG1/65M8Wmh0a4Kzpf7o3yLgBHt9VqUdz1CDhdwnkxiNVG7
         7HqIDGdCSgPGSb2jiysO4U8AB5qoiX7mdRDhswEIXPOkSi3CN6K3JmqhqEDDV2/YwNls
         SWsDU27WP8zzFb3m1+32gHqEtUsIcg1qSRMnQ24md5ZEhiQzzWFRd1UUg80bs1ibw3oy
         hZNOKAj6dHGbC/96QTCqB5HuB7ZMm6/bTFdi7HDLk7jpzHuwZiy7Zp5C76+JmILSHPn8
         VxOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HWyY2LFPccisa6ogmHUBexCKCnlNWwIX+nu+DoCYsmE=;
        b=nJjyt/G5TkmbMlZ8BtfQJGj9TH5O6EIpizFsPrg1mRV11Om84Pd9FGOCCarL7BA0qs
         qR5ElPiQyRovAVL4H8rXGBz2w3F1TeWnMeVONZpDbJFN4kTfIRDMq2oEYiRpE8TiMpkF
         8qg5UPaTQCk88x4a597HrtDRAKGQZUb6c6yVdirp6ykuCT1TKqwDplg+na3yYOE/vVgq
         NvK3zEAJOOphuuLDKqPbF8NMlHi453NrXJmMBcqKkyYtzIDjcqp7FpqB+OVwg0gVokgm
         nFoPSpCY5QvWBNo+CmIg5h9uQtk8XYWBDx3n9oJDXMbHrVup7SUeYYsZ6RyeCq/F71UU
         JA+A==
X-Gm-Message-State: AOAM530Z6K7YyWEzr1WQHYMoXpBuUdKOgbQwbx5RhnfYuGFoNircZ0wG
        Ua7DGsrsuAa29zRri3VwdDLazQN0EY8=
X-Google-Smtp-Source: ABdhPJxSBoHNBHXCOVuESr6mZH1Iq0HdxLcj4NGHT5uuFI0KKA61Xx3SAspeaWg+PiEGMnqWnY3xlQ==
X-Received: by 2002:a2e:711:: with SMTP id 17mr270235ljh.462.1599095534639;
        Wed, 02 Sep 2020 18:12:14 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id 18sm216680lfg.29.2020.09.02.18.12.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2020 18:12:14 -0700 (PDT)
Subject: Re: [PATCH v1 00/12] Improvements for Tegra I2C driver
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200831202303.15391-1-digetx@gmail.com>
 <20200902212026.GD1624@qmqm.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <04aae642-80f9-d22e-1d80-bb206bb27a8b@gmail.com>
Date:   Thu, 3 Sep 2020 04:12:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200902212026.GD1624@qmqm.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

03.09.2020 00:20, Michał Mirosław пишет:
> BTW, I wonder if you could expose i2c_in_atomic_xfer_mode() and use it
> to differentiate atomic_xfer from normal and get rid of the internal
> flag and .master_xfer_atomic callback.

The atomic transfer uses 90% of the code path that a non-atomic transfer
uses. I don't see how it could be exposed without duplicated lots of the
code, unless I'm not missing what you're suggesting.
