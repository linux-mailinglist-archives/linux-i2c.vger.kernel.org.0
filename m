Return-Path: <linux-i2c+bounces-13231-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3BDBA5D51
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 12:19:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC4CE17F9B1
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 10:19:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0CD32DAFAB;
	Sat, 27 Sep 2025 10:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DuqEZVtj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF20223A9BE
	for <linux-i2c@vger.kernel.org>; Sat, 27 Sep 2025 10:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758968392; cv=none; b=UMT6VZRmbC6UvlIsNv+UG6nrRSa3tD/sObKnqObR1gJ8CYPaVSe2/D/iGLqGXO9nH3fzTHg5yVM23dS74BgpqjmY2O4QsEtnVNgo4Kaw4lnm0bT1rX+oFkpGHqwLdiudg1+DgQgU0stJkGqW8u0L0QkSpa3GHDME2Z59yMBfN0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758968392; c=relaxed/simple;
	bh=0o9rKzR6gg+t55L6FVkME3POEj1s4xOONmMeC6wusr8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EGiAigWB33QgvxbS4g0q75hzt4qpXLOhMUQyjyi1DbUVKlG/kD38RRhc8XDSyIRnHXze/8wALerTgaXaH2YYh9lseBXOUl/W+eVzD7/leLILR3ubREpLuIrsB/dBF8oa+bXIFihjOfD1VV0CrJ4Js62Trz5lS+LrA5KJ7GiZWiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DuqEZVtj; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-46c889b310dso23894435e9.0
        for <linux-i2c@vger.kernel.org>; Sat, 27 Sep 2025 03:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758968389; x=1759573189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wUMIhguk0q/paILF3EYM4v2HRo4Qf4m2sM5vjWbUIDk=;
        b=DuqEZVtji3YVjgX+f4tSGSLo5unrsnSm3pmkud8JO7KCDkvS6d6GXoJOMt/Vn8QdnU
         pdFL1UIYsyPzTVGoyA1i7fcU5y8gARG8xgnKyGTpLQ6icckaaCse1M4E+ShDskK0O5nC
         4sMh/Ti655nRzm23ywvKsz8RrOvzyfVT0mge6abzFHiNZywYvcdtWBrdHZSB1OnRkaqU
         PkPXKrnE0zimRXFQedyw1eYTEJm+T6WxTuLc0q9NzViAbgxTAC4omNh8naV0LAfrBIrg
         5hLp+ufmT9I/M/XH4g9h9ZeH++Xmvtg9Cg9rZNEaiRtYPLNKxBPiieQ+qaj9HlGg6dsa
         PGog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758968389; x=1759573189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wUMIhguk0q/paILF3EYM4v2HRo4Qf4m2sM5vjWbUIDk=;
        b=VMdm/uGYHdK1EpQR1JWKxlH9Y0dnwtX4EDm0TWe63wji0UwEMP8zs+mNtA5nHf5oHE
         HWYXbnERarqhglYrt18r4Svu3fFGeVHTlZNlfIX5IUjnpdy/WIaiKmo1X0ROu9N0XhQJ
         MHAoAquBE3gXhoGbX2JVOgMewbpbvjI6hmtezB7TbMcKxMwY98cnLPTIKNvXNy5tP7Y2
         DnoSDuQpgW61p1PKyYEhVARdpMCl/t0hrz49Fyg6xiXjaE63LHmmOYXx+o/AII05mrQw
         ZhFql42LW50Pt+mvjCZhRiVFQVzeWS8u564WB4xgX0HaZTsqCuhfQQnuYMw2Dxjz1tBy
         rB7g==
X-Gm-Message-State: AOJu0Yx0whJn56pnPoha+lJ0NX+iChUJBbs/qGtJhfaaC1KJMk8YHGZf
	8SoRB+qVv2CTn4bALbMk9awIiwTLRWVLI2hIaki62ZioGAw1mNlOPDJgCGCYWw==
X-Gm-Gg: ASbGncuFB9Fji4ck255afIp2jZzJjF4QfBZuaDjYPb8BIEkEgedr/q5rL8bOuR9+7LZ
	VY/z80VthrkHLct4Jo8z4x74dtPo2BDYhoC/pUdVvTLJpSzyphECR9wUvw6Y9uDCQ+MRj/SJg7T
	+7lj088FwCwO7VF6XygkzAWXwti+hYALM0DNjJyDmzqvbE02rXTIYJKrUVClNNrq8cDGhX6Zb7c
	J+YxVcGotWzZBu4PecaNwS/819SuWDE/sln9dKT75yM34LgtnHXlTmYPqWCjNlIk9wmp27iqygP
	c8gC9lYeut7y9YGXnjsaXZNYwIsiP9AwivKyP8rN0q984q42IF/xbwgr89vd9fx8pKaiKtOhoJK
	rnhrbQTkOktWeQnpUHlveRvetL3ujybSNGFe/
X-Google-Smtp-Source: AGHT+IEAPARqjKK6EzkdIdiWoeQGC83mPWmTSOGI7FWVLymma48fW8utY1AM3rM/BoC0rW24tM4egw==
X-Received: by 2002:a05:600c:630d:b0:45d:dc10:a5ee with SMTP id 5b1f17b1804b1-46e33c8e3f3mr92273335e9.15.1758968388876;
        Sat, 27 Sep 2025 03:19:48 -0700 (PDT)
Received: from builder.. ([2001:9e8:f11a:4416:be24:11ff:fe30:5d85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e32c31df7sm53416435e9.4.2025.09.27.03.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 03:19:48 -0700 (PDT)
From: Jonas Jelonek <jelonek.jonas@gmail.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Markus Stockhausen <markus.stockhausen@gmx.de>,
	Sven Eckelmann <sven@narfation.org>,
	Harshal Gohel <hg@simonwunderlich.de>,
	Jonas Jelonek <jelonek.jonas@gmail.com>
Subject: [PATCH v8 0/9] i2c: fix, rework and extend RTL9300 I2C driver
Date: Sat, 27 Sep 2025 10:19:22 +0000
Message-ID: <20250927101931.71575-1-jelonek.jonas@gmail.com>
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

HINT: This depends on another series by Sven Eckelmann [1] due to some
      issues occured during merge of some patches.

[1] https://lore.kernel.org/linux-i2c/20250927-i2c-rtl9300-multi-byte-v7-0-c0fd0e78b818@narfation.org/

--
Changelog

v8: - dropped accepted patches 1-3
    - fixed minor issue in last patch to make second master work
    - rebased on top of shyti/i2c/i2c-host to make sure it applies
      cleanly

v7: - included given Tested-By and Reviewed-By from Chris Packham and
      Markus Stockhausen accordingly
        - except for Chris' Tested-By on RTL9310 since he only tested
          on RTL9302C
    - fixed typo as mentioned by Markuf Elfring

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
Jonas Jelonek (9):
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
 drivers/i2c/busses/i2c-rtl9300.c              | 473 +++++++++++-------
 2 files changed, 321 insertions(+), 197 deletions(-)


base-commit: 217f92d91c9faeb6b78bd6205b3585944cbcb433
prerequisite-patch-id: 773cf36a416585adc1e955c56c0d036b6cd8ebc4
prerequisite-patch-id: d8190d8d1904fc9ef151ffffb57622cd2fae623a
-- 
2.48.1


