Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E2C71CB26C
	for <lists+linux-i2c@lfdr.de>; Fri,  8 May 2020 17:01:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727092AbgEHPBC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 May 2020 11:01:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726767AbgEHPBC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 8 May 2020 11:01:02 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D32FC061A0C;
        Fri,  8 May 2020 08:01:01 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id h26so1661113lfg.6;
        Fri, 08 May 2020 08:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=283C+BzWzlu4+UqRQ7HpKCbrBsLg5HNbL+SW/2f4oPk=;
        b=fsRWgHgJdx8fTECIn9cTaQCKmUFeEGY5CTIZtmzsljmOAEwCYO3icAXKljD4RxHvcx
         OzU65lhltgcZQtKHTpjSdIsZ070iTokPblMG2c8wTIPqfmmbkmc2HDe23Vcp/9eNdkr6
         7kgkhdR6VwP7wiwfLBhvSU62FSsiFkInUT8Jhr14xajtrHhkDlhzoIVwqcd0e65glckr
         Te11H4FISYm89Pbxhr/Ra9qpUWyeZxMCjcvIcYR9Oee3ETWDrtM1cER6Ig7Wt3NoDazf
         CRi0PM/8BnI1V/yr7z/FzjnNx6rX725pdu/PWYAfqebHVVCL4RJv4QKa60oJ5BPjgHOG
         4CYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=283C+BzWzlu4+UqRQ7HpKCbrBsLg5HNbL+SW/2f4oPk=;
        b=G7sWED35rPXc6G+h3f25DCpnI4BVKrHC5xbkfBFzGNxGucIbZhYsMRUxJBhBLWiTzq
         IRoty3u/XvL5Gn8GMrUMgGXSQ0i9CWBDvegm+/vNN2v9cuIccLRTJ1XczXtr1xEDf3hB
         6rrNWXR4XroeIsbjKG/csvPOIf73YlNgW6+MsmfBBArrc+QmPcE/y+UZn4T9pxCzkcfT
         /0VTVQ2jLTEDGs+203gXy5Qaou/3852ynwYii2SmRrbXkzOCVfVfk5iicRug07q2KROU
         Lkewudcwv3Rg4ANaJj9G2wzBEa1nxnJ3CboSjGCIeKFeLPXOR1FT+XarGzjsoumNunyZ
         B7YA==
X-Gm-Message-State: AOAM532npsxM2tNzxaTCb3/xqcsTV5iUi5CIEOI1Yb7FcFSHHJjjevVM
        KLrLHth679WTdmmfM+EusNOhiImx
X-Google-Smtp-Source: ABdhPJz9A8C6mD6ryK2uWnoypN/A2bUmg7m4nneB9pQm7ZLNWifxvk+ruglNyBatBwD+2vfHeE1IRA==
X-Received: by 2002:ac2:53af:: with SMTP id j15mr2240261lfh.191.1588950059803;
        Fri, 08 May 2020 08:00:59 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id m20sm1364153ljj.94.2020.05.08.08.00.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2020 08:00:59 -0700 (PDT)
Subject: Re: [PATCH 2/5] i2c: tegra: Restore pinmux on system resume
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Jon Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20200506193358.2807244-1-thierry.reding@gmail.com>
 <20200506193358.2807244-3-thierry.reding@gmail.com>
 <2a0404ac-73bf-2f27-9147-8bef28ae995f@gmail.com>
 <20200508103130.GB3030605@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f149bb64-e93b-364e-47bc-c851e9638a35@gmail.com>
Date:   Fri, 8 May 2020 18:00:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200508103130.GB3030605@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

08.05.2020 13:31, Thierry Reding пишет:
...
>> Is it legal to touch DPAUX registers while DPAUX is in a suspended state?
> 
> DPAUX is never runtime suspended and the dependency from the I2C
> controller on DPAUX should ensure that they are suspended and resumed in
> the right order during system sleep.

1. Could you please explain why DPAUX is never suspended? Isn't it a
problem?

It looks a bit odd that driver is doing this [1][2]. RPM is supposed to
be used for the *dynamic* power management. Should we remove RPM usage
from the DPAUX driver?

[1]
https://elixir.bootlin.com/linux/v5.7-rc4/source/drivers/gpu/drm/tegra/dpaux.c#L524
[2]
https://elixir.bootlin.com/linux/v5.7-rc4/source/drivers/gpu/drm/tegra/dpaux.c#L591

2. Could you please explain why I2C driver has to care about restoring
the pinmux state? Why pinctrl driver isn't doing that for I2C and
everything else?
