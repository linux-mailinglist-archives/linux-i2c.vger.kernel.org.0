Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CBF423D6D3
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Aug 2020 08:30:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727012AbgHFGaa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Aug 2020 02:30:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726051AbgHFGa3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Aug 2020 02:30:29 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CA40C061574;
        Wed,  5 Aug 2020 23:30:29 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id f7so42865215wrw.1;
        Wed, 05 Aug 2020 23:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=TGBk281x4usHvdNF4g8zlmo5D8Bhv5Q8McyHFyF9+HM=;
        b=S9i0qvlyIu7dYtrctjS8zURJfTNuaHUJFmsq4RntwuztGPv3fezc0gZ2Inj8VFKNBP
         4rhI8IZMOrILBx/Nbiu+ecCVYOd6XKJ4IIXi84lO/jr0ffXbsSPR8BVfOXcKV+7zVLPv
         5lQyCgYIBncfg0vVH+zfq4RCtq4+YpON6IY+zrQI0YuRYdezFn4PU8pDKr4sX20MPbR6
         iO36Y7WznBJxbke2ec0xKTU746X/WAqFqCAY5rM1p/koUVFiGPSoZEyXvJKrKc8Nd69L
         6j+pSMvOmWkc9u17AydlJuDf+u2HEQLwt1/sWDZjwKMIlzOfkgzmIOW7+l5pz6QcMiri
         A/9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TGBk281x4usHvdNF4g8zlmo5D8Bhv5Q8McyHFyF9+HM=;
        b=tWZm01VGgzcptqn4kiDBEGyvnaOeCxCzwmkDgKpbLdRMt20qTjAbnv6IJoRi9jkgdM
         gXt0LOKZV5TN1G0lGly+XpNb7egoZu8nj09SsZ10e+gvvQwu+cq2bfpIqMaHYozP6t4i
         ZQw5Qac8CyZv/PGDCHCCVF92HWBDfovO35kA1YHh8jje36SHlcCwV7cOn075ZahCU0Tj
         9pHnSiLVjBiAdd40Miyzq0i2W1tuMZUdFbty5kADInUU2pjSCwrGNGYO6YpciXYcnb4d
         4TyMIRItiohezjZHWlxtx1PXSK7tdRw/Jzm7YXhb2CdMqYVDcTdkBv3gAX0mNKmnRjX9
         QFvA==
X-Gm-Message-State: AOAM533NP/V2xhE4ny9TTZS+GH+g68gqnvKAaW7eLY7T7Sr35McsX2xV
        twAHMdpj4XgrPnr09P/tRVs=
X-Google-Smtp-Source: ABdhPJz3fQId2Mfvo2IM9cPHd13bLT4jFeUUbQi44lKhwcEHOz/i4+jVOl9dhB1/oKwPNdmuXVjHIA==
X-Received: by 2002:adf:b1ca:: with SMTP id r10mr6294501wra.150.1596695427645;
        Wed, 05 Aug 2020 23:30:27 -0700 (PDT)
Received: from ziggy.stardust ([213.195.117.232])
        by smtp.gmail.com with ESMTPSA id t11sm4967586wrs.66.2020.08.05.23.30.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2020 23:30:26 -0700 (PDT)
Subject: Re: [PATCH v3 0/4] add i2c support for mt8192
To:     wsa@the-dreams.de, Qii Wang <qii.wang@mediatek.com>,
        robh+dt@kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        srv_heupstream@mediatek.com
References: <1596624742-14727-1-git-send-email-qii.wang@mediatek.com>
 <20200805214242.GA2182@kunai>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <249df8b3-6125-6ebd-2835-ab703f05b85a@gmail.com>
Date:   Thu, 6 Aug 2020 08:30:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200805214242.GA2182@kunai>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 05/08/2020 23:42, wsa@the-dreams.de wrote:
> On Wed, Aug 05, 2020 at 06:52:18PM +0800, Qii Wang wrote:
>> This series are based on 5.8-rc1 and we provide four i2c patches
>> to support mt8192 SoC.
>>
>> Main changes compared to v2:
>> --delete unused I2C_DMA_4G_MODE
>>
>> Main changes compared to v1:
>> --modify the commit with access more than 8GB dram
>> --add Reviewed-by and Acked-by from Yingjoe, Matthias and Rob
>>
>> Qii Wang (4):
>>    i2c: mediatek: Add apdma sync in i2c driver
>>    i2c: mediatek: Add access to more than 8GB dram in i2c driver
>>    dt-bindings: i2c: update bindings for MT8192 SoC
>>    i2c: mediatek: Add i2c compatible for MediaTek MT8192
>>
>>   .../devicetree/bindings/i2c/i2c-mt65xx.txt         |  1 +
> 
> Applied to for-next, thanks!
> 
> Sidenote: I get these warnings when compiling the driver:
> 
> drivers/i2c/busses/i2c-mt65xx.c:267: warning: Function parameter or member 'min_low_ns' not described in 'i2c_spec_values'
> drivers/i2c/busses/i2c-mt65xx.c:267: warning: Function parameter or member 'min_high_ns' not described in 'i2c_spec_values'
> drivers/i2c/busses/i2c-mt65xx.c:267: warning: Function parameter or member 'min_su_sta_ns' not described in 'i2c_spec_values'
> drivers/i2c/busses/i2c-mt65xx.c:267: warning: Function parameter or member 'max_hd_dat_ns' not described in 'i2c_spec_values'
> drivers/i2c/busses/i2c-mt65xx.c:267: warning: Function parameter or member 'min_su_dat_ns' not described in 'i2c_spec_values'
> 
> Is someone interested to fix these?
> 

I just send a fix for that.

Regards,
Matthias
