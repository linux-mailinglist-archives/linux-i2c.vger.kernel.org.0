Return-Path: <linux-i2c+bounces-10650-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 64954A9EDCC
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Apr 2025 12:25:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B3AA416A4F9
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Apr 2025 10:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00DDC25F968;
	Mon, 28 Apr 2025 10:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CqTmz56a"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1795D1AC44D;
	Mon, 28 Apr 2025 10:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745835926; cv=none; b=CLGLaxVrCGx+LnC42ou5RtCqpMCOOxT8AYJPAADHupDuVU8MCXCeS1LWtt6vY3fXB40MCTVInx18kwD5ThqhZviavT9gV1g0DEUiUZB9wKBwVmWa5wuh+FNLfoKfQh7wkMP4yMp9Zwc482CM6XrNYWfGaOZcib+CLii/idzGsSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745835926; c=relaxed/simple;
	bh=2iF1DQYU50GI2BXImUukqa+PGsl6sbO/8ovV6WiLb3E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qH/Mto01z9zemfzlCOTLNgmYiiH8ljUk64k9FyrfnnxOUyYl+MqEql6PB5+AWRucb2gU7CJCcThNmBhhbLzs5iHP6A8yPrIg0QdAcAwyhTyjmKb/j7cbkHDhw2bAGpGCigJNfLkH8nnffvcMujOj5hWVCRn1XsYG/QS6adEs7+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CqTmz56a; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39c1efc4577so2633387f8f.0;
        Mon, 28 Apr 2025 03:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745835923; x=1746440723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bxsZM3xIeExMB8+O5sy9NxIn/QCUBGTVG3S6FZZwWEU=;
        b=CqTmz56aDWpXGjbLHEVJUQBY3zxQHCwE3ffI7ZSIfqKU/+r30selcndpubhKky3+W2
         A0JnIyoXz+JpDhsDWPMiqxeM6WOeQDFf6zB0jwfkdL6OqrHkKc2MZzdGntniVta7EuAU
         PexSz0vR3O3p2msj/0ugAW1eb+e2FdsQwoXYw+vgnUFJLv3IXSF0+uhjAAc+5vGdJbCv
         lRjNNf9fKBZvkFTQ1QMgU6D5gTPSyDMh9iuqcFur9LzDjUvULqwBhz3bvIEzA7I8+C6d
         uVLdFBav0r3SCA1J6bf/lHIQxJAph8IdxXjWSN6C0Gmew5iujSSEBk/8JUDd2UAQUlRK
         8Elw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745835923; x=1746440723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bxsZM3xIeExMB8+O5sy9NxIn/QCUBGTVG3S6FZZwWEU=;
        b=kJBQFzILNyCM0TQW20dRjumX/59b4E2g0+oFScnerpnZsWfPMhEsWuOe1mhjv/Yd5A
         ZFMgtK/VdOyQVTRdVkztpyeJfcmEqTweYzswBnzyxCOekTxxwiAWjBuoPAKYDH7sNL7B
         j6NEmfG59nKEE/ZJwWjjc7F117ZwECX0urPlDkhs/lditj9rSVksA4OkYRSCF8UI2nkP
         yuFQ1NpZkUFKGtmKHFN1/zJb86RpG0t6xuzIc5HqgyDRcYo5/Q4kgiMQaTfs/c7p1L1w
         pbbTRgsJ6ls/Ca80BWlrhcnLzoTmeWHcaZhdLP/5mwJ+irECb2wOpY7eFhyuhLa+PmEI
         BKQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiKV4FrVDV+c7ubOuh9RLrXJUx91YpN0DB61LrLmKM80ggmMq76AvSx4J8A/C+auUqo4uFnyjXOQ/DMPxd@vger.kernel.org, AJvYcCWQXCBJBw4qt0JZXyX3hzbMvhBbtz6ZxuDGovvji1ntFZOL/rHDEEcEV8iNjda2T/xZ6u7FQ/uA4DA=@vger.kernel.org, AJvYcCWi9fExeKmyj07/j+zi7DK9eNfKZGXmnFHiYvwpAZss+eKSTubHJ7h1yslo4GCypBd7ctX6OHI/VMc+74g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ/VO8vbqpJP1L863d3oG1exg+FATu+kiUd9fuyCBe+AWoEACG
	l0491z9/w4bsYhJtvZmPOOr1Y3g4mLElCKipN3JFoys8gs+a15e4
