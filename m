Return-Path: <linux-i2c+bounces-12392-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 72373B32F78
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Aug 2025 13:34:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3AF6F1B6037A
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Aug 2025 11:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E02D025B2E1;
	Sun, 24 Aug 2025 11:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JPSBCgME"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10862030A;
	Sun, 24 Aug 2025 11:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756035273; cv=none; b=WELmJjcAJXP4wqJXwWBF5NOxZ8AUP4C8EPNUXGgDH4b8aeJbhmPpEcSip947VqU26sAcb80tdq1uXvicihNzaaqMaGovY70M1gY9dOX3mNlBo/hVBRIDMBzxQlXxTvo5pCn1uBZ4HoyBK0FU5xp8U06He7GYhCC/JLAc1h32ZfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756035273; c=relaxed/simple;
	bh=aAXW/pvfgzvQRrGw0vNyRlHaMorjDabcjNYrZbfRm6o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HZph6xjR5YBUPRELX/C3zVbW+52BmNKmyWmdMTR/s5U/+wAx/bXLDfi+I3aJfzAFXMCYBkDdX9UFXlFkQA3tmV6dST+k9B2/gKLQheprYBOKAaM9Ep2TUEy1UKutay5rwWYzC21ortDYtuBXefUJKtw+ujQUNmrgv/FddYeIyTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JPSBCgME; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45a1b04f8b5so21563285e9.1;
        Sun, 24 Aug 2025 04:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756035270; x=1756640070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tHzHrkeUJZB91+EOyFnNdhfvrRue2RscyP5h4hOzWNQ=;
        b=JPSBCgMEtGH4+y0RSrwwWMb/qz1PVARifvp7YMeLn6CNDE2q5xnCdKszytmdxRJEK3
         sqbRYeHtfpyEPzLhwdZxnAMSlat897pSalGRep0H6+niDSyrqYC9PYwsyu8B1fL3pyhM
         7yOnQJ6j8p5WLe0ocRnELw5csKt7pfzzGblp+e4nOEWkEEJpkgpQVPtJEIpuO8Ie+ble
         5jFTdALSvPIliHhUPF6HZjvW3WjvpbBMXSfoZzTw54BDzCH2SzFP4qngB5O6l9Od1Atq
         rssCFeyaDMILWvQ+lSMa87fnSmDN4T9mB0nzNpaAewhGEGyb6aFiOpauX8JeR1IiP3Es
         NzNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756035270; x=1756640070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tHzHrkeUJZB91+EOyFnNdhfvrRue2RscyP5h4hOzWNQ=;
        b=enqhzoYVlL8aDiQdp5maRJDEAWjWi76W9WczW3Njr1SjhLSY163i+kJxbjCnwLiQlw
         y7IDhYO+Lzmtf9Zq68zRVeovi+MqpxMMAagtFPhdeFeJMNHFQnMnWLXhFg+M/cTR8PWk
         nFSDzJDr/lKsf50pYuRpG3SquY95/jHdaqvbjt38cbjmeo5xHta2TupOqBgchmcoiy7W
         oJQ8mxcmI2ROqhREehjN9gkGexpSnnqitAWLfY9NsIoQnGgZAjW0Z3+9Ed7PzXKoMplo
         8+T8Or6pl9IOTRalgxb9zivNkEyWT2vw7zoIVGyMacstkatIXv1n5cCCMwRv9eR0P15D
         IQnw==
X-Forwarded-Encrypted: i=1; AJvYcCUwjGbhG2Ytm8Kt2VjeNuTc0VSWi+qkD229Cb660XETt36ycg0LZwi6+50KB0WY5LcCLMbnf25z2XG1@vger.kernel.org, AJvYcCVdkx2VBvxQgyvnT/wKV1R2YYoYHAwa6wOK/Fhj5T+yBd2mWfsYOc/oqMhAaOTrZcifYcmrTI/ZeDghGd6z@vger.kernel.org
X-Gm-Message-State: AOJu0Yxnwa4+ogVyMzoSXsJHqLKdknrZOKuOOP7KRYiC/CCqE70GLWhs
	6hvhLTfYyq+05mryHdWmuDfJSnyyWkdWH3vDQU4qZHfwhzF0AowLmu66
X-Gm-Gg: ASbGncsVhES8HSyZ0q2Unr6I6JeeUTLadiBfftbuhWHufP9NPtfAxeO+fbvaitYN3Ug
	acpNHhOHsP8dqKhJGdln674QrRGHRJcc0u5QgGEpch1+Q1WSCUFSgCdr4kUF4fywfKic38W71AM
	EdWs0SCuiWvdWzAosSwE6c2zNApIUAiwAOuGJse5mgBfn46EKgjy+1x8SNSYu4wXChcIMJ3iD3R
	hAwFhGLHKkpTlYjKHeCq/TdMFQFrZsdD9OKF0e6vrwY2fXUo6cC9Pk8Q02DokjbDpZgY7+z2p1P
	Y+efYsV1hjjtdz9EUZussPMZm1hmkFIdk3E7oDtZX1Ki9NYhKJUfOQxTIDnwEnUiIww1/Y/OWbq
	X4cGueFEWJciKMzESP9HYinzUBdVtB3KryuXdOqaEnU3/34xQ8oO/rmI=
X-Google-Smtp-Source: AGHT+IGW8RWt1Fjll6gX0bUMzFoYWNNuwjmNyRN+lbxdMnJ9SG0BATaG/HcklxQmaadQOSxr0iMzcg==
X-Received: by 2002:a05:600c:45d0:b0:442:e9eb:1b48 with SMTP id 5b1f17b1804b1-45b517ca4camr91812925e9.24.1756035269984;
        Sun, 24 Aug 2025 04:34:29 -0700 (PDT)
