Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98D1426D2F8
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 07:23:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726129AbgIQFXB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 01:23:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbgIQFXA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 01:23:00 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95930C06174A;
        Wed, 16 Sep 2020 22:22:59 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id v196so496097pfc.1;
        Wed, 16 Sep 2020 22:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DuzvDrmcmFUROMahjXsaIv677k9LWQoyjXqdmtsaBMI=;
        b=bxnFO5n3SkFWMS85cU1DAcdMSzGE74ZVXiqLcUxw0HX/4GRXpamomB+nOSVo9HrVZO
         VCCGSiJaDrANpunvM0OnKdpJdrG/hO0wacQLUJld32pbqlO/1I/ZwxrdMvL78U+DYG4a
         JOI3KN1qvSsDPTz0RAmAChw9LLzUmEiX29wwz3X4W1BsnuWpQgqVHNLfkQnoFADtfgcZ
         Q9tcmR8UmiJxOY/VaGHd+TnpVje0AF0gBc9/R9YJHfevBxXVE+LSijTnI4N1TrnRW5hK
         s6m7oXrx8FECohNau2O8zzXk4NeN9AUueXOo1ksvIvN5VozIEp8puXbi2AuxLFjA/kF7
         Fz1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=DuzvDrmcmFUROMahjXsaIv677k9LWQoyjXqdmtsaBMI=;
        b=Xm0R924xKsFYZ8nhiRWzulaekhcM4Jt4t+w4q+H7wGi7q8puDnHv+9gJtIFzmh46kl
         vq+u62zjb7V8v3rt8FkTupevyDsCnC8gKgFnHH7Aq63ytz7itcDVgIA6ufsn0UMP4tYx
         N9wCsAfgIZXX6sN/ZFMW1MF+IhELyGKgSHvqv7ELeO60LQhJJcnz6VkG/2CqizgxnmZJ
         dyLVY7uo2sSbG0HYO8RPaaE992bvYji91ua8b8YUiZJT80d5Fdv4IQbgrYMJJPA5jhh4
         VVpHKCJ/UrRragzjYbga878DSSXrBZvJNk8HjRHQ2T6TAp1nICByqe82Vkc3pQRFcnS1
         xo7A==
X-Gm-Message-State: AOAM533WPrrJqdKahWA5Gw0aMe5I6RrWzDbm2WbjPghRnIHFlmsQGUDV
        IqmDAKqJhq1FItk0Iw8pEf8nE7PGQblTLg==
X-Google-Smtp-Source: ABdhPJw7MI5v8hAUH6Yv8ZDHRjeZDtK2cRkFfnZbkBrXlzKA87WIhoC1VJMzv7dTLP1azOz3LGE4VA==
X-Received: by 2002:a62:545:0:b029:142:2501:35db with SMTP id 66-20020a6205450000b0290142250135dbmr9550209pff.59.1600320178779;
        Wed, 16 Sep 2020 22:22:58 -0700 (PDT)
Received: from sultan-book.localdomain ([104.200.129.212])
        by smtp.gmail.com with ESMTPSA id i62sm18705619pfe.140.2020.09.16.22.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 22:22:58 -0700 (PDT)
From:   Sultan Alsawaf <sultan@kerneltoast.com>
X-Google-Original-From: Sultan Alsawaf
To:     linux-i2c@vger.kernel.org
Cc:     jikos@kernel.org, aaron.ma@canonical.com, admin@kryma.net,
        andriy.shevchenko@linux.intel.com, benjamin.tissoires@redhat.com,
        hdegoede@redhat.com, hn.chen@weidahitech.com,
        jarkko.nikula@linux.intel.com, kai.heng.feng@canonical.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        mika.westerberg@linux.intel.com, vicamo.yang@canonical.com,
        wsa@kernel.org, Sultan Alsawaf <sultan@kerneltoast.com>
Subject: [PATCH v2 0/4] i2c-hid: Save power by reducing i2c xfers with block reads
Date:   Wed, 16 Sep 2020 22:22:52 -0700
Message-Id: <20200917052256.5770-1-sultan@kerneltoast.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Sultan Alsawaf <sultan@kerneltoast.com>

This is a fixed resubmission of "[PATCH 0/2] i2c-hid: Save power by reducing i2c
xfers with block reads". That original patchset did not have enough fixes for
the designware i2c adapter's I2C_M_RECV_LEN feature, which is documented
extensively in the original email thread.

Here is the original cover letter, which still applies:
"I noticed on my Dell Precision 15 5540 with an i9-9880H that simply putting my
finger on the touchpad would increase my system's power consumption by 4W, which
is quite considerable. Resting my finger on the touchpad would generate roughly
4000 i2c irqs per second, or roughly 20 i2c irqs per touchpad irq.

Upon closer inspection, I noticed that the i2c-hid driver would always transfer
the maximum report size over i2c (which is 60 bytes for my touchpad), but all of
my touchpad's normal touch events are only 32 bytes long according to the length
byte contained in the buffer sequence.

Therefore, I was able to save about 2W of power by passing the I2C_M_RECV_LEN
flag in i2c-hid, which says to look for the payload length in the first byte of
the transfer buffer and adjust the i2c transaction accordingly. The only problem
though is that my i2c controller's driver allows bytes other than the first one
to be used to retrieve the payload length, which is incorrect according to the
SMBus spec, and would break my i2c-hid change since not *all* of the reports
from my touchpad are conforming SMBus block reads.

This patchset fixes the I2C_M_RECV_LEN behavior in the designware i2c driver and
modifies i2c-hid to use I2C_M_RECV_LEN to save quite a bit of power. Even if the
peripheral controlled by i2c-hid doesn't support block reads, the i2c controller
drivers should cope with this and proceed with the i2c transfer using the
original requested length."

Sultan

Sultan Alsawaf (4):
  i2c: designware: Fix transfer failures for invalid SMBus block reads
  i2c: designware: Ensure tx_buf_len is nonzero for SMBus block reads
  i2c: designware: Allow SMBus block reads up to 255 bytes in length
  HID: i2c-hid: Use block reads when possible to save power

 drivers/hid/i2c-hid/i2c-hid-core.c         |  5 ++++-
 drivers/i2c/busses/i2c-designware-master.c | 15 +++++++++------
 2 files changed, 13 insertions(+), 7 deletions(-)

-- 
2.28.0

