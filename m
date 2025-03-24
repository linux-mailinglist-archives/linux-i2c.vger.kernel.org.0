Return-Path: <linux-i2c+bounces-10001-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7774DA6E475
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Mar 2025 21:32:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B05653B252C
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Mar 2025 20:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B47311EBFED;
	Mon, 24 Mar 2025 20:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jNxSyynZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5E71DB924;
	Mon, 24 Mar 2025 20:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742848209; cv=none; b=VTYXxpIn1acL2qT6CCDNjEtzCN54LLZCyRn2gfEZDBQfKl+Z/CbjIoYjSFI3bwRJ8nvnardo8TUNoYoXkipoJLkX4hwohp3djP6wD8dYvgnS9JaZ5/K7eZ0D7waSlyteXulY6Q93+w6liNcIiEYQvM9VoFb9KifJJvQObULBQmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742848209; c=relaxed/simple;
	bh=wJJhq3/wlH7TPRz9MWrbn18PJigvU4DbdV8z+Bppecg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U6C39/geXYc96OPFCmWYZQuETEwFwwX2vyQ0IyVMsUbSHyWctOFXXlcyYcQhkCL3qWqYTottY8xUWz9tM823Kbl2iuFYLOG2p3E9g8hdMyl7lPhd79h6vhzLR53inkJnrw0+tvU9z4bat/1t6jNGtiKGm6xDt6tS1q3Tt2dRYtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jNxSyynZ; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22398e09e39so98303965ad.3;
        Mon, 24 Mar 2025 13:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742848207; x=1743453007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kElO5D7Zqv8+xK19MHfo4Wrl9/d4L4ea0wa2HkxO4SI=;
        b=jNxSyynZkZcs47NouC0GOoKGyLtQMzoq8Unt/XlpvYFXHwSLEnXrtPnQbUWvrbiAIO
         6JcIU0f+Q1cwG6VUcUkItbgVkLIe4rOCNEw1rVkxVQ5ZIr7/atXsvBjXFTY44IQEgyLs
         we1zejmtUhQchDCXeDfHwSkk7XWAr5F7pQXMaGitXlIt36ZO/gNQgSJ+CAUusL9LKWmD
         k5J3FuRQyH/UdSpgoUAlcPA/9tKQly218zcKCp81Pl6+gdOA9SEZZ2fhb31lPoDVsGo1
         zNkRZXYeUa6B0gobrOafrDGMQR/u/ib75tLbARbjpZBsSGbJHZE2q0B9bBn9oK3BX23X
         u0Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742848207; x=1743453007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kElO5D7Zqv8+xK19MHfo4Wrl9/d4L4ea0wa2HkxO4SI=;
        b=tC+ksYf/ynX1bwfj5gypIUgr9fJ6p08OIWQmBIApCZIc/ftbUYctj2+eWZN2zcujD4
         udgqRrAzFz8OFHQfR9RGnqbPRtykJ9fh/8fESpLQUEa3mGwkERTQO7QXkh6hJLOiz8uo
         /rUd+PRKQ1K+pRxUL9Zj/hzAgTmAOOIN2vPI8jVYV+WW6MjvsKt9M8pf++lp/2PVoyrS
         5IJu/8kULcMyC2x//3TfBwQX1E6qzueUJrN7BP4FFKb9aon1LYpkTfkLUds2ZmI5vUHS
         UDOEdbrqw1lk0+ole3a7CB0v1mAEwFyKfqSPXrlEr2AfblDg+uoeq3M+687PukRNfqp/
         q9yQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpK7cBWqpc2CkHxzpGataankR9B1NvlNp5I3LGRh5i57af3FPrh14wNHYJdDUaBd+DjTudp5dXgRT4VWKe@vger.kernel.org, AJvYcCV2IaPCCC6Q4y+FrG2BpYTCAKfO5PZeG/R0oxgtZYrLzd5i8qTAYt0L9q3gx9WYZdbo/DiLAK17QMk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyU5qJ0+UX3bU8AfgRh4wd7YWZGhS+HOdthip8VWBqGyoDusnDX
	17EwkdqEARTf8ojx24Xup19f/5hGUhxZrJqB2Jnz2q9XtnkND5Fc9wd9da2eTC8=
