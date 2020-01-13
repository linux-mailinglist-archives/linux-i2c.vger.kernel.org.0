Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BCDC139D0F
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jan 2020 00:02:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728905AbgAMXC7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Jan 2020 18:02:59 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:40572 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728924AbgAMXC6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Jan 2020 18:02:58 -0500
Received: by mail-lj1-f193.google.com with SMTP id u1so12053665ljk.7;
        Mon, 13 Jan 2020 15:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=p4M64cKVK4meL/7+gbzzavKi5vXxmm/qBtCEuLMydu0=;
        b=J70mHToXWBwgRVc6BJiIVuYwg7Uwv/4tPuNA92gIT1WBKvtF+5jMcAbEIeXX6xhRv3
         dcEC30sIGK6RZ7sWUDRuVdXvCEdv4h4jzWu756cBvyXR0V1lacpis88sNCO1jNqBgLIf
         Q+vin3gpEFtiOPeVJgjOqaodkktQeXgTxIm9c4uZ38Ks/EY18DiJsdrWs8yaChTVswms
         ohnrzrveRKr7S9AlClA4i8GzTbECK5elJgOElKvzLehKfqM1868TahgDK8JxWU6/+u6k
         MfkoGZPEzw/5rPDrSHNGJa3x1lWaGi8V1Iy5PiB2R4wglN9wnNHo1E6V8iwe2GuJY08l
         L1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=p4M64cKVK4meL/7+gbzzavKi5vXxmm/qBtCEuLMydu0=;
        b=KPBTu1wh4TPzkv9bKmpqKeZN0Me0C3PhZKwp/HJPU4cgNvTkDNKeABVdUen8kXyp59
         kM3yYila//qPfoJVZ1KLWCPolDSVndcc8R4H8CQ9w3Xwc3QZbuExVqo7zFvgZ2q+W/GT
         X+d/HKsFmsU/FaopbWwABtZ/AdSoH/As64QPFUIfjx4STrd2Jtuq3Eiq9xQ1yFItZhTP
         ioEX+8DzWBiYnnvvOZydMHerLDS/AEYwPvvYKzKCKz7ihhNgz32kGKxr6WUeQZHY6He8
         2kkrd8eJoYNi+J+LOlZ92iE9/oSEHpIhMsRzZi5tlzd05+zL5JcCy+oaU3buBbVZ5Odd
         ByvA==
X-Gm-Message-State: APjAAAWU/pfFYL3xo+pOIcv4dgEeJJmnG6s98BB3UQe3EL1jM2ttbkOV
        USSmADnbRfa1ktmSDGAVTAxaGyv6
X-Google-Smtp-Source: APXvYqyySrulaNXe0BNmEybz+MMb2HeiY++Aw/c4iZK99f7wYJQbsWvsqrH+UeYvhgDYlEQoC6PS2Q==
X-Received: by 2002:a2e:b4f6:: with SMTP id s22mr12177957ljm.218.1578956576903;
        Mon, 13 Jan 2020 15:02:56 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id w16sm6373834lfc.1.2020.01.13.15.02.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2020 15:02:56 -0800 (PST)
Subject: Re: [PATCH v4 0/8] NVIDIA Tegra I2C driver fixes and improvements
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200112171430.27219-1-digetx@gmail.com>
 <20200113215341.GA2689@ninjato>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <15860a85-39ee-3bb9-168c-c5a981ff3720@gmail.com>
Date:   Tue, 14 Jan 2020 02:01:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200113215341.GA2689@ninjato>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

14.01.2020 00:53, Wolfram Sang пишет:
> On Sun, Jan 12, 2020 at 08:14:22PM +0300, Dmitry Osipenko wrote:
>> Hello,
>>
>> This patchset adds support for atomic transfers which are required for
>> shutting down machine properly. Secondly, a (not)suspending I2C and some
>> other things are fixed/improved by this small series as well. Please review
>> and apply, thanks in advance!
>>
>> Changelog:
>>
>> v4: Removed the "clk: tegra: Fix double-free in tegra_clk_init()" patch
>>     from this series, which was added by accident in v3.
>>
>>     Added Thierry's tested-by to the patches.
> 
> Looks good to me. I think all these patches should go to v5.6, let me
> know if patches 1 and/or 2 should go to v5.5?
> 

Patches 1 and 2 should go into v5.5, thanks.
