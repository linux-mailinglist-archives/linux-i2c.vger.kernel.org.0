Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E1D4232842
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jul 2020 01:42:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726718AbgG2XmS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jul 2020 19:42:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728057AbgG2XmR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Jul 2020 19:42:17 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F2BBC061794;
        Wed, 29 Jul 2020 16:42:17 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id q6so26913814ljp.4;
        Wed, 29 Jul 2020 16:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cL2JbRcE84h2qOJ9vLmukrsnsm1WHbQr6e0UJNvxVQ8=;
        b=Hw5bzSCGuATwPt9i7H48mIAiyWGoJbDEZaqHcG2vxIF4HpH7FXB8gDRaT8JQpYmki1
         tBNoT4uUTteMVlP7jJGrF8i2Bj9Zz57K1BVrMZP6IQK2k2CjKGtOLmzFps3z+Xp1FTkL
         c1skc6+4LaTU6b2VquBJJl201uG7AK3XXzt2X115UlqZTmssD6RyQqxipva5PZ9y0vXE
         A9/CDFUJ07ys1JzXXgys1RZH+ox6KNfo1O9cfiCUV225ikSNUWn3lb/cbHcv9t3n3j/2
         VtmXzcqYd1MrnCTrsLHRkCxFy9G60Ec84jm2KYXR26ZARSf8qANsy8Rvi96A163OmM6E
         WrCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cL2JbRcE84h2qOJ9vLmukrsnsm1WHbQr6e0UJNvxVQ8=;
        b=s6P6T4Lz0oslOueSewQUP8OSZ2p86g4hQweo33srR9VqeQCv5USqDn2ZAu7zF1dh2d
         x6rDXP7PK1rutWs7hIOdl8hV/z3v/i6DXK8esJnuJt4pK7ChWrOTWdN2HFgtBJ15LhSc
         AapVW8x8bGAsr4NVVQBSzF3NA2rVN6oWiYdOpHu7Y3e0ZZYHKkn+wjeqKlpEMVEri2vJ
         889Aeb39AOQ9uCr9SjUZk2C35b/JBLN1p/KKaNYRkbOJw1sT6+OItV/GpHO+3k0KhbZC
         sLoFwxwohGAQIXXqeuBZV/V9mPVzb32zCn9Zu/O5O0a78IXbmUSGP/8wJvR8uk7eg5Zw
         rHqg==
X-Gm-Message-State: AOAM5301gdoLbq0Wl617/JhXPvwUHWrCpizrqZGWvdfeQPo8woaWf/Av
        H5AD39hoDAs68YfXyhJY9DVaVoSh
X-Google-Smtp-Source: ABdhPJyTScdeMMtRUvJkfnoJ7SDC2kYuGF7oePiRrOQNL7i3VhpW7YvR0Mn+59qMcpvQAA94eAT7KQ==
X-Received: by 2002:a2e:9d53:: with SMTP id y19mr144090ljj.2.1596066135805;
        Wed, 29 Jul 2020 16:42:15 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-76-12-16.pppoe.mtu-net.ru. [91.76.12.16])
        by smtp.googlemail.com with ESMTPSA id b18sm934122lfp.36.2020.07.29.16.42.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2020 16:42:15 -0700 (PDT)
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <48977b6b-ef7e-1bdf-e3e0-2903032aa225@gmail.com>
Date:   Thu, 30 Jul 2020 02:42:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b5fcc292-8ce3-2833-491f-5aefbe0196eb@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

29.07.2020 20:55, Sowjanya Komatineni пишет:
> 
> On 7/29/20 10:08 AM, Dmitry Osipenko wrote:
>> 28.07.2020 19:04, Sowjanya Komatineni пишет:
>> ...
>>>>> +void tegra_mipi_cancel_calibration(struct tegra_mipi_device *device)
>>>>> +{
>>>> Doesn't MIPI_CAL need to be reset here?
>>> No need to reset MIPI CAL
>> Could you please explain why. There is a calibration state-machine that
>> apparently needs to be returned into initial state, does it return by
>> itself?
>>
>> TRM says that MIPI block needs to be reset before of starting
>> calibration process. The reset is completely missing in the driver, I
>> assume it needs to be corrected with another patch.
> 
> TRM documented incorrectly. There is no need to reset MIPI_CAL.
> 
> MIPI CAL is FSM and it does not hang and done bit is to indicate if
> results are applied to pads or not.
> 
> If we don't see done bit set meaning, MIPI CAL did not see LP-11 and
> results are not applied to pads.

But how to stop calibration from triggering on LP-11 once it has been
enabled? The reset should be needed since there is no other way to reset
the calibration state.

> Also while multiple streams can happen in parallel and we can't reset
> MIPI CAL as other CSI channel streams (using other pads) may also be
> going thru calibration process in parallel depending and also DSI pads
> also are calibrated thru same MIPI CAL controller.

Perhaps this should be the case for a shared reset control API usage.
