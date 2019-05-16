Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CE281FEAC
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2019 07:09:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726400AbfEPFJP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 May 2019 01:09:15 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:36440 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726336AbfEPFJP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 May 2019 01:09:15 -0400
Received: by mail-pl1-f196.google.com with SMTP id d21so998170plr.3
        for <linux-i2c@vger.kernel.org>; Wed, 15 May 2019 22:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:subject:date:message-id;
        bh=0q3a/odCRoCVA/nETkq3PjFBVKS7tpFQuK4PfOsccMA=;
        b=gjl0gVM2RiW2MI8vn6Z6445MzADPeIBpy+SffYn5OlaoPRK5EWAL4rSkmTGBrfdksE
         JqXNbRRGf4Zkt6QLKNjQ5wzqXtz1+grJjn7fOA29/3ZvtD3WxwfqTJ5CJ4W0628sDFgD
         Smb8+d2foPXtuPggJa9hK1wswHPOsvSaDWJ8rnKcoegy0rziYJcaOjc3qflSDVKL5WWi
         Tc6lh6RB/y4+TAUokO3X71VPatwS8Qva4O7KsJ/7Lvs/3x9Lj1mBHpUDYUS1Na0775FK
         v/ldDtSacMPH3xtr6Pq/uYWHynnnDPfMnb71guaHA3zhxUtG1jZ91vUUQEzkPTNCfru8
         npkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=0q3a/odCRoCVA/nETkq3PjFBVKS7tpFQuK4PfOsccMA=;
        b=eDHsUe91/9gfC+CFefE0kYyJVIS+hD17EoWGPlbEgoamdwfij65MVb/+L7Hh/adM0p
         egbAiEXrZeYdTb1d5f/Rk3d1wIwL3thyX7LEYxiNQKzr/vOdUxeWDBeZ2U7JBHdA29ug
         SZcF2+p/Jc6llkqhKajaSb4pY+wHKs0VqT1bopReURtGwL5N2EVBsBmvl276OMZ/LnAF
         4gSghG+qVMHvnqkhT0hYurPqBLhQ4CiVgTbA8y+9dQg5BpSJ4bLiO+1vTJQQjM1nbgNe
         vsVURdajKHPPH0vaTrP6Dt1A5a5GjlgrtNqL2/n/z96qIy4x2hI3HeTmhkJ50MxfULvs
         RrGw==
X-Gm-Message-State: APjAAAUL0Q8fKVAfPSoMNcYV8HNHFPTjPgvoPj7znFDUxpWg0g55M4Rr
        Lb3f/MCdrl41QbZxOekNJ/KR/A==
X-Google-Smtp-Source: APXvYqzGkhtdoXphNVBJgmn2RC0DNEZV+BpRn1iKw8kD5ieq2SAEPT5s4FKXUABjJo0hGXLltMzkaQ==
X-Received: by 2002:a17:902:b184:: with SMTP id s4mr10059937plr.46.1557983354809;
        Wed, 15 May 2019 22:09:14 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
        by smtp.googlemail.com with ESMTPSA id u6sm5929531pfa.1.2019.05.15.22.09.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 15 May 2019 22:09:14 -0700 (PDT)
From:   Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To:     robh+dt@kernel.org, mark.rutland@arm.com, peter@korsgaard.com,
        andrew@lunn.ch, palmer@sifive.com, paul.walmsley@sifive.com,
        sagar.kadam@sifive.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] Extend dt bindings to support I2C on sifive devices and a fix broken IRQ in polling mode.
Date:   Thu, 16 May 2019 10:38:37 +0530
Message-Id: <1557983320-14461-1-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The patch is based on mainline v5.1 and extends DT-bindings for Opencore based I2C IP block reimplemented 
in FU540 SoC, available on HiFive unleashed board (Rev A00), and also provides a workaround for broken IRQ
which affects the already available I2C polling mode interface in mainline, for FU540-C000 chipsets. 

The polling mode workaround patch fixes the CPU stall issue, when-ever i2c transfer are initiated.

This workaround checks if it's a FU540 chipset based on device tree information, and check's for open
core's IF(interrupt flag) and TIP flags to break from the polling loop upon completion of transfer.

To test the patch, a PMOD-AD2 sensor is connected to HiFive Unleashed board over J1 connector, and 
appropriate device node is added into board specific device tree as per the information provided in 
dt-bindings in Documentation/devicetree/bindings/i2c/i2c-sifive.txt.
Without this workaround, the CPU stall's infinitely.

Busybox i2c utilities used to verify workaround : i2cdetect, i2cdump, i2cset, i2cget


Patch History:

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
  i2c-ocore: sifive: add support for i2c device on FU540-c000 SoC.
  i2c-ocores: sifive: add polling mode workaround for FU540-C000 SoC

 .../devicetree/bindings/i2c/i2c-ocores.txt         |  7 +++-
 drivers/i2c/busses/i2c-ocores.c                    | 41 +++++++++++++++++++---
 2 files changed, 42 insertions(+), 6 deletions(-)

-- 
1.9.1

