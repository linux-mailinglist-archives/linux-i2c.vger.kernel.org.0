Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54806234902
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Jul 2020 18:14:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729483AbgGaQOl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 31 Jul 2020 12:14:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728882AbgGaQOk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 31 Jul 2020 12:14:40 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22BA6C061574;
        Fri, 31 Jul 2020 09:14:40 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id q4so33003760lji.2;
        Fri, 31 Jul 2020 09:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YqMA8MeVxar9xICWh2YYRA4Gnd/k8GNWBNgCmBw99tA=;
        b=tqEyFacWSDK3UrI52boiLHw2n1BPJ4Srrxm/v0jx+fGs5nP2OSvk0dVD+/+Lq4ZxYw
         d/kAoS9TIkdBlGTisSTgAXxUPyur69lj5f/hO9wj0GHnTqijJS4TFYvqXgK557sg64vV
         EMysJSc4lAVqrYcCItYj7CtgM4wfIqmIfdobgVKlDa1rqZ7KsCaKhHRXH0Xrv0ePnHSv
         d93T8X8TxMS1JZALSQHKPdGP85yDiPDHWSNOgmjVj9JPmmBHEL/2bXYwvCMqiqb2C0YA
         O0TtFnAvU8+Z6N/mYVVNMP+e35TZoAjJyBh/zIs+X7PCttETymTC0R4vSf/yTshHio1o
         xM8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YqMA8MeVxar9xICWh2YYRA4Gnd/k8GNWBNgCmBw99tA=;
        b=gd6rDG1Z0QlzXjPrSIyvWY/iWEGmhvHc+vjQRmQwqGPiUYOHW4Jt/l25hIgne1pNlx
         l1Yhgfkp7YbTE9IeiXV9UelNSGeMfuo2fu3U+plLhL/Vxk2cZlc597oD9zMWpl+bhri+
         saHhZfp1zrRxJr4IFw+BgpuWWCzkNf+1MpB5wwz3qw4yYr+ZlV9n78ZToD1blyjKf9vo
         nIalX12xuDDIVNUv5FCwMUEONMuwVBAU/mDoHKHk11MzpHRRA26/Um9BqhbxM/Pa0ZkN
         9buzDM69JsayDS3GKn2FL8ma1BGNZ5C2A14pW31WRuzpaEMhO1zzRO+BnRj1B53pNR3l
         O1SQ==
X-Gm-Message-State: AOAM530bSQ4PDq3GjpsbH5vdCuepwEyZ99/9GbyNn+UdY2QXIqsND4HX
        iYMOpZodGDv9/F82rcS4YNP9T5SE
X-Google-Smtp-Source: ABdhPJw0T9d6zBh79kx3CAECrhIJjV4ghrzyu1L0Z953EnYBevf+69nMTDav1jQp8wWhyH+MgaARCA==
X-Received: by 2002:a2e:b4b8:: with SMTP id q24mr2283271ljm.125.1596212078182;
        Fri, 31 Jul 2020 09:14:38 -0700 (PDT)
Received: from [192.168.2.145] (94-29-41-50.dynamic.spd-mgts.ru. [94.29.41.50])
        by smtp.googlemail.com with ESMTPSA id d26sm2038703lfq.73.2020.07.31.09.14.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2020 09:14:37 -0700 (PDT)
Subject: Re: [RFC PATCH v6 09/10] media: tegra-video: Add CSI MIPI pads
 calibration
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, robh+dt@kernel.org,
        helen.koike@collabora.com
Cc:     sboyd@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <1596186169-18729-1-git-send-email-skomatineni@nvidia.com>
 <1596186169-18729-10-git-send-email-skomatineni@nvidia.com>
 <3ac158c4-7df7-e3c1-f0e1-33e7ef017762@gmail.com>
 <f483329d-b5fe-fda5-e235-b8edb5fce440@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a08af0e8-80d8-0bd0-87a3-adfc8e70a92a@gmail.com>
Date:   Fri, 31 Jul 2020 19:14:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f483329d-b5fe-fda5-e235-b8edb5fce440@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

31.07.2020 18:46, Sowjanya Komatineni пишет:
> 
> On 7/31/20 4:39 AM, Dmitry Osipenko wrote:
>> 31.07.2020 12:02, Sowjanya Komatineni пишет:
>> ...
>>> @@ -249,13 +249,47 @@ static int tegra_csi_enable_stream(struct
>>> v4l2_subdev *subdev)
>>>           return ret;
>>>       }
>>>   +    if (csi_chan->mipi) {
>>> +        ret = tegra_mipi_enable(csi_chan->mipi);
>>> +        if (ret < 0) {
>>> +            dev_err(csi->dev,
>>> +                "failed to enable MIPI pads: %d\n", ret);
>>> +            goto rpm_put;
>>> +        }
>>> +
>>> +        /*
>>> +         * CSI MIPI pads PULLUP, PULLDN and TERM impedances need to
>>> +         * be calibrated after power on.
>>> +         * So, trigger the calibration start here and results will
>>> +         * be latched and applied to the pads when link is in LP11
>>> +         * state during start of sensor streaming.
>>> +         */
>>> +        ret = tegra_mipi_start_calibration(csi_chan->mipi);
>>> +        if (ret < 0) {
>>> +            dev_err(csi->dev,
>>> +                "failed to start MIPI calibration: %d\n", ret);
>>> +            goto disable_mipi;
>>> +        }
>> What would happen if CSI stream is enabled and then immediately disabled
>> without enabling camera sensor?
> 
> Nothing will happen as during stream enable csi receiver is kept ready.
> 
> But actual capture will not happen during that point.

Could you please show how the full call chain looks like? It's not clear
to me what keeps CSI stream "ready".
