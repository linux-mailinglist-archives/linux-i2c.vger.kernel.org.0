Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A86C38C192
	for <lists+linux-i2c@lfdr.de>; Fri, 21 May 2021 10:19:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230196AbhEUIU4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 May 2021 04:20:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230178AbhEUIU4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 May 2021 04:20:56 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 612FEC061574
        for <linux-i2c@vger.kernel.org>; Fri, 21 May 2021 01:19:33 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id et19so22157975ejc.4
        for <linux-i2c@vger.kernel.org>; Fri, 21 May 2021 01:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:cc:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=aaP9pNmUC/niC201OunfLCwSEIV14GwrqX7sp1oVPII=;
        b=KOXLnaeudwUcuKK2PR6kDRtfdVuB9Q0D6OlIHwIT5vGj5NGHA+BxsiDG4/Bi/D7Ycv
         qfX1Evckxl4LyWYenAhPBZ5nvOSQqRVjXL8YoizHHNP3RPgGdXQNvrw7gHLJ8OLtLEAt
         66r2qpdct1RLdSLY/HwYVW6gNUwgkEbPdL9xKhIZmEvBVl+CzxQ2D+L84uYqpfWo8C4Z
         wTk5qRP9J99Zeml11MVnwlpUbgjvjvIgltuLzFRs/0phOuLyzRyJPMCgsiVovAOgGBGT
         fzIwiX0fVriyl/RnRJUP5bQFODvwhbAI8QXpME8U+9yKcljhb18yJ4M9i+IQUKGaPVig
         Z1Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:cc:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=aaP9pNmUC/niC201OunfLCwSEIV14GwrqX7sp1oVPII=;
        b=LreKXoG7tekY9ktAN1RmzqRkNcvPkkz4IoPQbaJhpeiCJtisE3NuFtnzAeorIBTqIp
         joMryzKw0XRpXHDCaRXtddYTvSkprABC5Yw7S5Of8aLE+vW+oCwbByzD3496OLOev1zU
         BlAcXIj14Bnw2Jue8LFjvAuKXz/mrWPbvTf+xNPFjRrqB+ShTd6CTX2FF4Ip8ygOH/8H
         DR2GqIo9uFN6/hRfXzG2Hrz6sjmcfXEF19Zv3RRhmzReOSmrcEPFfRuq5LkJFk7z1ezQ
         Ut5qdt83ITmJS7XPpDR5F1nmie/73j32CiHeUXaPwm1pIVtSP2svqG7A+4pDeFFbK/E6
         22PA==
X-Gm-Message-State: AOAM533jzTkpHRf/sEu3OeA+/uEg6w0IW3b9d7hL3mU5AgMxHOVEdYAE
        PwGSw/sIrJijpTGHC7mqpmb3MePq1KPrgg==
X-Google-Smtp-Source: ABdhPJx8BS1mxGuQFqRomwFgAoV8gFp2rYCBlmEE6v3bdvFCVjUehBIuBW6TtdHGB9cuQI5z0j5fLw==
X-Received: by 2002:a17:906:408d:: with SMTP id u13mr663234ejj.128.1621585171619;
        Fri, 21 May 2021 01:19:31 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f38:4600:9d15:18e:4e9:7e3? (p200300ea8f3846009d15018e04e907e3.dip0.t-ipconnect.de. [2003:ea:8f38:4600:9d15:18e:4e9:7e3])
        by smtp.googlemail.com with ESMTPSA id u14sm3472151edy.47.2021.05.21.01.19.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 May 2021 01:19:31 -0700 (PDT)
To:     Jean Delvare <jdelvare@suse.com>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: i801_smbus: no runtime pm since a9c8088c7988 ("i2c: i801: Don't
 restore config registers on runtime PM")
Message-ID: <a9ad7cb4-ca40-1c25-9c9a-f7f167ad8be9@gmail.com>
Date:   Fri, 21 May 2021 10:19:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Before the referenced commit we used i801_suspend and i801_resume also as
runtime pm callbacks. That's no longer the case, and at least on my
platform the SMBus controller PCI device doesn't support PM. Therefore
PCI core can't do what it would do for other devices: bring them to D3hot
or D3cold.
Having said that effectively there is no runtime pm any longer. Not sure
whether there are SMBus controller versions where the PCI device supports
PM.

So my questions are:
Does the SMBus controller support any power-saving modes?
i801_suspend() just sets SMBHSTCFG to the value it had when the driver
was loaded. Means if SMBHSTCFG_HST_EN was enabled already, we won't clear
it. And this bit may have an impact on some internal PLL's (just guessing).
If there's no good-enough power-saving option, then runtime pm support
could be removed completely, or?


00:1f.4 SMBus: Intel Corporation Cannon Lake PCH SMBus Controller (rev 10)
        DeviceName: Onboard - Other
        Subsystem: ASUSTeK Computer Inc. Device 8694
        Flags: medium devsel, IRQ 16
        Memory at a1316000 (64-bit, non-prefetchable) [size=256]
        I/O ports at efa0 [size=32]
        Kernel driver in use: i801_smbus
        Kernel modules: i2c_i801

Heiner
