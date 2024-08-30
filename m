Return-Path: <linux-i2c+bounces-5938-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB6C9655E2
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2024 05:48:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A04881F22D29
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2024 03:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2E20136E3F;
	Fri, 30 Aug 2024 03:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lGjHJHZh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1823C53389;
	Fri, 30 Aug 2024 03:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724989726; cv=none; b=UnAkgZt+6hOQNG8940MZ+ln7bu6gDdWQJXTfyt1E15w98OqMGl9oP7BIR4oqFl3YC24IUT+TjL/uX0byfTOif8WRDpx6FiBX+wi+8sgtvZb+X9zAqFxotuqJNjG5qMt7VUz/gQBtGffP1WZPM82WCRvOlkUNAMjR6FSPaMa0wLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724989726; c=relaxed/simple;
	bh=I5wE2DCU3Fw9EyO+Kp45gHJsKgpYXZwW6ryuWdo18CM=;
	h=From:To:Cc:Subject:Date:Message-Id; b=U5p5ulIPBOHdDIxmd1oPzHamuq77MjWNqH51wpWb8xMSIi7KNqiO3denQDmSwJkM49RrwtFOO+rY81IDPrYUVHmhs8yU0ZDA1URJZLhqR1DvncYV60pEriF+ryf7C0tN0+3vuHzWmhVxQHPs09iEeNL1m0Nrmu9g/secDhvzqBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lGjHJHZh; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-715e3e03831so1302732b3a.2;
        Thu, 29 Aug 2024 20:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724989724; x=1725594524; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qbsfqCs5csSDvxpE96NTbhH7GVwWt1XCT6ArdWTDKno=;
        b=lGjHJHZh+0jj60PgvYeJBXGXsNR91wAkzdQ543ATj+UHX3eIAgBEpLz3kFLJCHsS1e
         7Z7He7i5WIr/33p53adoqa1AimecqVgqd8x7XeABAxtPCwa1Ea7KyVoc5Gzi5xVu4r0+
         yojmYukmB1aLvd+TwpPJrTo3nyhqdA5qDS28T/gzSNRFzyN3bexAGljS+KoxIh8mGzs7
         NakHIT86mdgnjX12pHGKh1fSofx9fR6Q6VRPI1vTET2wZl1aq7MPAzA7NQFTNvt3EYd+
         m2VhMYuBYUwsq5hgLVRyCqnmJdgzlU5zZUB4qxGZ4nqYNlKP5Osg1JtxJfwwQndP9Fdv
         zk4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724989724; x=1725594524;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qbsfqCs5csSDvxpE96NTbhH7GVwWt1XCT6ArdWTDKno=;
        b=OpX78lOW6gQMwd7zZx1hiu04cPRQPjnjVKnxS0mSAaMHKmMzSpvooxG7w0wv9dz5FF
         Wx4iU8Y0u1aZfzJJFZdhguaQgseX7F0DuPPbqxz3VUDR1SWGdpK/YxGeBKfoGJ9BWxw3
         3hogkr9nWPXX5Y524kheK0khWFiR+swZuQ1MCuw4FN6/izJMokTUcx/1CaTThH8eVwdg
         MbuNFf4Gp0xygQkU8D01nBFnqFaIrNlDUdeVCDYDr55kEod115/6gGcGXlMhXYFB5Gpt
         EoBCidavkUlad52AEJXkd0pmjj3KRD5fOV4IltJADzbIu5uVeNESKAuSKgiAXEZzm7CD
         Z9/A==
X-Forwarded-Encrypted: i=1; AJvYcCU6ttp9ztpRJu+6wk7Gxn1351wWhbjSencsET3baGiJWHAc/dvUQO9dS2G5wyyGM1B97EVMpaCWX0o=@vger.kernel.org, AJvYcCXm3vZhAUCg525sv6TsRzg198elLxzGIiPbeY3ol6NcsQ9g0atN+QAt9TiImMaB2MjX+gZklwdH6fCEXe9A@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5mm0DZlKbq8Zwn0gkCptuDZfVNqMYGWB8pIjxitJi/gr247CV
	OinmTojTsebHG76zaavAAA3K+74LsvHy7X9Cg3BH/djCl7alFa4=
X-Google-Smtp-Source: AGHT+IG3pIEbVlY0gXmkEN2xlmwfRwBfNFoebUp1tCda4OOj4xC208HlKYVhFM2v0yuqkG1ZSsDaQQ==
X-Received: by 2002:a05:6a20:9e49:b0:1ca:edd5:9254 with SMTP id adf61e73a8af0-1cce100b937mr4232979637.16.1724989723905;
        Thu, 29 Aug 2024 20:48:43 -0700 (PDT)
Received: from localhost (2001-b400-e338-dab5-746d-1a82-f21e-bb0a.emome-ip6.hinet.net. [2001:b400:e338:dab5:746d:1a82:f21e:bb0a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-205152cd8d6sm18391205ad.71.2024.08.29.20.48.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Aug 2024 20:48:43 -0700 (PDT)
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
Subject: [PATCH v2 0/7] i2c: npcm: Bug fixes read/write operation, checkpatch
Date: Fri, 30 Aug 2024 11:46:33 +0800
Message-Id: <20240830034640.7049-1-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

This patchset includes the following fixes:

- Restore the npcm_i2caddr array length to fix the smatch warning.
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
- kernel test robot : https://lore.kernel.org/oe-kbuild-all/
  202408080319.de2B6PgU-lkp@intel.com/
- Dan Carpenter : https://lore.kernel.org/all/202408130818
  .FgDP5uNm-lkp@intel.com/
- Andrew Jeffery : https://lore.kernel.org/lkml/
  20240807100244.16872-7-kfting@nuvoton.com/T/
  #m3ed3351bf59675bfe0de89c75aae1fb26cad5567

Changes since version 1:
- Restore the npcm_i2caddr array length to fix the smatch warning.
- Remove unused variables.
- Handle the condition where scl_table_cnt reaches to the maximum value.
- Fix the checkpatch warning.

Charles Boyer (1):
  i2c: npcm: Enable slave in eob interrupt

Tyrone Ting (6):
  i2c: npcm: restore slave addresses array length
  i2c: npcm: correct the read/write operation procedure
  i2c: npcm: use a software flag to indicate a BER condition
  i2c: npcm: Modify timeout evaluation mechanism
  i2c: npcm: Modify the client address assignment
  i2c: npcm: use i2c frequency table

 drivers/i2c/busses/i2c-npcm7xx.c | 276 +++++++++++++++++++------------
 1 file changed, 172 insertions(+), 104 deletions(-)


base-commit: 5be63fc19fcaa4c236b307420483578a56986a37
-- 
2.34.1


