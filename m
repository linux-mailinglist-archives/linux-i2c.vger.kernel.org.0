Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDF54190732
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Mar 2020 09:13:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727050AbgCXIM7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Mar 2020 04:12:59 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35059 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726166AbgCXIM7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Mar 2020 04:12:59 -0400
Received: by mail-wr1-f66.google.com with SMTP id d5so7887909wrn.2
        for <linux-i2c@vger.kernel.org>; Tue, 24 Mar 2020 01:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pBe64QqwGmfJTJzTC1TnFTjmJ3dO097sEXWT3BbQCJ8=;
        b=KZN8UMO5LD+wBS7m9vD8NgUCOc5MAYnFXyyL4s/kCWCiQbV8WoerLp9F/HzmaA8EfT
         2NZXZE6GxNkczY6uQ3M+WqHOMsJeESaHmd/uf4SRpg65qVxmgcd1sHXnbxUUJ8Lby0WX
         63UbAerEwjS0R7mG1+b6gWd41dv5rb5jFJNWQPtiNndYM1MrTSM7k6m/CeD0ELPyDsyM
         mdyLYQFERaPEish52BJ/ldHQNZ4zgLXWtS2f/CdsMmD/ZrLjB3BZK+2GR1n5b5wVD+gl
         u6BGGKWV0ug/nx0GzaAgwlMsk13gztfj+MH6t0MG1cVVRs2ul5nUWKEnNmr15BM5DAm+
         kl8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pBe64QqwGmfJTJzTC1TnFTjmJ3dO097sEXWT3BbQCJ8=;
        b=nTqcXiy4givblkjn0czAa+JXx41mv/owEznOGrQ6SuEE5kzTDE3811EYOlZo6u2ekQ
         sqqDfAfy72NZeVrLyTytAUydtMJJ3c04AdzlWqhXz0fJVXMbAuPkl9BkZ409SK0XEaD8
         fk85Fev+epXG8GxA0wqp1W7Xakk+GF4IrgY8UMTYcHSjlcPYI2UONBtMLHikqg5KA0n4
         pWcsVc5Cp8gx2zNvX58d4McdrR4ftzU03/4q7+2ecUYA2rf9qBBjNAgXMXSxdDVNAZz8
         RqypKXC0Km4qDkUr9xxOCesFOUruZnxc3rDMUD+UuYc5OR2sPPcUFtAtMIOoPwUyWXkQ
         7xVw==
X-Gm-Message-State: ANhLgQ14BTbV2Q2pN2+L1Eh/lVR06pKL8KrV/Y56LsWKeIw9db62n68P
        pxgg2lHTeWCXBjPsWVGwz6qePsYqG1I=
X-Google-Smtp-Source: ADFU+vt4kyypeI2FTaTdEm0GPfpTkqJ5jv/C+uq0NyROaKLBUWk+dx4wjqLh3Cl+5F4in82QPCWLyA==
X-Received: by 2002:adf:9071:: with SMTP id h104mr35344557wrh.359.1585037577103;
        Tue, 24 Mar 2020 01:12:57 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id z6sm26105338wrp.95.2020.03.24.01.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 01:12:56 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [GIT PULL] at24: updates for v5.7
Date:   Tue, 24 Mar 2020 09:12:53 +0100
Message-Id: <20200324081253.881-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Wolfram,

please pull the following change in at24 for v5.7. This time it's just
a single new ACPI ID.

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/at24-updates-for-v5.7

for you to fetch changes up to 4837621cd61e6b81a182098889143c6c9a06b0f3:

  eeprom: at24: add TPF0001 ACPI ID for 24c1024 device (2020-02-10 11:03:39 +0100)

----------------------------------------------------------------
at24 updates for v5.7

- add a new ACPI ID for 24c1024

----------------------------------------------------------------
Markus Pietrek (1):
      eeprom: at24: add TPF0001 ACPI ID for 24c1024 device

 drivers/misc/eeprom/at24.c | 1 +
 1 file changed, 1 insertion(+)
