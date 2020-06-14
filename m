Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A20171F8AC7
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Jun 2020 23:03:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727795AbgFNVDD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 14 Jun 2020 17:03:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726938AbgFNVDC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 14 Jun 2020 17:03:02 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E63BCC03E97C;
        Sun, 14 Jun 2020 14:03:01 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id l63so4460904pge.12;
        Sun, 14 Jun 2020 14:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H3wVtJJ7vMdb2trVl2O9u43RZh1efk34Dlrp+s0Wcp8=;
        b=pcAF8NTgqMEW4hWl5VT23BL951NmM7jIXoQ9mllwHaCmNrRv1xA2HL+1TC/ActMcah
         6AxqDAgf4GjfBiIez5vXWivLbxFgsr4SwmxDOGLDb4F2N46be5zo+NOCvEAyuDZgZ7SS
         Hf4SEb8SelQ+V/0zv2yRJkMe0Nsin6tkuch/PuzoTAWdJsWiVRNKwjgFvc7fe5geGd3H
         V9wts2y40pMYqX6s/DznN3lQmieYYobl/KYtmKqwhjgncUktjrpxFoDZwnQuLK8ShDDK
         yxU43n3iI+aO/rnqr7I+VShZCc0qCzV+xg+QINKZJGt8HmO4BGS7P7+l2JMIT3zcgejf
         Ij1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=H3wVtJJ7vMdb2trVl2O9u43RZh1efk34Dlrp+s0Wcp8=;
        b=hOSmreElz2aqDrxkjhRe96fJPChiAZ6TBrGw3UmK2sc7Wd9O21BonKRiP9ab0PPecN
         5sTmGco7RTP67ZdzZEGq9AErR2NXhu7fhooJeOuyUVUkn6nHbKh0B/GsJ+jDJc5o79kA
         OaunNDu9aUij6lud7zrMockujVwYdfZCRI1vPhYCt9iaM7woz1+Yp2v37/w+qYyFVuXj
         YUSfQXTLYDx+0x0oe8AsgQhaOjCtkyB7zZ1wMvtRN0FZmXOCAf73DR1+egG9f3DIFvps
         nttyxSldoE0SZ5vR35bS0o1OM0SygfA3iA+/kZpThBvkWZbjpLqdO2b4bHPEoq/W2zdG
         jsdg==
X-Gm-Message-State: AOAM530EdtVgT+f2YGf4INQjVQ7c6umnlmtz07GRPrU4wCy33Q+pthY/
        cdqv8DCbinNY81uwOOfDMfA=
X-Google-Smtp-Source: ABdhPJzGoUvFKMBovUE+ulnDCp+nm2+fVT5EV5+pJ6+dcGnYQLkQ/M1GnVdj1QH30zUKycheKI+nZg==
X-Received: by 2002:a62:aa07:: with SMTP id e7mr19606934pff.87.1592168580031;
        Sun, 14 Jun 2020 14:03:00 -0700 (PDT)
Received: from sultan-box.localdomain ([89.45.90.111])
        by smtp.gmail.com with ESMTPSA id d184sm1827746pfd.85.2020.06.14.14.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2020 14:02:58 -0700 (PDT)
From:   Sultan Alsawaf <sultan@kerneltoast.com>
X-Google-Original-From: Sultan Alsawaf
To:     Aaron Ma <aaron.ma@canonical.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>,
        HungNien Chen <hn.chen@weidahitech.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Jiri Kosina <jikos@kernel.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Pavel Balan <admin@kryma.net>, Tin Huynh <tnhuynh@apm.com>,
        Wolfram Sang <wsa@kernel.org>,
        You-Sheng Yang <vicamo.yang@canonical.com>
Cc:     Sultan Alsawaf <sultan@kerneltoast.com>
Subject: [PATCH 0/2] i2c-hid: Save power by reducing i2c xfers with block reads
Date:   Sun, 14 Jun 2020 14:02:53 -0700
Message-Id: <20200614210255.4641-1-sultan@kerneltoast.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Sultan Alsawaf <sultan@kerneltoast.com>

Hi,

I noticed on my Dell Precision 15 5540 with an i9-9880H that simply putting my
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
original requested length.

Sultan

Sultan Alsawaf (2):
  i2c: designware: Only check the first byte for SMBus block read length
  HID: i2c-hid: Use block reads when possible to save power

 drivers/hid/i2c-hid/i2c-hid-core.c         |  3 ++-
 drivers/i2c/busses/i2c-designware-master.c | 10 +++++-----
 2 files changed, 7 insertions(+), 6 deletions(-)

-- 
2.27.0

