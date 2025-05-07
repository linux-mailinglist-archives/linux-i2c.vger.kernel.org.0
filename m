Return-Path: <linux-i2c+bounces-10864-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 812C5AADED2
	for <lists+linux-i2c@lfdr.de>; Wed,  7 May 2025 14:19:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDB674A4586
	for <lists+linux-i2c@lfdr.de>; Wed,  7 May 2025 12:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BB5A2594B7;
	Wed,  7 May 2025 12:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SRRCq/Rl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517971B0402;
	Wed,  7 May 2025 12:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746620366; cv=none; b=e8yvTOq4eoRaZc1wzghj5DMjqyDOh53la+CsfxS80nhhXUhJNHcU2dP8sQwGu0FN1uO0CF/l2ivVqxzEIaJRG3uR+Vxo2FSryzx8bAEyfYikl5cN0wBIqNjqthVq4GOcyL+HtL21p3Iw74v7RlGSvm5WRGG3pUds/OgtQqc3nYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746620366; c=relaxed/simple;
	bh=CKMRTnS0B4bvNBSSaYh+mIAjQrBFREvL62azq950quk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hcqRkZWw8hoLpb0M3X3Viejzf2blgNNBkVwNGAGAbHPJyIdUZP/rMV1PKPDgLHMwt5aIXUa2y5lkH4COCjcAfu6EsGhL+yRAsfxUzqH4u1G6L1SdsvwXAOpy+HMLMu5UVq5hDeCdNHaSsECLgCy8yTyqFAoFiXZoBMy1BYHN2KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SRRCq/Rl; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5fbeadf2275so1547478a12.2;
        Wed, 07 May 2025 05:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746620362; x=1747225162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kV+KjlfLL/cADUTBqt3WXEfFAs0DbcGPIboT/FQzAro=;
        b=SRRCq/Rlqf7G1+jwbq+YA2DHdhdH52EdTkQ1JtV+IpWwBDT5QcKZhAQAWDDgdKTD4G
         grNnXZMWs8wlJ19zwz7kJ7Xzao6t921bRZ58JXDthIaCeRCvAXqyUTxjoJz4gurom1iJ
         BsL7nebZc/5ybJVZQNrYbWSMH2iydbNVbqd/4w0kVrB55s8PODQyRo9P5ZhmvGDydj2d
         ECZR+kS2RjKZbLarmheYzRAqSQu11yOo1dXL4Ajir/WkCLFccvyaPRrR+ys8fy4NAmAf
         DcU+4y+GbPMOMb9zPbHUqHv2ZpcL9+gAm2SLFApNDOgRLhZC3V0ln8vUVwDt/Xzq+WVj
         Iyyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746620362; x=1747225162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kV+KjlfLL/cADUTBqt3WXEfFAs0DbcGPIboT/FQzAro=;
        b=fk36lnAjXG8DulNydErgxxCD78VHgBv0p5z6Qb+5YUyrdwmBobIN6gEPx5o1dLzT5d
         6YUKMliHzuId16JTVYR2A0sHA73KqGMfSAwRtITNk4L8z1dLWc1IRhV0rDGnnTMHOej/
         +VcyVQo2M40F2gsUJc6DhyfyYvU165WjVoMGcTp7wfzXMc0zdpKtBNKpn/3Iwn6XkHHe
         Jvx1m8SkdcV76F3W8UxGrP+aA9WeiYgN7fBhdMsKWFVp3TZKUbgThBNyojKeQbmAGYKb
         5xACUQSzYHEExTFI9CEoQVn9ivwCq2ZlbEPcurQ+Ip5OF6bfXxiLGpBUa+FdpPhS1ALv
         yk9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWV4lYd5oyAyMqLgfKiaFVgWGxESry8JHu5/Wa0f+jC2HyF5h27fdHb0K+TzqTEQyiUH6MEEYGEffM=@vger.kernel.org, AJvYcCWgJc7KWRtz1A+b5aZV1pMN8CkKi5VBrtucGhNyoFPKWuPEBqpKLQ6cZkzh98eQ6iPix81GxfW02NFgQIY=@vger.kernel.org, AJvYcCXRiYao6DTSp+ZhGyzeyJzM/qp18uS8Dyk34Vdzl8yV5r0NOctSEkM0UW0/fN1C9vKNzelm2JeuVCCus/Zu@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg1vVALkfB3Su5Lsl1Qd+2MkEPRBXY6s87MtoPwa4ML9yXUYy/
	m3bjiLMk3YU0XiCy4YXe9e9upuM3draMBtR0EdKsOuwUF9ea6TUI
X-Gm-Gg: ASbGncsBopArdPyLkpIGp/7JccrWyyvcUse+0eLA0AzgsoEpUUGv68zBD3Kgn34qveO
	Bz1hEYc8j9AHLx6Ygu+cUNmx27UVja8+Yqe7IrYa+qVyxOFyx8lidx6LCR2vKTEYiiPzXNBELL6
	Qi7Kym5VO6ljCVwg92OPFzU+xbh+PGrbPKnF5h+eShb5rlqbb1S6x7JG1AC2Lo7B9Gv35E/6bfj
	nKn94btkVUnRePFF5kLE5DKAEqFuc25xDirOPIljU7lwwNkrYksao9Kwp4vjVH018a4G/oSAx8l
	N8Mn7dDfHHgype0xGTCmG1iikb0kCvovkpyCK9EPUdRZTvwzUBpb
X-Google-Smtp-Source: AGHT+IEqa0eIvs9J2+yFgAMTJ+c01AQk+1L/p7LFOztMr/qgDUejaP47ibyyXFy6eMTqQBvUVBkwXQ==
X-Received: by 2002:a05:6402:2712:b0:5fb:165:2a95 with SMTP id 4fb4d7f45d1cf-5fbe9dfbfaemr2722828a12.13.1746620362385;
        Wed, 07 May 2025 05:19:22 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa777557b9sm9350002a12.10.2025.05.07.05.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 05:19:21 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v5 0/9] i2c: atr: allow usage of nested ATRs
Date: Wed,  7 May 2025 15:19:06 +0300
Message-ID: <20250507121917.2364416-1-demonsingur@gmail.com>
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

The previous version is at:
https://lore.kernel.org/lkml/20250428102516.933571-1-demonsingur@gmail.com

V5:
 * pick up Reviewed-by tags
 * expand the I2C_ATR_F_STATIC description
 * place i2c_atr_create_mapping_by_addr() before
   i2c_atr_replace_mapping_by_addr()

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

Tomi Valkeinen (1):
  i2c: atr: Fix lockdep for nested ATRs

 drivers/i2c/i2c-atr.c         | 197 ++++++++++++++++++++++------------
 drivers/media/i2c/ds90ub960.c |   2 +-
 drivers/misc/ti_fpc202.c      |   2 +-
 include/linux/i2c-atr.h       |  19 +++-
 4 files changed, 146 insertions(+), 74 deletions(-)

-- 
2.49.0


