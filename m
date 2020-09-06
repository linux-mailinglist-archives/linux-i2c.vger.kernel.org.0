Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8A1025ED4E
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Sep 2020 10:01:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725788AbgIFIBE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Sep 2020 04:01:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725497AbgIFIBE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Sep 2020 04:01:04 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20A60C061573
        for <linux-i2c@vger.kernel.org>; Sun,  6 Sep 2020 01:01:00 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id l63so9711955edl.9
        for <linux-i2c@vger.kernel.org>; Sun, 06 Sep 2020 01:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=0n2GkfaY2axEWvZQfDDSpa4H93Ktd0KUOaTLuWEvXPs=;
        b=tp0Zva03H8Qwy5C1xgnwz9TodaQcgepDEEdusQSNBFHIGWel8N/C1KJxvXTGUs66Ds
         Dozj+hTQpeFYNZvgyoeMFKtjY7YbW/h1kLm0zyKi8s/E9KZFfJTON+HuJaECYf88VO5X
         uJZ6y9RMPCb+hiLd/HoWOE2TfP7pBwGbw3d9XGAsCTfaDrZ4V+3NdizCJ1bi7SazvMR9
         oJlAMduxa96dgHLDE47K+unUb8lbJaPwPXQQvhaisnSCvGMRHCpNfCqvodvTVNQI3EAy
         Bch7NQY4S613ckXyXAJfxLmrAHkz4sizVzT/t2H0MvDeGPvE7DsXz+YzoRSVAS/LxL4v
         FOFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=0n2GkfaY2axEWvZQfDDSpa4H93Ktd0KUOaTLuWEvXPs=;
        b=F2bDQTZA7DaImwTj3ve4XNRTSCuRhESkouKvqjHdWFBqH6Dvfnb9Kl2H6sqVcvnnO4
         bM+J+Un/xaoYCaikkrzLhEBgd243B6PhkIoRJmRfc74W81aPs/4IKnQPs4NKazt1+kK5
         /iD+m3IdW7VfiwFsqa3e5TQ8v0NfrxLYzEgOCqWAGNunBp/zTszAsmDz3e/bOVwxPnt4
         hZfK9x/SH7x6x1a3zl8s06uh9ga+Dl1M/A7KC/omDx40m00bhAyzeaAYMHH2SKLYF9ss
         dyRpFqnSnqg0c366Q6W0/s1X0zzhdWdcpetROHBnQdl4vaQJM1liCBDrq7VRSe/u5wEw
         OFnA==
X-Gm-Message-State: AOAM532+5rA3iZgCpjPMG4v19hWqpGWgowdiUN1j1VH2xHpsCOqAz3ml
        E610IBDGntjq93JmZv4eo/g=
X-Google-Smtp-Source: ABdhPJzXTtV8Bd1Zw2qT28Zmj7oaNdT8VL6qWS5fbm0zzC08vh76zs+AVbaQMgj2Zl4NiAenkaAFqg==
X-Received: by 2002:aa7:c9ce:: with SMTP id i14mr17113940edt.186.1599379258490;
        Sun, 06 Sep 2020 01:00:58 -0700 (PDT)
Received: from ?IPv6:2003:df:1f11:8900:6a05:caff:fe39:4909? (p200300df1f1189006a05cafffe394909.dip0.t-ipconnect.de. [2003:df:1f11:8900:6a05:caff:fe39:4909])
        by smtp.googlemail.com with ESMTPSA id q11sm11066450eds.16.2020.09.06.01.00.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2020 01:00:57 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] i2c: i801: Fix resume bug
To:     Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Bjorn Helgaas <helgaas@kernel.org>,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        Wolfram Sang <wsa@kernel.org>
References: <20200901152221.3cea0048@endymion>
From:   =?UTF-8?Q?Volker_R=c3=bcmelin?= <volker.ruemelin@googlemail.com>
Message-ID: <19d445a6-0410-78a0-77aa-4297e864d064@googlemail.com>
Date:   Sun, 6 Sep 2020 10:00:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200901152221.3cea0048@endymion>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jean,

with these two patches the code in i2c-i801.c looks really good.

But there is an issue with the reproducer.

> I noticed this bug in a QEMU x86_64 q35 VM booted with OVMF. OVMF
> doesn't inititialize the SMBus master. After 1s of SMBus inactivity
> autosuspend disables the SMBus master. To reproduce please note QEMU's
> ICH9 SMBus emulation does not handle interrupts and it's necessary
> to pass the parameter disable_features=0x10 to the i2c_i801 driver.

Since commit a9c8088c7988e "i2c: i801: Don't restore config
registers on runtime PM" the reproducer doesn't work anymore.
This is because commit a9c8088c7988e works as intended and the
pm->runtime_* callbacks no longer call i801_suspend() and
i801_resume().

But there is more. With the SMBus master in runtime suspended state
the direct-complete mechanism skips the calls to the pm->suspend
and pm->resume callbacks on system suspend/resume. I am convinced
in nearly all cases this disables the fix from commit a5aaea37858fb
"i2c-i801: Restore the device state before leaving".

At the moment I see two ways to fix this problem. One way is to
revert a9c8088c7988e "i2c: i801: Don't restore config registers
on runtime PM", the other is to set the driver flag
DPM_FLAG_NO_DIRECT_COMPLETE in i801_probe(). I tested both, but I
can't decide which way is better.

With best regards,
Volker

