Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0D0E13E045
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jan 2020 17:38:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726785AbgAPQiV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Jan 2020 11:38:21 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:46707 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726151AbgAPQiV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Jan 2020 11:38:21 -0500
Received: by mail-lj1-f196.google.com with SMTP id m26so23358045ljc.13;
        Thu, 16 Jan 2020 08:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=eCcZLabUeQdma4/BEVorroq8W4egZf/HDAPymRFcBkY=;
        b=IIXiwZgozLSY/IJmPPLGcHn8Ve+FgoEn7EaVcMqcMMeebjIZ+Vw/Hi5mXg02Vz/Uj+
         a46bCj6F5Pvtwnz/F2fVi4cB/S+HlGcemlkqOaem7j82L4V12zZGZxSk7A3sg0rja3a8
         sK/l9oGkVNrW2PnfHXbFOQj2aZgV+0EFo4stRtu+YnKWdESXWd5BgNHfRTeqtzjPzv5E
         KSyNNCZQhZEYpNv8SSu/8Uv07j+T7apB+68x8Kka+HpqoZjlYedvDZmRNhaT8t+r9g/Q
         uHmmhHpvqzV62J3zdT0RIXNb+q5NFjYx82jmdcuTedHNI/cuHtgLTWsNJF9Hk0dygwkn
         KWeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eCcZLabUeQdma4/BEVorroq8W4egZf/HDAPymRFcBkY=;
        b=ka3vwIE4r9/bqu7uyOH5qdgz5TaQ4Ig5+Un1OC03ML0vIoM0ZhJeBpMRlDmoG1o07A
         +fPpdx6LpWdQ7KNZwg1bmOCGPMjwjgagSF4dPEU55M4pnC4y3pdGTDfYoeUaIFEQn4Hj
         VY6omgt/UdBqkpvY/FbmleMnDMlTdX2AmCQR4fq8qzV7pSwPyo7kHZqhrZHMVjLJPjdW
         fYHpxGIn+++kqW+l7umfzNsP+qH/+zszY3UDsVn9V7cGyLhDhGWfWAAWQFp6UNID3QJf
         6k34XfRkiPbgXNDpi9cRETqRSa0ebOCrZVkKOR2/JVmnSXsOqNXJKj8/TwOrK2FdL/xm
         8dKg==
X-Gm-Message-State: APjAAAXNL0LJUMHwQQ/uPH49BYWZJ0XKa5dXgID7Q+0Nplt1fUOalJY5
        G3j1k7ThJmtyB+iFcH+tCVKIXnKY
X-Google-Smtp-Source: APXvYqz+lJxd7qiwm/1Ps+yifU0qnOuTOxg4aKH59jWE+KR0fwxiDO8dW/SZzFqFZZxus4z+RfcSFQ==
X-Received: by 2002:a2e:9708:: with SMTP id r8mr2871050lji.92.1579192698498;
        Thu, 16 Jan 2020 08:38:18 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id t27sm11161859ljd.26.2020.01.16.08.38.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2020 08:38:17 -0800 (PST)
Subject: Re: [PATCH v5 0/8] NVIDIA Tegra I2C driver fixes and improvements
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200114013442.28448-1-digetx@gmail.com>
 <20200115173535.GF1239@ninjato>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ea7c484b-d8ae-48b9-84ca-db26902f4654@gmail.com>
Date:   Thu, 16 Jan 2020 19:38:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200115173535.GF1239@ninjato>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

15.01.2020 20:35, Wolfram Sang пишет:
> On Tue, Jan 14, 2020 at 04:34:34AM +0300, Dmitry Osipenko wrote:
>> Hello,
>>
>> This patchset adds support for atomic transfers which are required for
>> shutting down machine properly. Secondly, a (not)suspending I2C and some
>> other things are fixed/improved by this small series as well. Please review
>> and apply, thanks in advance!
>>
>> Changelog:
>>
>> v5: Improved commit message of the "Support atomic transfers" patch,
>>     thanks to Wolfram Sang.
>>
>>     Added explicit stable tags to these patches:
>>
>>       i2c: tegra: Fix suspending in active runtime PM state
>>       i2c: tegra: Properly disable runtime PM on driver's probe error
> 
> Patches 1+2 applied to for-current and patches 3-8 applied to for-next,
> thanks!
> 
> Checkpatch spit out some of those:
> 
> CHECK: Lines should not end with a '('
> 
> I didn't mind. We can fix it incrementally if you want to fix it.
> 

Thank you very much!

I was aware of those minor warnings, but couldn't instantly see how to
fix them without making code less readable.
