Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85B4A4A736A
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Feb 2022 15:44:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345068AbiBBOn3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Feb 2022 09:43:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238990AbiBBOn2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Feb 2022 09:43:28 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 236EAC061714
        for <linux-i2c@vger.kernel.org>; Wed,  2 Feb 2022 06:43:28 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id b9so41119689lfq.6
        for <linux-i2c@vger.kernel.org>; Wed, 02 Feb 2022 06:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7GjHKzpzlHplDDKhV9GIkeeSyQMGz4QdXm9jvUoDJkU=;
        b=bmd97pCEXeyn5PPSmzHRH7h3OSBMvz3CoXiZjjx1CEOVI8kXv1j5ktwfNBSeMRvzN4
         sLdxdbi3sps7VBUXAct7IZG5/RAJYxwLKkAOoYAAI4zX0zFhI65Xcrj0oZ6qFc2f1dJN
         oiGNIEzNLKc5fp+MFX1gjdhY3GEFNWhlzDBEABhtYWbUMPc9CrhIWLt5sJbMAcKCqT9G
         TJUH7osbZ3a9FIVV1ah5Y+nz2QYL+ZripbfnUBcMG90CIxCJX1reafF339YaZdwR7mQq
         x+SjlZG4PlPUFWD9jR92XpTWm/yDovzzjlGMYt/CjRC9emiWyprXK/e+riFC75x3eGcF
         IU0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7GjHKzpzlHplDDKhV9GIkeeSyQMGz4QdXm9jvUoDJkU=;
        b=U84X467yevsuT3YQBGv00askp4bfpp+5rrZ9cfSTFvgaSoGZI6k6D55V8Gb+jpi86H
         M0H4V/5bcFW4mmM4gLEuD3ouW7zVwDMUZClD9jTpZgzt6JSX8czNhRGu0OMy3BBQTXuU
         IVFUX/62qYztgi3y1sdVosqw2/UV9QtIB5OmDe6bw4r+yXsjERKRSXULhqa5h73qwec7
         TnsZ8Cd0ARjI06ajgqFXf51fi/SosgbMacJ0FtU1iQOd1mwBUjFvFmR+7OcOHbyq0y0Z
         8kjJXCnEnHlDPulnbv4XIu/KzORzi3v7XAAUEZ/oObuccg3VRJL8nd4QLLX41ng1CQbN
         y63Q==
X-Gm-Message-State: AOAM5316fRmGGtAlzu0qUo2hiSFkSknRIV7+5t0MwfGH1kYLg6DUHDne
        nVjkrh1nhqrTMBzok4sDZZpOig==
X-Google-Smtp-Source: ABdhPJyuHVoOe8yvmGKP1oxWVGTwY1FfE/NyRFWRjjVauPIERtz6cKTY1Mu1vGLoXOB2uLQEiQvgkA==
X-Received: by 2002:a05:6512:b23:: with SMTP id w35mr22739713lfu.653.1643813006440;
        Wed, 02 Feb 2022 06:43:26 -0800 (PST)
Received: from dabros-l.roam.corp.google.com ([185.157.14.92])
        by smtp.gmail.com with ESMTPSA id z5sm2849610ljz.38.2022.02.02.06.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 06:43:25 -0800 (PST)
From:   Jan Dabros <jsd@semihalf.com>
To:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com
Cc:     mika.westerberg@linux.intel.com, hdegoede@redhat.com,
        wsa@kernel.org, rrangel@chromium.org, mw@semihalf.com,
        jaz@semihalf.com, upstream@semihalf.com, thomas.lendacky@amd.com,
        alexander.deucher@amd.com, Nimesh.Easow@amd.com,
        mario.limonciello@amd.com, jsd@semihalf.com,
        kernel test robot <lkp@intel.com>
Subject: [PATCH v3 0/2] i2c-designware: Add support for AMD PSP semaphore
Date:   Wed,  2 Feb 2022 15:43:01 +0100
Message-Id: <20220202144302.1438303-1-jsd@semihalf.com>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
In-Reply-To: <20220120001621.705352-2-jsd@semihalf.com>
References: <20220120001621.705352-2-jsd@semihalf.com>
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

v2 -> v3:
* Change X86_64 Kconfig dependency to X86_MSR
* Switch from phys_addr_t to u64 in mailbox struct definition
* Remove redundant guard in semaphores' probes
* Add comments about error propagation
* Move credits for kernel test robot into changelog

v1 -> v2:
* Remove usage of unions
* Get rid of unnecessary __packed attributes
* Switch to use iopoll.h and bitfields.h APIs were applicable
* Follow the convention to check for the error first
* Reorder entries (includes, table entries) alphabetically
* Add necessary includes
* Add Kconfig dependency on X86_64
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: kernel test robot <lkp@intel.com>
* Modify probe() to use terminating entry for traversing through table
  instead of ARRAY_SIZE
* Fix typos in comments
* Rebase patchset

Jan Dabros (2):
  i2c: designware: Add missing locks
  i2c: designware: Add AMD PSP I2C bus support

 MAINTAINERS                                  |   1 +
 drivers/acpi/acpi_apd.c                      |   7 +-
 drivers/i2c/busses/Kconfig                   |  11 +
 drivers/i2c/busses/Makefile                  |   1 +
 drivers/i2c/busses/i2c-designware-amdpsp.c   | 389 +++++++++++++++++++
 drivers/i2c/busses/i2c-designware-baytrail.c |  12 +-
 drivers/i2c/busses/i2c-designware-common.c   |  12 +
 drivers/i2c/busses/i2c-designware-core.h     |  18 +-
 drivers/i2c/busses/i2c-designware-master.c   |   6 +
 drivers/i2c/busses/i2c-designware-platdrv.c  |  60 +++
 10 files changed, 505 insertions(+), 12 deletions(-)
 create mode 100644 drivers/i2c/busses/i2c-designware-amdpsp.c

-- 
2.35.0.rc2.247.g8bbb082509-goog

