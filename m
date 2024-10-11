Return-Path: <linux-i2c+bounces-7328-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4A4999C46
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Oct 2024 07:52:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 84E4B1F24251
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Oct 2024 05:52:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC76F1F4730;
	Fri, 11 Oct 2024 05:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g/+WldH4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A09B1EABA2;
	Fri, 11 Oct 2024 05:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728625960; cv=none; b=hoa9/guMx3Mpu4wOXGMYO2ltoRwK38IqFHLkR/5e4sD31/gtuNMHRnqjCEFAlyiFh2nVaRXMlVFkG5QMlvj187ycD5ShfETVFYaesUFc+SvhZGlNBi1FRHoTJF1qIqmvFIdQBQLrQjwHaLGuHQZEiTHFmOxkKVqj5xzjj/AP5yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728625960; c=relaxed/simple;
	bh=k7a/6NlISzDAoMHxrctmx0ZsXphGvGGWBsS9qxb5j44=;
	h=From:To:Cc:Subject:Date:Message-Id; b=b0gRfuZkDB6Wh1KZqvjpZR3+OBBXpS1driEV8Nwcr7lp9OIc3bto4kVDxClxwAi6sphHAggfMF7+o9vmc+lRWhbYhrtMpkDTzetcknZwcrNuCdd1X/4MjVJi6BRrQmT0lL5Dy1Y5dFO45J25qkYLjDchALkoIh4YzHuiiL8vpO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g/+WldH4; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7db238d07b3so1543214a12.2;
        Thu, 10 Oct 2024 22:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728625958; x=1729230758; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gubUx7YA3XH8B/MVDP0X02w0r61djF5HDUMcLAKhgk8=;
        b=g/+WldH4hSndN5QVNlng0rD2iFpshYaBhoVXMHv90AqhRI+dR4kR56TRhw5QmMVlgu
         x2O0WsBPWanAJAg4Fawc5owLLHG+iYSao0yGTpYYK88gwvcD1DPuWbfoSt/zCWbio48m
         0AgUjRgW27joTfDRg4flHm2/wLh+92A7jpS6SbNAqZq2gJad1ZJG1F1cSePVVsyBrmgF
         IXhH4wGLD54u/ZHkMJGy7cEfwsE4O/anJej2U3sM6HkZL7TTIXVvJqN39V9HIFL65YKU
         uqMwNCN3GxSF/Tgck7RvzAVmayMfiIGMjOqO8RWXZeunDpITuBrTz2HKxI4UuEHAah0G
         jYtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728625958; x=1729230758;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gubUx7YA3XH8B/MVDP0X02w0r61djF5HDUMcLAKhgk8=;
        b=B1caTDYMt6veAjm7BZ5MAUVxUiQifc7zSSrwvSkqmkY3TfcDk6kqbM5Au+sgJi+P0p
         LIamH5gkdTn22qP6G3Yj16+FABKkJu/H6PEqn24otInvFhT7cbfSLwfssAhzWOqjmoH3
         jsefjLicvoetpE3sj1frTpjSZvTyPzDIJsfgbmzfjPuYL28FB2gtw5b8cVpxKSbdVA8G
         hss5ktciM9s/7Gj7bMZ9p5OmQYF+JsQxzIbvfjbfXOrewtJAIGuwt3MuOYH3fLUjNKM9
         wuDDqkZHRzT9eXRj8IV8+WdV6sSH1gZLZGzZWm9gh4Vz4xE4DMv5hWiLDksWKyZ+KM12
         GFtg==
X-Forwarded-Encrypted: i=1; AJvYcCU+ZJK39rdG8bkj26Zy6ZDXjLSCUOT/AeuiqtS7hj4jeSQ4ml4PAXPVJmrhAIm+5wzapjZgLPfeQ+Q=@vger.kernel.org, AJvYcCV+X6hqQS28YcNBZGrjW6SklhP9HLNeSjOhsxFzaY73fgxRS6J9J0/8+sRb+YbjFGBT/q561i9wQY1RjT/0@vger.kernel.org
X-Gm-Message-State: AOJu0YxomEuk3JvIdOQmFv7IQLjCyTylqsx2cUpWdTIJjCOF/u65Omf4
	sj0HCAZfAPHaPZOXoqwfGwvabKQEfz4/y/UmwQEkkzeUfNmJYQU=
X-Google-Smtp-Source: AGHT+IFuXKSQzE3D4FXgPcQs86Ev89IWF58UUbrUTDSMyHazV9CkFfv59ZyhCE0poiLdoE+ciM2C+Q==
X-Received: by 2002:a05:6a21:6e4a:b0:1d8:a9c0:8853 with SMTP id adf61e73a8af0-1d8bcf3bd6amr2724825637.23.1728625958472;
        Thu, 10 Oct 2024 22:52:38 -0700 (PDT)
Received: from localhost (2001-b400-e38a-6880-f424-8486-7476-9f9d.emome-ip6.hinet.net. [2001:b400:e38a:6880:f424:8486:7476:9f9d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ea44967269sm1915371a12.81.2024.10.10.22.52.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Oct 2024 22:52:37 -0700 (PDT)
From: Tyrone Ting <warp5tw@gmail.com>
X-Google-Original-From: Tyrone Ting <kfting@nuvoton.com>
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
Subject: [PATCH v6 0/4] i2c: npcm: read/write operation, checkpatch
Date: Fri, 11 Oct 2024 13:52:27 +0800
Message-Id: <20241011055231.9826-1-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

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
- Andy Shevchenko : https://lore.kernel.org/lkml/CACD3sJYhAYV3zBse5ntF
  sQmLV+TpLKtOiyyqgp3g8qeja54Ejw@mail.gmail.com/
- Andy Shevchenko : https://lore.kernel.org/lkml/ZwVcGu3YeJ6pI0sM
  @black.fi.intel.com/
- Andy Shevchenko : https://lore.kernel.org/lkml/Zvv3ws1_jUMVnAAJ
  @smile.fi.intel.com/

Changes since version 5:
- Correct "EAGAIN" to "-EAGAIN" in the commit message.
- Configure the bus->dest_addr by calling i2c_8bit_addr_from_msg()
  and remove the I2C_M_RD flag when calling i2c_recover_bus().
- Fix the commit message which meets a too small wrapping limit.

Changes since version 4:
- Add more description for the codes.
- Modify the term "function" to "function()" in the commit message
and code comments.

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

Tyrone Ting (3):
  i2c: npcm: Modify timeout evaluation mechanism
  i2c: npcm: Modify the client address assignment
  i2c: npcm: use i2c frequency table

 drivers/i2c/busses/i2c-npcm7xx.c | 428 ++++++++++++++++++++++++-------
 1 file changed, 332 insertions(+), 96 deletions(-)


base-commit: 663bff1ddfe4ecbba3bcf4a74646bb388b1ad5b2
-- 
2.34.1


