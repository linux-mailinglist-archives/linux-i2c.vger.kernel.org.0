Return-Path: <linux-i2c+bounces-12187-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 849D4B1F707
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 00:08:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B7A617F77F
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Aug 2025 22:08:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 123DD2C08CA;
	Sat,  9 Aug 2025 22:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P5kFV9vD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089862BEC30;
	Sat,  9 Aug 2025 22:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754777250; cv=none; b=YgWg/xrgDmDucb57UBtpyjXQdr5cCfmuqFKdEDzzm+qEl7FU+FrLIVeKnSua/K0kikKVj5NM5McB1Moiir8gIywxJ2og49suyPzDTObDxKv1Ir1+bhDGtPOcdnsGZerT0KYfzRV2YgZdRESlXsRfdCXldqR88wDKL6LS8Kt2/kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754777250; c=relaxed/simple;
	bh=Lwh1P7aB9aQVyEzGjesKwYkZt/CYXq2AVwbawpU18Kk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JWSg0ZMSeWQRl9o8ogX8nDub54OKr+oqFm1MGQqVebJnPzXSoCyNTN7v4yl/1v77WDR59Nu+W0yDC9M0HDcM+XDtbw7KdNHmhKpZJKFKjUkPTO0YZzV4kEAbZP5Qr9zRE1w1xw9/VzuS159GQP+Y6fMEdZHeRpm+HqEP3VQO19s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P5kFV9vD; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-458b885d6eeso20478335e9.3;
        Sat, 09 Aug 2025 15:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754777247; x=1755382047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0lsDSBXC+0KNhVISb8yjtzuT6Sl95K4BiEO6oxCv6c=;
        b=P5kFV9vD/pUXkds0i5UiDKr0s/7+wTVUK0CfPRLYsB9QVUgjpFswlhJVRAgeUH5+7S
         9LFGX6ZwwgdZNnyIejcrFdKzdjjMeL3cQ6270Z6Pkqpxnn4YAcsKRVN8CssXQhXMCRrb
         B/LSGT6kDQcco+UjvQGYGUfhqWpIcWK2YpRUlWPxieVxT5BJRj2drtVNwwdmqwR8mEIE
         zutNcyAGa4BHomSc467FmPqXyc9dQE2EiPAELClChqKBoeNknX0WAbUvUBJum0V8rjJx
         gWRhAl257T10mjrPLnrgQlYS+oW+KN0j/lcEIMV5jii5cN1t3HPX5uG7d4+7SuTB0Qd4
         bV8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754777247; x=1755382047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l0lsDSBXC+0KNhVISb8yjtzuT6Sl95K4BiEO6oxCv6c=;
        b=uOBhs318HBnAyYOsJOf99aOQPQyA5zdM78FIDxg+jiTtbVCOzokZDdtXmeKyS/kpwp
         JvUAmGU57CtRn/TGTyFTnPDwP7HEGySZOulvLgZ8Y4rml7C5XnCySYlRBV4qI2tnyty5
         OS3VStunIrC9pzVlvFHxg4FJ9hiQFO3kz/JhU3VvHRsWYf1a0pNKKRTVC6QMJzj05Alt
         u5aFvKnMVMiLyQVV8Ak46Nn5fOPgnEugmv4uUZedTuFX3xSdODGxj7atJzb6JrqbnzdT
         ri65VK2j+GkuPrExPg4m9y2OphxwyjWCyzP1B10oREIlCyaNMwMbESa7gDYcd8uA3goh
         //VQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnT3xJ3qlcZ2+QJt8LUq04pCJrvRa5FJUgoML9N8OrIzPB/zAEQyNLqFwAoSxbBT0bpRAbxKTwRvQTbmd/@vger.kernel.org, AJvYcCXqct+PtTh6EWgm3vIfUyXezqgUqRZJWg2co+E4AyEduF8ljqjGp/sF2lDssKG/5v+SRPXYxDxi6IOv@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8Ozq18Jlh2ATZ2swjJ+9nBetMdxxehLbnKVz6xZeJnaGf7FZ/
	4NaYD9ogFGKHDus+W8PpsQ4RImUkvMu0pQlTgeDlSMj9Jo3+bBXa5kVY
