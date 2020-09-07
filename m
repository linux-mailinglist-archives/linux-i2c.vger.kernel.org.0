Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DC4E25FF2E
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Sep 2020 18:29:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730369AbgIGQ2G (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Sep 2020 12:28:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729909AbgIGOcx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Sep 2020 10:32:53 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67994C061574;
        Mon,  7 Sep 2020 07:32:06 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id b19so16338459lji.11;
        Mon, 07 Sep 2020 07:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ofy7ZMVoqjvyTlxeeuL9h0P/hht6T3NltPSUDtHJ0KE=;
        b=vX+Z4WVx7eFg5vnkA4Jhui6+VxcDMXwA1C/U7uTPx9uZqE6ws2rUh7GD0mtWmLY+ut
         dsQvHx4ZQzcJirbpwQBb9Zu0YwSAnMhkxgqTI7z9fg6iQuxChmR+Fn7/ifxfaltZwUQC
         Wq5FVa6PiaaZ19rX2kTYhjkE5JJKiMn4BzVdX63eKkm4mSrjP5tozltKSAydkPXEkQ87
         eXBNbLnMBuDdQ1EK2tlY9asSEyAYdNnuV9ABAhcjlQRm1wqthpAr/QhcDdaYakTzGA1A
         rzUUnlFN/B9pk/AeCcQDf9JNaaEkGRC6bpgvM3gSpWxKafiBXu95NwVwIquohDRqttJn
         Zn1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ofy7ZMVoqjvyTlxeeuL9h0P/hht6T3NltPSUDtHJ0KE=;
        b=d269Qq/ycrZ891qqmPaQhOrxl/kLgV7xqyTVruwb4bHRLbD5IOAJt4efhVcFGPSmhR
         jVKy5iABAMMMX50FFPbdjZTM+jcFaSWdImGhelH8mQQxRC/KkqgpG1n+Z9DvaxSYGX6L
         IQGRSPjJiqdO7gN2stb0G7v1cMKbobboqaI2+hCpa7X6koi9B3sA/8X6sOYep7tYV+Ka
         s6zf675b6o0dLu7jmcRxLRdCD0TRtGxWcGmJL6AQ07kOHjP8e0+YB9jmEXPfP80jBGMZ
         BkI0F2KmHBNhcbk3XU2vpbilnwe2bBpj2UYw0lw3cX4tlODc8aaEfNmDK11ShPk12Ysr
         290A==
X-Gm-Message-State: AOAM533xKbV5bAnndtRDoRMkI1NzQjeEHtx8BoEldHLLHeIW57j86VCv
        o+mJ+/tjlQIQLPu/Ashty8tI1S1gD1g=
X-Google-Smtp-Source: ABdhPJwe7QvksfELWM6mw/4N9gawNqQNoQimqKF9TUdngnJpm9X6w2JplWBJrigWolgKM3jNe4nKgw==
X-Received: by 2002:a05:651c:506:: with SMTP id o6mr10876663ljp.233.1599489120157;
        Mon, 07 Sep 2020 07:32:00 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id u22sm6783238lji.65.2020.09.07.07.31.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2020 07:31:59 -0700 (PDT)
Subject: Re: [PATCH v5 06/36] i2c: tegra: Runtime PM always available on Tegra
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200906185039.22700-1-digetx@gmail.com>
 <20200906185039.22700-7-digetx@gmail.com>
 <CAHp75VevXe3c2LGF3jZyDfvPpRAz+-GQKvXEO4OKvuur=RgXCQ@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f9ec5178-e38e-ed9a-25f8-21e53ccd31d1@gmail.com>
Date:   Mon, 7 Sep 2020 17:31:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VevXe3c2LGF3jZyDfvPpRAz+-GQKvXEO4OKvuur=RgXCQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

07.09.2020 11:10, Andy Shevchenko пишет:
> On Sun, Sep 6, 2020 at 9:51 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> The runtime PM is guaranteed to be always available on Tegra after commit
>> 40b2bb1b132a ("ARM: tegra: enforce PM requirement"). Hence let's remove
>> all the RPM-availability checking and handling from the code.
> 
>> +       ret = pm_runtime_get_sync(i2c_dev->dev);
>> +       if (ret < 0) {
>> +               dev_err(dev, "runtime resume failed\n");
>> +               goto disable_rpm;
> 
> As in the original code here is a refcount leak.
> Should call pm_runtime_put_noidle(). (Possible to use goto put_rpm;
> but in that case the code a bit confusing to the reader)

Good point! I already forgot about this RPM API problem! I'll add a
patch to address this.

Would be great if anyone could put effort into changing the default
get_sync() behaviour and add get_sync_nofail(). Otherwise this will be a
never ending problem.
