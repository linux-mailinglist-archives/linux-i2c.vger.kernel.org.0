Return-Path: <linux-i2c+bounces-12531-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB68B3D1F8
	for <lists+linux-i2c@lfdr.de>; Sun, 31 Aug 2025 12:07:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65D021756CE
	for <lists+linux-i2c@lfdr.de>; Sun, 31 Aug 2025 10:07:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B7CB26461F;
	Sun, 31 Aug 2025 10:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fHR/jSx6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A937A25A35D;
	Sun, 31 Aug 2025 10:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756634733; cv=none; b=VkzUAsZPVFUIyQZksXgnf7uQ927sSJyrAGkQVjWnlSBjC22OMlLIgZ116858unXe0qXTDy3QXP7v4me8V3FUzD2b4jxyeGRH/v/2C5bUOW0AOMjQhx8DnLxk2jLCnvrTph9tWECB/MPZfDwW6ODMW1ckbz/evjjg4PQgA0U7sFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756634733; c=relaxed/simple;
	bh=vEHdMu4fZDG0pv0OrxT4yCsQ2r9RoDo1W3KJXPI34so=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hFDoJkDkIteBYaMpEH2h+6pqpfL4f2fUXfLVCHp/N6DTpl/qz8tzLBLEgtQHOz/tTQ/twmfo6n9/srBiYe8yFDOyDGiQpbtgisL6/VTzJsomSPse+28lIG0fn9wtykyBaWyutAz6+PLNP5fV0/4qG35LA4QVSOMgTskHuSn8Iz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fHR/jSx6; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45b7d485173so19551385e9.0;
        Sun, 31 Aug 2025 03:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756634728; x=1757239528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rVYljPZ7zSakciHIair+w4BKANbFUIx4H7fyvtM/0P4=;
        b=fHR/jSx6S87PuSQfhS8v6Sw402yAOSA3+2ccMCID74C8pBDGGWgl4RmNKPGPtxGJbh
         39rB9jCnA0GkhKiZHKAJl6c/sVWOBSnn0pUy7tuccTV77aOlj1u7g7SzTH05hAOaNWN4
         7wHr2R3y6+mJBeuchUw7rxLNDAEAllZkEkf+O9z3un1un56c2sc1MZBw4z3yJLMC6UZT
         zfiZ0ajs2ugFx1K3HH69iwYyVgKdDcTt4IYWK33gsRD231quHbLkkOqPX7i22Ucv2pMM
         66zYJWyDajwaSM6WjadjSi3DXTOOeYUvnp1fdaFK9+jN9NIHblo+WkeQg0aIBiGm+4kR
         fIhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756634728; x=1757239528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rVYljPZ7zSakciHIair+w4BKANbFUIx4H7fyvtM/0P4=;
        b=n7DXI82CkUB3kvlQfYoNTtpolOfWqj03e5/V7fZI/2M+NQYgClxKkMgFLqNdPUfwLm
         Vm4sWuXK1npn+Yo4O0+Kd2F9w3l28HuPSNnPysMHJZdrxzk43OrBHk3AXUGSElTYlpFP
         QjbEnvrn3ptTZo3GN0ohbfBGmMdjL1EvDo8t8E6kr0n456YHGpBE5bMuZIfTXZR/5kgn
         ItH3AwQMitBvf2qdKsUW1IhyaIcFo4a9YC9IcC1TkPn15D9t/bvED2aTzpe3SzpR12ZP
         OyPtZOYGZiKaomRDaKMmt13VVuLhfOiW7OYS76cbJEosV9SQGj/2wMZAgiMQiu6ys2J3
         fYSA==
X-Forwarded-Encrypted: i=1; AJvYcCVGGVnRVj9y2TVFi+VHizPGx37tgPDZCc3TSjCAQN+AXtqKGOx+mejKlflm/eVCSoTdLjW3jZfYgZDb@vger.kernel.org, AJvYcCVqnm2tJ+ZKlJNkZk8geXZDIOLf5hnKaUMUVUpr9ryWzVLyZEVmAxVqx/+ImFgY2Df1iZVUsluhtYfWAqGx@vger.kernel.org
X-Gm-Message-State: AOJu0YyucFeIOg54kF26UgWaEsNFca3LSW9CwQ4jzXQbZffBG+pPIo1n
	UpbPB+SFXPAB48q+riBxt2P24ToG38KNHlcfrTjM8MYKUIQGYwbc12yY/I3TCA==
