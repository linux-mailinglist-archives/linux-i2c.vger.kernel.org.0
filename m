Return-Path: <linux-i2c+bounces-6891-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B0397D412
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Sep 2024 12:18:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E3341C21013
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Sep 2024 10:18:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 269D613D250;
	Fri, 20 Sep 2024 10:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MLV/YrV1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515001BC49;
	Fri, 20 Sep 2024 10:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726827509; cv=none; b=J3kFVILQCiCKV9wMQNjQgRk/NDzhSkognIKO3DCFkJJt7Nom8qUHWV1qDlRYI1JRxBVBQKu/A4dfsooBOGpsd7AC/k/g9yQ1wdCGQEjlJYfwpoYABOXZzygy+WGjAOzGkd7A/CvwDE4pAQW/lxu+0yT2so67YIIZGPsG8f9YA5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726827509; c=relaxed/simple;
	bh=DY2WcN+lNOCjb8WsL0B52KYCADP8CcP7nEruXm5cFO8=;
	h=From:To:Cc:Subject:Date:Message-Id; b=oi7vP50tVBFPmhnJWtw1KPFCkGqfTD8xQcbu3Md6kBHEFzHl/NBmnovqarCucxqrSBhjhUM+793jXj1i9y9WPdVsuTqql6qlSw3uG55TAz2aB0+MGoaEgw8+41u6bW6DxUBxrYBuWxnIyCbDGcGk/fXy0dNE027K0xK6jmZZUNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MLV/YrV1; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2db85775c43so1337215a91.0;
        Fri, 20 Sep 2024 03:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726827507; x=1727432307; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qBcCIjRoxiVjgDZ5MgMhXd2EKuQeYew6JZXuK1tPsac=;
        b=MLV/YrV1pyguWjC8fwAEj6lANJ+f9vbx4bJ/nUniNZK6U0SqYcx1J6zJeKl2sabuIX
         Slt0xe6+Sa5IQgX1FjGIRF8gXoUEsI8pkMNHUlN/EPw6kmWGWrT3OOqjoAGZUzkTJ7va
         XU7/ndx5nm7pyij303rDqYoe4zUaDoVbknuj4QJYLKWC8M0mr542R6yUV6649wiHsJzh
         GG07o6UdywPC3mMxRC6SFFH+CNwHM3jrKbllZEUMnYC7Un97CB6jPxeIdrEqyP5TLdpw
         V3/ycFSDax6RND/931TGpXnRNSgnmtT1OJq4cZRk3WqwAlxhdgfJtM06KG2b2mIRxqtm
         a8Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726827508; x=1727432308;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qBcCIjRoxiVjgDZ5MgMhXd2EKuQeYew6JZXuK1tPsac=;
        b=YeJ0IqBVKHNBMHHxiJtfUCvZ0A8wX94VynKQKqa00k4oLQVgDdlrRoOtjMHwinssID
         IW18fERR1hh/J6nDFFu/a4i9T9dk82G0zpeGqsZZaGSJfTXJENU50plnluiUnqzAmees
         SNeVvZy3gAc5tEUpg8b6yyJ+SPEYad167Sf/JfLW/ZSwjaoofY9Mj14mzy7QY5TXzr9F
         +KsNrC4d00AKcNdliMME57l13crWsSw6fr/H8kkSSbnPssTRG7tARQi9MU+X1X85owRD
         MztA85IwtYvlKSBklA9Gyv6+kfuAX4azmUokS4n7yZFK4953zi97S0N49xfOAUcDIorP
         i3lQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZBecQw1zUyk6mnFWVWJPdj2Tu9kQAPy5bhgtf0DTPz8qS5uMha5vgJ73HVvvI1cRex86kQkizbQx10G0C@vger.kernel.org, AJvYcCXZuxMV/2RmhKSUVH3mF854harJwHjmh6eypuPKF8aRyukTf4bZb6jgQQFGenKXD/g4pJBsdf3MsLc=@vger.kernel.org
