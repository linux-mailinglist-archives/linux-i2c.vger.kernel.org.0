Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC60D4ADADE
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Feb 2022 15:12:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244311AbiBHOMh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Feb 2022 09:12:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232200AbiBHOMg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Feb 2022 09:12:36 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08D6CC03FED0
        for <linux-i2c@vger.kernel.org>; Tue,  8 Feb 2022 06:12:36 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id o17so24674266ljp.1
        for <linux-i2c@vger.kernel.org>; Tue, 08 Feb 2022 06:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yVgWZ2N1Y3ipUjYUXEezvGNOUs6Y1vt/P4K0hmTOcF4=;
        b=2WnR+gN9/VdMtplRqSNkKICA7ofvSX2+hUCDaoql5mmxVs11kgYIkqnWxtAFLHF7E1
         tnpn1GwQasvuerlKqPROPoF0HzKNhlIGACPtZXYfMVL/WLmAGaCvqZp8pDkKF1TWM2Us
         CLeSbvbmZTNbTXdv1Ic+8BH+NfPt7I+R9tTe8Di0rEHyp1dpfUzjF+hWTqRTYYA12XOc
         xPtqEuDyo/7VoSXTQWZaCnml0xd6I3BrcXYjiziVIg/u4SZzNp18bRKL5KxgLVcNJI9C
         Wx+gWEHl7XpEF5ORyb8vXPGzARzL5i4l2k41Ho8IW+jBwQ2jCOLMs/E+1WNrmeG3AbLt
         vNUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yVgWZ2N1Y3ipUjYUXEezvGNOUs6Y1vt/P4K0hmTOcF4=;
        b=28ipPaUEEIM1geBYRrZ202yQy5iu+s2OXrX/UBEV31Bi8zox1RQ58fQhCwlR8YNWG2
         CBsDam+7wW52I1I/qcrzOMS6eqAAKLlzo3PAvvibWXlotM7EukcjhkwTPVWItSbpuloe
         SiiKmVmv+8172/YIBtiU5yc5a/jTlWY/YpfiENpSAz158jFOn/YuwnWU4FzBpY5lkBUS
         seguj21rva2AwG0UxE10EngmuRAafYnW3jwyVRGOSS+BRr7IdYwjJ+jEhYTn0xY1+5jD
         hxOaacgpjemfPc4BTFFgbY1S1NRYn3zaOUK8n/kJJI5UyTu+6nDcEni3IYb2HNzZ6Eau
         5uOA==
X-Gm-Message-State: AOAM530QDxkHrUadIgIFJ2HLwlmR4ZrvTVjJobUYVQ+sa5wa+k/eQSFQ
        33wh9H6PNwSn7N7fAiNkRVAhgg==
X-Google-Smtp-Source: ABdhPJxZO3JDeGXuOOp7bu/eRMlJvw8kLcNh8e+sAxQoykKtY16B/knGrP4rliOq2jUo/99nI+UaEA==
X-Received: by 2002:a2e:b947:: with SMTP id 7mr2847382ljs.141.1644329554361;
        Tue, 08 Feb 2022 06:12:34 -0800 (PST)
Received: from dabros-l.roam.corp.google.com ([185.157.14.92])
        by smtp.gmail.com with ESMTPSA id u1sm1935973lff.199.2022.02.08.06.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 06:12:33 -0800 (PST)
From:   Jan Dabros <jsd@semihalf.com>
To:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com
Cc:     mika.westerberg@linux.intel.com, hdegoede@redhat.com,
        wsa@kernel.org, rrangel@chromium.org, mw@semihalf.com,
        jaz@semihalf.com, upstream@semihalf.com, thomas.lendacky@amd.com,
        alexander.deucher@amd.com, Nimesh.Easow@amd.com,
        mario.limonciello@amd.com, jsd@semihalf.com,
        kernel test robot <lkp@intel.com>
Subject: [PATCH v4 0/2] i2c-designware: Add support for AMD PSP semaphore
Date:   Tue,  8 Feb 2022 15:12:16 +0100
Message-Id: <20220208141218.2049591-1-jsd@semihalf.com>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
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

v3->v4:
* Remove unnecessary alignment of psp_i2c_req
* Add missing bits.h header
* Make use of USEC_PER_MSEC
* Simplify `if` conditions with unsigned variables
* Add additional comments

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
 drivers/i2c/busses/i2c-designware-amdpsp.c   | 394 +++++++++++++++++++
 drivers/i2c/busses/i2c-designware-baytrail.c |  12 +-
 drivers/i2c/busses/i2c-designware-common.c   |  12 +
 drivers/i2c/busses/i2c-designware-core.h     |  18 +-
 drivers/i2c/busses/i2c-designware-master.c   |   6 +
 drivers/i2c/busses/i2c-designware-platdrv.c  |  60 +++
 10 files changed, 510 insertions(+), 12 deletions(-)
 create mode 100644 drivers/i2c/busses/i2c-designware-amdpsp.c

-- 
2.35.0.263.gb82422642f-goog

