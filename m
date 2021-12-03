Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB679467008
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Dec 2021 03:37:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350107AbhLCClF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Dec 2021 21:41:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235868AbhLCClE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Dec 2021 21:41:04 -0500
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9878AC06174A
        for <linux-i2c@vger.kernel.org>; Thu,  2 Dec 2021 18:37:41 -0800 (PST)
Received: by mail-yb1-xb4a.google.com with SMTP id l145-20020a25cc97000000b005c5d04a1d52so3616175ybf.23
        for <linux-i2c@vger.kernel.org>; Thu, 02 Dec 2021 18:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=hQggcIGgy6ZKALnkw04VjX0+7sX9DPBYoaUquorKfFo=;
        b=pWMHEleNRosicEE52A3D6C0q7o0/IDzJIRvUkGOSOELfD2qJrCPRyIZlCBMeJQDANC
         AAvEUPB6xllw71fAGtEjVJ1m3+jPzglhd4SnOvaoaZgp8Y596PSaD3ke32Vnae1Hw1Gf
         iGgd6msT77zeuFtRo1xlHC0z+lM+KY8vAmucadw3158GLkoTMYE9W50foko4KUCzkoja
         k/kv9dljHRCOdJcx7QuonHtnRAu9hojV7fOgEgYx0uphk84mRDBseX8tso6n0xgY06hk
         8i0+cTbfFDZnHSE3GxLlvCjD9I/Ct99bCIEFasuUKf7usCb4LjFEURW97otzohlnKJLL
         M9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=hQggcIGgy6ZKALnkw04VjX0+7sX9DPBYoaUquorKfFo=;
        b=iP5OyJdeHz5+AHLT4277+8z+NIqoUUbZVDjVbz78yOYUDkxm8BAxvEAkjFbSonhc4z
         PDiLqHqCg7zhz6nglGOwrMqkqcxtoIGkyWtfnO+Nmn8FX8tcK+ZwvqKf5FdQxw+YLg06
         +zgXA7SKbMfySg7rIPiyHznfRNMIfIdaFzE0qBmgvq6+IaR0iCjjhBPsnBNBDnJ9fF3Y
         swC9HsyJ+WAhVwykYPy6+zT/s0hF3V3CRw/mJRcW87LrS++5JpE9Y6Fwppq2sKUMkmES
         cZZa+jwyWzmJ7rNUQb09wcBoXKew72Ryms2oMheiXUfKzptTkle08P0jiAeoIKyivOe7
         tM9w==
X-Gm-Message-State: AOAM532gkAF/vrzcMp/YTkUgJBgNyGoOKEP/Q4upa7q3vGILA/UYiYuq
        nTq926lO/QGMbFVf+1bNYBBSVu2LTPr+
X-Google-Smtp-Source: ABdhPJyEstOP7jjC8xY+y2To+7nO+sQ3QFKHnOyof+ZDQy+NSFAWu4iDF6eIdQPDmbDhVfAhZ0yeMw3kskYd
X-Received: from suichen.svl.corp.google.com ([2620:15c:2c5:13:bc47:f5e4:20fa:844b])
 (user=suichen job=sendgmr) by 2002:a25:c010:: with SMTP id
 c16mr20955799ybf.760.1638499060256; Thu, 02 Dec 2021 18:37:40 -0800 (PST)
Date:   Thu,  2 Dec 2021 18:37:25 -0800
Message-Id: <20211203023728.3699610-1-suichen@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.0.384.gca35af8252-goog
Subject: [RFC Patch v2 0/3] I2C statistics as sysfs attributes
From:   Sui Chen <suichen@google.com>
To:     linux-kernel@vger.kernel.org
Cc:     openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        joel@jms.id.au, andrew@aj.id.au, tali.perry1@gmail.com,
        benjaminfair@google.com, krellan@google.com, joe@perches.com,
        Sui Chen <suichen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add I2C statistics such as Bus Error counts and NACK counts as sysfs
attributes so they don't need to live in debugfs.

There are a few I2C statistics that are implemented in many I2C
controllers, such as bus error counts and NACK counts. Having those
statistics in sysfs will 1) allow for a unified definition across
various I2C drivers, and 2) make the statistics more ABI-stable and
available on devices with the debugfs disabled.

Overall the patch works as the following way:
1) An I2C statistics sysfs directory is created.
2) Each specific I2C driver is responsible for instantiating the
statistics available.

Test Process:
1. Clone the OpenBMC repository
2. `devtool modify`and apply patch to the linux-nuvoton recipe
3. Build image for quanta-gsj
4. Build QEMU
5. Run the image-bmc image in QEMU

Results:
root@gsj:/sys/class/i2c-adapter/i2c-1/stats# ls
ber_cnt          i2c_speed        nack_cnt         rec_fail_cnt
rec_succ_cnt     timeout_cnt      tx_complete_cnt
root@gsj:/sys/class/i2c-adapter/i2c-1/stats# cat *
0
100000
0
0
0
0
53

Sui Chen (2):
  i2c debug counters as sysfs attributes
  add npcm7xx debug counters as sysfs attributes

Tali Perry (1):
  i2c: npcm7xx: add tx_complete counter

 drivers/i2c/busses/i2c-npcm7xx.c |  13 ++++
 drivers/i2c/i2c-core-base.c      |   2 +
 drivers/i2c/i2c-dev.c            | 103 +++++++++++++++++++++++++++++++
 include/linux/i2c.h              |  27 ++++++++
 4 files changed, 145 insertions(+)

-- 
2.34.0.384.gca35af8252-goog

