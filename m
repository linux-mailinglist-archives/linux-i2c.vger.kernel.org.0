Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 087CF232930
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jul 2020 02:53:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728287AbgG3AxK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jul 2020 20:53:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726709AbgG3AxJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Jul 2020 20:53:09 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 817A8C061794;
        Wed, 29 Jul 2020 17:53:09 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id s16so11819137ljc.8;
        Wed, 29 Jul 2020 17:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2WIsb3OakYjVF8It8z90CrlZdw9biUetyGUhn5Gd9zk=;
        b=LxOV/pwADxmLgnpAn+jbdz5AKBHxCpc/fKkznCKuZayUymRrRDAsQCB/BOt8G4cTbc
         SSJ0DMfLg7hAzdfyxjSZ6aT+t7uqiNkHxIyhWpdTnwB86aYn6DY9sOAWKptq012/EKks
         ue8Ncx+bhH6u2V9Ni2ih10Gqe8a3PnKRW9+N9vz8SOnIXm9qJX4jOeQRBvHwU6fv6ko2
         PC4IXJTx7akbYwyZm666fmJCoTpAw3DhbtQohmALJXHmEyMelGVRMrcT3ISXMvzFW769
         ptzX4T75V2X5d/IoP58qdytZeH2dADX43cPK3GuDC6BzBV0pFFPZ6TP77UhKUsk2zdAQ
         znLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2WIsb3OakYjVF8It8z90CrlZdw9biUetyGUhn5Gd9zk=;
        b=rRY2Fq5Bwe1YvpdYSVX7zLBN+U7VXlXBM9TIWPoN6hdDD5qpw6m5ZfWl+keX/+9W9n
         p39TU77lSKQy/Xx+cdQua4tshjacMXE6zS7ts/uIXzYGRbcxpifDy3pIVKjdguOQuDlU
         Ya2CLQkzMW/FqAuOElsznu5n2bQq49RqsuH8tpD+6HTm0FyIL8cytvKlC0phVHUR+I6E
         5wtbCngsJ00AOJo/c5oRJv3c6tr/Ab8HgxrA6eYbD/EIRcfJxzE66W2xJO3qfv//tEQ5
         NHNBCGf5gXhnyVV+cSrJx2ZGmY3fYwyixGQU9cgrNOQ+sAB3TA01WxmM0hlrPvCy++aB
         y6qw==
X-Gm-Message-State: AOAM533j5rtVLVSYSy8EKRDtzv0oIJvcNbwd5tq6BgkSeMRaPbYKFTeZ
        e01NoLj8pzzw9TQJr6mKQjjcWaBZ
X-Google-Smtp-Source: ABdhPJyrfeqwdyj25iD1xokH7+qTgCm7Qmo3VsGSgHxwkAYo+mtQ7x5gnXHVBPX1PLQKx4jfLffKPA==
X-Received: by 2002:a2e:8718:: with SMTP id m24mr221091lji.253.1596070387782;
        Wed, 29 Jul 2020 17:53:07 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-76-12-16.pppoe.mtu-net.ru. [91.76.12.16])
        by smtp.googlemail.com with ESMTPSA id r19sm803663lfi.58.2020.07.29.17.53.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2020 17:53:07 -0700 (PDT)
Subject: Re: [RFC PATCH v5 13/14] media: tegra-video: Add CSI MIPI pads
 calibration
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, robh+dt@kernel.org,
        helen.koike@collabora.com
Cc:     sboyd@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <1595883452-17343-1-git-send-email-skomatineni@nvidia.com>
 <1595883452-17343-14-git-send-email-skomatineni@nvidia.com>
 <c3d40261-9d77-3634-3e04-f20efad9d3d8@gmail.com>
 <01ee0805-3d57-d857-48e3-5c2245cd4500@nvidia.com>
 <2ec535c9-55e8-8834-6002-36c75aeb097c@gmail.com>
 <021707b9-5f72-6f8b-d125-43627ef64a6d@nvidia.com>
 <de2d6117-b1e5-14c0-52ca-ff46b444c866@nvidia.com>
 <ca18b93e-1f1c-50ae-e0c1-11758935ee89@gmail.com>
 <42f25a49-ad2b-4e52-fd99-cb0f52037988@nvidia.com>
 <f5440f57-3653-7cf0-9efe-e9a0c276f7cf@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <6ae07f82-53f7-33fc-5892-340b0d9f12cf@gmail.com>
Date:   Thu, 30 Jul 2020 03:53:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f5440f57-3653-7cf0-9efe-e9a0c276f7cf@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

30.07.2020 03:55, Sowjanya Komatineni пишет:
> 
> On 7/29/20 5:52 PM, Sowjanya Komatineni wrote:
>>
>> On 7/29/20 5:43 PM, Dmitry Osipenko wrote:
>>> 30.07.2020 03:27, Sowjanya Komatineni пишет:
>>> ...
>>>>>> Secondly, perhaps a failed calibration isn't a very critical error?
>>>>>> Hence just printing a warning message should be enough.
>>>>> Using dev_err to report calibration failure. Are you suggesting to use
>>>>> dev_warn instead of dev_err?
>>> I meant that failing s_stream might be unnecessary.
>>>
>>> The dev_warn should be more appropriate for a non-critical errors.
>>>
>>>>>> Could you please make a patch that factors all ON/OFF code paths
>>>>>> into a
>>>>>> separate functions? It's a bit difficult to follow the combined code,
>>>>>> especially partial changes in the patches. Thanks in advance!
>>>>> what do you mean by partial changes in patches?
>>>>>
>>>>> Can you please be more clear?
>>>> Also please specify what ON/OFF code paths you are referring to when
>>>> you
>>>> say to move into separate functions?
>>> I meant to change all the code like this:
>>>
>>> set(on) {
>>>      if (on) {
>>>         ...
>>>         return;
>>>      }
>>>
>>>      if (!on)
>>>        ...
>>>
>>>      return;
>>> }
>>>
>>> to somewhat like this:
>>>
>>> set(on) {
>>>      if (on)
>>>        ret = enable();
>>>      else
>>>        ret = disable();
>>>
>>>      return ret;
>>> }
>>
>> You mean to change tegra_channel_set_stream() ?

Yes, and tegra_csi_s_stream().

> changing tegra_channel_set_stream() to have like below will have
> redundant calls as most of the code b/w enable and disable is same
> except calling them in reverse order based on on/off and doing MIPI
> calibration only during ON
> 
> 
> if (on)
>     ret = enable()
> else
>     ret = disable()
> return ret;

Readability should be more important than number of lines.
