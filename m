Return-Path: <linux-i2c+bounces-8624-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0529F77FD
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2024 10:09:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C2D918963AD
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2024 09:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AF2A21CA15;
	Thu, 19 Dec 2024 09:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ms4xCnpc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BAF71FC0FF;
	Thu, 19 Dec 2024 09:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734599347; cv=none; b=e82IDMEX3NmdsyCgh6V8MS0qKgtXkjlpu+jyED/tSN2B1bQudhy3qLclT+jdy+M4YooVd4fvhFAiG9ebTCjvhyyy4FJPAkvx2FKZh8Ont3Jy9kLgG9Pbs5S7BQ035U7VVvAzMbzpdRzktDI8+18csWC1K+vpfKLRSvEtUvIjpMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734599347; c=relaxed/simple;
	bh=mwN2+FCT1DXTnZqG6sYXaEm2dQE+NH2+5UzAvVbn928=;
	h=From:To:Cc:Subject:Date:Message-Id; b=TmfO0OfNeb4BLjcBcZp8UVSmMKw/F8CdZMh5jXJk0jsKQ9h8O/3XeQWgeHpAQd9R8d65havBYb8uznGGSY9/zXXiMoxTwX7xd7GpyWdShLfQrs7NLduRILoiJ8LQyUv3LQIgUNj6sWLdYBEJLz3Npo+JuC4cd19pnw7d4H779UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ms4xCnpc; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-218c8aca5f1so6350935ad.0;
        Thu, 19 Dec 2024 01:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734599345; x=1735204145; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5FZVo9yrFWm1ZHZhqCeWDgA1Bi74R8VjGoD/NF/vjQA=;
        b=Ms4xCnpcFbiyhFrj/8CLyLYd8vAwzWF79EUeZYNPcZ1MsKsJPICxmT4hBwgSwBrDyO
         x3eKIg1eIWo2fLrNabY++O7oSimJb/7VAtGrHhZDVZ3XDFMyo309QU17QIhz/z6ab6L+
         mb2b+JTDA30eXdu6tkPQEbfdhGh8E8yq1DpU8ValwBSwnAOjR93auYrvNqUKFB6fX2SV
         n1TpT5lrXb/YMmyhEnSNEbzXxt1rV259Xe01Kk5+d/ZzEdaQIKKsWIj/hBpayVMZxA8s
         8gxM/and63gtZsHecKXzPpX9HATyTPwNePlLF5OLG9U2Nb5mmDyvxug2+xoL+IT4IfTz
         JXug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734599345; x=1735204145;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5FZVo9yrFWm1ZHZhqCeWDgA1Bi74R8VjGoD/NF/vjQA=;
        b=HnE6pGBaC4PNmcryBIEaXz7VzqCahZ61FRux8W3f3+eTNG3N5qRoTTYMRJ4rBxHKqU
         cV3oLLH8gIifwYU8waP3ctjr1jDvSTTitgDXVU1AcA+IKNyC1wagpIEAyGtVxre5BuZp
         rN/HtTjcfph3CjlOyFu6zOctxuklitzxXfV+lZOGOYSDo+Kshiwp3J/Hc4qtkxhXscYK
         +r3DXY9eYVRuEoaFYoZaa96/iZusvn3t1smxcYEACoVk7FPYGlnNJj29oXgecuUCuZbO
         A4G8d5UNX/GWv4zH+GTgHRJaRWjwTPZPxKV7AXab8cLsbqsXaH0ziIycNB1TIDKfYjZI
         HW9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWGl1uYrMqe3Cnv479M5W4w+7S5edZ5OA4nsPxhStCc1DX4dHWsz6MiYNnRjbLmmU9OV83qlF09knsDZYVX@vger.kernel.org, AJvYcCXXnKXIhQ5SLgYMcgyGxiQmBsA+HN5hJfyt/nTZf/SHzLrxPEki0rUlF6R+2zi13yx9V3iwmCkrO1c=@vger.kernel.org
X-Gm-Message-State: AOJu0YypdGa9BOdd35FqHb8rVLDsgFZIZzJzqnSPH3xnI7oC172gXpGB
	Gt/tEjPzAmi9G62axZzj2gK8h1D1ydt2lUi3GWJvRWYx9aQKdB8=
X-Gm-Gg: ASbGnctHbbgSnGimmEMX9LIhnOxKx+dXmhQ7HFp0uOZPwv1owmYua0hvk3uJ8kBQdP2
	h9wHazJZIocdmbEGS2qHtETc6GoHgCXhTrd4o1iklnGCKwTMugXAvITGIF4uz1aak1RK6vWrNPq
	wGC1pQj5FutZQnqrhjvmZ5ynGnExFuzv5rC9JpHUiRhZEZlErBMm5L4a4yWIjs/4HQqNqBArJzW
	Am1GQByEpXjQ4+1XSCg5X5wsYGMuwdD1yN6u5Cs37KHTYGNAptxMgIYPHq1VwpvgUWdJGCxOLnv
	JkaSaLKBHoKieVT9n3mqt1GBO/O/6vetgCkZDdy4VPUc4dZ4
X-Google-Smtp-Source: AGHT+IFwp2rwAf8SnTYio5mfU04YzPMAsVdxRwNoOKeATSvCJKQkxU5bEZG4Wd4iiq4j22tQcxPeTQ==
X-Received: by 2002:a17:90b:53d0:b0:2ea:5054:6c49 with SMTP id 98e67ed59e1d1-2f2e8f5e4b6mr9740495a91.0.1734599344759;
        Thu, 19 Dec 2024 01:09:04 -0800 (PST)
Received: from localhost (2001-b400-e356-b45b-f574-35d0-91d3-527b.emome-ip6.hinet.net. [2001:b400:e356:b45b:f574:35d0:91d3:527b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ee06dcb0sm2787111a91.35.2024.12.19.01.09.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Dec 2024 01:09:04 -0800 (PST)
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
Subject: [PATCH v8 0/4] i2c: npcm: read/write operation, checkpatch
Date: Thu, 19 Dec 2024 17:08:55 +0800
Message-Id: <20241219090859.18722-1-kfting@nuvoton.com>
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
- Paul Menzel : https://lore.kernel.org/lkml/67d34216-e98b-43d9-afd1-
  2e73ffb71968@molgen.mpg.de/
- Andi Shyti : https://lore.kernel.org/lkml/cexpymszobfl7676acibp474e
  q3qx242ppo22wrbjepxhufkvt@w4ptnmfjx7yo/
- Tali Perry : https://lore.kernel.org/lkml/CAHb3i=uT+Zx8m4hAF1M2yjCn
  =a5sDBn2wJajWdCm79syuy97Ag@mail.gmail.com/

Changes since version 7:
- Modify the commit title for better description.
- Modify i2c address assignment.

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
  i2c: npcm: Assign client address earlier for `i2c_recover_bus()`
  i2c: npcm: use i2c frequency table

 drivers/i2c/busses/i2c-npcm7xx.c | 427 +++++++++++++++++++++++--------
 1 file changed, 326 insertions(+), 101 deletions(-)


base-commit: 663bff1ddfe4ecbba3bcf4a74646bb388b1ad5b2
-- 
2.34.1


