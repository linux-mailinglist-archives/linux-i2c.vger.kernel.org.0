Return-Path: <linux-i2c+bounces-13226-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D2CBA5D13
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 11:52:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8AAE189EE0C
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 09:53:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BBA52D6E5A;
	Sat, 27 Sep 2025 09:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="bCGqsZlW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD334317D;
	Sat, 27 Sep 2025 09:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758966753; cv=none; b=S3fsNBzXpfO0e62H+2VvYsahBrW9HiRlecfz8RSPr5G03ZMpiJZ2/GGkxThtD7PEuTvbVRyKSV4vgS1m7dKdEsMUbI/2+Q+ncQRn2/FWltmNqN79DmsxzRYpqsIRLWxQfzihUqf6BSD/MseYw+TzXJgbFEfu4MYUg3wG3Qc12NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758966753; c=relaxed/simple;
	bh=P3RlToR2Jg/rNd/jIsGgASFvQPotFqFvtSO067CGp7A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bT6m7vUGy90ivbKw6pL+LKfdbFLxCZVpPLfCLdqItQVg2PU2YGwmc+VlwvO3mTrJ6jwSHLRGfCK+hCG/Z7qIUU+4XL+J0Y4v/QNpvdtlM/JLk7+2WQA3ER8CgrQOubEWJ0f4eCDdy8heeDCJ0WiHIfKyfuhlL9QCi4wndAljabM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=bCGqsZlW; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Received: by dvalin.narfation.org (Postfix) id 07B0B2009B;
	Sat, 27 Sep 2025 09:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1758966741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jgmRc6RcwdBrE4RigkI44U/isMfTaiUIe6zdqae8QXE=;
	b=bCGqsZlWBiTQI6s34F8iGs+I8i23CZI00fBujQPRUvTihKyiFuUR6DDbxg/2vlu17AmDC/
	qXPlnxEBkCeHM9NyF2hpteYgnvkgsoaccXWST5Hy5UIxoIEwmJgGU9BJMOBqzsEsKxXLnA
	pvNhD00Ja9VW/FdzjbHbvSUUsw9nVts=
From: Sven Eckelmann <sven@narfation.org>
Subject: [i2c-host PATCH i2c-host-fixes v7 0/2] i2c: rtl9300: Implement I2C
 block read and write
Date: Sat, 27 Sep 2025 11:52:15 +0200
Message-Id: <20250927-i2c-rtl9300-multi-byte-v7-0-c0fd0e78b818@narfation.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM+z12gC/4XQzWrDMAwH8FcpPs9DVuKvnfYeZQd/yK2hS4bjh
 ZaSd5/by8JI2PEvpJ+E7myikmlib4c7KzTnKY9DC/rlwMLZDSfiObbMEFCCAeQZAy/1YjsA/vl
 9qZn7WyVO0TmRPBiNgbXhr0IpX5/w8aPlc57qWG7PPbN4VP8lZ8GBy6SMJgBrCN8HV5Kr7cLXs
 ZzYg51xTXW7FDbKeu21tInQqy2qW1P9LtU1ihAUaBIeTdii+jVld6m+UVGLGCV5JVBsUXJFCdi
 lZKNCtDE4iF7j5q/UL2VR7VKKC+4w6mhalwD5l1qW5QdbvJryNwIAAA==
X-Change-ID: 20250802-i2c-rtl9300-multi-byte-edaa1fb0872c
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jonas Jelonek <jelonek.jonas@gmail.com>, 
 Harshal Gohel <hg@simonwunderlich.de>, 
 Simon Wunderlich <sw@simonwunderlich.de>, 
 Sven Eckelmann <sven@narfation.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4504; i=sven@narfation.org;
 h=from:subject:message-id; bh=P3RlToR2Jg/rNd/jIsGgASFvQPotFqFvtSO067CGp7A=;
 b=owGbwMvMwCXmy1+ufVnk62nG02pJDBnXN19kcllven/LjuXPpv9QtGDdFOhc/u7b/ZYJ62zV4
 uQ5rVav6ihlYRDjYpAVU2TZcyX//Gb2t/Kfp308CjOHlQlkCAMXpwBMJPAFw/+AlG8fq25tNS6r
 O8XXLZ5Tos+b8cZhjypHWHvlisdf3kkyMnRkfdqeznPz06XlW6ZFKkrb/hTfZf3gbMIvNpXjcwT
 nKjEBAA==
X-Developer-Key: i=sven@narfation.org; a=openpgp;
 fpr=522D7163831C73A635D12FE5EC371482956781AF

This patch was already applied [1] but then removed. Instead, only the
chunk

  @@ -314,7 +343,7 @@ static u32 rtl9300_i2c_func(struct i2c_adapter *a)
   {
          return I2C_FUNC_SMBUS_QUICK | I2C_FUNC_SMBUS_BYTE |
                 I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA |
  -              I2C_FUNC_SMBUS_BLOCK_DATA;
  +              I2C_FUNC_SMBUS_BLOCK_DATA | I2C_FUNC_SMBUS_I2C_BLOCK;
   }

