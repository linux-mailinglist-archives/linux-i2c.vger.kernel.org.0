Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A42E58E7C4
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Aug 2022 09:21:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231233AbiHJHVb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Aug 2022 03:21:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231184AbiHJHV1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 Aug 2022 03:21:27 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 823745FEF
        for <linux-i2c@vger.kernel.org>; Wed, 10 Aug 2022 00:21:22 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id m5-20020a2598c5000000b0066faab590c5so11419062ybo.7
        for <linux-i2c@vger.kernel.org>; Wed, 10 Aug 2022 00:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:from:to:cc;
        bh=PV7OXYmXvOy3oOI40B0c/NrQt9YbIpwW5ysp1+4Kfk4=;
        b=K2FGfe9V4BWEOz04T3rNzNuwXWtZMfNdbP6DmrpQ84RwDIlwCdprOpZfia1FTadzEJ
         YcbL5Dg/9HC7x4f9nS5/HiVZtQhWb6l0BfRfQWpXI8vAFQFwR+jmPBr1indQTC1+YrFt
         Tx4ZFpy0lpbF/e0v+usbJ+cgckaEkf1NSRyfg5QvG83xWCPOL+U05N0qSdFWEn7O1F5D
         OV3bzcS09/Jrkt9FCrrTOHqQolYCINKhuNJj6x2+jOARifAUUdtMFRU5t209dikRvBqz
         U6YAL7iu0dwNuWOEM0ffe6vuSaC11VtfpeyOtqqMAIj/y32vbAjLi/4hXK89VqIUom4G
         fZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc;
        bh=PV7OXYmXvOy3oOI40B0c/NrQt9YbIpwW5ysp1+4Kfk4=;
        b=eV+qvdo73hakYSA4mm1BxNt4ESRGvhaY/APe2u4lqCVDAFJQ3OCeIGm0FnEm8vUaeZ
         bShZdQqk4ga/GysZ5jf9MmTyc8G704kEEA+WP1BCjGFwp1qqltqBj0BMBm5q3ijHLhff
         /EF3O8u/ItFLRU2G4JilLL3I22rVhCI5drihLmJABUEnSQQvTZ77jbSgHSK6NeQ0F4OX
         /HQ2ZDfi0aHwe6oAure+3geRuHqq9J5FbOao7glDexbrLz+1meLoJGzMTbs+g2LGGEhz
         L/u/oydssJtDROqgj9Lkbge6AJgoEnIHMpBC1baI5Srvy+Y9o/W6h4WwSnyrCYJvz1y3
         4ZQw==
X-Gm-Message-State: ACgBeo2Zf4CFoW+kQBu7inTD+2bXt78Mk7HiOXcTI2/IGoV9IARXMxcg
        gaPLdZ/vnx/VbmW2gDfvHULMPcln7E2X
X-Google-Smtp-Source: AA6agR4hmMW+Op22E/4cpCGBrHn7Z6qt/OcIhhC57rhdeFszcCqfUhtrpELfu3MWeftfhTZP2iucKvxNccus
X-Received: from suichen.svl.corp.google.com ([2620:15c:2c5:13:820:de6:2fcc:8636])
 (user=suichen job=sendgmr) by 2002:a25:3b10:0:b0:671:80ee:6a8 with SMTP id
 i16-20020a253b10000000b0067180ee06a8mr23825802yba.114.1660116081386; Wed, 10
 Aug 2022 00:21:21 -0700 (PDT)
Date:   Wed, 10 Aug 2022 00:20:40 -0700
Message-Id: <20220810072041.57055-1-suichen@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.1.559.g78731f0fdb-goog
Subject: [RFC Patch v5 Resend 0/1] i2c counters as sysfs attributes
From:   Sui Chen <suichen@google.com>
To:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        wsa@kernel.org, openbmc@lists.ozlabs.org, tali.perry1@gmail.com
Cc:     joel@jms.id.au, andrew@aj.id.au, benjaminfair@google.com,
        krellan@google.com, Sui Chen <suichen@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello, linux-i2c,

We would like to ping in a friendly way and see if there are any
comments on the i2c counters as sysfs attributes.

This change renames the I2C debug counters as previously, and makes them
available to i2c_adapter's and i2c_client's:

 - bus_errors
 - transfers (only applicable to i2c_adapter)
 - messages (only applicable to i2c_client)
 - nacks
 - timeouts
 - recovery_successes (only applicable to i2c_adapter)
 - recovery_failures (only applicable to i2c_adapter)

This patchset is the same as the last one, except that we are using a
new method to verify the results in the counter for i2c_adapters:

We use the Perfetto profiler+visualizer to grab the I2C kernel
tracing events on a BMC with many I2C devices, and compared
the I2C counters before and after the tracing process.

We needed to add a change for Perfetto in order to view the I2C
events in the UI. The Perfetto change is located in
https://android-review.googlesource.com/c/platform/external/perfetto/+/2145699
and it currently shows the outermost I2C ID that appears in an I2C
transaction.

We inspected the counts in the Perfetto trace by executing
the "SELECT count(name), name FROM slices WHERE name LIKE "%i2c%" GROUP
BY name;" SQLite query.

It turns out the increment in the counters in the counters in sysfs and in
the Perfetto trace very closely match each other; the differences were
caused by the time differences between the moments the tracing
started/ended and the I2C counters are obtained.

We would greatly appreciate any comments on this change.

Thanks!

Sui Chen (1):
  i2c debug counters as sysfs attributes

 drivers/i2c/i2c-core-base.c | 240 +++++++++++++++++++++++++++++++++++-
 drivers/i2c/i2c-dev.c       |  94 ++++++++++++++
 include/linux/i2c.h         |  41 ++++++
 3 files changed, 374 insertions(+), 1 deletion(-)

-- 
2.37.1.559.g78731f0fdb-goog

