Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37EDA319D4
	for <lists+linux-i2c@lfdr.de>; Sat,  1 Jun 2019 08:11:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726109AbfFAGL1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 1 Jun 2019 02:11:27 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:46691 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725901AbfFAGL1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 1 Jun 2019 02:11:27 -0400
Received: by mail-pf1-f195.google.com with SMTP id y11so7455759pfm.13
        for <linux-i2c@vger.kernel.org>; Fri, 31 May 2019 23:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:subject:date:message-id;
        bh=O+j3K6zXE5IFccZ8hsChRKn58QJIrP/3QjqkpXaSicE=;
        b=H9XjjKqdCqYBArs4d5A5VOqZDdSI/0XkBG3mQAWVvS2atr49rAkowOry/D6iiJ6hCW
         tJPj+VV0id8acOAc0GqY/9VoMnz6roJQL9kQuJLByrMXGKf/T2b5N9PE/Cf3aqrenBGg
         XwpXAUQffX4JPjTYeA5R+aO8OT1Mf539S4w0I0zcQ59QKgCShjDlxa2YWz0JWFd9GhOh
         gH173cW3eB0cjRok90yVJM4nM8aQYLonL4zC+5YH/uULc5e2Z0h9p17YkTh340UJw9MC
         icNeLZOVRtZC/Z+cUHLyJB4ZH1g3vZDVvB8I1bUtnKqN2CHdQuSfXk+47XdQkTkgf5k0
         BgyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=O+j3K6zXE5IFccZ8hsChRKn58QJIrP/3QjqkpXaSicE=;
        b=mIvR7LjWLMdXDcl6tBxHIdMXz3lPSZCPL+XY21iNBascpKG0g3kY51p3MhDTQhvWDu
         ck5sZXmAD7ZuDj+thB4OPx7OYdff5zots1+IMY3kkkSxkY1MHfxF6LP8sh82psoBZWNS
         15j/VqUhsRUhIDhjM3RmxlpUpKcAR9+9mGAFj1qWDAiW0IdWKolq9iMPHkZR66oxw2jj
         wlw/cHFmVBbIMQGvLo3HS/76MatUmO7dEecBazHGI+kCooWZZz+g9arY2d+b5QgyqPiE
         9Rd8B/I2G8W9ZwW6kqgSbloOivXLYmOrBiOUdoPkNSqkU/Ltsy95U4duxc/YyywZf+kv
         8Dig==
X-Gm-Message-State: APjAAAW7c9BKdtwY+7oEe0HS17ZE+eYOeqMinhgfD40yDVn4ZY0jchGq
        hD5a/XB0zz33Ixyh01hMwXKVqA==
X-Google-Smtp-Source: APXvYqxElRMoBYQ8m1mfc86RUFdW68p9ZByi5HewQQkRamsx1F3eLEbpxVK9no5w+Qs+hAW+UfpzDQ==
X-Received: by 2002:a62:5e06:: with SMTP id s6mr15266012pfb.193.1559369486705;
        Fri, 31 May 2019 23:11:26 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
        by smtp.googlemail.com with ESMTPSA id 2sm8935850pgl.40.2019.05.31.23.11.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 31 May 2019 23:11:25 -0700 (PDT)
From:   Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To:     robh+dt@kernel.org, mark.rutland@arm.com, peter@korsgaard.com,
        andrew@lunn.ch, palmer@sifive.com, paul.walmsley@sifive.com,
        sagar.kadam@sifive.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH REPOST v8 0/3] Extend dt bindings to support I2C on sifive devices and a fix broken IRQ in polling mode.
Date:   Sat,  1 Jun 2019 11:41:12 +0530
Message-Id: <1559369475-15374-1-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The patch is based on mainline v5.2-rc1 and extends DT-bindings for Opencore based I2C IP block reimplemented
in FU540 SoC, available on HiFive unleashed board (Rev A00), and also provides a workaround for broken IRQ
which affects the already available I2C polling mode interface in mainline, for FU540-C000 chipsets.

The polling mode workaround patch fixes the CPU stall issue, when-ever i2c transfer are initiated.

This workaround checks if it's a FU540 chipset based on device tree information, and check's for open
core's IF(interrupt flag) and BUSY flags to break from the polling loop upon completion of transfer.

To test the patch, a PMOD-AD2 sensor is connected to HiFive Unleashed board over J1 connector, and
appropriate device node is added into board specific device tree as per the information provided in
dt-bindings in Documentation/devicetree/bindings/i2c/i2c-ocores.txt.
Without this workaround, the CPU stall's infinitely.

Busybox i2c utilities used to verify workaround : i2cdetect, i2cdump, i2cset, i2cget


Patch History:
V7<->V8:
-Incorporated review comments for cosmetic changes like: space, comma and period(.)

V6<->V7:
-Rectified space and tab issue in dt bindings strings.
-Implemented workaround based on i2c->flags, as per review comment on v6.

V5<->V6:
-Incorporated suggestions on v5 patch as follows:
-Reformatted compatibility strings in dt doc with one valid combination on each line.
-Removed interrupt-parents from optional property list. 
-With rebase to v5.2-rc1, the v5 variant of polling workaround PATCH becomes in-compatible.
 Till kernel v5.1 the polling mode was enabled based on i2c->flags, wherease in kernel v5.2-rc1 polling mode is set as
 master transfer algorithim at probe time itself, and i2c->flags checks are removed.
-Modified v5 to check for SiFive device type in polling function and include the workaround/fix for broken IRQ.

v4<->V5:
-Removed un-necessary checks of OCORES_FLAG_BROKEN_IRQ.

V3<->V4:
-Incorporated suggestions on v3 patch as follows:
-OCORES_FLAG_BROKEN_IRQ BIT position rectified.
-Updated BORKEN_IRQ flag checks such that if sifive device (Fu540-C000) is identified,then use polling mode as IRQ is broken.

V2<->V3:
-Incorporated review comments on v2 patch as follows:
-Rectified compatibility string sequence with the most specific one at the first (dt bindings). 
-Moved interrupts and interrupt-parent under optional property list (dt-bindings).
-Updated reference to sifive-blocks-ip-versioning.txt and URL to IP repository used (dt-bindings).
-Removed example for i2c0 device node from binding doc (dt-bindings).
-Included sifive,i2c0 device under compatibility table in i2c-ocores driver (i2c-ocores).
-Updated polling mode hooks for SoC specific fix to handle broken IRQ (i2c-ocores).


V1<->V2:
-Incorporate review comments from Andrew
-Extend dt bindings into i2c-ocores.txt instead of adding new file
-Rename SIFIVE_FLAG_POLL to OCORES_FLAG_BROKEN_IRQ

V1:
-Update dt bindings for sifive i2c devices
-Fix broken IRQ affecting i2c polling mode interface.


Sagar Shrikant Kadam (3):
  dt-bindings: i2c: extend existing opencore bindings.
  i2c-ocores: sifive: add support for i2c device on FU540-c000 SoC.
  i2c-ocores: sifive: add polling mode workaround for FU540-C000 SoC.

 .../devicetree/bindings/i2c/i2c-ocores.txt         |  9 ++++--
 drivers/i2c/busses/i2c-ocores.c                    | 33 ++++++++++++++++++++--
 2 files changed, 38 insertions(+), 4 deletions(-)

-- 
1.9.1

