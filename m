Return-Path: <linux-i2c+bounces-12523-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C141AB3D1DE
	for <lists+linux-i2c@lfdr.de>; Sun, 31 Aug 2025 12:05:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F64F17CC55
	for <lists+linux-i2c@lfdr.de>; Sun, 31 Aug 2025 10:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68738256C84;
	Sun, 31 Aug 2025 10:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HFbFYvEb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCE625333F;
	Sun, 31 Aug 2025 10:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756634725; cv=none; b=KJWN1iGS84jrHgfr0msZ1mFj1uHITa7C67aIoKjrt0KgRu0pDoHy6GOyt42IlADdSWcP1Yp4UOUc82BAAc75BLEWHTxhINIw6VZCvZlOA3wL/jlF/pzGbvUVpys61eQOEl29iAk8BgNAKPS616EeSVvz2wS7SAeHmuSYtF38K/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756634725; c=relaxed/simple;
	bh=c0/Sv0HbkGOwQACB9q6lcyzn2W0r+1nlzG1a9H7dUlo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AgFWfg8R7Bp7IVz1CqwSdudsKmmrMbBb6luW+OSk/b7qceSq8kw1TTvJJ0IkVp6McP6Gd5oqzhLAqZursypYwH6aP4LD1YqWkxEukyEcGw8vsETmJuIVjGKEn6MGeTNTTWnHpmXtAO6i3B/q94DusqWdrCPlZw1vNsJtUmdd3EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HFbFYvEb; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45b89147cfbso4263245e9.3;
        Sun, 31 Aug 2025 03:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756634722; x=1757239522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I83+DpOGB8BLeWuxSsvCnBXK47razkPCuWBaTDf4aQE=;
        b=HFbFYvEbSGNO1cZHfBTUOwU67fAsnn6cbYNvIMq87JISuB4zhRdTJsIQbFk/Xw8AlP
         aPw5CCF4fCX8hiaJcEB+HGc8eO4FV/hbJRs3QvUL+Ce1VhnsXkaYKweG0YAAcJD0dtTG
         Lzb/7CirnU/SckU98Hj1/sWiqaZuZURt+gX6OY50rkY2rqvO9Opm1yAWlVWmtnHgETLu
         cQdLR4230cLJLdXoTDBeSFwdFZhEBkIOvioKhRUovtTD7VX0fsg9/plJZpjDLZkmxsu+
         ynujdnxyMD1Ii8Jje4JknQgoNpANnZgKfCZVErFrYt+jh02+v1pvnfB/CrNvTbqqwHNC
         sMEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756634722; x=1757239522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I83+DpOGB8BLeWuxSsvCnBXK47razkPCuWBaTDf4aQE=;
        b=VCtzbOvBJqg69MNt33y5uliIYg5OrS6Z1wZTVA1YxwE5wwvJBH+EBPBOCE998TUPwZ
         kyI39fAlKXmBZLLmXwDjJfdTFyHjiju/B0xZjwyMDSBB+a5GluU2VN1GzwUeo2PjVV5b
         tJXtE5+uOJl/WX7jBcneyInYig2Oq7DL7gQ2A8I2L82tUlegnYpKYVv+SIviTDcxrlZW
         JZ3hbw35d0Hv6KENJDI/g4fcgXNk5Ms9l/EFcEw4Bq34pzkSeyXRMLea1OZ13gHd97UZ
         c9eTbLZRUd3DWcnlN8FEs+phycsbOmJc6Y1EN6HbDisU4R68gzuWQCSx46ioqIJExhdS
         cl3w==
X-Forwarded-Encrypted: i=1; AJvYcCX7u5dbet7M/FoTqKSGW63JDfo8BVjuty0+P66RLmfEeGLiT9xpW6kxiGXof0kzr/IKk0eCYGIc5UR4jcR6@vger.kernel.org, AJvYcCXIMehmxubBNwQHacGIaSNPatR4jq9mDiUKTGt1pqWJIa4rciGTNmG/TDzLqNUh8viMdUUgpwph7RWi@vger.kernel.org, AJvYcCXgYFK7rN7f+4hFztekVhXomXZN/V0lQQIFOpHUTjVSKtWklT+CW2RtUpoBs7teIZfSzn4SncLd@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ2IhsQad5YwcPwc5dWW2jUzgUxabXCXHjLpq0AjrOAD7V4Hfm
	pnI7l8UiAaB3EJ0r2m+u0uSJQAnpK0FzSgcW/LVF9Iz9ys7q1zhzgzh+
X-Gm-Gg: ASbGnctq8oIpY7SfLKeTIS2VQjDusDv4/YU5kuYwP85x4Ka+gfHXEsZ3mw2VrT0VKOd
	Kc2Ye+90StVDRw7Etgp4pNkXeSNeRk7WvZR9+A7V6uCTU3bT/Rtsh3Q7N7tFXmgLVqlVy8UWttS
	lY4WvyFOs8kH10T1cT7mrYXkJU51qWazwc9QmcfRqyOLNEudpTejf2qMWe4fwIPoDiiLjnuJSA3
	AiSdbz3TR8geaFSq/5uH9csaGv/kuHrpjYR88ATuLeNilqjggoVn0bqLbwMnswk7uIn9MdpefuG
	aSs1kpIOHvmBRAaTQgak/3N5tg2tnaCuONSx4lTAWGowG1xlqqK8zdT5wyaYoh7SKou4uzX/Bir
	IQTCYGoplVvv8YhPAvN42G/8XD1GMF/AOlqAayVaEEi8Q4mG0AjOI
