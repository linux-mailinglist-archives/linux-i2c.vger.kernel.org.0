Return-Path: <linux-i2c+bounces-6686-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF57977D06
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 12:14:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 249221C21B3E
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 10:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C18DD1D6C7F;
	Fri, 13 Sep 2024 10:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bYM6W6mq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053AF1D7E42;
	Fri, 13 Sep 2024 10:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726222493; cv=none; b=TCoX0HYwRR8wAZlL6bs4QVCjgTkWV3UDONeIbvUUOBhICK4y5c1gsRnj3Ebw4HivhPPUwjukU2RcXT9NWU1NMyHYjDMSIXfGhwtYM06tSfy5LAqkT4Gp0sb8mDE7Pi9fltdXrdzzaa8nQfdt6Peje6BK/I6bZkGzZO3BVi/K79Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726222493; c=relaxed/simple;
	bh=CRudJVWUDQLzsnW4V+Kg/z8JiBN3j0Vm0hrJgzryFy0=;
	h=From:To:Cc:Subject:Date:Message-Id; b=lJGepgStOP17R8NMfEz1RwCUETWVeAUSFLkq2XG1HDF7jNPkID9AbKs9NcHTZhyK9zRdJ+SEQf04oKBGYWG/YqKIMyD94BC2IjAEDmTvj2lY3nVV74E6q6u7nQRLZ+AKxSqKS+Q6deHMxFvAI5cC8qsRWUAjWnmQCCDwMPKau10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bYM6W6mq; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-206bd1c6ccdso6412345ad.3;
        Fri, 13 Sep 2024 03:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726222491; x=1726827291; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fG6tr1CEMYW+hGol0y7P6nh0VSGKd7m23E/GKIsNqpE=;
        b=bYM6W6mq+kdMI26Nx/MpkM7u4006tsiC0ZMZqqQEfr+XDjbCYM1J9rr1JvtUQCKR05
         MRDVo821T8Kdhg5zmCjyv7ndIENXp9pVtRK16sVkv0k8M9fpOIV7euI+spEIrPmZD07E
         V8mVVM+dPdE8ih7FMqdpkSzU0TRpRHVTbpZNH4qe505bgEzkIlT6TZIc+/Fyra95XIj3
         W/Etd6wsVCRpHhKXe84Al94uE5PJR2GxNA9jMpgoty+464rCZfN6PSD48pSkTV+enpNe
         ZJc7E9lXPDOmHbLlfyMSPigwhw/TgxYuABXIpoGqm88Ts49ROQmD3nOITRWjqyOUo0CC
         AvnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726222491; x=1726827291;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fG6tr1CEMYW+hGol0y7P6nh0VSGKd7m23E/GKIsNqpE=;
        b=J7B6YSbqfcNH5TIcjMYfRNwukYYPWsJhS3N6v7ST/OJerruXKdrJUfkbH00aQd6y8k
         Jre68LR2so2VXt3ysJOS1lVLauQB4G/vqal25sIXygMmxbNyGaVJ/TVCMYix5g8vQfdP
         KXcjKkXu2D0kSRz8Y37nYMRxUc3JU05ArleLbuMXoENoYuuGcIsLa7AZl5Iy9igvW9Ik
         ssmmL+AfQTZRduQLLveiaFJItdOJJkqROXq7zZPn2oBYOMyp2ZCRN+WRs8a0heKl0mU6
         pmq9OYzsATbM9IaUWm43GAG4UxtnSOu00PZiztcIC9vocYSz46yMMkD065P1xcKVAZpi
         iEJg==
X-Forwarded-Encrypted: i=1; AJvYcCWLNRBrNl5nCm2V/w46rHBnf2MUMs9amZl6/UF/9Hawp6h47P82FUnF0fZATpe2T155JzXHNQDwGpU=@vger.kernel.org, AJvYcCXhNIT5rEYh0eEVm7RdesTbs4mxmKFGpS93nX3fBXIDdXBRUVv3HK4sJdAt9lc+IoHN3IiY2vSLFJIp4BH8@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjurh1vaG8yQJfycb96javOWDzW+UNfgjTYcqZW5XPri/iCcgR
	5J9f+KXmEec6TlP2f2V2sji23fgjVb5Ut5sDoQyj1/8qFtQt6Ms5rfNm4nk=
X-Google-Smtp-Source: AGHT+IGe7fD6EqPAmOXxGUzdjT+wv0BtZDhatz1LkOcMyllPOxfMDoG9hDmkUDaXk7n+6F8ZAqv4cQ==
X-Received: by 2002:a17:902:e88a:b0:206:ba7c:9f2e with SMTP id d9443c01a7336-207822414b5mr31809455ad.25.1726222491019;
        Fri, 13 Sep 2024 03:14:51 -0700 (PDT)
Received: from localhost (2001-b400-e334-c33a-b4cd-4a8f-209a-cf54.emome-ip6.hinet.net. [2001:b400:e334:c33a:b4cd:4a8f:209a:cf54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076af250f2sm25787545ad.61.2024.09.13.03.14.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Sep 2024 03:14:50 -0700 (PDT)
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
Subject: [PATCH v3 0/6] i2c: npcm: Bug fixes read/write operation, checkpatch
Date: Fri, 13 Sep 2024 18:14:40 +0800
Message-Id: <20240913101445.16513-1-kfting@nuvoton.com>
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
- Andi Shyti : https://lore.kernel.org/lkml/
  cfdfldh5tuhb4r5pdpgolcr2roeewsobedet2uvmpbnqlw5yh4@c4a2szsbs2r2/
- Andi Shyti : https://lore.kernel.org/lkml/
  stnyjmnqdobzq2f2ntq32tu4kq6ohsxyevjn5rgz3uu2qncuzl@nt4ifscgokgj/
- Andy Shevchenko : https://lore.kernel.org/lkml/ZtWnd8bmiu-M4fQg
  @smile.fi.intel.com/
- Andy Shevchenko : https://lore.kernel.org/lkml/Zt7Nn9uJSeHFUZZF
  @smile.fi.intel.com/
- Andi Shyti : https://lore.kernel.org/lkml/
  2kqhf2ad3omx3dsjucrqhtnonnox7ghtp7vkogrwrdfh3dgg2o@4cpa4gfg6c3f/

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

 drivers/i2c/busses/i2c-npcm7xx.c | 281 ++++++++++++++++++++-----------
 1 file changed, 179 insertions(+), 102 deletions(-)


base-commit: 48b83f5f68edb4d19771d5ecc54bbbc37166f753
-- 
2.34.1


