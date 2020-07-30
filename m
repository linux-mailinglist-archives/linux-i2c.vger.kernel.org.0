Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C82A72328E1
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jul 2020 02:32:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728264AbgG3Abv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jul 2020 20:31:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728321AbgG3AbZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Jul 2020 20:31:25 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DD10C061794;
        Wed, 29 Jul 2020 17:31:24 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id s16so11779248ljc.8;
        Wed, 29 Jul 2020 17:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZVacFYGVPN4g3YsTbyPGFySWPU41Uv/NcrgGIRbhArM=;
        b=MJv/c1zNeN0Y5gPtpTwF8qnxVnppEDQGAM2rcHWruQWUzBP4mkFtGmXpEWQHAqv8Vt
         HvKU+v0luAKbhOnJUhnbnuGd8/PYr3Qt6jaVpPct2NBIsNs80hu9vnrIqYn1/YeA57TS
         FQgZA6Pli3yZZuWkEUSEXNJEM02d2/Iz/BTZ3XaYwZ6eWB5y/PAHoIAstrRKlwcUtJdu
         p0qGGWW2dK9RZwfgzJaud+XSiOfSaLekBEfKfGI90mFRItoVy7glD7Zwlc0+bWxuel0o
         gMvnN1Lg47xkrAFvxxkW5pi69ydwQEjbWJ2GdlVEbnoJQMJuRBtddlQloi/QHV72+VpI
         F34g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZVacFYGVPN4g3YsTbyPGFySWPU41Uv/NcrgGIRbhArM=;
        b=E1EhD2wVApRtsdeTcy2KQd03xOQtBT48EeuOipLIH0ShY51QbWAvHIoxXIlfRpTRcg
         T8ar1E0gFFXNLKyjwJIT9Zqh8I2fsannoZNKR7CZk45Ive0YlwpLWgyF/Vb/wSVkZYy4
         kVACY91MyaToA3T1wSjyEXuHBSTMfepE+9Dmg1uJIR6eXOGuuvm2MQWYR73Rud7xM8Nr
         d9u+4yHbpQwFm0+PgqErlr4QJ44tUeq9b/e97BA0VqxS54ezBjE+DBw8fh4ZlW4X+/fe
         HmZag5tAGQfrDl8LLIjI2d6YZKM5j57/D632TN3V4G9YSCkyq35oC2X8e3cjgKjk8lfh
         QJHQ==
X-Gm-Message-State: AOAM531lrIzZT4RvdgunLLHKNAdnFdTMWvMPki0eIb/M0wKi8/eESWh5
        NqO6wwBM8g7SDC0SqahZGJoaV7EA
X-Google-Smtp-Source: ABdhPJwwmKLQBXTMmPMZSFMIfctPh0khlEDb0MnVX81UXk6OpBHGTmLsmCPCw2fig6229M53AwO0qQ==
X-Received: by 2002:a2e:8853:: with SMTP id z19mr199537ljj.267.1596069082777;
        Wed, 29 Jul 2020 17:31:22 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-76-12-16.pppoe.mtu-net.ru. [91.76.12.16])
        by smtp.googlemail.com with ESMTPSA id r19sm794198lfi.58.2020.07.29.17.31.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2020 17:31:22 -0700 (PDT)
Subject: Re: [RFC PATCH v5 12/14] gpu: host1x: mipi: Keep MIPI clock enabled
 till calibration is done
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, robh+dt@kernel.org,
        helen.koike@collabora.com
Cc:     sboyd@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <1595883452-17343-1-git-send-email-skomatineni@nvidia.com>
 <1595883452-17343-13-git-send-email-skomatineni@nvidia.com>
 <b21e3227-d0d8-5b4a-ae69-aa29551a22c3@gmail.com>
 <69903c67-8e5f-11c2-45ec-c76b97634aba@nvidia.com>
 <d291d306-55d4-2264-dc05-0e47f0dfef20@gmail.com>
 <b5fcc292-8ce3-2833-491f-5aefbe0196eb@nvidia.com>
 <48977b6b-ef7e-1bdf-e3e0-2903032aa225@gmail.com>
 <b159e69a-32fa-7bcb-3c95-aaaba250f85b@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a6604949-5675-50ae-160d-d1a26f0a9c0b@gmail.com>
Date:   Thu, 30 Jul 2020 03:31:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b159e69a-32fa-7bcb-3c95-aaaba250f85b@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

30.07.2020 02:54, Sowjanya Komatineni пишет:
> 
> On 7/29/20 4:42 PM, Dmitry Osipenko wrote:
>> 29.07.2020 20:55, Sowjanya Komatineni пишет:
>>> On 7/29/20 10:08 AM, Dmitry Osipenko wrote:
>>>> 28.07.2020 19:04, Sowjanya Komatineni пишет:
>>>> ...
>>>>>>> +void tegra_mipi_cancel_calibration(struct tegra_mipi_device
>>>>>>> *device)
>>>>>>> +{
>>>>>> Doesn't MIPI_CAL need to be reset here?
>>>>> No need to reset MIPI CAL
>>>> Could you please explain why. There is a calibration state-machine that
>>>> apparently needs to be returned into initial state, does it return by
>>>> itself?
>>>>
>>>> TRM says that MIPI block needs to be reset before of starting
>>>> calibration process. The reset is completely missing in the driver, I
>>>> assume it needs to be corrected with another patch.
>>> TRM documented incorrectly. There is no need to reset MIPI_CAL.
>>>
>>> MIPI CAL is FSM and it does not hang and done bit is to indicate if
>>> results are applied to pads or not.
>>>
>>> If we don't see done bit set meaning, MIPI CAL did not see LP-11 and
>>> results are not applied to pads.
>> But how to stop calibration from triggering on LP-11 once it has been
>> enabled? The reset should be needed since there is no other way to reset
>> the calibration state.
> 
> Its a finite state machine that goes thru fixed steps of sequence codes
> internally and holds results in registers.
> 
> When it sees LP-11 results are applied to pads.
> 
> If it does not see LP-11, next start will again trigger calibrating with
> finite sequence codes.
> 
> As per HW designers, we don't have to do any reverts when done bit is
> not set.

Alright, then should be good if HW can't stuck.

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
