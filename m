Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94AB749FC11
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jan 2022 15:48:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349463AbiA1Osn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Jan 2022 09:48:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349459AbiA1Osn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 Jan 2022 09:48:43 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5E5CC06173B
        for <linux-i2c@vger.kernel.org>; Fri, 28 Jan 2022 06:48:42 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id t9so9299130lji.12
        for <linux-i2c@vger.kernel.org>; Fri, 28 Jan 2022 06:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Hh9Du3zi2EE9aGSkpScEKpJcFjAj+tq+5C7CFEO+lqI=;
        b=ETQdujY+VAPD1E56RTyi+9fIWkoFai6b5RcxQPEFTeTQBaR6tZyXAMQoCt6qyKvbE6
         p1RWNPl6Za4USeuQxHpgjqylDHT7NG0yK0xTZiRibAqmpG25FylDUA68mEcjr3zUXzCn
         7lRysstPjGE9CDN8nVgYVrE/mQNzGsNZi0I9DLZNYSv8B+T6NPWxxjNAa+HLMdBhwCdM
         3QPtaQxCfge76RuqOHXvwAD5l2inBHn24nKgx8cGvjJupYWwnFPMNS6QmFEyNedZzj+d
         A1PAGuk5Lm6CWWg5DB8bBz62zELVSAP84YwOCQIl0bqB/9VOIlilqS1iUPeOPRh6GCb0
         GZ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hh9Du3zi2EE9aGSkpScEKpJcFjAj+tq+5C7CFEO+lqI=;
        b=qjIPlTB+ByIREMccuBw76DpGUPCacAvO0LRPAif3RUf0NopThU2kjq0vFH/1Rvtvp5
         R05jp4Y/7hjORzcgsLdxbyTNIEchkV5bwt+2OYkJDhalDwdN6CtjoCseEErAEC8TY+Wq
         YYIEYED+4AtGkhYWpT9V/C5Oao83vQ5MJHDhdUBB6FM4bNbMBu+fGbmZ0/QfDYjRx6/z
         xnbyPQKubvsKwI3jpWBqGDNu1AXqQYrgpUF4405yeS96bmDGEOpfh0zrv5zd5X/aYmCO
         9I1jIngdiBVi9+eqyKCzLeTKXGner6gA8VOCEBUHieu6AMKZl/15saWqQbKoGsQWjvCT
         S6sQ==
X-Gm-Message-State: AOAM530pJXJR9SW1++GKmaF9apMbJef4BJUUhjlczXlUixAtK2Kj3gZy
        gGkuKkKUqUMvcfvzjhgrPpyHIA==
X-Google-Smtp-Source: ABdhPJwf2DbhwA19oN7hkY6fX1TMcJ9AHcqvghVzZC4jNV0GZ8/0dFgL61mMF1GO9vTu7likBd8W+A==
X-Received: by 2002:a2e:9ada:: with SMTP id p26mr6236557ljj.490.1643381321020;
        Fri, 28 Jan 2022 06:48:41 -0800 (PST)
Received: from dabros-l.roam.corp.google.com ([185.157.14.92])
        by smtp.gmail.com with ESMTPSA id q7sm1706520lfp.63.2022.01.28.06.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jan 2022 06:48:40 -0800 (PST)
From:   Jan Dabros <jsd@semihalf.com>
To:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        jarkko.nikula@linux.intel.com, adriy.shevchenko@linux.intel.com
Cc:     mika.westerberg@linux.intel.com, hdegoede@redhat.com,
        wsa@kernel.org, rrangel@chromium.org, mw@semihalf.com,
        jaz@semihalf.com, upstream@semihalf.com, thomas.lendacky@amd.com,
        alexander.deucher@amd.com, Nimesh.Easow@amd.com,
        mario.limonciello@amd.com, jsd@semihalf.com
Subject: [PATCH v2 0/2] i2c-designware: Add support for AMD PSP semaphore
Date:   Fri, 28 Jan 2022 15:48:09 +0100
Message-Id: <20220128144811.783279-1-jsd@semihalf.com>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
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

v1 -> v2:
* Remove usage of unions
* Get rid of unnecessary __packed attributes
* Switch to use iopoll.h and bitfields.h APIs were applicable
* Follow the convention to check for the error first
* Reorder entries (includes, table entries) alphabetically
* Add necessary includes
* Add Kconfig dependency on X86_64
(above two fixes for "kernel test robot <lkp@intel.com>" issues)
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
 drivers/i2c/busses/i2c-designware-amdpsp.c   | 373 +++++++++++++++++++
 drivers/i2c/busses/i2c-designware-baytrail.c |  10 +-
 drivers/i2c/busses/i2c-designware-common.c   |  12 +
 drivers/i2c/busses/i2c-designware-core.h     |  18 +-
 drivers/i2c/busses/i2c-designware-master.c   |   6 +
 drivers/i2c/busses/i2c-designware-platdrv.c  |  61 +++
 10 files changed, 489 insertions(+), 11 deletions(-)
 create mode 100644 drivers/i2c/busses/i2c-designware-amdpsp.c

-- 
2.35.0.rc0.227.g00780c9af4-goog

