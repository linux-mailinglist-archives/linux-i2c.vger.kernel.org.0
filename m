Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD08125CD52
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Sep 2020 00:18:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728491AbgICWSU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Sep 2020 18:18:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727065AbgICWST (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Sep 2020 18:18:19 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54CAAC061244;
        Thu,  3 Sep 2020 15:18:19 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id v23so5661552ljd.1;
        Thu, 03 Sep 2020 15:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=L6OYjrBWLMGkLZUDNUHAcsUTScuiU6WSVwlqzVd6Pzc=;
        b=TWyRrvJAvb5keY81T6x3lfqcDecwPzWx87ybAGWLnxTvc0Rha1udM7jn+nGN8AbBoX
         /PPf1Jd2rpVcEBSnypYGZTUFD8BZoNRbJPQjnHXQphg4fL0cLyA3WB+SmZOB9DvHkH1s
         2pje8dwelv9GhEcpHe/t1X6caFRA75du5buyYrB/0o6kdzGdyg4w05FVo3l6Af6iPKEl
         DkfCwypiyhMfHKUEq9OSDThzRqYH5aCTQ/nIloDqhLezdVbDD2dfIAAQiYGucHtFY0yl
         mbFNZUh7A9Fm9fL2eJrmeSyrp2mF3C22jcATK3HfQ+q/hx5dWhWRoWguSBy34/nG+rxO
         hRzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=L6OYjrBWLMGkLZUDNUHAcsUTScuiU6WSVwlqzVd6Pzc=;
        b=eFVaeUHOuvODiP4bKhjtTdaTPodYq24idoKW7mRYHI5kZKlFveu/HyU86OTq+cdGRd
         6bG17rL8nXYQu0N6KhS+1jPYSqZaHFsnCr23+JH9Cn0jThJWOUnIpjV0ydGI0XBLaSpP
         /CElyTO0HtMe802Ahczhnmc2aE7Vt70sVj6Rhmy/4dbgGJMITbp4R9SjfSvguW77kQ8M
         dUGYx1U+JY+21BAy0I+EFfMdDgzRRuzqmW3OjoRKAZE8fqjMeaRdvdL2omXLb4CROGIt
         77EfcfybIG3fajFg488X+StUnuSG094vcGmoWk2Nr1lCotcldiXE42jODS8D4fsayUYI
         WhwA==
X-Gm-Message-State: AOAM531fE3P4v4xG5zsetOZQuBmSVjW/CkM4z9InhnwWAyPXCs7baNG+
        TfqNABHvQ6sBo2ie345rw2nGt6piB/M=
X-Google-Smtp-Source: ABdhPJz5Ov+gqdpL+IzGjoOMfvZX5CXv7ChYUyHXwOI1HZaIVfBMeKzxeSNXqrpHCrWgQ4/DFUn0Xw==
X-Received: by 2002:a2e:9d8e:: with SMTP id c14mr1019646ljj.135.1599171497517;
        Thu, 03 Sep 2020 15:18:17 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id c13sm855258lfi.76.2020.09.03.15.18.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2020 15:18:16 -0700 (PDT)
Subject: Re: [PATCH v1 00/12] Improvements for Tegra I2C driver
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200831202303.15391-1-digetx@gmail.com>
 <20200902212026.GD1624@qmqm.qmqm.pl>
 <04aae642-80f9-d22e-1d80-bb206bb27a8b@gmail.com>
 <20200903164709.GA7406@qmqm.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e1b7a9fc-e638-8576-a79e-7c2cf1cfbfe2@gmail.com>
Date:   Fri, 4 Sep 2020 01:18:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200903164709.GA7406@qmqm.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

03.09.2020 19:47, Michał Mirosław пишет:
> On Thu, Sep 03, 2020 at 04:12:13AM +0300, Dmitry Osipenko wrote:
>> 03.09.2020 00:20, Michał Mirosław пишет:
>>> BTW, I wonder if you could expose i2c_in_atomic_xfer_mode() and use it
>>> to differentiate atomic_xfer from normal and get rid of the internal
>>> flag and .master_xfer_atomic callback.
>>
>> The atomic transfer uses 90% of the code path that a non-atomic transfer
>> uses. I don't see how it could be exposed without duplicated lots of the
>> code, unless I'm not missing what you're suggesting.
> 
> The I2C core falls back to .master_xfer even in atomic mode if
> .master_xfer_atomic is NULL, so what I'm suggesting is to make
> i2c_in_atomic_xfer_mode() public (from i2c-core.h) and use it in
> normal .master_xfer to choose atomic wait variants.

Okay, I see now. But the I2C core prints a noisy warning if
master_xfer_atomic is NULL in atomic transfer, so I'm not sure whether
changing all that code will bring much benefits to us and anyone else.
It's a bit too questionable change to me, but maybe I'm still missing
something. Will be great if you could provide an example patch.
