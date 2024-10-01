Return-Path: <linux-i2c+bounces-7115-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4446498B451
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 08:29:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4878284262
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 06:29:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F4AA1BC9E9;
	Tue,  1 Oct 2024 06:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dK6U5efF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D36F1BCA00;
	Tue,  1 Oct 2024 06:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727764155; cv=none; b=N+E1VnCGO57FCVkZBTj8R6+2YzCfCVcus+ZTbQ78hDZ2b1VXiFuDzCparrXv7FDSr1RqICbr2nFRdpESBTTNfMTAsu97d76ydlgGjgjQf8pGQpv4EnvdxM6x/3L2DZHGqt+1FyZURFCBhAMa/hKd2XA9yH3SkTDF8cpAD+OcMzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727764155; c=relaxed/simple;
	bh=uW65bDyiqPjJj/ZXtceDGpnWFbS+6cuzGmi7008JRck=;
	h=From:To:Cc:Subject:Date:Message-Id; b=Xw3YPMLlQcFH6yNp29G2R52yMnHBLByClmX+8H+mWweHLOzDIK13j0RX+wMzWsCI8MKrTmK6UqgZ3Pwc7Qv7zZtu+79+ccl2r3ujR3L/YPz6pMDYAe0EIhVjyeKjTp4GFbpWhP7dYfdZjiHSYmlSiGUaqb29/GOOBq/Rs2u1xFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dK6U5efF; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2e0b0142bbfso3216435a91.1;
        Mon, 30 Sep 2024 23:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727764153; x=1728368953; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oYuuvZ+ipGa30qTfy2WMGB6rrbu+NUHXUKcEf89oisQ=;
        b=dK6U5efFAiK5E5KpHa2GXoVqU4wrCpwduUushuRk+Wk/NtZkDR1Z9SV+AlqLt9Gh4F
         y45EEVYtDjvchQvv28Fn7bbxQmUVwEdwQbOOk2dusoB+sl+QMYfFUVurMdNOzuE63b3G
         feEXQWuRb3FK/7Eo+T5MjDNAnDZ4WKnqu6/gjGvfEivzN9re80WIwtS4qpA6T9K8cXGP
         HUSYE3kWJz7bTRU+Y6y9ZqzxCRmBR8ONpXh/ReYnaRauthQwvKTEcaqbhAu18ENYVi6E
         UhwdHvRjNWeL+DwoZ120bkae6rZ16sgNLVRcA+x7sUPgB85OT6WK/ZK/2b8e9jBTw3tv
         +M6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727764153; x=1728368953;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oYuuvZ+ipGa30qTfy2WMGB6rrbu+NUHXUKcEf89oisQ=;
        b=KJS6KD7W94ePXjDBGT5X4Lv0WmaWFRnDZjg07ab1VijBv183gDSTAg5Al5wlVC3ySA
         NH9+x04JcPtfKIE77nxpyi8kko7aI4l2ySQrlKAsE1tlsq+NZByCnEq+p6XX/aTDzQlW
         C4yKw92GoXzRhBRAM727/G2/sJqkXqOXGf/JaRMdChQ7WqqVGTeSW034PdHtkmFGlrzu
         aZWVxBONdSr8CMkZNo/KNoToa7YDaKSbQe6p2vr/+pQI0wrlXKWcEtNdmcKmA4ASQBR4
         lQZMivmENaZKdQedbkDV/ysdcWrNiG+qsdnZ1eLOMeexEshO3X0yQpeWCh7h/G7VDv0+
         LG9A==
X-Forwarded-Encrypted: i=1; AJvYcCUwcLUyVcYtCMX0RvXR1bLMA7L3UB9TnTRyzu8CMNlaQr0gwpgEuUmXDXVvIkLB1FBwFRVqwTYUE0w=@vger.kernel.org, AJvYcCVv+VScehD/5IIAjkp5QImNR/4NCqYTDoW/og1afIOEjrpiVOoMpQlvOPX7J+LBzq0ANbd3qGCHlhHyXoSA@vger.kernel.org
X-Gm-Message-State: AOJu0YzAdgtggHuJwrzsfu8Fl08XmoTh+9BSa22i35SFc0We5Nh0s+ns
	kv0OIxiizqVwSAtKmpFZlsE6/5NbFUCyy6XNW/4u31ym4EmawoRk/KsTt+A=
X-Google-Smtp-Source: AGHT+IEOZHtfxpvKHDCmKrIxF+xoxOJJyAbKzGs+AqYFUj0RoA43o5UzzvbHQEaj8y7GN+3zIFmhFA==
X-Received: by 2002:a17:90a:fd8c:b0:2c9:36bf:ba6f with SMTP id 98e67ed59e1d1-2e15a1b6980mr3138039a91.3.1727764153255;
        Mon, 30 Sep 2024 23:29:13 -0700 (PDT)
Received: from localhost (2001-b400-e30e-7f15-c94a-d42b-025a-8ff3.emome-ip6.hinet.net. [2001:b400:e30e:7f15:c94a:d42b:25a:8ff3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e0b6c4c1e3sm9217053a91.10.2024.09.30.23.29.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Sep 2024 23:29:12 -0700 (PDT)
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
Subject: [PATCH v5 0/6] i2c: npcm: read/write operation, checkpatch
Date: Tue,  1 Oct 2024 14:28:49 +0800
Message-Id: <20241001062855.6928-1-kfting@nuvoton.com>
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
- Andi Shyti : https://lore.kernel.org/lkml/5mxsciw6443k5rlpymrs7addvme
  53f5v3zuj5u7tvlggfeirik@dy2bvyz2lyue/
- Andi Shyti : https://lore.kernel.org/lkml/z4g5alkk3cug7v5bsmrmzspgvo4
  hhu2ebtykht72ewwhsqxqgq@kg2tlpvz3ctp/
- Andy Shevchenko : https://lore.kernel.org/lkml/Zu2HmkagbpMf_CNE@smile
  .fi.intel.com/

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

Tyrone Ting (5):
  i2c: npcm: correct the read/write operation procedure
  i2c: npcm: use a software flag to indicate a BER condition
  i2c: npcm: Modify timeout evaluation mechanism
  i2c: npcm: Modify the client address assignment
  i2c: npcm: use i2c frequency table

 drivers/i2c/busses/i2c-npcm7xx.c | 440 ++++++++++++++++++++++++-------
 1 file changed, 338 insertions(+), 102 deletions(-)


base-commit: f56f4ba2fc1dbefd3242946f2fad35338a60e3bc
-- 
2.34.1


