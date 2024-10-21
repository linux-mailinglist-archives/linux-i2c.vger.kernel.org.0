Return-Path: <linux-i2c+bounces-7484-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FF99A5A4B
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Oct 2024 08:27:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E43941C20F40
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Oct 2024 06:27:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1DA21CF291;
	Mon, 21 Oct 2024 06:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XyflKhhh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBE419415E;
	Mon, 21 Oct 2024 06:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729492060; cv=none; b=eK9DSWWnYbdchFnK77L9kyWaNlnyW4GUipVjwgmXMiqeXqXP4drcIhhIvutBdvd7rfybo63cilI49T4tpucbEqVcWRFcNtSaFxFejyt5mHYyqvFBEqP7MMLFfhn4r1+YX3KFKP3YAeiynVhpL7faI6oMNqi8be82CZDulvErIKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729492060; c=relaxed/simple;
	bh=I4Z2GVo7dzKhtMIspZuk0y8cpnMFZZ0OvJLpnwrppFY=;
	h=From:To:Cc:Subject:Date:Message-Id; b=WfFD8LdoilECUGkb37Z9crxdklWK1xtSgrIZwyeXgsLcfq5t84T/k5vpA2m97aDyXQcK92XfXw82gEts3b7AtLjeXHDPMdae+hevkZlio4dz7g4F0n2Uro1FDJgP4ISLyKzDDRDZxeN2A6TZY+Omvie5ByHWlZNhVCLMNmtQf64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XyflKhhh; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20c805a0753so34258525ad.0;
        Sun, 20 Oct 2024 23:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729492058; x=1730096858; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s56c+/LO6NBVWgMpiwpkhSioI6B4YvZqh4mtUGgHfdc=;
        b=XyflKhhhIOkyC5VpaQWK7xvTld5Vtcfwj8anHjOqk0HQUO0qLhpZCuJ2cVcM/6xbU2
         1IuA/zC3xwY/+KRBQQtXnUhz2OnTxQ61MOWPQNz7NLnaXpFXCIJvIzcGFdhOWQPLH/oj
         tb8nuSbcNbWVOZmXktkuhNZLifUghPhoZOu8w5P34ik/rlAl3qr94zzsTGDFujL0spYQ
         29QrT/SiF/XcrPkergxyvUMa2w/+UvilCw47Cad6pvz27DK/udw5r9LpJ2in1WerJVj7
         gEgwn8jxVbY9/JrmOKR38w8W8mZ5CpxLsMnwM0QwH/7w5C8L1a4ob1LOTr94mvTeKhml
         ip1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729492058; x=1730096858;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s56c+/LO6NBVWgMpiwpkhSioI6B4YvZqh4mtUGgHfdc=;
        b=n41oBhjjxFUdyHU7M7PDdp+wmBwMdxDe3z9tqhQ7c6M+KZks0Wh8UirEpSPcs0DyiV
         QMm8y5uci9TBIgkKExsURDQUMgi2whDUsWzWzDiO06lfCLqQF43feTpiaoAbj2CDyun6
         jami7grHdjKHNVN4C/sF+uKgcE51BNO7keWxdXiTqtJGPS8Qp0wfdkWtQAcpZLe6zAAO
         vb/W5PjqrNQP/NvBoEcZ7QnQCFVLIjCxn5lV6I/r1oyYgdiru3Sd0BsnIgt3cCSiPek7
         LFbNpJGPp44ZKRXfytCooVj1mYUFp6dLKEZhS6MnVIWwHsggEyxktPWOdEroM0UeZ1LB
         XIvw==
X-Forwarded-Encrypted: i=1; AJvYcCU+C/EYCkItKyQOPgibj0JPDpUQH5r+Mw5Zl+WtlheyFAha4nD1TuA6XaitV1wgZ/h8TR3zEZjKli4=@vger.kernel.org, AJvYcCUqB6z6ELAYGovDlxt3hhpLUS/gl//QLKeujQKcNMTNC0jRH8313I4UDrPLpti95NOfEUl5v9X5yiCMojMh@vger.kernel.org
X-Gm-Message-State: AOJu0YwFKZu+ApEvzUnk845e1PTa1tOSyl/TfPDgWTQ5igMzGhEWh+u/
	116o4AJjjAfoKpe+56oeak4DPYUkYGSy3mi9BxEIqy2vTFA9W4ebbYRcYSU=
X-Google-Smtp-Source: AGHT+IGG/B7+Tn5iB7renUdnGDg7/rv1JOu3+Pd4cAaEkQR1SOfQ7EInkZJFb3oU73e0M7B7NsaYmQ==
X-Received: by 2002:a05:6a21:6b0b:b0:1d9:ae4:91ef with SMTP id adf61e73a8af0-1d92c5087b3mr14838800637.22.1729492057856;
        Sun, 20 Oct 2024 23:27:37 -0700 (PDT)
Received: from localhost (2001-b400-e38e-c9a7-dd38-775c-4093-c057.emome-ip6.hinet.net. [2001:b400:e38e:c9a7:dd38:775c:4093:c057])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad3677b2sm2700255a91.20.2024.10.20.23.27.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 20 Oct 2024 23:27:37 -0700 (PDT)
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
Subject: [PATCH v7 0/4] i2c: npcm: read/write operation, checkpatch
Date: Mon, 21 Oct 2024 14:27:28 +0800
Message-Id: <20241021062732.5592-1-kfting@nuvoton.com>
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
- Andy Shevchenko : https://lore.kernel.org/lkml/ZwkFWVC3_5xr6OQW
  @smile.fi.intel.com/
- Andy Shevchenko : https://lore.kernel.org/lkml/ZwkFwABviY8ClyUo
  @smile.fi.intel.com/

Changes since version 6:
- Modify code comments.
- Remove redundant code check.
- Remove i2c address mask.

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

 drivers/i2c/busses/i2c-npcm7xx.c | 424 ++++++++++++++++++++++++-------
 1 file changed, 328 insertions(+), 96 deletions(-)


base-commit: 663bff1ddfe4ecbba3bcf4a74646bb388b1ad5b2
-- 
2.34.1


