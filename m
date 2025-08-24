Return-Path: <linux-i2c+bounces-12402-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 87550B32F9A
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Aug 2025 13:38:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 671C41B65147
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Aug 2025 11:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58DDD2DE6E3;
	Sun, 24 Aug 2025 11:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gZzduMEi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564512DAFA9;
	Sun, 24 Aug 2025 11:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756035282; cv=none; b=oJVJNAhTcqCnyRaXZMCBRHRUtkUot7wDLBLZfmN3mO7R1lyBC1sq2l6SeWVkO8xhj3K1mYWRdfAxt44rZVFgV+JVXzJ+SOcpg2LBDV0tGEIi4BqmaFr2qXcXgPHXskDuDmTsTOy6TTcW7IttlyWbGzZULmKVVGauiqULJIGlNKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756035282; c=relaxed/simple;
	bh=EfrOytfcbQeQJZZreuoZDcC87F2iv+7pZRcAuuZIEPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J/KwpOI65o+QzVdXzXTvpAtU5M5ylBgGN98YlTJzkngFVKa5ubbiQw7HVhrf6dKptrs3ygDW22ILRCgRTTxHAwEc9TQTp8Ce3UWhiG0kOSNhXwGZv1fFC0ehFw51YyHof5rdmmSx35ffMSM0Pprd/pILvQJxUq87XB7wic86iso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gZzduMEi; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45a1b065d58so29436275e9.1;
        Sun, 24 Aug 2025 04:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756035278; x=1756640078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VRyI/FYoRek6yvet85HPVtC+4+M4ibWnCCCn/CkLLEI=;
        b=gZzduMEitlkt8haJVS1O162vFIqMM1r9i4CRxbdyG90jce8WwtCDPmnhLZyrA65WZS
         sEgYwM2gd2E/qi93UypQPLv/NiRXpffxuQYbUes6424AUaJvtXTRNS0wO3mJnTt1ifv3
         krq37qSBMAyGunDtWweyaIQlkCemmBX62glJQPkK0Yv69djqwxtDptIFatnTNabpg2P3
         IAy0e27kh7KdaBp41uZLNJVAmVtJd9tM1gJYL8+wg838OoZNosJr1ahWAk41mdA6bfCf
         YkZzPebcYX0s63CEBV6erlrePv/12dApjENfi1mG6zA7lex20XPrrwFUGMJ/AN9Wl1m0
         2ikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756035278; x=1756640078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VRyI/FYoRek6yvet85HPVtC+4+M4ibWnCCCn/CkLLEI=;
        b=R6BAKBMqpznVZHq6oZsriOmv/NOf/jVRHtdo/c1Lb5gi90Hs4VcyrMVQPITjfhpoP9
         Q6rcKiHZ86E37cJPP/6Z3eU746QPTLvwdWEJbd6rNbxScuLxVu63MXxqiOEw4mokXbeF
         2dBkWaz5YOvn7m2X4RwoFMAwy3rlT98ICK91TzU41qdGRLd6d9NPT9ChHae39rGHRb/J
         fxU2ezDiFhLW5mXasGq2rVY7HuE3dDmcn8fvigxOCFwW1fC389MnDRScviahgzLCV/lj
         axIYJ55yiDElzTO7f/J+SKZ0vFF/2AyUMsncn/kGmWEBYmkbcZU9iUGgRDy/ePNeqmz3
         8vGw==
X-Forwarded-Encrypted: i=1; AJvYcCVe40nuPxhYEpv8v6Y4biGZ+tjTc/yQmTrPCl9m1C6yQnzu0K7GV+pM319SOBGsBW8Nj3IGYsw9ztN4YhkA@vger.kernel.org, AJvYcCXDs5gBvTJxfn7o+/SvxBObF9G3GygR876Sj0jKf6fQ1czpTHPCDWe/VRZ4VFgXHyYStwAGfDbYtCNu@vger.kernel.org
X-Gm-Message-State: AOJu0YxBClqIt5ZPoaCEnfw+4XFWfW9T4Sq6LqySpy0xMRdqpmqdUBa3
	kZMVwxDiU7hCV+eueGwnR7qlK8X0aEf7XOghqki2+1dyq1ppdQzXcYLL
X-Gm-Gg: ASbGncvL18CP/97m6CtHwMiTUULKncu0P/VcGcIJIaWCGRzpVQBJcnFs42Pw6ILtLTx
	sNO+mUQBzn4nO0+otgvuGQ8tSGAyK9xqarzS2/ynkgYf21aT/7EwfTbeN+RmL+s2+gtVtD+GcA8
	mmy6g8BA+5ZmdiyOUyzFZq9RNRqBgLSIlpoUj0Vyxz1kV68fLnMNxJfIgrcn8kDJDcNgf21PEvs
	aHiEW2ZZ/VdOdQ1QyAukK1hHIqx/sgh2UmxIkveC//DSNab6aAjj9PBD/lRkHdNx1G9sa+3v/OP
	mPiG9MzM5UZdsBzqv1wAa2CifysBxCl4lgvxEo+/rg+As2iqJkDLEJa0o/rJwmcAjq2Q2mzMz4C
	4Iw4og4k8h52JhrPJunitaMminlv6bjRYv/eTVmqNu5p8wmd6j97oMVc=
X-Google-Smtp-Source: AGHT+IEIxK407BN/nRZ47kkeNtQIUEKEBZTDjo32BZ50MJRc8XdZoKJKX3cAQ7qj5VwtcSvGH/BJPw==
X-Received: by 2002:a05:600c:3b8e:b0:459:d780:3604 with SMTP id 5b1f17b1804b1-45b5723940bmr46755675e9.3.1756035277711;
        Sun, 24 Aug 2025 04:34:37 -0700 (PDT)
Received: from builder.. (197-10-142-46.pool.kielnet.net. [46.142.10.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b5757453fsm66470895e9.14.2025.08.24.04.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 04:34:37 -0700 (PDT)
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
Subject: [PATCH v6 10/12] i2c: rtl9300: use scoped guard instead of explicit lock/unlock
Date: Sun, 24 Aug 2025 11:33:46 +0000
Message-ID: <20250824113348.263475-11-jelonek.jonas@gmail.com>
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

Use the scoped guard infrastructure which unlocks a mutex automatically
when the guard goes out of scope, instead of explicity lock/unlock. This
simplifies the code and control flow in rtl9300_i2c_smbus_xfer and
removes the need of using goto in error cases to unlock before
returning.

Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
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


