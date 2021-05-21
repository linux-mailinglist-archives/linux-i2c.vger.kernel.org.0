Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6E8138C7F5
	for <lists+linux-i2c@lfdr.de>; Fri, 21 May 2021 15:26:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235214AbhEUN2D (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 May 2021 09:28:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234701AbhEUN1f (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 May 2021 09:27:35 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 162ABC061763
        for <linux-i2c@vger.kernel.org>; Fri, 21 May 2021 06:26:12 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id r12so21082560wrp.1
        for <linux-i2c@vger.kernel.org>; Fri, 21 May 2021 06:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:references:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hW+hyw/kUwWUwWDTmDtf2l0lzI8Lbv17LkYy1lDof50=;
        b=byTzDjRq3QpugHZIe3NtH4j7br/6NzzgVhuL5NZo6hSK69eONj8azdE2GYGH3bfCWx
         Vzjc3cgYBFsWh+/0GfS8bEx+J2NNRcjGteaHPUBRFrszBZa8SbYM6IFF3WzN6cgWneca
         RW2i08/R5FrxzP2txnEIH6ehdQwnrExEqPOu/wMh8wnXatLREN+NtJFYsBEX/nKuBK8Z
         hpthmnsmzmViPWS7euhBDhHSbeETnsNWbg4c/qBqpjHhffWdVjDU5FjTKstGf8/KKe41
         iMEdC8D0McyjlKOV9dHrNqk8twcXahwZKzPQd++3kmpN0DyhQ/QpMc9CuHxGzQSDUp8C
         vSCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:references:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hW+hyw/kUwWUwWDTmDtf2l0lzI8Lbv17LkYy1lDof50=;
        b=e1MnPGWCcHVyVZfPcbeHJTae7kpkeHXNbqnb2FgPa6jun+oKVML08Nv1Dg64FIEgxO
         owj8rCOhWMKQWq9W3E3hAyz7HccZq8tx9Om/0DYCL+ZC3nknvf580NQ6O/DNWlmOLAxM
         qmcDm4FMoiCC/DfsMVLcG1Zoqlsvr5/1MJNdNnKvYkFZIvulTJKLRhug1ZmiNX3YlQ3P
         keYNyrUaB2XZuYFtoWmVx/SMwwAquWGhHB10JLEsrmO2PTaxQlRB52r7DhwnXLLYtQw9
         kg66ttSS+elE6LJvf/RdZX67lvz5nwe+l5au5RqnoJr8rhz9En6ooJ6nnMq2nZr5TCgi
         xBOA==
X-Gm-Message-State: AOAM530PzOxbyhw14FbxwA/YeQlUKcxjFpJ/ziJyGA62j347mV1bgDvK
        vAtHEgm/o9to75hZ9CXgnaOK3tqN4z0=
X-Google-Smtp-Source: ABdhPJzBms2CzWit9TD7bPAJ3dZxBP6H0gqkADCRu0HkHwqTf9RoHtsN3sM5M0masMYlNNqcQ1rg0A==
X-Received: by 2002:adf:b356:: with SMTP id k22mr6222749wrd.80.1621603570678;
        Fri, 21 May 2021 06:26:10 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f38:4600:9d15:18e:4e9:7e3? (p200300ea8f3846009d15018e04e907e3.dip0.t-ipconnect.de. [2003:ea:8f38:4600:9d15:18e:4e9:7e3])
        by smtp.googlemail.com with ESMTPSA id i1sm2221346wrp.51.2021.05.21.06.26.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 May 2021 06:26:10 -0700 (PDT)
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>
References: <a9ad7cb4-ca40-1c25-9c9a-f7f167ad8be9@gmail.com>
Subject: Re: i801_smbus: no runtime pm since a9c8088c7988 ("i2c: i801: Don't
 restore config registers on runtime PM")
Message-ID: <b61f2014-fa9d-f63a-7ea2-3c9226411a58@gmail.com>
Date:   Fri, 21 May 2021 15:26:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <a9ad7cb4-ca40-1c25-9c9a-f7f167ad8be9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 21.05.2021 10:19, Heiner Kallweit wrote:
> Before the referenced commit we used i801_suspend and i801_resume also as
> runtime pm callbacks. That's no longer the case, and at least on my
> platform the SMBus controller PCI device doesn't support PM. Therefore
> PCI core can't do what it would do for other devices: bring them to D3hot
> or D3cold.
> Having said that effectively there is no runtime pm any longer. Not sure
> whether there are SMBus controller versions where the PCI device supports
> PM.
> 
> So my questions are:
> Does the SMBus controller support any power-saving modes?
> i801_suspend() just sets SMBHSTCFG to the value it had when the driver
> was loaded. Means if SMBHSTCFG_HST_EN was enabled already, we won't clear
> it. And this bit may have an impact on some internal PLL's (just guessing).
> If there's no good-enough power-saving option, then runtime pm support
> could be removed completely, or?
> 
> 
> 00:1f.4 SMBus: Intel Corporation Cannon Lake PCH SMBus Controller (rev 10)
>         DeviceName: Onboard - Other
>         Subsystem: ASUSTeK Computer Inc. Device 8694
>         Flags: medium devsel, IRQ 16
>         Memory at a1316000 (64-bit, non-prefetchable) [size=256]
>         I/O ports at efa0 [size=32]
>         Kernel driver in use: i801_smbus
>         Kernel modules: i2c_i801
> 
> Heiner
> 
+Jarkko as author of the change that added runtime pm

The commit message of the original change says:
"those platforms that support PM for i801 device"
Which platforms are this? Independent of the i801 generation I didn't see
any SMBus host controller supporting the PCI Power Management capability
yet.
