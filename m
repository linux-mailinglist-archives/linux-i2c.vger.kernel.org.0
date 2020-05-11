Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C1311CE834
	for <lists+linux-i2c@lfdr.de>; Tue, 12 May 2020 00:38:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725836AbgEKWh7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 May 2020 18:37:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725828AbgEKWh5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 May 2020 18:37:57 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 877B8C061A0C
        for <linux-i2c@vger.kernel.org>; Mon, 11 May 2020 15:37:55 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id f15so4528408plr.3
        for <linux-i2c@vger.kernel.org>; Mon, 11 May 2020 15:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x7XWnhuv6bB5++eXCPLD4AyAk/i6oZ+YWOu/1t2B1wE=;
        b=M0crUOJyOxNj2pD6eqMOnmLoO4knAmORM3NSudilFoFB5IkqFFKMHWOphiB8VzOMF6
         XE7AH7T7FvhNr92u6HZdCKuP1bYupqVurN80gLEm6vZ9oV3BPgVHmMcAipSIUGawcVsZ
         eIncwh/3VxSOTivadOCwvhSxw7iOvIy4FkW08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x7XWnhuv6bB5++eXCPLD4AyAk/i6oZ+YWOu/1t2B1wE=;
        b=keJ//fQqUbEcJx9+bD1q1tTTVKjzcFAYKi7XPgR2NdB/lgxz9A8WwcUnV+eGwiH7S4
         5DtvhR8tEJDItWa37NSQQiluXjfO2T+pssdKq2rwzzucloJfw1G8gdTYXNCyi7q7Ms5B
         S0t5zaZeoEvMVYrYK+wFqJYPdYIvU/v5Smwho7yI+t9k0ku7TRuE+0tQV+jRQOCnJCh2
         sRPUP59C8w70BvFFWtRhggXCnyhfWf9nzwzwqfpyytleFVEXl9MC5O/YlWjfYIhLSkjH
         rewIYCvVUGmerdQG4qjCdBCO3iGiP7a65i4qRjLVWUQP1qDLCjEw0sl8oRgdPho0covY
         1V1A==
X-Gm-Message-State: AGi0PuYK4nBpT/NK6Q8a1PbowdntQOSCQkb8/RFJABZCTd2n7Hxpyflo
        ohYOjn35gRZUmz/5h4slMnFz
X-Google-Smtp-Source: APiQypJVE45601UTkg87xjBXf8sy1JrHaBHybIyxIKjfMaF9SMeWf9TSiwObdHSIDRBuVNhClyMw8A==
X-Received: by 2002:a17:90a:32ea:: with SMTP id l97mr25198759pjb.50.1589236674837;
        Mon, 11 May 2020 15:37:54 -0700 (PDT)
Received: from idle.mtv.corp.google.com ([2620:15c:202:1:fe92:d5a8:f1c5:e510])
        by smtp.gmail.com with ESMTPSA id x19sm10790040pjq.54.2020.05.11.15.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 15:37:54 -0700 (PDT)
From:   Matthew Blecker <matthewb@chromium.org>
X-Google-Original-From: Matthew Blecker <matthewb@google.com>
To:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc:     Matthew Blecker <matthewb@chromium.org>
Subject: [PATCH v2 0/1] i2c: Add i2c-pseudo driver for userspace I2C adapters.
Date:   Mon, 11 May 2020 15:37:36 -0700
Message-Id: <20200511223737.46122-1-matthewb@google.com>
X-Mailer: git-send-email 2.26.2.645.ge9eca65c58-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Matthew Blecker <matthewb@chromium.org>

This patch adds i2c-pseudo, a module that provides I2C adapters backed by
userspace programs. This allows for userspace implementations of
functionality such as tunneling I2C through another communication channel,
or mocking of real I2C devices whose behavior cannot be modeled with
i2c-stub.

Module naming: A pseudo I2C adapter is analogous to a pseudo terminal.

In the Chromium OS ecosystem we are using this for a userspace I2C adapter
built on top of an existing userspace I2C-over-USB implementation used with
embedded debug devices that act as I2C master to a device under test (DUT).
This arrangement is used for interacting with I2C slaves on the DUT,
particularly for transferring firmware to an embedded controller IC which
receives programming via I2C.

That I2C pseudo controller implementation is here:
https://chromium.googlesource.com/chromiumos/third_party/hdctools/+/refs/heads/master/servo/interface/i2c_pseudo.py

---

Changelog v2:
- Fix ARCH=um compilation error from non-const strlen("literal").

Matthew Blecker (1):
  i2c: Add new i2c-pseudo driver for userspace I2C adapters.

 .../i2c/pseudo-controller-interface.rst       |  305 ++
 drivers/i2c/Kconfig                           |   17 +-
 drivers/i2c/Makefile                          |    1 +
 drivers/i2c/i2c-pseudo.c                      | 3200 +++++++++++++++++
 4 files changed, 3522 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/i2c/pseudo-controller-interface.rst
 create mode 100644 drivers/i2c/i2c-pseudo.c
