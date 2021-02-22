Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE28132223A
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Feb 2021 23:38:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230326AbhBVWig (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Feb 2021 17:38:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231152AbhBVWif (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Feb 2021 17:38:35 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2C63C061574;
        Mon, 22 Feb 2021 14:37:54 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id i7so663478wmb.0;
        Mon, 22 Feb 2021 14:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=OG84TCVpzOvu0k+n0n+mBjAnoUroeSHULIlvXLAswOQ=;
        b=KjLbT1T6wGDYkYrP1rC7MvL8hgAAM1DzCaojVOdGag82ig4oJrCiHArQmceF44/Li+
         JE+/8D7gWnMxJipthpHRF6JBDj5t5KdT7N0MoIyvdNSBXIQpoLIuDK8jwvaaKrKlbK/E
         52yJXZzOKMw0PvEfhZhEQZ4M3QHuEroBs4AVINrHokkQycuiYPnts7Hs7Mnl8cawcm+F
         04qcsvCpNShaLAlJyzRx65apTthWGRJkPXTXyJTVCd3K3xOwtqOhXaH0D3X58ZeDnvx5
         grxPJHJM8NrvMP20LMMM1IBMyX7xqzULxOb+H2JLBUndg1WwiWtqzpZfp5lfX92g8sED
         rN2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=OG84TCVpzOvu0k+n0n+mBjAnoUroeSHULIlvXLAswOQ=;
        b=M1UMngQm6gCbBacEnZ1V9EAXCU8l1soVoHeMh2L8EUbSZv/MPrn7BD8BS2H756C6kG
         HLBWIKd9g+ol082DwbfJ7DJItdGp0Ej037vjDIYEGi5Kf2hIzrNF94zrnF7XlkEKBXkn
         zSX9jtlZYFPziJxkIqVbdVPUhjCRWpEIcYT7PB17UTcHI5DVLQkN6BNe4LKsyUDAI2Ti
         lwx4FQ4MQKNEC/ApHxOC7WC1m3u5nMWlWOy97wMWGrXxQGJQ0tsrnTL35954bcEEpAEr
         R67tQZGuGb6tjoWg+905ww2Hls9Ap2svhgdEPEYTMbChxsIuel3UzcDItqsKvD/KhY20
         4XjA==
X-Gm-Message-State: AOAM5335O5GbUAl64YM1j5MotZjJgHkIO63v+EEegSM6g1OrjH+fczco
        YCpZLTrwsZu0uFSqJKxsEv4=
X-Google-Smtp-Source: ABdhPJxF3LwORa249PDud7gcZLOJApH8R9HWg9suqvDcMjAIbN36Nf77fwz2awTGfkrXN6VYi0EqSQ==
X-Received: by 2002:a7b:c5c7:: with SMTP id n7mr22017751wmk.63.1614033473415;
        Mon, 22 Feb 2021 14:37:53 -0800 (PST)
Received: from [192.168.1.211] ([2.31.224.123])
        by smtp.gmail.com with ESMTPSA id v9sm26246302wrn.86.2021.02.22.14.37.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Feb 2021 14:37:52 -0800 (PST)
Subject: Re: [PATCH v3 6/6] mfd: tps68470: Remove tps68470 MFD driver
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        andy.shevchenko@linux.intel.com,
        kieran.bingham+renesas@ideasonboard.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Robert Moore <robert.moore@intel.com>,
        Erik Kaneda <erik.kaneda@intel.com>, me@fabwu.ch,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        devel@acpica.org
References: <20210222130735.1313443-1-djrscally@gmail.com>
 <20210222130735.1313443-7-djrscally@gmail.com>
 <CAHp75Veb=0OOE=iyt5ua46HkMuG6_Xu1bWAxzZX5d3378CrfNg@mail.gmail.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <995b2a4e-601a-3256-9348-bcad173826ff@gmail.com>
Date:   Mon, 22 Feb 2021 22:37:51 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Veb=0OOE=iyt5ua46HkMuG6_Xu1bWAxzZX5d3378CrfNg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 22/02/2021 14:12, Andy Shevchenko wrote:
> On Mon, Feb 22, 2021 at 3:12 PM Daniel Scally <djrscally@gmail.com> wrote:
>> This driver only covered one scenario in which ACPI devices with _HID
>> INT3472 are found, and its functionality has been taken over by the
>> intel-skl-int3472 module, so remove it.
> As long as patch 5 accepted
> Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Great - thank you! And likewise for the R-bs on the previous patches,
I'll follow all the comments for those
