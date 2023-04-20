Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9584B6E9F5D
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Apr 2023 00:51:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233080AbjDTWvz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Apr 2023 18:51:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230304AbjDTWvy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Apr 2023 18:51:54 -0400
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00C714C1A
        for <linux-i2c@vger.kernel.org>; Thu, 20 Apr 2023 15:51:51 -0700 (PDT)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1a66888cb89so14261385ad.3
        for <linux-i2c@vger.kernel.org>; Thu, 20 Apr 2023 15:51:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682031111; x=1684623111;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FHEo6J6OzA1z03GQ8P/8IuPGJgsY0yZmfuZPfGcJq/Y=;
        b=E/jEZ8mX400WMcBh2oQwUtMg71jq3rBvTUSgz1lSstMKOu2OCWDkb+VNIbFBIdZp49
         Pc7z2pXJyJCtrZ1Q+8WgJgmMTbtkAn/1Q42hyYqhriAEZm8HGF94O1VMrg5Pek8VWU3M
         dDjMQz1Ro7ea24myh/a5i790OnX4rNtg7fBDL43cmljGiCUihTWkgl5NQlUP0O+HqxCA
         O/r1cnSbrjIy8Z46jK6D/AuyeCpO/65jIF6aC++NuAlQbSmBMumVq2B9kcfYe1iK9DdG
         r9BBRHlCdlZzrogVbFE4ciFiwkj3IxKTk37p4TZWKQkU3vGeSqUAAdTzMl4hSX/c3aIA
         nuBg==
X-Gm-Message-State: AAQBX9cY+ys4f2x44eS0ldZW5xipU8ClE9mABqd8rwg4pQuVsjzCVKzD
        82916xbpqDoUbfpxlfxzk6cTTYHbwvE=
X-Google-Smtp-Source: AKy350ZKpQuiB6dovM4K5VQNseSQJxgc61k1na9g6ZdXHIAPgje74epdv4T2t6dBixC5f0WCdHEUtQ==
X-Received: by 2002:a17:902:d505:b0:1a2:8871:b408 with SMTP id b5-20020a170902d50500b001a28871b408mr3931417plg.36.1682031111177;
        Thu, 20 Apr 2023 15:51:51 -0700 (PDT)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com. [209.85.214.182])
        by smtp.gmail.com with ESMTPSA id y23-20020a17090a16d700b0023670dbb82fsm1590725pje.25.2023.04.20.15.51.50
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 15:51:50 -0700 (PDT)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1a5197f00e9so14421025ad.1
        for <linux-i2c@vger.kernel.org>; Thu, 20 Apr 2023 15:51:50 -0700 (PDT)
X-Received: by 2002:a17:903:40ca:b0:1a6:ee5a:7208 with SMTP id
 t10-20020a17090340ca00b001a6ee5a7208mr3234368pld.18.1682031109740; Thu, 20
 Apr 2023 15:51:49 -0700 (PDT)
MIME-Version: 1.0
From:   =?UTF-8?B?SmVhbi1GcmFuw6dvaXMgUm95?= <jf@devklog.net>
Date:   Thu, 20 Apr 2023 15:51:38 -0700
X-Gmail-Original-Message-ID: <CAE8T=_HGM+gKQguOasGSKi5YXh91S62QYA2=MC45CLJPYxrVAg@mail.gmail.com>
Message-ID: <CAE8T=_HGM+gKQguOasGSKi5YXh91S62QYA2=MC45CLJPYxrVAg@mail.gmail.com>
Subject: [ee1004] Failed to select page 0 - G.Skill Trident Z5 NEO DDR5, ASUS
 X670E board - 6.2.11-arch1-1
To:     linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello,

On a ASUS X670E (AMD AM5 platform) board, I am unable to read the
eeprom for my memory (through decode-dimms). The SMBus is driven by
piix4_smbus.

i2cdetect -l lists the following:

i2c-0   i2c             Synopsys DesignWare I2C adapter         I2C adapter
i2c-1   i2c             NVIDIA i2c adapter 2 at 1:00.0          I2C adapter
i2c-2   i2c             NVIDIA i2c adapter 3 at 1:00.0          I2C adapter
i2c-3   i2c             NVIDIA i2c adapter 4 at 1:00.0          I2C adapter
i2c-4   i2c             NVIDIA i2c adapter 5 at 1:00.0          I2C adapter
i2c-5   i2c             NVIDIA i2c adapter 6 at 1:00.0          I2C adapter
i2c-6   smbus           SMBus PIIX4 adapter port 0 at 0b00      SMBus adapter
i2c-7   smbus           SMBus PIIX4 adapter port 2 at 0b00      SMBus adapter
i2c-8   smbus           SMBus PIIX4 adapter port 1 at 0b20      SMBus adapter

Looking at i2c-6:

i2cdetect -y 6 0x50 0x70
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:
10:
20:
30:
40:
50: -- 51 -- 53 -- -- -- -- -- -- -- -- -- -- -- --
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
70: --

I think those are the memory eeproms. If I bind them to ee1004 as so:

echo ee1004 0x51 >/sys/bus/i2c/devices/i2c-6/new_device
echo ee1004 0x53 >/sys/bus/i2c/devices/i2c-6/new_device

The kernel prints:

[ 1642.373579] ee1004 6-0051: 512 byte EE1004-compliant SPD EEPROM, read-only
[ 1642.373588] i2c i2c-6: new_device: Instantiated device ee1004 at 0x51
[ 1645.328289] ee1004 6-0053: 512 byte EE1004-compliant SPD EEPROM, read-only
[ 1645.328299] i2c i2c-6: new_device: Instantiated device ee1004 at 0x53

But then when I use decode-dimms, the kernel is unable to select page 0:

[ 1697.112564] ee1004 6-0051: Failed to select page 0 (-6)
[ 1702.581605] ee1004 6-0051: Failed to select page 0 (-6)

I tried looking for a SPD write enable/disable option in the system
firmware but didn't see any (I am trying to confirm if that feature
exists or not).

All this on 6.2.11-arch1-1.
