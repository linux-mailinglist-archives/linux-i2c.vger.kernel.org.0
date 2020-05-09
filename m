Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DED31CC272
	for <lists+linux-i2c@lfdr.de>; Sat,  9 May 2020 17:35:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727926AbgEIPfq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 9 May 2020 11:35:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727092AbgEIPfq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 9 May 2020 11:35:46 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E07DC061A0C;
        Sat,  9 May 2020 08:35:45 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id 8so1104035lfp.4;
        Sat, 09 May 2020 08:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lzmiW4ai34vL1R52asRHKaWqLBaR1/46ZdQ//XVaBiQ=;
        b=VqdHUCGZsIebL8bw1pIVn+zo+eNFdKYKpDqaMfvZtRPCLY6zF/JtJNpg/ydkWTR/mb
         vYkBue/7O8hmxBgTroM9jLAMNYkIXx5vBGzQFJBTHacydrtPrwAeSRg4n4BSOFOxy+EE
         yViPwmHgaSZDKayEODEwjYADS13KgyEBznymCA19Rx4pHzN1d8NTmUIS2JfE2MddiVUl
         s0E2+fWtCLod0SM4KTjRhAeqyI80KSFv0/HM6TIy6DE8RtCvWVb5+98RI0IqgdE1hy/K
         vzup/gve2a25M8J7P5j1MXdO7/jCCFy8m/joix8bcGS6g2NycPz42bF/np3iRXK+8kNn
         CTQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lzmiW4ai34vL1R52asRHKaWqLBaR1/46ZdQ//XVaBiQ=;
        b=i2uwruyqxf9ggGYl7SzNYD3pdrkLbwJAm7gfA7ZRvdAA3h4vVOTSpfEyRZVdJ3SEdN
         lROE8d/QE80nmx2tgsQjlcznbUmP2TpMKpxLa/bvB5XuDaacszCF1S8AwnXLZX1Sri6J
         hgVFU7EOf0IJs9KMyb0SzFnBXM3zS26NeHtjPCmmAAitdOr1mWT+g2Qdrz977GVW37KR
         3+eknn/GjlB3KqBZ/nql7wARxX8r24RLaHYw/kXTt2uPvnnu9AmHBDARMD1a/YeHxS+S
         FNgXIuCgh0hV8/9rzIsg7/bnuqj2H8Ap962VguUK0SKZOF1CdM/hljY4lwHY2gAjpXoT
         8hmA==
X-Gm-Message-State: AOAM531kxrJyYrSDGbUROyOn5Uud7J9dKTb243M15A89V6IQB7rsjpIw
        rBYyS6+O2OcCUD1GN1Rrip4lLn68
X-Google-Smtp-Source: ABdhPJzqnGcdRMt8ENMu1Kr1eb19BxMnsHbXQzJjvIAADh7/d9ypSfKL0A0JjNBkHuPUrTRD9U7vgA==
X-Received: by 2002:ac2:46c1:: with SMTP id p1mr5065181lfo.25.1589038543742;
        Sat, 09 May 2020 08:35:43 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id a25sm4244794lfb.87.2020.05.09.08.35.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 May 2020 08:35:42 -0700 (PDT)
Subject: Re: [PATCH 2/5] i2c: tegra: Restore pinmux on system resume
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Jon Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20200506193358.2807244-1-thierry.reding@gmail.com>
 <20200506193358.2807244-3-thierry.reding@gmail.com>
 <2a0404ac-73bf-2f27-9147-8bef28ae995f@gmail.com>
 <20200508103130.GB3030605@ulmo>
 <f149bb64-e93b-364e-47bc-c851e9638a35@gmail.com>
Message-ID: <86fee5a3-fe2f-05ab-bc05-1c441d2845e9@gmail.com>
Date:   Sat, 9 May 2020 18:35:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <f149bb64-e93b-364e-47bc-c851e9638a35@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> 2. Could you please explain why I2C driver has to care about restoring
> the pinmux state? Why pinctrl driver isn't doing that for I2C and
> everything else?

Although, now I see what you meant in the commit's message.

Perhaps the "their I2C controllers may have lost the pinmux state in
hardware" paragraph should be removed from the commit's message because
it's irrelevant to this patch. The pinctrl state is changed once
tegra_i2c_runtime_resume() is invoked and it is not about the change
made by this patch.

