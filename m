Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F182F330559
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Mar 2021 01:31:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233375AbhCHAbT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 7 Mar 2021 19:31:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233358AbhCHAbG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 7 Mar 2021 19:31:06 -0500
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 868CAC06174A;
        Sun,  7 Mar 2021 16:31:06 -0800 (PST)
Received: by mail-ot1-x32e.google.com with SMTP id a17so7623840oto.5;
        Sun, 07 Mar 2021 16:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3rM9/pP2BdU9S9K45RbV/1PyW9E84N2VnvEOvgoysKo=;
        b=eQGiPKxpjQVwNXAAfD2+DrADN3mZLlzwN/UkcPJf8DId+9uHEuqGSbKA34m0aQZRSf
         mhrtlQGpZgrwhdhVhu2WRKsMOb6HtkUXgcAUYK5EYwbIUCp+um1trazcRcvWlcud7SPE
         WqlNeZsqpk0V16lni0RA0muIT7XgTow6W8J8Z5e2hOuCZXkS7ASW+/kpJ8kI6U7B4m2d
         fjmfjaeq51Wce2d3YDXIVCvFTXa4/zxmaaLzYPdBLRZxzoUrs9Bfj0jstcF7bzgXIPGr
         Cdd/Cm0dY3yfBl3W+l8e/1MqyUpcERRiyczyT2NTdbh0Wmr5u0lnTQ15M7WiHCqO5b+L
         jPkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=3rM9/pP2BdU9S9K45RbV/1PyW9E84N2VnvEOvgoysKo=;
        b=DCawbQ7n39YqcmWa1VzzOtdKB1Y+yY9XiIDiBo6MuVPJbRsIGNacjaxY3q53GPEH6S
         ew0T9bTNP+Z2Gd0gPIz0a6gwygHSc7+NwY/IiT8RRnqrCysie1iLSwTFte0hG/uxhOiJ
         c6uYPev12MmGD/xhZiSuFCFJh/F2qyCi1j/zckgeexLTg/WeU23E19Jei5gfjnGc+xRK
         z0+1U5f4t0NuejIt0oqPmtdt9zMxefssyO44GpUpjZET48MRhZczuxvePNEfhhp4u4in
         kKvdGnLe1No5CNS9Cgi/ohVhina9byRezrRNZz3GwJUr3iKF4Zsc+Ux5XpO+XGc0aJpf
         fCqw==
X-Gm-Message-State: AOAM533k8nYU3C0BmhtZgHloM/8puOGpCMnjbAv4TcMoDYN7XtmgScZD
        /5o5x/oz8p5pFvF1tMZL8SNx4maE9Z4=
X-Google-Smtp-Source: ABdhPJxcY/PsIuP1QCQMExD7EUhuFX98c3eff4h+efhDQPwCezNogvk6E36EWcbQhjtWGcTuIAS86g==
X-Received: by 2002:a05:6830:1de9:: with SMTP id b9mr17379623otj.137.1615163465375;
        Sun, 07 Mar 2021 16:31:05 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e82sm2039691oob.37.2021.03.07.16.31.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Mar 2021 16:31:04 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: Errant readings on LM81 with T2080 SoC
To:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
        "jdelvare@suse.com" <jdelvare@suse.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <8e0a88ba-01e9-9bc1-c78b-20f26ce27d12@alliedtelesis.co.nz>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <96d660bc-17ab-4e0e-9a94-bce1737a8da1@roeck-us.net>
Date:   Sun, 7 Mar 2021 16:31:02 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8e0a88ba-01e9-9bc1-c78b-20f26ce27d12@alliedtelesis.co.nz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 3/7/21 2:52 PM, Chris Packham wrote:
> Hi,
> 
> I've got a system using a PowerPC T2080 SoC and among other things has 
> an LM81 hwmon chip.
> 
> Under a high CPU load we see errant readings from the LM81 as well as 
> actual failures. It's the errant readings that cause the most concern 
> since we can easily ignore the read errors in our monitoring application 
> (although it would be better if they weren't there at all).
> 
> I'm able to reproduce this with a test application[0] that artificially 
> creates a high CPU load then by repeatedly checking for the all-1s 
> values from the LM81 datasheet[1](page 17). The all-1s readings stick 
> out as they are obviously higher than the voltage rails that are 
> connected and disagree with measurements taken with a multimeter.
> 
> Here's the output from my device
> 
> [root@linuxbox ~]# cpuload 90&
> [root@linuxbox ~]# (while true; do cat /sys/class/hwmon/hwmon0/in*_input 
> | grep '3320\|4383\|6641\|15930\|3586'; sleep 1; done)&
> 3586
> 3586
> cat: read error: No such device or address
> cat: read error: No such device or address
> 3320
> 3320
> 3586
> 3586
> 6641
> 6641
> 4383
> 4383
> 
> Fundamentally I think this is a problem with the fact that the LM81 is 
> an SMBus device but the T2080 (and other Freescale SoCs) uses i2c and we 
> emulate SMBus. I suspect the errant readings are when we don't get round 
> to completing the read within the timeout specified by the SMBus 
> specification. Depending on when that happens we either fail the 
> transfer or interpret the result as all-1s.
> 

That is quite unlikely. Many sensor chips are SMBus chips connected to
i2c busses. It is much more likely that there is a bug in the T2080 i2c driver,
that the chip doesn't like the bulk read command issued through regmap, that
the chip has problems with the i2c bus speed, or that the i2c bus is noisy.

In this context, the "No such device or address" responses are very suspicious.
Those are reported by the i2c driver, not by the hwmon driver, and suggest
that the chip did not respond to a read request. Maybe it helps to enable
debugging to the i2c driver to see if it reports anything useful. Even
better might be to connect an i2c bus analyzer to the i2c bus and check
what is going on.

Guenter