X-Gm-Gg: ASbGncsJ6KvHQMU15RccvWpEzGTSUADQUaf/cNZkv15+Xld2jm5V0fkIqycvXh/sJSt
	7DsyA8eW/1s+2RDTMTLvFdaLncoaaYPJJtmdDTGOYa+TQ9HHGMaaqT4FmaLgxDQzVJJucpAEYpA
	bhy6Px7BzNbiZe/qGnc1nF5uvYkDWOsB+q9dfkbEBHSSRoLXhYYAGigMcK2/829WkAdK1c1odqy
	/a7iw7wM7vCPP/97Rb4ZXkOpcENwAnvqydfZObvIK/pq+zDEcGL9+DeX0K7E/g4MiA9pmLGsnWA
	q0g31NjDegghMaI/sTkY+jAWjZpxer9YJqCuqTq3EhFNy9g1C71nQlZXHJ56AatSu7B1JJ7t2rS
	j0mcj2zVMlnGmx0w4CNbwC5HLu8vlBwk1LOLLVonI+ci21FyRXl5i
X-Google-Smtp-Source: AGHT+IFscJ7ti8f3py0rgPMa3sPM+GkbBJW2hqxoKCX38wnkA/sFJZEDxaFRipo1X1CkGm+y6e6s3w==
X-Received: by 2002:a05:600c:474f:b0:45b:7951:92a2 with SMTP id 5b1f17b1804b1-45b85571351mr29190805e9.18.1756634727754;
        Sun, 31 Aug 2025 03:05:27 -0700 (PDT)
Received: from builder.. (39-10-142-46.pool.kielnet.net. [46.142.10.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e68c83asm117505565e9.20.2025.08.31.03.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 03:05:27 -0700 (PDT)
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
	Jonas Jelonek <jelonek.jonas@gmail.com>
Subject: [PATCH v7 10/12] i2c: rtl9300: use scoped guard instead of explicit lock/unlock
Date: Sun, 31 Aug 2025 10:04:55 +0000
Message-ID: <20250831100457.3114-11-jelonek.jonas@gmail.com>
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

Use the scoped guard infrastructure which unlocks a mutex automatically
when the guard goes out of scope, instead of explicit lock and unlock.
This simplifies the code and control flow in rtl9300_i2c_smbus_xfer and
removes the need of using goto in error cases to unlock before
returning.

Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz> # On RTL9302C based board
Tested-by: Markus Stockhausen <markus.stockhausen@gmx.de>
---
 drivers/i2c/busses/i2c-rtl9300.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rtl9300.c b/drivers/i2c/busses/i2c-rtl9300.c
index fb3ebbd46a18..c67463228604 100644
--- a/drivers/i2c/busses/i2c-rtl9300.c
+++ b/drivers/i2c/busses/i2c-rtl9300.c
@@ -72,6 +72,8 @@ struct rtl9300_i2c {
 	struct mutex lock;
 };
 
+DEFINE_GUARD(rtl9300_i2c, struct rtl9300_i2c *, mutex_lock(&_T->lock), mutex_unlock(&_T->lock))
+
 enum rtl9300_i2c_xfer_type {
 	RTL9300_I2C_XFER_BYTE,
 	RTL9300_I2C_XFER_WORD,
@@ -283,11 +285,11 @@ static int rtl9300_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr, unsigned s
 	if (addr > 0x7f)
 		return -EINVAL;
 
-	mutex_lock(&i2c->lock);
+	guard(rtl9300_i2c)(i2c);
 
 	ret = rtl9300_i2c_config_chan(i2c, chan);
 	if (ret)
-		goto out_unlock;
+		return ret;
 
 	xfer.dev_addr = addr & 0x7f;
 	xfer.write = (read_write == I2C_SMBUS_WRITE);
@@ -324,20 +326,14 @@ static int rtl9300_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr, unsigned s
 		break;
 	default:
 		dev_err(&adap->dev, "Unsupported transaction %d\n", size);
-		ret = -EOPNOTSUPP;
-		goto out_unlock;
+		return -EOPNOTSUPP;
 	}
 
 	ret = rtl9300_i2c_prepare_xfer(i2c, &xfer);
 	if (ret)
-		goto out_unlock;
-
-	ret = rtl9300_i2c_do_xfer(i2c, &xfer);
-
-out_unlock:
-	mutex_unlock(&i2c->lock);
+		return ret;
 
-	return ret;
+	return rtl9300_i2c_do_xfer(i2c, &xfer);
 }
 
 static u32 rtl9300_i2c_func(struct i2c_adapter *a)
-- 
2.48.1