Received: from builder.. (197-10-142-46.pool.kielnet.net. [46.142.10.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b5757453fsm66470895e9.14.2025.08.24.04.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 04:34:29 -0700 (PDT)
From: Jonas Jelonek <jelonek.jonas@gmail.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Markus Stockhausen <markus.stockhausen@gmx.de>,
	Sven Eckelmann <sven@narfation.org>,
	Harshal Gohel <hg@simonwunderlich.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jonas Jelonek <jelonek.jonas@gmail.com>
Subject: [PATCH v6 00/12] i2c: fix, rework and extend RTL9300 I2C driver
Date: Sun, 24 Aug 2025 11:33:36 +0000
Message-ID: <20250824113348.263475-1-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series for the RTL9300 I2C driver:
    - fixes issues, one of them in some cases causing data corruption
    - reworks significant parts of the current implementation
    - add support for the (quite similar) RTL9310 series

Goal of this is to fix critical issues, improve overall code quality and
simplify maintainance and further extension of the driver. Moreover, it
should be brought on par feature-wise with OpenWrt's downstream driver
to be able to drop the downstream version.

The first three patches address bugs in the current implementation, on
of them being critical and causing data corruption under certain
circumstances. Although the hardware doesn't support SMBus Quick Write,
the driver claims to support it with a broken implementation. This
causes to execute a 16-byte Write instead of a Quick Write, e.g. causing
corruption on not-write-protected SFP EEPROMs and soft-bricking them.
These three patches are also sent to 'stable' because they fix critical
issues.

Subsequent patches introduce various smaller and bigger enhancements.
These include:
    - use regmap_field + its API instead of macros + GENMASK + shifts
    - refactor xfer handling
    - variable renaming to avoid confusion
    - move some register operations, calling them somewhere else and
      less frequently
    - use guarded mutex instead of explicit mutex_lock/_unlock to
      simplify control flow

Finally, the last two patches add support for RTL9310 (mango) series to
the driver and adjust the dt-bindings accordingly.

Simple operations have been tested successfully on:
    - Zyxel XGS1210-12 (RTL9302B)
    - TP-Link TL-ST1008F v2.0 (RTL9303)
    - Netgear MS510TXM (RTL9313)

with Byte-Read, Word-Read and I2C-Block-Read. Other operations need
testing from people with devices available.

Compile-tested with Linux, run-tested as backport in OpenWrt on the
aforementioned devices.

--
Changelog

v6: - patch 'i2c: rtl9300: check if xfer length is valid'
        - renamed to 'ensure data length is within supported range'
        - added I2C quirk for zero length as suggested by Wolfram Sang
    - reordered patches to have backport-worthy fixes first and
      enhancements/others after
        - patches 'fix channel number bound check', 'check if xfer
          length is valid' and 'remove SMBus Quick operation support'
          were moved before all others
	- added CC: stable to first three patches
    - fixed commit message of 'dt-bindings: i2c: realtek,rtl9301-i2c:
      extend for RTL9310 support'
    - added a patch to use guard(mutex) instead of explicit lock/unlock
      as suggested by Markus Elfring
    - added Reviewed-by: Rob Herring ... to dt-bindings patches
    - added Tested-by: Sven Eckelmann ... to all patches (except the
      new patch in this version)

v5: - added more patches to fix further issues/do further cleanup
        - remove SMBus Quick support (not supported by hardware)
        - move setting SCL frequency to config_io
        - only set read message format (RD_MODE) once on probing
        - add check to avoid len = 0 being allowed as length
    - adjusted cover letter

v4: - fixed an incorrect check for number of channels which was already
      present in original code

v3: - narrowed vendor property per variant to be required only
      for RTL9310
    - narrowed usable child-node i2c addresses per variant
    - no changes to driver patches

v2: - Patch 1:
        - adjusted commit message
        - retained Tested-By and Reviewed-By from Chris Packham
    - Patch 2:
        - simplified check as suggested by Markus Stockhausen
        - fixed commit message
    - Patch 3 (all requested by Krzysztof):
        - use vendor property instead of generic
        - add front compatibles to make binding complete
        - fix commit message
    - reordered patches, dt-bindings patch now comes before its 'user'
    - properly add device-tree list and relevant maintainers to To/Cc

---
Jonas Jelonek (12):
  i2c: rtl9300: fix channel number bound check
  i2c: rtl9300: ensure data length is within supported range
  i2c: rtl9300: remove broken SMBus Quick operation support
  i2c: rtl9300: use regmap fields and API for registers
  dt-bindings: i2c: realtek,rtl9301-i2c: fix wording and typos
  i2c: rtl9300: rename internal sda_pin to sda_num
  i2c: rtl9300: move setting SCL frequency to config_io
  i2c: rtl9300: do not set read mode on every transfer
  i2c: rtl9300: separate xfer configuration and execution
  i2c: rtl9300: use scoped guard instead of explicit lock/unlock
  dt-bindings: i2c: realtek,rtl9301-i2c: extend for RTL9310 support
  i2c: rtl9300: add support for RTL9310 I2C controller

 .../bindings/i2c/realtek,rtl9301-i2c.yaml     |  45 +-
 drivers/i2c/busses/i2c-rtl9300.c              | 488 ++++++++++--------
 2 files changed, 325 insertions(+), 208 deletions(-)


base-commit: 57774430864b721082b9bafd17fc839f31251c7b
-- 
2.48.1