X-Gm-Gg: ASbGncsxZaBK/oXQpHMfZyk4w1R6iFoo2Nyr/GyYiTqr8J3gvH7Ir98KhCZ/5ynRj56
	O6ssTJb/miQ+/1bETQNCyzRBaiU8L6d/yBo8mRd2nxA55KIgLEdgcbWwXHvunAEW4Z3sjuzE7o4
	0GX3O7UsO8vQfaunaIz/YeHZZoWe+nc7oTTfoKfW5ca9CAiqo+A6/2hpZbmsro7+yDWmTRx8L90
	ZqxsEqLNaL7KuapTnA4I7e7ZwG061bEOpSITzQW1GrYQd2hwULJ6X1js8pzKHldHzHivM1/Mf/D
	eT2qInVTNQhgQtyOc98+YjIPb0fp5qPa2A0Z7JxJxt/cwBFdBCI5uuQsNVVhiA/dfEzJlMHfoAc
	RoM4CkSFzjkGxZRZNfRVnA+HhRm5NQQ+eiJd6Prb0xA==
X-Google-Smtp-Source: AGHT+IEyfOvubyKcs/FYRHT1trQZfByq+iQfMNula2Al6lFJPKIE++NRjplQ5cwukg/PxXizviePFA==
X-Received: by 2002:a05:6a00:2c98:b0:739:3f55:b23f with SMTP id d2e1a72fcca58-7393f55b36amr2374072b3a.14.1742848207061;
        Mon, 24 Mar 2025 13:30:07 -0700 (PDT)
Received: from elbadrym.c.googlers.com.com (34.125.168.34.bc.googleusercontent.com. [34.168.125.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390611d212sm8771886b3a.95.2025.03.24.13.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 13:30:06 -0700 (PDT)
From: mohammed.0.elbadry@gmail.com
To: 
Cc: Tali Perry <tali.perry1@gmail.com>,
	Mohammed Elbadry <mohammed.0.elbadry@google.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	openbmc@lists.ozlabs.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] i2c: npcm: Add clock toggle in case of stuck bus during init in npcm_i2c_init_module
Date: Mon, 24 Mar 2025 20:30:02 +0000
Message-ID: <20250324203005.1266044-2-mohammed.0.elbadry@gmail.com>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
In-Reply-To: <20250324203005.1266044-1-mohammed.0.elbadry@gmail.com>
References: <mohammed.0.elbadry@gmail.com>
 <20250324203005.1266044-1-mohammed.0.elbadry@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tali Perry <tali.perry1@gmail.com>

Signed-off-by: Tali Perry <tali.perry1@gmail.com>
Signed-off-by: Mohammed Elbadry <mohammed.0.elbadry@google.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 3ad6124be80f..78c85015d955 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2043,10 +2043,14 @@ static int npcm_i2c_init_module(struct npcm_i2c *bus, enum i2c_mode mode,
 
 	/* Check HW is OK: SDA and SCL should be high at this point. */
 	if ((npcm_i2c_get_SDA(&bus->adap) == 0) || (npcm_i2c_get_SCL(&bus->adap) == 0)) {
-		dev_err(bus->dev, "I2C%d init fail: lines are low\n", bus->num);
-		dev_err(bus->dev, "SDA=%d SCL=%d\n", npcm_i2c_get_SDA(&bus->adap),
-			npcm_i2c_get_SCL(&bus->adap));
-		return -ENXIO;
+		dev_warn(bus->dev, " I2C%d SDA=%d SCL=%d, attempt recover\n", bus->num,
+				 npcm_i2c_get_SDA(&bus->adap), npcm_i2c_get_SCL(&bus->adap));
+		if (npcm_i2c_recovery_tgclk(&bus->adap)) {
+			dev_err(bus->dev, "I2C%d init fail: lines are low\n", bus->num);
+			dev_err(bus->dev, "SDA=%d SCL=%d\n", npcm_i2c_get_SDA(&bus->adap),
+				npcm_i2c_get_SCL(&bus->adap));
+			return -ENXIO;
+		}
 	}
 
 	npcm_i2c_int_enable(bus, true);
-- 
2.34.1

**Reported-by: Mohammed Elbadry <mohammed.0.elbadry@google.com>**
**Tested-by: Mohammed Elbadry <mohammed.0.elbadry@google.com>**