X-Gm-Gg: ASbGncslH4gG4dvu2n8qX5XSbIYEpyezl71qRV2NqB7zH+r5gdtIjD0lIheYOir3bsy
	db3hHHTzk/qpUai75tZhym9pwtvT0Saf0EBu5ZdrFVG6nNLhqqF9sDeTXo+I5JQu+eQqVvmQpt2
	TJgTJ/uXtcgJVC4zGCmJeWafge53f43PNCSALuD5jRbsp8pBivztCHyguGBR+PCsARL7OCKZKEj
	x/l56HhQXxuehYNynWnpolBxcoNzHYzrfrd2TH/GBWS7UM0AZbNv9vlA1/D1uftzK5jhF4REhcH
	7OR2/CCRo4/TGgR/fXUCgjEdXBKAZDyo60eX+fXNxOSoL/oZ51BO6wkJ0+8fDzkLbY78AdWLkMd
	B3/WSBhSSC/jCbX4V7HgUyPhwQCvDQxRHA+roF82NQz/XBJ06LzPv
X-Google-Smtp-Source: AGHT+IHgyVNnQq4KFEWeXFXinA1eIh2SOcxOgl0QGI5PcUBpYV27FOS00azRxoN+aBAu5msPTZ6Y3w==
X-Received: by 2002:a05:600c:5490:b0:458:bb0e:4181 with SMTP id 5b1f17b1804b1-459f4eb19d7mr75512945e9.10.1754777247338;
        Sat, 09 Aug 2025 15:07:27 -0700 (PDT)
Received: from builder.. (188-9-142-46.pool.kielnet.net. [46.142.9.188])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459c58ed0ecsm145592185e9.4.2025.08.09.15.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Aug 2025 15:07:27 -0700 (PDT)
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
	Jonas Jelonek <jelonek.jonas@gmail.com>
Subject: [PATCH v5 06/11] i2c: rtl9300: remove SMBus Quick operation support
Date: Sat,  9 Aug 2025 22:07:07 +0000
Message-ID: <20250809220713.1038947-7-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250809220713.1038947-1-jelonek.jonas@gmail.com>
References: <20250809220713.1038947-1-jelonek.jonas@gmail.com>
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

Although there are currently no reports of actual issues this caused.
However, as an example, i2cdetect by default uses Quick Write operation
to probe the bus and this may already write anything to some register
of a device, causing unintended behaviour. This could be the cause of a
recent brick of one of my DAC cables where there was a checksum mismatch
of the EEPROM after having run 'i2cdetect -l' before.

Because SMBus Quick operation is obviously not supported on these
controllers (because a length of 0 cannot be set, even when no register
address is set), remove that instead of claiming there is support. There
also shouldn't be any kind of emulated 'Quick' which just does another
kind of operation in the background. Otherwise, specific issues may
occur in case of a 'Quick' Write which writes unknown data to an unknown
register.

Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
---
 drivers/i2c/busses/i2c-rtl9300.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rtl9300.c b/drivers/i2c/busses/i2c-rtl9300.c
index 35b05fb59f88..ead5aa6e60f8 100644
--- a/drivers/i2c/busses/i2c-rtl9300.c
+++ b/drivers/i2c/busses/i2c-rtl9300.c
@@ -251,15 +251,6 @@ static int rtl9300_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr, unsigned s
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
@@ -360,10 +351,9 @@ static int rtl9300_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr, unsigned s
 
 static u32 rtl9300_i2c_func(struct i2c_adapter *a)
 {
-	return I2C_FUNC_SMBUS_QUICK | I2C_FUNC_SMBUS_BYTE |
-	       I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA |
-	       I2C_FUNC_SMBUS_READ_I2C_BLOCK | I2C_FUNC_SMBUS_WRITE_I2C_BLOCK |
-	       I2C_FUNC_SMBUS_BLOCK_DATA;
+	return I2C_FUNC_SMBUS_BYTE | I2C_FUNC_SMBUS_BYTE_DATA |
+	       I2C_FUNC_SMBUS_WORD_DATA | I2C_FUNC_SMBUS_READ_I2C_BLOCK |
+	       I2C_FUNC_SMBUS_WRITE_I2C_BLOCK | I2C_FUNC_SMBUS_BLOCK_DATA;
 }
 
 static const struct i2c_algorithm rtl9300_i2c_algo = {
-- 
2.48.1


