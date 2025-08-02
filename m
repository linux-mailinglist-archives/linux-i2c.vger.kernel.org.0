Return-Path: <linux-i2c+bounces-12113-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C5902B18E01
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Aug 2025 12:42:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3AC061AA2221
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Aug 2025 10:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00D1F221FB6;
	Sat,  2 Aug 2025 10:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="0Amdm/9u"
X-Original-To: linux-i2c@vger.kernel.org
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071D221146C;
	Sat,  2 Aug 2025 10:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754131346; cv=none; b=Wg/g0Qwwnmaoa45Lf40TwG5EFwFEYdSqA9PygDzRYFBygdL7KbnoR7vqxBUAAWBDk6uDczBq8HQz6IRJm6kcuuwFl29AKo/Ca4TBfGnCTCW167m7J2+iYCbvwGzM7zpjIBgfePYRqiikHPmkKJkpqeApsLI5ZxMtwHBzPqjxe5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754131346; c=relaxed/simple;
	bh=D4SrjSCVF/QFFZGZ8db0byFl9K4OB6LkB7i7Fsk/Uh4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fsljsVqoQcZs4LO4/WhNt0moA1gkaQAtPljm26+qaYbjBQ8GqkhLUadBupCxxN0+zcYlVZ0rmd2db4YMt9g307Ama8hSgTxmEWiM5S+O8FBrTAa2H2eocgI1uQOvnYboF9p6ekbsK068PnW/JUzf5AUqMlmpE2ol3VUbamatCNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=0Amdm/9u; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Received: from sven-desktop.home.narfation.org (unknown [IPv6:2a00:1ca0:1d86:99fc::8c24])
	by dvalin.narfation.org (Postfix) with UTF8SMTPSA id 274C421798;
	Sat,  2 Aug 2025 10:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1754130743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vwQxvH0aQAdhk+KtdLO2G0fuUHwUbVgID2tMIZca1T4=;
	b=0Amdm/9uQ7aI+HwC1GivSNN/uk5VKv33DBM4CkJNC8ztNC2v41suTaeUH5C5b7R7RIOanJ
	wMrgq9KqDvtrNZ/ZuQD75EVlCRZSPsR7hJVk8p5jVV4iM27oXa+CrTZD2Y/t10zLCvYFdB
	efANxJ6BpeHUvwTRKaTq8LMCl4JB8Nw=
From: Sven Eckelmann <sven@narfation.org>
Date: Sat, 02 Aug 2025 12:32:02 +0200
Subject: [PATCH 3/4] i2c: rtl9300: Add missing count byte for SMBus Block
 Write
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250802-i2c-rtl9300-multi-byte-v1-3-5f687e0098e2@narfation.org>
References: <20250802-i2c-rtl9300-multi-byte-v1-0-5f687e0098e2@narfation.org>
In-Reply-To: <20250802-i2c-rtl9300-multi-byte-v1-0-5f687e0098e2@narfation.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jonas Jelonek <jelonek.jonas@gmail.com>, 
 Harshal Gohel <hg@simonwunderlich.de>, 
 Simon Wunderlich <sw@simonwunderlich.de>, 
 Sven Eckelmann <sven@narfation.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1548; i=sven@narfation.org;
 h=from:subject:message-id; bh=D4SrjSCVF/QFFZGZ8db0byFl9K4OB6LkB7i7Fsk/Uh4=;
 b=owGbwMvMwCXmy1+ufVnk62nG02pJDBm9L01e1j2XSuU/fs9NISvN8NYfbfNCR2/rtd8026NLu
 LWyfs3pKGVhEONikBVTZNlzJf/8Zva38p+nfTwKM4eVCWQIAxenAEwk8SPDP7OPL672f9xSeefo
 OWvlpOnBlz4nsGgdvl3j2q3zU+5q8neGf8qZwu9EG71k13Uu63sl0nfZxt1n18TWzmf2GW2qKkX
 tbAA=
X-Developer-Key: i=sven@narfation.org; a=openpgp;
 fpr=522D7163831C73A635D12FE5EC371482956781AF

The expected on-wire format of an SMBus Block Write is

  S Addr Wr [A] Comm [A] Count [A] Data [A] Data [A] ... [A] Data [A] P

Everything starting from the Count byte is provided by the I2C subsystem in
the array data->block. But the driver was skipping the Count byte
(data->block[0]) when sending it to the RTL93xx I2C controller.

Only the actual data could be seen on the wire:

  S Addr Wr [A] Comm [A] Data [A] Data [A] ... [A] Data [A] P

This wire format is not SMBus Block Write compatible but matches the format
of an I2C Block Write. Simply adding the count byte to the buffer for the
I2C controller enough to fix the transmission.

Cc: <stable@vger.kernel.org>
Fixes: c366be720235 ("i2c: Add driver for the RTL9300 I2C controller")
Signed-off-by: Sven Eckelmann <sven@narfation.org>
---
 drivers/i2c/busses/i2c-rtl9300.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-rtl9300.c b/drivers/i2c/busses/i2c-rtl9300.c
index a10e5e6e00075fabb8906d56f09f5b9141fbc06e..ed82e6c21aaf46000a263740123ffba833578cc2 100644
--- a/drivers/i2c/busses/i2c-rtl9300.c
+++ b/drivers/i2c/busses/i2c-rtl9300.c
@@ -288,7 +288,7 @@ static int rtl9300_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr, unsigned s
 		if (ret)
 			goto out_unlock;
 		if (read_write == I2C_SMBUS_WRITE) {
-			ret = rtl9300_i2c_write(i2c, &data->block[1], data->block[0]);
+			ret = rtl9300_i2c_write(i2c, &data->block[0], data->block[0] + 1);
 			if (ret)
 				goto out_unlock;
 		}

-- 
2.47.2


