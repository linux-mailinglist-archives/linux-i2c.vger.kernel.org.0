Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73CE53DCBF0
	for <lists+linux-i2c@lfdr.de>; Sun,  1 Aug 2021 16:16:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231577AbhHAOQA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 1 Aug 2021 10:16:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231961AbhHAOP7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 1 Aug 2021 10:15:59 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEB2BC061796
        for <linux-i2c@vger.kernel.org>; Sun,  1 Aug 2021 07:15:42 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id o7-20020a05600c5107b0290257f956e02dso5731626wms.1
        for <linux-i2c@vger.kernel.org>; Sun, 01 Aug 2021 07:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=DSSOSeXpAOh/bvGQvnSv18BC/U4Hf/zHTlZqJxuOuJs=;
        b=rVMTXEty6i7bpu9EvtKWM1DN9OjBgUsTdiaevwdrYlm+duam74sNlWCA8J5Zp7bN3y
         uqYs3XpZr8oDm15EaicJR4EAAK5rHpWwAAa9HcEOELWSvhsGmbIH85vzKB/hnA6Xbyr6
         OO8DS1H1sUF023+bjAlOGYIQdBPw1KJXq2FJ4x3bq+XgO0tl9bToRMgTOGMF+OdwIkWd
         sE/nIe+czEt/lxNPJHsfYSq8jibmku8755VAUItR3QebML1to9yW/fHvZtibe1dSWWQY
         b2YOC2qMooXXXTsw92iQOyIeReMu0OZVL8TEyfCkC5C9ODDPmNPnd+hjyZ5nNUHzbiyb
         ICRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=DSSOSeXpAOh/bvGQvnSv18BC/U4Hf/zHTlZqJxuOuJs=;
        b=iOLJV/AFiGmgiqbeucEgCraWrHefLPTv+nF2N05qVhvZr034YQq1x+gq5dzL9AtAkw
         fL+3XmTC2aMxPlj8A+JVHYcuj4We9ijEz3h3qMP/mAAvzkHRzhCm/0m18SdjUj65flvz
         iF8o9hpMDpG6890g1kndD0zjxZEx/I0k5PIst5IH06EuKObT6na8iuLlZW8LW12HcmGQ
         g/daX8bKjbge0cYTz+Vi86qjsvirIY5CgS+YjkP3JwrO9YXP/4sQUF5kgTdOfhBlJgOA
         p46I9OU2kvKW0d78jmo/RdLN7CEpvLLQ66UM9f9j+HMo/kLoTn9Af6pRyH1juJJrw3Kn
         ZH4g==
X-Gm-Message-State: AOAM5325f7mn76M4VdWZUwUAW1dUPPPoXqABIudNx8eSMctngkmA+SM0
        RSIqPB+PsrhIXWK08B8ir84ZjmGaxXQu1w==
X-Google-Smtp-Source: ABdhPJxP/8sTyeLAxSn2x+ySMSQKB6YhTavFxVLkAPMZ2JafcIQbT9PJW1+mhywXiPkdnILZXLbGaQ==
X-Received: by 2002:a1c:ed0a:: with SMTP id l10mr12344649wmh.151.1627827341121;
        Sun, 01 Aug 2021 07:15:41 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f10:c200:9d9e:757:f317:c524? (p200300ea8f10c2009d9e0757f317c524.dip0.t-ipconnect.de. [2003:ea:8f10:c200:9d9e:757:f317:c524])
        by smtp.googlemail.com with ESMTPSA id j14sm8049644wrr.16.2021.08.01.07.15.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Aug 2021 07:15:40 -0700 (PDT)
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 00/10] i2c: i801: Series with improvements
Message-ID: <7a1581de-7566-15da-d1af-08cbf8c5e46f@gmail.com>
Date:   Sun, 1 Aug 2021 16:15:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This series includes a number of improvements to the i801 driver.

Heiner Kallweit (10):
  i2c: i801: Don't call pm_runtime_allow
  i2c: i801: Improve disabling runtime pm
  i2c: i801: Make p2sb_spinlock a mutex
  i2c: i801: Remove not needed debug message
  i2c: i801: Improve is_dell_system_with_lis3lv02d
  i2c: i801: Remove not needed check for PCI_COMMAND_INTX_DISABLE
  i2c: i801: Improve i801_acpi_probe/remove functions
  i2c: i801: Improve i801_add_mux
  i2c: i801: Improve register_dell_lis3lv02d_i2c_device
  i2c: i801: Improve handling platform data for tco device

 drivers/i2c/busses/i2c-i801.c | 138 +++++++++++-----------------------
 1 file changed, 44 insertions(+), 94 deletions(-)

-- 
2.32.0