X-Gm-Message-State: AOJu0YydibrfM0ncWayPT6FZ63GdeWEHsbx5Z5+4oMvj4RTXFQrQxKh3
	wKfDltKiFEiaWM+r+B5iBu+GFjZbwREAAS2jq2fsRdtWWzqynm0=
X-Google-Smtp-Source: AGHT+IFbP/eoSZq3hbpekXAbmM4GZBdYL25BhV5ix8BcXAh8aBgnpApziN0RHvvL0/JIKZRAtrQzmw==
X-Received: by 2002:a17:90a:d906:b0:2d8:aa5d:5856 with SMTP id 98e67ed59e1d1-2dd7ed20097mr4122520a91.11.1726827507470;
        Fri, 20 Sep 2024 03:18:27 -0700 (PDT)
Received: from localhost (2001-b400-e35c-9cc2-447a-d760-d4f6-01f4.emome-ip6.hinet.net. [2001:b400:e35c:9cc2:447a:d760:d4f6:1f4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dd6ef93b3asm3631278a91.54.2024.09.20.03.18.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Sep 2024 03:18:26 -0700 (PDT)
From: warp5tw@gmail.com
X-Google-Original-From: kfting@nuvoton.com
To: avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	andi.shyti@kernel.org,
	andriy.shevchenko@linux.intel.com,
	wsa@kernel.org,
	rand.sec96@gmail.com,
	wsa+renesas@sang-engineering.com,
	warp5tw@gmail.com,
	tali.perry@nuvoton.com,
	Avi.Fishman@nuvoton.com,
	tomer.maimon@nuvoton.com,
	KWLIU@nuvoton.com,
	JJLIU0@nuvoton.com,
	kfting@nuvoton.com
Cc: openbmc@lists.ozlabs.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/6] i2c: npcm: read/write operation, checkpatch
Date: Fri, 20 Sep 2024 18:18:14 +0800
Message-Id: <20240920101820.44850-1-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

From: Tyrone Ting <kfting@nuvoton.com>

This patchset includes the following fixes:

- Enable the target functionality in the interrupt handling routine 
  when the i2c transfer is about to finish.
- Correct the read/write operation procedure.
- Introduce a software flag to handle the bus error (BER) condition
  which is not caused by the i2c transfer.
- Modify timeout calculation.
- Assign the client address earlier logically.
- Use an i2c frequency table for the frequency parameters assignment.
- Coding style fix.

The NPCM I2C driver is tested on NPCM750 and NPCM845 evaluation boards.

Addressed comments from:
- Andy Shevchenko : https://lore.kernel.org/linux-i2c/ZuQUfCK7d7DuR9eH
  @smile.fi.intel.com/
- Andy Shevchenko : https://lore.kernel.org/linux-i2c/ZuQU2iIZwW4mAumo
  @smile.fi.intel.com/
- Andy Shevchenko : https://lore.kernel.org/linux-i2c/ZuQWYabomv_xyYyj
  @smile.fi.intel.com/ 

Changes since version 3:
- Remove "Bug fixes" in the cover letter title.
- Modify the term "function" to "func()" in the commit message and
  code comments.
- Correct the coding style.

Changes since version 2:
- Add more explanations in the commit message and code modification.
- Use lower character names for declarations.
- Remove Fixes tags in commits which are not to fix bugs.

Changes since version 1:
- Restore the npcm_i2caddr array length to fix the smatch warning.
- Remove unused variables.
- Handle the condition where scl_table_cnt reaches to the maximum value.
- Fix the checkpatch warning.

Charles Boyer (1):
  i2c: npcm: Enable slave in eob interrupt

Tyrone Ting (5):
  i2c: npcm: correct the read/write operation procedure
  i2c: npcm: use a software flag to indicate a BER condition
  i2c: npcm: Modify timeout evaluation mechanism
  i2c: npcm: Modify the client address assignment
  i2c: npcm: use i2c frequency table

 drivers/i2c/busses/i2c-npcm7xx.c | 425 +++++++++++++++++++++++--------
 1 file changed, 323 insertions(+), 102 deletions(-)


base-commit: f56f4ba2fc1dbefd3242946f2fad35338a60e3bc
-- 
2.34.1


