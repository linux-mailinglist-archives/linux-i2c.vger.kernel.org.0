Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2E813E30B0
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Aug 2021 23:10:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234753AbhHFVLH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Aug 2021 17:11:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231431AbhHFVLH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 Aug 2021 17:11:07 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D80D0C0613CF
        for <linux-i2c@vger.kernel.org>; Fri,  6 Aug 2021 14:10:49 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id l18so12667982wrv.5
        for <linux-i2c@vger.kernel.org>; Fri, 06 Aug 2021 14:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=Pe6wkVKIN0eBOIupzZhTEm6EbyMWjUI9685wvHuh2pQ=;
        b=CvD55yakGozj2f9QrbIwe/W0iZcRC3w7g6v1gYFcqngkKYE/Rjyh9pHWs45F4Z+THZ
         Qd21MMQVNdSP707c1o1oxZ4ONDyTXo7pmpbctnRKfZBoUc4YN1gzrgGUMjvUHBu7LJfC
         tddVWz6xNiRS9YwUc/edG5B/4mM0yWPPrrQf4byPxPWAAy+pT0cqDEMDqoWBJIqAmk93
         VhMFlHX8SuNBMpBZerv1MQIWjuJWaIr9GfDS+PRwaOPUZvuvEqAJmbG+m6WpXx1TTL9O
         EVxNCUEsuPrCqlrxJ5WBbr4YAqrbnd9OHnDiHGbCZenUC0YSDrOG93azsMsIh7UMi+ht
         dnfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=Pe6wkVKIN0eBOIupzZhTEm6EbyMWjUI9685wvHuh2pQ=;
        b=efhhGk9BcfOXC+fJSZ71tghgxuB+EI2UvaoHdJPAnp05lZpZ2h/vLu2KpexvAHDagW
         vdm7ASjP4PClEQKw8RIAufWItG2xFpNzXWP1hg+RzAK49q+4MHUaSnLv4t0zgOZSTeB+
         hTTluBOXgRxg41WIWiLPnpRQEqFl53ROzOXAwFs9dn6mOWLOo7FmRDNOQxm6kXckV426
         SfVN0Fz0LqUXqUdpxKvoFPJY8yarT46ReUZameq9O5AQGZOgXiSwsENRhc3zIZ4xjq9s
         1Qf+YpPXqm05yO2VHiXG2R8RzrvrLAjiJeItWpxRW5lGpe3ZGRVNw8XREYGrxRJ88mdo
         VRng==
X-Gm-Message-State: AOAM530BHlbdRzoaGofFVSwKPe8Iy92+y/kkepZ+qn1HWsmDIOKMWQ7G
        4WDKoTwVo6APia5b+2K1fV8AeMAq4E2YgQ==
X-Google-Smtp-Source: ABdhPJyJW6jRu454Q1Hs8UDk3pwliQq6Qhfhql9XgCdwgrn7f6BxNrCoutm3mrCh/VIGVJKy1JLL+A==
X-Received: by 2002:a5d:44cb:: with SMTP id z11mr12880080wrr.100.1628284248393;
        Fri, 06 Aug 2021 14:10:48 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f10:c200:cc6d:4891:c067:bf7b? (p200300ea8f10c200cc6d4891c067bf7b.dip0.t-ipconnect.de. [2003:ea:8f10:c200:cc6d:4891:c067:bf7b])
        by smtp.googlemail.com with ESMTPSA id o17sm9286765wmp.31.2021.08.06.14.10.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Aug 2021 14:10:48 -0700 (PDT)
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2 0/9] i2c: i801: Series with improvements
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Message-ID: <e46ac7c1-1bb0-2caf-58e6-2fcaa89d30ae@gmail.com>
Date:   Fri, 6 Aug 2021 23:10:34 +0200
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

v2:
removed first patch from v1 series
patch 2
  - include linux/mutex.h
patch 4
  - avoid assigning potentially dangling pointer to *return_value
patch 8
  - move definition of struct i2c_board_info info to inner loop
  - add missing curly braces to outer for loop

Heiner Kallweit (9):
  i2c: i801: Improve disabling runtime pm
  i2c: i801: make p2sb_spinlock a mutex
  i2c: i801: Remove not needed debug message
  i2c: i801: Improve is_dell_system_with_lis3lv02d
  i2c: i801: Remove not needed check for PCI_COMMAND_INTX_DISABLE
  i2c: i801: Improve i801_acpi_probe/remove functions
  i2c: i801: Improve i801_add_mux
  i2c: i801: Improve register_dell_lis3lv02d_i2c_device
  i2c: i801: Improve handling platform data for tco device

 drivers/i2c/busses/i2c-i801.c | 138 ++++++++++++----------------------
 1 file changed, 48 insertions(+), 90 deletions(-)

-- 
2.32.0

