Return-Path: <linux-i2c+bounces-8360-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 849D79E7C58
	for <lists+linux-i2c@lfdr.de>; Sat,  7 Dec 2024 00:20:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55E0F18859AD
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Dec 2024 23:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEC6B206276;
	Fri,  6 Dec 2024 23:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fbf4rOcP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D9C1F4706;
	Fri,  6 Dec 2024 23:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733527241; cv=none; b=raEB975+x2Au9CKoNpnxhbC3hcEE3MPfKqLFNyBrjjw/ETlTmW0Eo0tWZpzfKR8tI1guGyZhdgboFs5zgquQe49bC6+FlVNQn0MvEkv03+/Lk/FAxZWCBMX8nGVef8tvG/uRtXYtljwqvN0HIdkbHOOOJ4K3XX1Sg8zWne92iKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733527241; c=relaxed/simple;
	bh=KeYg3MycPle5RHn6ARMJNrmNcPW0/jHSxgJyyCQOPLk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZnzIapMMcvdesozaRE9x4CtMiGRVsPePcsiVJ0wdL11lrMnTwCWjkRfTT8YPmHlBC+Yb7R5cNW1MMlQeM16eB5tyuIrVV9n5L5EC9Tfur4mZ2BCqKHOnmQSLMBd875dWRemStvKxn/BZKqDZ/3DCTBrb3lzUlMoEYIMbm+P0ES0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fbf4rOcP; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5d340313a4fso2225008a12.2;
        Fri, 06 Dec 2024 15:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733527238; x=1734132038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P4h1nqGewaKzsi8QNniPMbF/tinUcgzwDW10s57UOc4=;
        b=fbf4rOcPaw8IGgc2FuZ9PnTM6sUmvxorL6yHnw4HW9YPSvm9iL+btKIacdpxouDLcE
         /6ix94RNkuQK2YP8GytuSKWjK70s53jmRtj5SMWE7R6xsa9ucj/Wn6nxo93UtZ/rmK1r
         N176MM7pW5v/BGLYUHzJH5BAdyCH7BQXvmwOnXPvyUKgaRCt6atdcsAinP+gMcSKxcZ2
         FyjLPlzeTDw0/NMmpv8wRqkf8a8Ba9Qz/5XeAlXNc+PnsUSGAxgRNYwYLUU+5/c8kSu7
         ia4vw17OY6WO/mTiP0vOnYL8LO//2kS/NiFxjxEi+woHGlRj/2RPdVh9MdXi5FXPi+sR
         uZOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733527238; x=1734132038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P4h1nqGewaKzsi8QNniPMbF/tinUcgzwDW10s57UOc4=;
        b=eR8S8CgvS/Pciev0E9lxMq0GIVPpJEab2ARpigeJ09IQus5/5R7pVSzcCePsZW5mCF
         XwnPE10inPz+2TlklaSmf/rTRQJ7ttwl3jjtaCxd6VO3w0kHQ5Kg9SSsgzhZ0edj+0aT
         D5/Inu/wZ3Dqe/6PaBe0vlPgx293aP0jVda+gcOwLXRCHSB5HPsLorMhGsjgwdl4qc/P
         /T2KCmvmB+Pr3rKBSe/kusWmtbwVlGFb8slxeFdOIhotVnQQBYJ43xfa1ACtnmBnGPUb
         QF85ogPQ5TJfaBmSl+vdQYtOjqkwp/5PfOPDvjxJPbIpapsxQi8KoNmuIrkPSVP1XZY/
         5vVw==
X-Forwarded-Encrypted: i=1; AJvYcCUFWJMop8Y20Dho5uG17fbmBmYs/NgJGENcr9KnvI6HOJVhb9ru9Jz30yJh/xwR4OVIVqC82JY/5UM=@vger.kernel.org, AJvYcCXasgU2WOCXVBAGL2gQ9C8Tb35bbY9Q9UqS0y0Vby3l010nMA0af5/jPaCl+byKj2r01YAourPPMGso7MBG@vger.kernel.org
X-Gm-Message-State: AOJu0YzFZhZC4JWosIK4+d3Fnau4GAy+SKMl2BtIQlOXTpawV8eW6Ztm
	T80vceS5/DlD5FdYa8WgS1PNjhyRlOhaaPpNYEjPag5v4M8Q8+8=
X-Gm-Gg: ASbGncvd2f++167JqYZ2x8+fpDaXglyggqpBxU+PBWqLn4pfITp2mPc211hX01POAdZ
	n6jcL54Lh2DNgmu9joDf+uHQ30Y9nFPutM5rWAcuzAFqRpi75GwdLQyPCjdj3IkGWRpECDf10GQ
	+Bi5nU5S6X0pgymRl5RkAKkbnM2x5z8XIP301CjtxSJHRC3/OAjlhRvDRhN4fo1bMk7acStYafY
	Sh640Oh+30fGHXOxsr3tFjY0/YeHGbAKVAjY7GOTbbXKV2KFqrRThU5kss/nCZPRO5dtA==
X-Google-Smtp-Source: AGHT+IE6Nj5sbj3vQqbPGZzxXqk+OdVeuuu8XMzGsoeDnc4KTpBBzFjx2ggheX/nQimxUwbTOd7Gaw==
X-Received: by 2002:a17:907:3a18:b0:a9e:4b88:e03b with SMTP id a640c23a62f3a-aa639c1960cmr293604166b.0.1733527238047;
        Fri, 06 Dec 2024 15:20:38 -0800 (PST)
Received: from vova-pc.cloudlinux.com ([46.161.87.65])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aa62602cff7sm300794066b.130.2024.12.06.15.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 15:20:37 -0800 (PST)
From: Vladimir Riabchun <ferr.lambarginio@gmail.com>
To: 
Cc: Vladimir Riabchun <ferr.lambarginio@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: pnx: Fix timeout in wait functions
Date: Sat,  7 Dec 2024 00:19:34 +0100
Message-ID: <20241206231937.86408-1-ferr.lambarginio@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit f63b94be6942 ("i2c: pnx: Fix potential deadlock warning
from del_timer_sync() call in isr") jiffies are stored in
i2c_pnx_algo_data.timeout, but wait_timeout and wait_reset are still
using it as milliseconds. Convert jiffies back to milliseconds to wait
for the expected amount of time.

Fixes: f63b94be6942 ("i2c: pnx: Fix potential deadlock warning from del_timer_sync() call in isr")
Signed-off-by: Vladimir Riabchun <ferr.lambarginio@gmail.com>
---
 drivers/i2c/busses/i2c-pnx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pnx.c b/drivers/i2c/busses/i2c-pnx.c
index d4d139b97513..9a1af5bbd604 100644
--- a/drivers/i2c/busses/i2c-pnx.c
+++ b/drivers/i2c/busses/i2c-pnx.c
@@ -95,7 +95,7 @@ enum {
 
 static inline int wait_timeout(struct i2c_pnx_algo_data *data)
 {
-	long timeout = data->timeout;
+	long timeout = jiffies_to_msecs(data->timeout);
 	while (timeout > 0 &&
 			(ioread32(I2C_REG_STS(data)) & mstatus_active)) {
 		mdelay(1);
@@ -106,7 +106,7 @@ static inline int wait_timeout(struct i2c_pnx_algo_data *data)
 
 static inline int wait_reset(struct i2c_pnx_algo_data *data)
 {
-	long timeout = data->timeout;
+	long timeout = jiffies_to_msecs(data->timeout);
 	while (timeout > 0 &&
 			(ioread32(I2C_REG_CTL(data)) & mcntrl_reset)) {
 		mdelay(1);
-- 
2.43.0


