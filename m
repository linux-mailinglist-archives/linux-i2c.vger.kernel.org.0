Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72B0B4257DD
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Oct 2021 18:24:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233610AbhJGQ0q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Oct 2021 12:26:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233590AbhJGQ0p (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 Oct 2021 12:26:45 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1420C061570;
        Thu,  7 Oct 2021 09:24:51 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id x27so27068040lfa.9;
        Thu, 07 Oct 2021 09:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=TylpvwBRM8zk64/pqOOEvArsR9eHWPZ2QC0K2UZhvtg=;
        b=pfaH67C4WxrmY5cF2+58SyJm5z9SzKgheF1nBxxaGumJrYpoIfeYmJw9ZSSeuLQU4l
         ZYx3T8gz73irFqxUyp5nGapAm26X1oRwVGgndkVFRKoo5leFEqvHXHJ8CT9uvMvz7I4w
         rLVJVg+67jqx6P9DWFuYHKo1HKIX8yuII1LVDCM8mucKclYAIrfFq1xWeY1D2KdNGDWq
         ChPLaOk2ydY5PFA9wn9dlxEDQsAHdtvbph9EPcMCJ0U9fTIQx5D6cteGRrRY9lJT4Qfl
         CC6B3ru7I0NgGuntiNG6HupRiMYQeSoiy42z6jLJvDLmWRIzcP06sKjn5xslA6cgx8bD
         xvNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TylpvwBRM8zk64/pqOOEvArsR9eHWPZ2QC0K2UZhvtg=;
        b=LIxiC9eGYcJ3/GphrAE22AoVWOXzXSaE0If6XyQ67Sp6Ac89mLRxH73VVcNUbGggIB
         zYr3WW6uHz8U+H/W6lusXmGHY+qWy335sOtFKblxcJTOO24qUtVjs6G97K672YhJMbfn
         pAkMftfqgdJPeCj8lJGaPj8GVMwBNZhqBYaDXnY9Z4P/Smhc/frPs05i5XSVstJbktnd
         Eho8nZTocXeNXSTTT1IE89f71jRoMv2HdKqtKtu4fFKAUa+cocNl+1fxzx+JpLZcM452
         Z005OoRQoUExpmsdlBoThkkMHOseWebikGbgNE2+UmV/yct2hITOl+fvDi6kv0L0AVXT
         Kr0w==
X-Gm-Message-State: AOAM532k4TWMyR3++SA2D/3iFMjFNTPxVQQX2UGr+716LMz8Xl9vW7F4
        e3HU0wK1vCHK4paOLEK9vR9izQRKcl8=
X-Google-Smtp-Source: ABdhPJw2oMWtFkddFu1J7XTrGZxyQK1pbW10O+ehrog9arI02NxxHBGIj4D7rByvbMIdL2tleF2O6Q==
X-Received: by 2002:a2e:5453:: with SMTP id y19mr5475709ljd.247.1633623890133;
        Thu, 07 Oct 2021 09:24:50 -0700 (PDT)
Received: from [192.168.2.145] (79-139-163-57.dynamic.spd-mgts.ru. [79.139.163.57])
        by smtp.googlemail.com with ESMTPSA id o12sm1859lfl.33.2021.10.07.09.24.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Oct 2021 09:24:49 -0700 (PDT)
Subject: Re: [PATCH v1 1/2] i2c:busses:Register PCI1XXXX adapter to I2C
 subsystem
To:     LakshmiPraveen Kopparthi <LakshmiPraveen.Kopparthi@microchip.com>,
        andriy.shevchenko@linux.intel.com
Cc:     UNGLinuxDriver@microchip.com, wsa@kernel.org, treding@nvidia.com,
        mirq-linux@rere.qmqm.pl, s.shtylyov@omp.ru,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210929062215.23905-1-LakshmiPraveen.Kopparthi@microchip.com>
 <20210929062215.23905-2-LakshmiPraveen.Kopparthi@microchip.com>
 <d39e99ff-6498-e532-e833-1c65861d566f@gmail.com>
 <683a7136ec818d01420a5c2cbf43e13498d82740.camel@microchip.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <55bf986d-ea29-f067-ea39-14eaab0d519a@gmail.com>
Date:   Thu, 7 Oct 2021 19:24:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <683a7136ec818d01420a5c2cbf43e13498d82740.camel@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

05.10.2021 11:50, LakshmiPraveen Kopparthi пишет:
>> Why i2c->freq is fixed to I2C_MAX_FAST_MODE_FREQ in
>> pci1xxxx_i2c_init()?
> This is the default frequency at which the adapter shall operate. This
> driver is targeted for x86,X64 platforms. Could you please suggest a
> way to configure the freqeuncy?

For x86 it should come somewhere from ACPI info presumably, but I'm not
ACPI expert. Andy may have more insight.

At least you could add a clarifying comment to the code, telling why
freq is fixed to the standard speed.

Also, will be great if you could remove all the unused code in v2. It
will make code to look cleaner and easier to follow. You will be able to
add new features later on with another patch, once those features will
become really needed.
