Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66DA62CA6F5
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Dec 2020 16:26:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391795AbgLAPXw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Dec 2020 10:23:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391739AbgLAPXt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Dec 2020 10:23:49 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81AD8C0613CF;
        Tue,  1 Dec 2020 07:23:03 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id a6so3708791wmc.2;
        Tue, 01 Dec 2020 07:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=yADVRMh/EY6ElQ2fDzuAEHfJk7R1Ue0wFYgwIbY8SU4=;
        b=ufKAFIXDThq6pW+Sj32IvUaxOtQH2TGECe7CGUE7RHXDZXP6RBYu2En0UnVg/Xw3Pq
         plhEnti1LjoRMxNFODbT+cLDWXf76bGNFjshBXTD/fkLNcibUpYSHyNP3rLo/NvOLMro
         SLDBvAua0DC5P4YsbnqqogEkPt6Jk0UAJKIoHAvcW/NKMGnp+SJiymkOLE3nlPtgkRWT
         p/u8FiEzVdjNRxgLKtipg8YY5HTL7VuBA9hGXXxCgSwNa3Kw8rjchYk6yGZC9y1IyMqx
         Glsxbh08YB/MznIJO+NO+Bd07f9Y8r5jbt+j8Z36ZPUq6jTM7n51ueLIRB5MAlhye2fo
         xuCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=yADVRMh/EY6ElQ2fDzuAEHfJk7R1Ue0wFYgwIbY8SU4=;
        b=n43njrWIhR1x6lWTUT+Wgj4qvDzyJH02JyQFbN/MZwhP6V5f309pv6YsRWMfNSd8tE
         xQihOc3WjEj/aM5bl2i9EaKTKTbl6fkwSFBzjrZbwkRo4OVZYdgC3u7C//j9/FWaGsbW
         4oO22jFYSDWs7SS2QMjcYsxnMIKQFzfjCnJUhMMvR6ICwLpuAJ8DIVuKHbZXkm22RLes
         hoFrSi/HVhcUx2TYiAaDoGiBeOt1NskNWhKDjCNyivDyggXhcD4pBhT8E5cBwVccaqU8
         4pIUMvPNItz98T84ymJVUWwSRjEdoFnnsqsHd7ZLz/6tiAkrGaxowWrZM7eQezlx+fbE
         16Yg==
X-Gm-Message-State: AOAM5327h804x1rFR+0WgfD1fzIHbHHEdu8rUk8esbU24iHXeDLfZNx/
        LvYv1z8mFtd1B4chWNrsZr0=
X-Google-Smtp-Source: ABdhPJxcHJN0zQ1xaZvWXO8OSl+Ad4sFnkieJdvurZiCfNEOeCrpgUOvoEneb7pfHHk7dMEXDS0u/g==
X-Received: by 2002:a1c:208f:: with SMTP id g137mr3137329wmg.67.1606836182294;
        Tue, 01 Dec 2020 07:23:02 -0800 (PST)
Received: from [192.168.1.211] ([2.31.224.80])
        by smtp.gmail.com with ESMTPSA id h83sm322241wmf.9.2020.12.01.07.23.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Dec 2020 07:23:01 -0800 (PST)
Subject: Re: [PATCH 14/18] acpi: utils: Add function to fetch dependent
 acpi_devices
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, devel@acpica.org, rjw@rjwysocki.net,
        lenb@kernel.org, gregkh@linuxfoundation.org,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, yong.zhi@intel.com,
        sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, mchehab@kernel.org, robert.moore@intel.com,
        erik.kaneda@intel.com, pmladek@suse.com, rostedt@goodmis.org,
        sergey.senozhatsky@gmail.com, linux@rasmusvillemoes.dk,
        kieran.bingham+renesas@ideasonboard.com, jacopo+renesas@jmondi.org,
        laurent.pinchart+renesas@ideasonboard.com,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        heikki.krogerus@linux.intel.com
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-15-djrscally@gmail.com>
 <20201130182354.GW4077@smile.fi.intel.com>
 <26d7fa3f-3552-90e0-1f64-5c39449dcdd7@gmail.com>
 <20201201151012.GG4077@smile.fi.intel.com>
From:   Dan Scally <djrscally@gmail.com>
Message-ID: <1244ac3e-2835-6cb2-611d-af0a4f5614a9@gmail.com>
Date:   Tue, 1 Dec 2020 15:23:00 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201201151012.GG4077@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 01/12/2020 15:10, Andy Shevchenko wrote:
> On Mon, Nov 30, 2020 at 11:54:44PM +0000, Dan Scally wrote:
>> Hi Andy
>>
>> On 30/11/2020 18:23, Andy Shevchenko wrote:
>>> On Mon, Nov 30, 2020 at 01:31:25PM +0000, Daniel Scally wrote:
>>>> ACPI devices declare themselves dependent on other devices via the _DEP
>>>> buffer. Fetching the dependee from dependent is a matter of parsing
>>>> _DEP, but currently there's no method to fetch dependent from dependee.
>>>> Add one, so we can parse sensors dependent on a PMIC from the PMIC's
>>>> acpi_driver.
>>> Do I understand correctly that it's an existing table provided by firmware that
>>> (ab)uses _DEP in such way? Note, the specification doesn't tell we may use it
>>> in this way, OTOH I don't remember if it strictly forbids such use.
>>>
>>> So, please elaborate in the commit message why you need this and pint out to
>>> the 6.5.8 "_DEP (Operation Region Dependencies)" which clearly says about
>>> OpRegions and that part already supported by ACPI in the Linux, if I'm not
>>> mistaken, need to refresh my memory.
>>
>> Laurent's reply is good explanation, but for example see my Lenovo Miix
>> 510's DSDT:
>>
>>
>> https://gist.githubusercontent.com/djrscally/e64d112180517352fa3392878b0f4a7d/raw/88b90b3ea4204fd7845257b6666fdade47cc2981/dsdt.dsl
>>
>>
>> Search OVTI2680 and OVTI5648 for the cameras. Both are dependent on
>> IN3472 devices (PMI0 and PMI1) which are the discrete type that we're
>> attempting to handle here.
> Yes, it seems since PMIC is kinda "power resource" (don't mix with real power
> resource as by ACPI specifications) and that's why they decided to include it
> into _DEP.  So, it seems a de facto common practice. Thus, it would be nice to
> have the above in the commit message in some form. Can you do it?
>
Sure, no problem. I'll include that in the next version
