Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6075F2D7F59
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Dec 2020 20:29:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391934AbgLKT1G (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Dec 2020 14:27:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731564AbgLKT0f (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Dec 2020 14:26:35 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9A9EC0613CF
        for <linux-i2c@vger.kernel.org>; Fri, 11 Dec 2020 11:25:54 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id x22so8446143wmc.5
        for <linux-i2c@vger.kernel.org>; Fri, 11 Dec 2020 11:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q97jZXfuYNd7LxZyaTU5pq9JJKg4stvLUxrnSqyGA5I=;
        b=k2AR9sGARZXYpwGn8MAl80tBY+7XmcoFtQazzy68F4rNe4cagRUXR1Qygd2zTI/Wpa
         nP1gm5YYVjahMVQKUW29FRYavFOMs6g6Wip2Q/Ju8sE2U2vX4O3JuSpcK7M+8eI8+DfV
         g9uf27qWnbxMi+akfAnL7vfk6+OsWsJRwPSPBSxhMPPOovo5QCQoWhBe/lc+mqV3X2UQ
         dN74E4qfk5nPlTugnP62kSnXYX591OQ5e5bXrbI80lBnXA5P9PspRYP8aIR1kACgsCKa
         JlcsAQpqMqxhQ8Q3o01T7DN/4y0mDYhaiYmC9ayYyKFnIhLvrUpwHaRrGYMxt6VMSRr7
         MIow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q97jZXfuYNd7LxZyaTU5pq9JJKg4stvLUxrnSqyGA5I=;
        b=fHzB3tlT/09jEcXjvIeljVVAb3tWM+VgIw3XqqDGfsEVS4wTFipm9Z87DS3cIWEF50
         2qmKxbOgKUdRX32d04yqZx6f1LhFeRqVVBgMR2NfPWihVmcAEuAoArwT8A5MoMzzNwD3
         LoOLlbRSnJD9QFj3S3AyR1M1rrYY4c8HQXRKQ6GJCuVkNZI4CPI1nuqr6IofZ3xQ0yGs
         9vnl5gMt/cJ7r7j+l3rmCAUPwWWtawYpXHsrlKJVFHMXOXPnhN9Xb6onYwPh9F0SsGGx
         ZQWiGbdSPfcV8IjZ1sX4g/UluuabBSyOEcJvxPFG4iZFJXTMZ5oNIwW0qetLNmSKF02l
         4eNA==
X-Gm-Message-State: AOAM5330cBwvz2UqmlWZK+Ajjba/FDHBvR7QFB67saxHIYm54DEhsoWX
        YmyD4G0rAiqRgOf1+MHQzvc83g==
X-Google-Smtp-Source: ABdhPJzBdNYFmsqPNxsBcgAWSPRI09hkgUF+ecezKBXQaF8r8ySPhlPdO7cMz9j+gwR5SaWRoPYX4A==
X-Received: by 2002:a1c:240a:: with SMTP id k10mr14582462wmk.173.1607714753462;
        Fri, 11 Dec 2020 11:25:53 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id t188sm16283249wmf.9.2020.12.11.11.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 11:25:52 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [GIT PULL] at24: late fixes for v5.10
Date:   Fri, 11 Dec 2020 20:25:51 +0100
Message-Id: <20201211192551.2226-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Hi Wolfram,

I'm terribly sorry but I completely forgot that I had this fix in my tree.
If you're still sending out fixes for v5.10 to Linus before Sunday, please
include this one. Otherwise take it into your PR for v5.11 and I'll backport
it to stable.

Bartosz

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/at24-fixes-for-v5.10

for you to fetch changes up to 4e302c3b568eaf2aeebba804c07aba5d921a8c9e:

  misc: eeprom: at24: fix NVMEM name with custom AT24 device name (2020-12-04 10:46:36 +0100)

----------------------------------------------------------------
at24 fixes for v5.10

- fix NVMEM name with custom AT24 device name

----------------------------------------------------------------
Diego Santa Cruz (1):
      misc: eeprom: at24: fix NVMEM name with custom AT24 device name

 drivers/misc/eeprom/at24.c | 1 -
 1 file changed, 1 deletion(-)