was added as part of a patch which has nothing to do with
I2C_FUNC_SMBUS_I2C_BLOCK [2] and was never submitted like this [3].

I am therefore resubmitting this patch again with a patch that is removing
the errornous I2C_FUNC_SMBUS_I2C_BLOCK from i2c-host-fixes.

Order:

* The first patch needs to be applied on top of i2c-host-fixes
* after i2c-host-fixes (with this patch) is included in the i2c-host branch:
  - the second patch from this series
  - The patches 4-12 from Jonas [4] need to be applied on top of it in the
    i2c-host branch:
    + https://lore.kernel.org/r/20250831100457.3114-5-jelonek.jonas@gmail.com
    + https://lore.kernel.org/r/20250831100457.3114-6-jelonek.jonas@gmail.com
    + https://lore.kernel.org/r/20250831100457.3114-7-jelonek.jonas@gmail.com
    + https://lore.kernel.org/r/20250831100457.3114-8-jelonek.jonas@gmail.com
    + https://lore.kernel.org/r/20250831100457.3114-9-jelonek.jonas@gmail.com
    + https://lore.kernel.org/r/20250831100457.3114-10-jelonek.jonas@gmail.com
    + https://lore.kernel.org/r/20250831100457.3114-11-jelonek.jonas@gmail.com
    + https://lore.kernel.org/r/20250831100457.3114-12-jelonek.jonas@gmail.com
    + https://lore.kernel.org/r/20250831100457.3114-13-jelonek.jonas@gmail.com

[1] https://lore.kernel.org/r/a422shurtl3xrvnh2ieynqq2kw5awqnmall2wjdpozx336m26i@54ekftmkwvrv
[2] https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git/commit/?h=i2c/i2c-host&id=ede965fd555ac2536cf651893a998dbfd8e57b86
[3] https://lore.kernel.org/r/20250831100457.3114-4-jelonek.jonas@gmail.com
[4] https://lore.kernel.org/r/20250831100457.3114-1-jelonek.jonas@gmail.com

Signed-off-by: Sven Eckelmann <sven@narfation.org>
---
Changes in v7:
- Split into two patches. One for i2c-host-fixes to remove the actually
  unsupported I2C_FUNC_SMBUS_I2C_BLOCK. The next one is for i2c-host and
  readds it with the correct code.
- Link to v6: https://lore.kernel.org/r/20250926-i2c-rtl9300-multi-byte-v6-1-a2d7d8926105@narfation.org

Changes in v6:
- drop all fixes patches (which were already applied)
- drop rtl9300_i2c_func chunk which was incorrectly added by another commit
  [2] (but was not intended to be in there by the original patch [3]
- Link to v5: https://lore.kernel.org/r/20250810-i2c-rtl9300-multi-byte-v5-0-cd9dca0db722@narfation.org

Changes in v5:
- Simplify function/capability registration by using
  I2C_FUNC_SMBUS_I2C_BLOCK, thanks Jonas Jelonek
- Link to v4: https://lore.kernel.org/r/20250809-i2c-rtl9300-multi-byte-v4-0-d71dd5eb6121@narfation.org

Changes in v4:
- Provide only "write" examples for "i2c: rtl9300: Fix multi-byte I2C write"
- drop the second initialization of vals in rtl9300_i2c_write() directly in
  the "Fix multi-byte I2C write" fix
- indicate in target branch for each patch in PATCH prefix
- minor commit message cleanups
- Link to v3: https://lore.kernel.org/r/20250804-i2c-rtl9300-multi-byte-v3-0-e20607e1b28c@narfation.org

Changes in v3:
- integrated patch
  https://lore.kernel.org/r/20250615235248.529019-1-alexguo1023@gmail.com
  to avoid conflicts in the I2C_SMBUS_BLOCK_DATA code
- added Fixes and stable@vger.kernel.org to Alex Guo's patch
- added Chris Packham's Reviewed-by/Acked-by
- Link to v2: https://lore.kernel.org/r/20250803-i2c-rtl9300-multi-byte-v2-0-9b7b759fe2b6@narfation.org

Changes in v2:
- add the missing transfer width and read length increase for the SMBus
  Write/Read
- Link to v1: https://lore.kernel.org/r/20250802-i2c-rtl9300-multi-byte-v1-0-5f687e0098e2@narfation.org

---
Harshal Gohel (1):
      [i2c-host] i2c: rtl9300: Implement I2C block read and write

Sven Eckelmann (1):
      [i2c-host-fixes] i2c: rtl9300: Drop unsupported I2C_FUNC_SMBUS_BLOCK_DATA

 drivers/i2c/busses/i2c-rtl9300.c | 35 ++++++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)
---
base-commit: 217f92d91c9faeb6b78bd6205b3585944cbcb433
change-id: 20250802-i2c-rtl9300-multi-byte-edaa1fb0872c

Best regards,
-- 
Sven Eckelmann <sven@narfation.org>


