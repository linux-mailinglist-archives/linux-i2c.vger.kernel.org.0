Return-Path: <linux-i2c+bounces-12707-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E01B479EF
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Sep 2025 11:04:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 368D83A39DF
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Sep 2025 09:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 894A821ADAE;
	Sun,  7 Sep 2025 09:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YPdmx/BW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A797D1E0B9C;
	Sun,  7 Sep 2025 09:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757235882; cv=none; b=h34URXnovMX8dDnAe6UWvIma0mOGfRDdQcA2wt15Zsljee0QAlslWYc4zegf87ttvL0oMG7RsQEC204B88I7QqauT25aABlfFyCR7hUSsh2E0Hz9XHfaOD2PNVjeMcPNQ7UYmACDjz4Czsrw0PBB3qWQMxFP8np99X7gG4lOOkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757235882; c=relaxed/simple;
	bh=yqszQYyYNF75epILjr9T1T87Zt5AhbpTCIe9wT2Y6Qg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FpSZL3Kfdl6Hj8pP+Sv+83U+UN8JTbbUI8QIMfz6bKRKhhcZD0pbMVcOi9R7+woWK8j9mZQrx7zNiTBGMl0CsDUcWKR0nvrtO+pe/kIl6iJROMF3p577rz2/Z6UUhsG3vtIPwEDxR5VqRmvOTfh2vhu3ja+QRvI2/M/CuNcbVio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YPdmx/BW; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45b627ea685so25877005e9.1;
        Sun, 07 Sep 2025 02:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757235879; x=1757840679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QDygqp3eRM3Cpzio3fo8uXzP41hjajjDfBZfVuyx6pw=;
        b=YPdmx/BWIvgc9B762sN2bzX9UMAnE15P8TwAp2DFUa6weZqC0pv6apnKb0TNzAarOW
         qPO/ksEhfxz389Q5yx8tqDWuFrl/T8eiicv16ql/sGdF/Mx7Jb3jhh3EuIYRToZHROBt
         eomkYERJOUlYig1jviS6kAcD9crw0Nq+nSSzOXKlYeUZ5ojJl1+iUy7Saib7mhQbj25b
         ny57OCUR0paln6le1Bk1U/jVZQoCagRFb65FsZyf9TDcqPG72dgs0MoeBz+2X4hIj5uI
         jb0gpj/HS9gGvXaSL3s/dPpCrtVBmLyd9JjScCGSfkXjM87SavpxuKSkZS4uqujsw5Kd
         PPRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757235879; x=1757840679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QDygqp3eRM3Cpzio3fo8uXzP41hjajjDfBZfVuyx6pw=;
        b=NN+vVwm0nvHETynl4YYvgAdMN2MJQDp+dO4mZylJllSjjPf0BPy68EwXXmM+kdmpeC
         wgU09UIZ/iE4QMjdaXODRqPAvuVFp00EgfKOpztIb+gBLuUmYgWcNb/dxAhsvNe3so1p
         lQ2EIDm/hw02Oi8SXgHH9XxYwTfDj4yTQ9IxE7+PkZHylzWohFOaE3XLA4ifiKASsbS/
         WlDOJi+c/QsWTry9H7JAhslWGRBzMdhD7yNppm++393l3PpXwzYV9E3ToZsBQZA8jl/u
         bSYBv0jJyGxzYX1vPpAlVXtHnFvabbUvZe5BhZJgabrd+mBwTNfY2B3EqDyVOHtAH0Yi
         mn2w==
X-Forwarded-Encrypted: i=1; AJvYcCVrIny5y1ga1LaiboDTkYEeey7RCS0u5H8PY4eXjVHSJMH0+nZG0TNfP1vacR7m7PWa4Fbhei6p0MN0Aok=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUP99YMPurC6VbV7mjAQF8tHdKtFBwiP80+5bz6wMkK0Vok/c8
	oOI7yr2XaJhAvnoAXII/7xJkcHCSfqhb4TB5+/ZZu8XqyAWE8i2/CmL7
