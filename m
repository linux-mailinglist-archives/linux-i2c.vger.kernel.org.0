Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3350E314B4
	for <lists+linux-i2c@lfdr.de>; Fri, 31 May 2019 20:30:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727210AbfEaSan (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 31 May 2019 14:30:43 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:42894 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727173AbfEaSak (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 31 May 2019 14:30:40 -0400
Received: by mail-pl1-f194.google.com with SMTP id go2so4320205plb.9
        for <linux-i2c@vger.kernel.org>; Fri, 31 May 2019 11:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:subject:date:message-id;
        bh=O+j3K6zXE5IFccZ8hsChRKn58QJIrP/3QjqkpXaSicE=;
        b=SWslyCxAFsWjWsrlNYIrP9FrVWDVXzVrheDU9AOZXEQd80tjpHW8Wak8RYA6fPRKHB
         Sg44lM5zV9HMrV0jxxVClT4RP6UlYdVW8fnKV5sYoOK+Bayco5Ye8ukpOfvM/rM57A7z
         EMRoLE6YPRT0b3fSODS6osICMQ542+LDIbmEvTP0ovuPb8s5nNKHSnZnTGYzBwnLgxSA
         +WNMMvFvfdd9YYbMQwkM4IS/j5hqEVKYRvnIvV27Nu3Qruvp2M44eQ3gsO7fBYkYDF9Q
         m2M0U9nhZpL3YYjbc+sO6GDlvw+k1gIEWQ3NdWMmADAM/RbCpdlZ+FYMjaAq3/NsF/Bc
         9PPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=O+j3K6zXE5IFccZ8hsChRKn58QJIrP/3QjqkpXaSicE=;
        b=lHeE3ap6V/1KeGFtpyOUX2dCFR5G8EBRVLKOSbIVzpJVeDp1Wfutz9+GHniDpTJVCI
         fYDRAqKLQILOz5tZbERGuTp2tuBU9PJi2YarRKKRRdOuAGp7HXFkAi0W1EfVGDAAJBZZ
         9rT4G4XXwyzcQbuziCcbrJpDP6O3Ae9AhoSvwtYJqOwRxNPHvgfheU6MvhEHJZ92P/3v
         NIY/ZD8fj23Fxy2+tu/KbvlalHswbCFReMKkZtZcASr5vh7ELi7v7Qnn8IP3V5P2AQLC
         DsSfkiSU8pnASOs1SieNUuXT1NSELCTtW1puLRRQVYaxoQ7Cy/pPjf/Rsvw0I61O8msg
         ZB3A==
X-Gm-Message-State: APjAAAX2bouNTF9ot9Cv6xBPp5cBdB+pcPDclMl+OWuJHXZBjCw5A2MP
        qh4gc4rhz5G6OTfn/EydJAcNvg==
X-Google-Smtp-Source: APXvYqx+kbS+qlhl2y5SToTHB7pOFTvniSKiYfiMThhCx/x/F5GEOcBhNwt9XZcYZxTjq6+OXirZeQ==
X-Received: by 2002:a17:902:9b85:: with SMTP id y5mr11191979plp.313.1559327439860;
        Fri, 31 May 2019 11:30:39 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
        by smtp.googlemail.com with ESMTPSA id 85sm10039511pgb.52.2019.05.31.11.30.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 31 May 2019 11:30:37 -0700 (PDT)
From:   Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To:     robh+dt@kernel.org, mark.rutland@arm.com, peter@korsgaard.com,
        andrew@lunn.ch, palmer@sifive.com, paul.walmsley@sifive.com,
        sagar.kadam@sifive.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH REPOST v8 0/3] Extend dt bindings to support I2C on sifive devices and a fix broken IRQ in polling mode.
Date:   Sat,  1 Jun 2019 00:00:20 +0530
Message-Id: <1559327423-13001-1-git-send-email-sagar.kadam@sifive.com>
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

