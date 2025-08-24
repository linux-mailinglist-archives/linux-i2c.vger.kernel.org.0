Return-Path: <linux-i2c+bounces-12395-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E9086B32F7D
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Aug 2025 13:35:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1FE12A0988
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Aug 2025 11:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20A4C2D7DE7;
	Sun, 24 Aug 2025 11:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l8RL/D/w"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED512D6E43;
	Sun, 24 Aug 2025 11:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756035275; cv=none; b=QHH2Ex3jZ4BjGpvUanXvzm5N+BPLgiJRIROyYDffDElB2hYxUwZpHmjIJCDRJXtzz2oP70AHH2rnOXjznz9UFwfdJuIhUXfagIhpusAg22fxZMjIP6DSBl36VbzwUluQQknGRaRa7oeyvBRMfKOCCv+mCdbDHMv1Hcq9SD3fnTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756035275; c=relaxed/simple;
	bh=1nTD6kaiOz1BwPdoG6SRg+ZHJMGWjjwl4nJ0Vx0Jy+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tiU16EUelxNljtrQi6hTHp7lwfKv9pCS7cWeNP9M5fyh7frwT+mH+wbULmsCW/f55IadDDRVW4hrvqgUqY80pxnd9EBNUIt8SZ7ajexz6Qgnrwi5vEon/lXcyHXM7E/WSItmSV91n0Uc1cj7glLebbgaiIz03yCbTYlvEsRt4BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l8RL/D/w; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3c68ac7e238so878943f8f.1;
        Sun, 24 Aug 2025 04:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756035272; x=1756640072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=//U63PD85OTzt0jQ8Gnj2XRbWc63AN05K4R5o5HvqLs=;
        b=l8RL/D/wrSxRhYfI3NMA0d1OspVIvZIGFTEMamX/Gx9WJmO4sQmYhoEoP9BfQYzbSX
         Wfxi3n1c9tUP4y1R5e+gfaa+eC2VdO1beEmLwXZoQyOsuRQFSkQgDiVNXOiP342vlxYc
         sJiTGULhcNWbpyWkumRjQWdE4jfGnVyaT1iTeqHMOjBF/pVU0R5Av0GyK3R49YTtuH8C
         ioH2CGeBUBrjPWt8jSlFf/fLUlf+BTfFnZr1FnOQMmE9u39vVExFEszX0+1bCYE89Zah
         gILTceQwAFXgSePjduwvUwDYqnVvzcK/MWhzm0oeHaTA6BIE5cggC7VdSbh++/1oMPCy
         J46A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756035272; x=1756640072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=//U63PD85OTzt0jQ8Gnj2XRbWc63AN05K4R5o5HvqLs=;
        b=LmOXsj5BtlXAZiS34PupRAvMlCEX9KXErohrW81VK7O/u+7gyqk3mcc0KMo6kC9BKU
         k0FBO6tcqLqlH0oFIiufkSgd0piRAWmq0Fzfao1KeGc45sgCWcl81qsJZaBBS4Rr8pBz
         8gG2CHWf12ZzpP0e/unvxpQAfShE1AAKHcpAqrnmb4igxliWkhl/qUDGHumZ5ww0jI+U
         +Q6/wJSrzYEy8hXqnrxNAI+KI+paMwM8x4R1hO6PwBf2OsX/UOt0W4JfKw0NeopSOKT1
         Hxb2Fq7C75vSuThKSuqrWegG35yYk2iCeweeZhMsLJ8Z/bdhbAKoVFFwZBcdhpoL/O1Q
         sOAw==
X-Forwarded-Encrypted: i=1; AJvYcCUHHdDX4jbPca9j0lzOAV/savFVrVkir3MTIcxLlJpv7zalye4lkFgEnf6YDDdn6ipY9dqsfLN+QkoHZDl0@vger.kernel.org, AJvYcCX3VzWF/ZMFg9fOI6bQH9RhHeibc5kit2cJyA2cNVJE2QX230bHRgEL3a2l7jSFoSbh8Gpaoq95@vger.kernel.org, AJvYcCX7fE4B3/H2UrKYBF1luYeYp57Upao4BInj7iVz+7KwV5crsbloIMbmJjcN6s0gTzrZrQDthe03vo6G@vger.kernel.org
X-Gm-Message-State: AOJu0Yyyz7LY+uLFNT+8rSP0KL4piwD5EntrNetHg8dcMDTU18E3JNdi
	oYiHFka6s4qxrSj37ud7klyd8RHgPSTXnrblrGjHpu7LksdAcZoRNBDj
X-Gm-Gg: ASbGncsT5zOeDZTs/SgTOdzAVpY4eelRjfy9Ew1Vk9Fd0HtgrN4X7SUxtdHZ2/jpWLB
	K82b2c3o5UYybJg/z0/lQwnrlijNDGi2eDfx25kBuOGj2ITnU4FbX0VzVg30lfREfrxB226hzsq
	0C6BxLP2P7/A4tYJAecSYgHCzockodbKP1MizQ4DrXq2Dd8SKvFIzgBqhUt04YAKP0bov0RMGYj
	o4cSZdj+oBjfu8aD3pulk+40uCUk50vSel7Rcm1M/L3ZY0sHwrScIq7/h3Fs9IOJKkxmVYQ6ckH
	++dNixCrGDZhn90uKa20fxNt6S5hSYqquCbR4VK44+0HtaWQpUGx+yc68sgdGGRs/B17d0931uc
	eliOmPukq7PEvmN1gGAeid6ynbP4FaW5vw2phXq+I1vdTU/RTW+eoQl4=
X-Google-Smtp-Source: AGHT+IGhK7O+VRYHUuH7vcoRK7FHXcK79OpXkdum2Hajv5qhQMsTVibXGh+4YF6xCrQ/jikHvKVyUw==
X-Received: by 2002:a05:6000:4387:b0:3bb:bd05:7bef with SMTP id ffacd0b85a97d-3c5dbf69bfbmr7314649f8f.24.1756035272319;
        Sun, 24 Aug 2025 04:34:32 -0700 (PDT)
Received: from builder.. (197-10-142-46.pool.kielnet.net. [46.142.10.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b5757453fsm66470895e9.14.2025.08.24.04.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 04:34:32 -0700 (PDT)
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
Subject: [PATCH v6 03/12] i2c: rtl9300: remove broken SMBus Quick operation support
Date: Sun, 24 Aug 2025 11:33:39 +0000
Message-ID: <20250824113348.263475-4-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250824113348.263475-1-jelonek.jonas@gmail.com>
References: <20250824113348.263475-1-jelonek.jonas@gmail.com>
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