X-Gm-Gg: ASbGncvop/hAzS4g4s8DOALJr1vk45RYrfm5q19W6hZTRdVGdVZXEeZ6dp/p5sE2M/i
	vHBz71MZeuZl3QSKRJbKlv7nvwOvY9aCbLwrEIv7SsjP9h7EbaHnP9l1tAIrZX/kNP1HtD86pwc
	E3BIRk7iwxr+Y84avVC/tqDQmQ5QHWNfiDpwYVkOVI3RvbRd0EQl8pqBA0AxZG/AfNdw6K+a9VF
	eiVgfNQMpsomWJamkb13LtdZeMwYTsxhdskQPrGXrtC2v2Ta1HP9t2YHKUmQtURXXAobrj7m1D0
	h5FbpQpby8SDvojSGqMBu8TU1xTTeQ48gU5D5hv9X6SlFHPyUp+XzjU8bniugSWY5GoBN2ePotW
	1jCzmS7Uy0wCeCKkJia+ySLDRcGLwLg==
X-Google-Smtp-Source: AGHT+IFG3HhPFkz+qtw92oXcVYjk4OmnMTqrCVzqVo9yJnT3TN9zD85Dun5JE7oBPMOD+2/eC/yMAQ==
X-Received: by 2002:a05:6000:1ac6:b0:3cb:285f:8d9c with SMTP id ffacd0b85a97d-3e643555f89mr3248654f8f.48.1757235878644;
        Sun, 07 Sep 2025 02:04:38 -0700 (PDT)
Received: from hangmanPC.. ([86.124.200.102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dd60b381csm100851935e9.17.2025.09.07.02.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 02:04:38 -0700 (PDT)
From: Cezar Chiru <chiru.cezar.89@gmail.com>
To: andi.shyti@kernel.org
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cezar Chiru <chiru.cezar.89@gmail.com>
Subject: [PATCH] i2c : i2c-algo-pcf : fixed errors and warnings in header file
Date: Sun,  7 Sep 2025 12:03:44 +0300
Message-ID: <20250907090344.30917-1-chiru.cezar.89@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed code indent should use tabs error, missing '*' from
multiple line block comment warning, space prohibited after
paranthesis error and no space before tabs warning.
My motivation was to fix all errors and warnings in
drivers/i2c/algos/i2c-algo-pcf.h file.

Testing:
    * built kernel with my changes and I2C_ALGOPCF=m enabled
    and it built successfully.
    * installed kernel and external modules generated by build
    * rebooted and loaded using modprobe i2c-algo-pcf kernel module
    with param i2c_debug=3 and no message was found related to
    module in dmesg. But also no error was generated.

Signed-off-by: Cezar Chiru <chiru.cezar.89@gmail.com>
---
 drivers/i2c/algos/i2c-algo-pcf.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/algos/i2c-algo-pcf.h b/drivers/i2c/algos/i2c-algo-pcf.h
index 2448ab192ce5..d9393092aaf1 100644
--- a/drivers/i2c/algos/i2c-algo-pcf.h
+++ b/drivers/i2c/algos/i2c-algo-pcf.h
@@ -3,8 +3,8 @@
 /* i2c-pcf8584.h: PCF 8584 global defines				*/
 /* -------------------------------------------------------------------- */
 /*   Copyright (C) 1996 Simon G. Vogl
-                   1999 Hans Berglund
-
+ *		   1999 Hans Berglund
+ *
  */
 /* --------------------------------------------------------------------	*/
 
@@ -25,7 +25,7 @@
 
 #define I2C_PCF_START    (I2C_PCF_PIN | I2C_PCF_ESO | I2C_PCF_STA | I2C_PCF_ACK)
 #define I2C_PCF_STOP     (I2C_PCF_PIN | I2C_PCF_ESO | I2C_PCF_STO | I2C_PCF_ACK)
-#define I2C_PCF_REPSTART (              I2C_PCF_ESO | I2C_PCF_STA | I2C_PCF_ACK)
+#define I2C_PCF_REPSTART	       (I2C_PCF_ESO | I2C_PCF_STA | I2C_PCF_ACK)
 #define I2C_PCF_IDLE     (I2C_PCF_PIN | I2C_PCF_ESO               | I2C_PCF_ACK)
 
 /* ----- Status register bits -----------------------------------------	*/
@@ -55,7 +55,7 @@
 
 
 /* ----- Access to internal registers according to ES1,ES2 ------------	*/
-/* they are mapped to the data port ( a0 = 0 ) 				*/
+/* they are mapped to the data port ( a0 = 0 )				*/
 /* available when ESO == 0 :						*/
 
 #define I2C_PCF_OWNADR	0
-- 
2.43.0