X-Gm-Gg: ASbGncuSMfyc+zwQb8KLMne1VlBGQtZZnCC3vfOluckhdMbqjyc7uaLzzD62vOc7hPS
	cBWqzi0RAfPg0kUmqk2khtUZhEgBWLACnPzBVR5uukUYT/qQmZYmQ0J+C8lmkpeDz7MiMgObNiY
	X9vd4c49vcuqD0mnjUIqLe5ESGSoKbonKNyZb8k4tc/9Jdhlzort3rUnjiX4hQmY35s9/XUni+o
	oq8hIUcBvkcvvfr0pSnqdj41flcX8qpL2nSNj5Bg5cPr0IuX6RslYJIsz3+Mak5vks5mnyOZOmm
	2cIJ8BdXghkL1hxpy7iFKX87TKlYgH8NDxIgyYt5SfBFxBKazKdQ
X-Google-Smtp-Source: AGHT+IHWX4L2c7kjEuSEfvPInIWs0DaJlyK02zZDMs8LQhXL5x3SjemNMZxe3IzaA9++76MmjCg9zA==
X-Received: by 2002:a05:6000:1362:b0:391:489a:ce12 with SMTP id ffacd0b85a97d-3a074e3cae4mr6298926f8f.26.1745835923069;
        Mon, 28 Apr 2025 03:25:23 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a5310ad2sm118825295e9.21.2025.04.28.03.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 03:25:22 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v4 0/9] i2c: atr: allow usage of nested ATRs
Date: Mon, 28 Apr 2025 13:25:05 +0300
Message-ID: <20250428102516.933571-1-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For upcoming GMSL drivers, we need to be able to use nested ATRs.
The deserializer changes the address of the serializers, and can only
do that for the serializers, while the serializers have proper address
translation hardware, and can translate the address of its children.

To achieve this, add a static flag and a passthrough flag.
The static flag prevents usage of dynamic remapping by disallowing
creation of new mappings outside of the attach_addr() function.
The passthrough flag prevents messages coming from non-direct children
(which don't have a local mapping) to be treated as erroneous.

This series also contains various fixes to the logic observed during
development.

This series depends on:
https://lore.kernel.org/lkml/aAii_iawJdptQyCt@stanley.mountain

The previous version is at:
https://lore.kernel.org/lkml/20250228151730.1874916-1-demonsingur@gmail.com

V4:
 * rebase on latest merged changes, and latest submitted fixes

V3:
 * remove i2c_atr_new_flags(), add flags parameter to i2c_atr_new() in
   a new patch
 * remove "i2c: atr: unlock mutex after c2a access" patch as it will
   be moved into the base series
 * remove alias_pairs variable used only once
 * remove err_del_c2a label used only once
 * add lockdep_assert_held to i2c_atr_create_mapping_by_addr()
 * I2C_ATR_STATIC -> I2C_ATR_F_STATIC
 * I2C_ATR_PASSTHROUGH -> I2C_ATR_F_PASSTHROUGH
 * add passthrough check to i2c_atr_smbus_xfer()

V2:
 * rename and split up i2c_atr_find_mapping_by_addr() to allow for
   usage of parts of its logic where applicable

Cosmin Tanislav (8):
  i2c: atr: find_mapping() -> get_mapping()
  i2c: atr: split up i2c_atr_get_mapping_by_addr()
  i2c: atr: do not create mapping in detach_addr()
  i2c: atr: deduplicate logic in attach_addr()
  i2c: atr: allow replacing mappings in attach_addr()
  i2c: atr: add flags parameter to i2c_atr_new()
  i2c: atr: add static flag
  i2c: atr: add passthrough flag

Cosmin Tanislav (8):
  i2c: atr: find_mapping() -> get_mapping()
  i2c: atr: split up i2c_atr_get_mapping_by_addr()
  i2c: atr: do not create mapping in detach_addr()
  i2c: atr: deduplicate logic in attach_addr()
  i2c: atr: allow replacing mappings in attach_addr()
  i2c: atr: add flags parameter to i2c_atr_new()
  i2c: atr: add static flag
  i2c: atr: add passthrough flag

Tomi Valkeinen (1):
  i2c: atr: Fix lockdep for nested ATRs

 drivers/i2c/i2c-atr.c         | 185 ++++++++++++++++++++++------------
 drivers/media/i2c/ds90ub960.c |   2 +-
 drivers/misc/ti_fpc202.c      |   2 +-
 include/linux/i2c-atr.h       |  15 ++-
 4 files changed, 136 insertions(+), 68 deletions(-)

-- 
2.49.0


