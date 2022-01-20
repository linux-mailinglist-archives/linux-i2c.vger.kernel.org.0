Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9025449440F
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 01:17:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357664AbiATARI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Jan 2022 19:17:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357655AbiATARI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Jan 2022 19:17:08 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B76EFC061574
        for <linux-i2c@vger.kernel.org>; Wed, 19 Jan 2022 16:17:07 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id s30so14944124lfo.7
        for <linux-i2c@vger.kernel.org>; Wed, 19 Jan 2022 16:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NPDv/4ut9T/p09x8/AMRX86/gRJUHk8SX5V3uS3JB0o=;
        b=an2BcXLPoLBuGiM8g9XhPMet4vOHDlh9p2qdL/Yhl8QdYZT7M1mtaBd+I3nCrUTzKg
         4P2kN2u5XnN0SC6sfE/n1kqWdlWxqo5fMAo6AjwLjseqVC+60RivmIkqYtUXhGfWf5vE
         tpUKhpO/8x+5IRmWLXKwlZD8pZIlNl8myLe+Ra+X9gOD8wFhRp6TehDJySCa1Zcun2xo
         RnUdEL1Tl7WeS12qzVzlG1oaGqzOGz1dVjRpRXaNJT4tIXbhLZgmbkz8dE98JQATBUSx
         EL4jn8Rk6xiCOgVHhV22ZeosdsabN1IeqZRi2BLVz1LRDvDyL736ixbPEz2TdkTgiH5F
         A/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NPDv/4ut9T/p09x8/AMRX86/gRJUHk8SX5V3uS3JB0o=;
        b=Vo1hif1e/iU7tM8VlwcmKxkwnfcDG7BFge52vdxVs4zZAG4QItUcnSRmDRK/yuea4s
         eqM+roJ2JowVMPwY9y1IqNSs2l95Xvi4CB+e5VSnGItHID0lSqQrG5IOu7V+qNWwc6KL
         X/OQF31BK6gCCSz250E5zKPgFvTf2jxrbBq2cv7F9GcmuCkJF67W1ybG/L8hxcT8p1wX
         Tzc0uSaDK3UD9uu0llrhXl1vUNE16gSwLTzZxUrd1m8DlVEyVVFFGOj6z6qCIiF1K+jQ
         ZQjHLugCdFC6jkJBH37/LBxa3eC4wbrUrTnnCKZJ0t0XX3osJtKGcPYYTMZeRZ+3fwOm
         y7Fg==
X-Gm-Message-State: AOAM532ObsQ/XJLCqHKAd2o0ui4EwOsmwSgIF4nzhpeAMfmYeCCNBNIF
        zvr4N3o2XtaOV3e3iiLCmOFXkUpOCNIZVQ==
X-Google-Smtp-Source: ABdhPJw3YT+KtDMp9FPvOftu6GuZa6cXHtcvpG9ClSYN+lARCm867nv1EONzwfYsSZYCnFwereq4FA==
X-Received: by 2002:ac2:5d4e:: with SMTP id w14mr3796792lfd.574.1642637826068;
        Wed, 19 Jan 2022 16:17:06 -0800 (PST)
Received: from dabros-l.roam.corp.google.com ([185.157.14.92])
        by smtp.gmail.com with ESMTPSA id v27sm119564lfo.243.2022.01.19.16.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 16:17:05 -0800 (PST)
From:   Jan Dabros <jsd@semihalf.com>
To:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        jarkko.nikula@linux.intel.com
Cc:     andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        hdegoede@redhat.com, wsa@kernel.org, rrangel@chromium.org,
        mw@semihalf.com, jaz@semihalf.com, upstream@semihalf.com,
        jsd@semihalf.com
Subject: [PATCH 0/2] i2c-designware: Add support for AMD PSP semaphore
Date:   Thu, 20 Jan 2022 01:16:19 +0100
Message-Id: <20220120001621.705352-1-jsd@semihalf.com>
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patchset comprises support for new i2c-designware controller setup on some
AMD Cezanne SoCs, where x86 is sharing i2c bus with PSP. PSP uses the same
controller and acts as an i2c arbitrator there (x86 is leasing bus from it).

First commit aims to improve generic i2c-designware code by adding extra locking
on probe() and disable() paths. I would like to ask someone with access to
boards which use Intel BayTrail(CONFIG_I2C_DESIGNWARE_BAYTRAIL) to verify
behavior of my changes on such setup.

Second commit adds support for new PSP semaphore arbitration mechanism.
Implementation is similar to the one from i2c-designware-baytrail.c however
there are two main differences:
1) Add new ACPI ID in order to protect against silent binding of the old driver
to the setup with PSP semaphore. Extra flag ARBITRATION_SEMAPHORE added to this
new _HID allows to recognize setup with PSP.
2) Beside acquire_lock() and release_lock() methods we are also applying quirks
to the lock_bus() and unlock_bus() global adapter methods. With this in place
all i2c clients drivers may lock i2c bus for a desired number of i2c
transactions (e.g. write-wait-read) without being aware of that such bus is
shared with another entity.

This patchset is a follow-up to the RFC sent earlier on LKML [1], with review
comments applied.

Looking forward to some feedback.

[1] https://lkml.org/lkml/2021/12/22/219

Jan Dabros (2):
  i2c: designware: Add missing locks
  i2c: designware: Add AMD PSP I2C bus support

 MAINTAINERS                                  |   1 +
 drivers/acpi/acpi_apd.c                      |   1 +
 drivers/i2c/busses/Kconfig                   |  10 +
 drivers/i2c/busses/Makefile                  |   1 +
 drivers/i2c/busses/i2c-designware-amdpsp.c   | 357 +++++++++++++++++++
 drivers/i2c/busses/i2c-designware-baytrail.c |  10 +-
 drivers/i2c/busses/i2c-designware-common.c   |  12 +
 drivers/i2c/busses/i2c-designware-core.h     |  18 +-
 drivers/i2c/busses/i2c-designware-master.c   |   6 +
 drivers/i2c/busses/i2c-designware-platdrv.c  |  61 ++++
 10 files changed, 469 insertions(+), 8 deletions(-)
 create mode 100644 drivers/i2c/busses/i2c-designware-amdpsp.c

-- 
2.34.1.703.g22d0c6ccf7-goog

