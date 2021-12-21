Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CC9047C52A
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Dec 2021 18:44:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232502AbhLURoS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Dec 2021 12:44:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233212AbhLURoR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Dec 2021 12:44:17 -0500
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 592A5C061574
        for <linux-i2c@vger.kernel.org>; Tue, 21 Dec 2021 09:44:17 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id d27-20020a25addb000000b005c2355d9052so26829795ybe.3
        for <linux-i2c@vger.kernel.org>; Tue, 21 Dec 2021 09:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=CDuBDxOSUYlCehxXtPSC2OIzjN0BmuoKrvgmDwQyvuQ=;
        b=TfaGYcVbeJF4OeDvfFRzo2v0n3VAgiSZ3mYQT9Dxs6ECLCGrTBdlc+kWr64JHpqCR8
         rH3rwP7DYtDKLJtEcuRtG6Xiau9Wem4usMhThTsyuDqj+AcHiYOyPEUtPSQMvdv3Y5ox
         0kYuYQxzIGm39nxLk/ZGKVHHUVDhP6RUQ1v++V1m8R5Xo6/bal8jhjQ7DHJJRj29aIWm
         G9Cee5gMwrOgqiNuG4RWRaivl/BNl+Z6ii9TJOQBJ1uWshAgX1+i8HbRDlIvEHsMupZJ
         pM+5xJt07vuSvz1P6oGCwpVEURMMbNuTiQuJKVMZRPJjN9JrnB+ADawiT2newm6S6EGT
         sQJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=CDuBDxOSUYlCehxXtPSC2OIzjN0BmuoKrvgmDwQyvuQ=;
        b=1jrHxTB13lS36N/A/jLdVVRIfSzUK9SbovzwYnyItHeXVtjX5YaxxdF/IFldXG6Quo
         HFpZ+EaQfy9Mt1UR4rK9FwK9SSn4YZPWfeY27bCCJH9YrJIIa7L+Fjn5f3s7uLvYU/R9
         GXvQoG12SoNKMV7RSLhVhmqmQK3uu/Jyez9u/MZC/o4MTmFkQaNTqduSxUz3PNGGPvTz
         MGWZ4l8ix+A2vkcHNKLpM3IYZseHk05R3y0ZzJX4+xVf7R1SGCC7MJLYXh8tyXwBUbzo
         deE8ly+EmDFqoV69p+1cfvcXC23p1k+Okd+QssHD4ObncbYItobtiS/4Vf3SQmcArgof
         /EaA==
X-Gm-Message-State: AOAM531902NcoelrBLRYuwZ6/2Myzy8ASETffZ4TmRf/6oll/ZL3vVAQ
        b2WtTy8j7UnZbVoRPFF23+bdd9uYL52H
X-Google-Smtp-Source: ABdhPJxArDKEt7s8nvJ9hO+5aMzE0jhQdqi4ArT2F52H2Z6NTXreZ4J7/reCC5firYqFR/Hmc/uPcZyFi9bu
X-Received: from suichen.svl.corp.google.com ([2620:15c:2c5:13:19fd:5987:f46f:7488])
 (user=suichen job=sendgmr) by 2002:a25:2f03:: with SMTP id
 v3mr6131319ybv.557.1640108656573; Tue, 21 Dec 2021 09:44:16 -0800 (PST)
Date:   Tue, 21 Dec 2021 09:43:41 -0800
Message-Id: <20211221174344.1249202-1-suichen@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1.307.g9b7440fafd-goog
Subject: [RFC Patch v3 0/3] I2C statistics as sysfs attributes
From:   Sui Chen <suichen@google.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
        joel@jms.id.au, andrew@aj.id.au, tali.perry1@gmail.com,
        benjaminfair@google.com, krellan@google.com,
        Sui Chen <suichen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add I2C statistics (transaction, bus error and NACK counts) as sysfs
attributes for a stable and unified API.

The motivation is monitoring large numbers of BMCs at scale.
Monitoring will be done using OpenBMC, which includes a Redfish
implementation (bmcweb) and runs on different SoCs.

OpenBMC has distribution-wide DBus C++ bindings, for which I2C
statistics will be added. For the Redfish schemas, the upcoming
Release 2021.4 will include I2C statistics too.

Since both OpenBMC and Redfish have/will have committed to stable
APIs for monitoring I2C statistics, we would like to learn the
kernel community's opinion on stable kernel APIs for I2C counters.

A more detailed explanation could be found in [1].

This version (v3) fixes format errors, potential unchecked memory
allocation, and fixes a build problem found by the Kernel Test Robot.

Thanks!

[1] https://lore.kernel.org/lkml/CAJOps0u=seskB-YGvLBsHantJohkEX7do-mt7YSZ6zChQMQxbg@mail.gmail.com/


Sui Chen (2):
  i2c debug counters as sysfs attributes
  add npcm7xx debug counters as sysfs attributes

Tali Perry (1):
  i2c: npcm7xx: add tx_complete counter

 drivers/i2c/busses/i2c-npcm7xx.c |  13 ++++
 drivers/i2c/i2c-core-base.c      |  23 ++++++
 drivers/i2c/i2c-dev.c            | 124 +++++++++++++++++++++++++++++++
 include/linux/i2c.h              |  28 +++++++
 4 files changed, 188 insertions(+)

-- 
2.34.1.307.g9b7440fafd-goog