X-Google-Smtp-Source: AGHT+IEibhSWnWE1MjJC3R8FtcJ7xPHK79tg4sHdHyBpZriX1kYAe8F7wgBhmcL8NFLqOUEO3nh6vA==
X-Received: by 2002:a05:600c:478f:b0:45b:86e1:61e3 with SMTP id 5b1f17b1804b1-45b86e16457mr22690895e9.31.1756634721394;
        Sun, 31 Aug 2025 03:05:21 -0700 (PDT)
Received: from builder.. (39-10-142-46.pool.kielnet.net. [46.142.10.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e68c83asm117505565e9.20.2025.08.31.03.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 03:05:20 -0700 (PDT)
From: Jonas Jelonek <jelonek.jonas@gmail.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Markus Stockhausen <markus.stockhausen@gmx.de>,
	Sven Eckelmann <sven@narfation.org>,
	Harshal Gohel <hg@simonwunderlich.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jonas Jelonek <jelonek.jonas@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v7 03/12] i2c: rtl9300: remove broken SMBus Quick operation support
Date: Sun, 31 Aug 2025 10:04:48 +0000
Message-ID: <20250831100457.3114-4-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250831100457.3114-1-jelonek.jonas@gmail.com>
References: <20250831100457.3114-1-jelonek.jonas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the SMBus Quick operation from this driver because it is not
natively supported by the hardware and is wrongly implemented in the
driver.

The I2C controllers in Realtek RTL9300 and RTL9310 are SMBus-compliant
but there doesn't seem to be native support for the SMBus Quick
operation. It is not explicitly mentioned in the documentation but
looking at the registers which configure an SMBus transaction, one can
see that the data length cannot be set to 0. This suggests that the
hardware doesn't allow any SMBus message without data bytes (except for
those it does on it's own, see SMBus Block Read).

The current implementation of SMBus Quick operation passes a length of
0 (which is actually invalid). Before the fix of a bug in a previous
commit, this led to a read operation of 16 bytes from any register (the
one of a former transaction or any other value.

This caused issues like soft-bricked SFP modules after a simple probe
with i2cdetect which uses Quick by default. Running this with SFP
modules whose EEPROM isn't write-protected, some of the initial bytes
are overwritten because a 16-byte write operation is executed instead of
a Quick Write. (This temporarily soft-bricked one of my DAC cables.)

Because SMBus Quick operation is obviously not supported on these
controllers (because a length of 0 cannot be set, even when no register
address is set), remove that instead of claiming there is support. There
also shouldn't be any kind of emulated 'Quick' which just does another
kind of operation in the background. Otherwise, specific issues occur
in case of a 'Quick' Write which actually writes unknown data to an
unknown register.

Fixes: c366be720235 ("i2c: Add driver for the RTL9300 I2C controller")
Cc: <stable@vger.kernel.org> # v6.13+
Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
Tested-by: Sven Eckelmann <sven@narfation.org>
Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz> # On RTL9302C based board
Tested-by: Markus Stockhausen <markus.stockhausen@gmx.de>
---
 drivers/i2c/busses/i2c-rtl9300.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rtl9300.c b/drivers/i2c/busses/i2c-rtl9300.c
index ebd4a85e1bde..9e6232075137 100644
--- a/drivers/i2c/busses/i2c-rtl9300.c
+++ b/drivers/i2c/busses/i2c-rtl9300.c
@@ -235,15 +235,6 @@ static int rtl9300_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr, unsigned s
 	}
 
 	switch (size) {
-	case I2C_SMBUS_QUICK:
-		ret = rtl9300_i2c_config_xfer(i2c, chan, addr, 0);
-		if (ret)
-			goto out_unlock;
-		ret = rtl9300_i2c_reg_addr_set(i2c, 0, 0);
-		if (ret)
-			goto out_unlock;
-		break;
-
 	case I2C_SMBUS_BYTE:
 		if (read_write == I2C_SMBUS_WRITE) {
 			ret = rtl9300_i2c_config_xfer(i2c, chan, addr, 0);
@@ -344,9 +335,9 @@ static int rtl9300_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr, unsigned s
 
 static u32 rtl9300_i2c_func(struct i2c_adapter *a)
 {
-	return I2C_FUNC_SMBUS_QUICK | I2C_FUNC_SMBUS_BYTE |
-	       I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA |
-	       I2C_FUNC_SMBUS_BLOCK_DATA | I2C_FUNC_SMBUS_I2C_BLOCK;
+	return I2C_FUNC_SMBUS_BYTE | I2C_FUNC_SMBUS_BYTE_DATA |
+	       I2C_FUNC_SMBUS_WORD_DATA | I2C_FUNC_SMBUS_BLOCK_DATA |
+	       I2C_FUNC_SMBUS_I2C_BLOCK;
 }
 
 static const struct i2c_algorithm rtl9300_i2c_algo = {
-- 
2.48.1


