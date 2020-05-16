Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44F131D5F76
	for <lists+linux-i2c@lfdr.de>; Sat, 16 May 2020 09:45:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbgEPHph (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 16 May 2020 03:45:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725934AbgEPHpg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 16 May 2020 03:45:36 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2818BC061A0C;
        Sat, 16 May 2020 00:45:36 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id h26so3733828lfg.6;
        Sat, 16 May 2020 00:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=r051ZtscWAFEcwFXTElJPWWhBN0jv0av84Oriy8NXF0=;
        b=Nde/IQ8ZgdfP/+ZFaM0t2CjZda+NjRrxe5VOxJiNELtJsZWil+xblmGvW6qMEOuxVE
         qRa73T5Az4SOIDXVqf4E60V54gUkkkb+wDYmw+2AH5yJG8sBbw38DVkM+1hzJtcEt7HO
         Huenawq1IqvH/zwGTmOaEiTsbWpVGENgHK+mAcOMlzTFKdUR4Q9VkvNMsOaZJ4WX51X5
         iXUm0iMIH7JqkGFUaGjcS3C97pL0rUmHaRzVEx5u4boVkAxjf8277cDH39TNIn1ROeiq
         3Z0mJx39xX77+5GyXN4SD/3DkThyZWKofljwmCYWKC73cJCtQziH/RxHqMBfj5slRLM6
         1feQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=r051ZtscWAFEcwFXTElJPWWhBN0jv0av84Oriy8NXF0=;
        b=cTCX08+PwzFbDaPArShIkne7qMs7EjBJped4+Rae/nlkVOtCXJSVQel1+CKTVVM0Wn
         o6NRepE958vUnriD4KfpWS78hmVK2ExCzd55mn+qlwNuuXeZ2qD+WP3DVu+G8xjerLw5
         W53FpSAbABRpZmdHGMgLljc7zSSbNgs+DIn1vfIMcg5dhBs58+YpoR+7lKjbDGCHzu9t
         f+u8IWviOnT48mzsgIfGyHWgLPn8v1Frez9OI9XebM4PVmQqV/ZKlgTw6mSsH2EvzTHZ
         I/J14sVbsnruX97hxnkYxZimsb9M/+XYprEC9BHAwGt3PwDPJc/a1sXtQhMVcj74ot0A
         789w==
X-Gm-Message-State: AOAM530kMg7Cuyr1QXEJyGYozZHvTgLRoHwiV/FkoPLCV0hOpPpzuJ9+
        VJzOXE10Q1dYgSFCYjPCBfXGf1hs
X-Google-Smtp-Source: ABdhPJyDGBd+HPYbjsQt4MvgrhGWyRCVR4XGU9lU52TvZe43hp00hLEnDwgo/PTWo9QueyZJWRRaOw==
X-Received: by 2002:a19:e86:: with SMTP id 128mr4864067lfo.34.1589615134285;
        Sat, 16 May 2020 00:45:34 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id 5sm2651357lfy.60.2020.05.16.00.45.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 May 2020 00:45:33 -0700 (PDT)
Subject: Re: [GIT PULL] i2c: tegra: Changes for v5.8-rc1
To:     Thierry Reding <thierry.reding@gmail.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20200515143924.1579055-1-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <314a292e-bcd9-bb30-4067-71dc7cc399d6@gmail.com>
Date:   Sat, 16 May 2020 10:45:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200515143924.1579055-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

15.05.2020 17:39, Thierry Reding пишет:
> Hi,
> 
> The following changes since commit 0e698dfa282211e414076f9dc7e83c1c288314fd:
> 
>   Linux 5.7-rc4 (2020-05-03 14:56:04 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/for-5.8-i2c
> 
> for you to fetch changes up to c73178b93754edd8449dccd3faf05baafd4d3f0e:
> 
>   i2c: tegra: Add support for the VI I2C on Tegra210 (2020-05-12 22:47:52 +0200)
> 
> Thanks,
> Thierry
> 
> ----------------------------------------------------------------
> i2c: tegra: Changes for v5.8-rc1
> 
> This includes a few improvements to make the Tegra I2C controller behave
> properly on suspend/resume, does a bit of cleanup and adds support for
> the VI-variant of the I2C controller that is used primarily for video
> capture purposes.
> 
> ----------------------------------------------------------------
> Dmitry Osipenko (2):
>       i2c: tegra: Better handle case where CPU0 is busy for a long time
>       i2c: tegra: Synchronize DMA before termination
> 
> Thierry Reding (5):
>       Revert "i2c: tegra: Fix suspending in active runtime PM state"

>       i2c: tegra: Restore pinmux on system resume

In general this series is good to me, although I have some concerns
about this patch. Could you please answer the review comments?

>       i2c: tegra: Keep IRQs enabled during suspend/resume
>       i2c: tegra: Use FIELD_PREP/FIELD_GET macros
>       i2c: tegra: Add support for the VI I2C on Tegra210
> 
>  drivers/i2c/busses/i2c-tegra.c | 248 +++++++++++++++++++++++++++++------------
>  1 file changed, 179 insertions(+), 69 deletions(-)
> 

