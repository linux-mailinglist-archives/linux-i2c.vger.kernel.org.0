Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32BE323984
	for <lists+linux-i2c@lfdr.de>; Mon, 20 May 2019 16:12:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733016AbfETOMQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 May 2019 10:12:16 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:42565 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732845AbfETOMQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 May 2019 10:12:16 -0400
Received: by mail-pg1-f196.google.com with SMTP id 145so6856450pgg.9
        for <linux-i2c@vger.kernel.org>; Mon, 20 May 2019 07:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:subject:date:message-id;
        bh=nGtttgXFEJ1HOgo8bh4Lp5/Nmp2dywuBtKSOZng5Qbc=;
        b=c6d0ZkgL2saozGONzGCnFEQjAWNRdRLaTLfi3lW4z4qkcqrrTV7g5av3Ok3O7OECou
         3yYApsOiPp7tG5FkOQ4PPTJtiqNcJPVlgF1cEAycAO5AY8GaRxqh8qTbxNUu8X33kc6a
         eFXxuJ89V7opU+5GNVeMDSpmGQL3B+H+HegVtp2eTgUqOiBmZT7NteugVeFGYIXw5vOI
         7m/RrnkVU9PGZTgK4NPef0DQ8yWtFqG45q+90e5F+UhN1mRxdUO5qcHnDzAfon4dxER7
         Uuau/plRmvrgjj99S1LjTivrRsQo14Qx6dL9uWaBjimH9GPvRY+mD4WUFuyAHY8euVap
         ethQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=nGtttgXFEJ1HOgo8bh4Lp5/Nmp2dywuBtKSOZng5Qbc=;
        b=GiAkWZFWOb4Vdob2sdx0ynqp6cXw+L2gU6VQuuqIj2SMJyXLGp1IAW0AJuwT/vOTmK
         KAifXJUq971nPgdd5gyNh24eoZ/B182lYyyjqkpReSae0Ghud5J2Oo8Lp2Dx+O6I8p9l
         DYcSuc9qDkRsJ73rTNBFleR7/741CuuDnizQ5hf4TAnShomIRUewL5+vtiFD/u/tgffL
         qiGbWTtt3LbzwNvrac8Ad5ekYIFh7z6abBKquYpA/4CfrZZy5EP3CzFOUWqUDbnmTeWd
         d2K42cbGRnqLnWFOCPcptydARfTXC1Jr6PY0pzwPJKpk6y35/3RdWpqVrzw5JSgDKpso
         L8dQ==
X-Gm-Message-State: APjAAAWcIV5fPm+m7XJHQFkjPMyMO2iK9bqRpync6ThN4yruQSELYlJ8
        l/KDumVcLfDW9EFXMD13Mf6cdg==
X-Google-Smtp-Source: APXvYqzDhGlszACUDMjZoW+0B0CqS1xGBQilzDwKmDvbLOxQ7SIgyDw30Jflw2tbu6Wq1eYPuirj4w==
X-Received: by 2002:a62:6341:: with SMTP id x62mr79597104pfb.63.1558361535563;
        Mon, 20 May 2019 07:12:15 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
        by smtp.googlemail.com with ESMTPSA id a9sm26388248pgw.72.2019.05.20.07.12.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 20 May 2019 07:12:14 -0700 (PDT)
From:   Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To:     robh+dt@kernel.org, mark.rutland@arm.com, peter@korsgaard.com,
        andrew@lunn.ch, palmer@sifive.com, paul.walmsley@sifive.com,
        sagar.kadam@sifive.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/3] Extend dt bindings to support I2C on sifive devices and a fix broken IRQ in polling mode.
Date:   Mon, 20 May 2019 19:41:15 +0530
Message-Id: <1558361478-4381-1-git-send-email-sagar.kadam@sifive.com>
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

 .../devicetree/bindings/i2c/i2c-ocores.txt         |  7 ++++-
 drivers/i2c/busses/i2c-ocores.c                    | 31 ++++++++++++++++++++--
 2 files changed, 35 insertions(+), 3 deletions(-)

-- 
1.9.1

