Return-Path: <linux-i2c+bounces-12774-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CA72CB48FC9
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 15:37:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4AC5C34410F
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 13:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C756D30B52A;
	Mon,  8 Sep 2025 13:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BYq56xGg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB67C30C605;
	Mon,  8 Sep 2025 13:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757338598; cv=none; b=BF0HoFOdEYUPpH4mcRiz3VjVtseIaWzMMcycjQL0aA+WE4P6tsYiQ5ffRL3I1dM/sQGn3hSctOa0GRNZEu2Jfkv5ooT0zP77EzpqofziXmF19eShYf4egiEw36PWneyajdaSuOffrOl/gm37Tg1vd3MPcbl0bBxKxF96B7MJGTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757338598; c=relaxed/simple;
	bh=8ZP2d7MWdPMW3TuqHaHv4WwQJH0eU66TfZPE++TgSZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MnRX5193FxNfCyXvmIIGEm7VyQ0QGu4VQPTRQZ3Ty+nndOVgkofSaXyPvO0es+HMWUOJTUjXlGfk/XqLDaAzV3CHB6U3eEGlObj3rTEJmw+krbKUn5ABX2Zr7Chd93CVRC4lckSBqtp0CNyzm3bpTRFmYjCToyAAQi6dhlRA7BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BYq56xGg; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-628caee5ba2so1690842a12.1;
        Mon, 08 Sep 2025 06:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757338595; x=1757943395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i3oUSyXBh20XGavn4ZmpQFyjojWktm6chZH/CpBk0Y0=;
        b=BYq56xGgKUmIDu5mO6HzJ7hifb0sdShsEnFnuR4ZRofTYofmkchxJ21YpsfPsl4mnO
         QuP+jKKtYniXScbc7z7BYj6d4XsAMYCSWYjqFcPXfaARmuekotoZq5Vwvn+e00nY0ZVL
         Xx0lx4bi5Ixf+/yEokTSuVWTrlUMPjenJk5KJr0HFWpAIH/RjrMzQ2OgDnyKQdwGeTn3
         TG+RLGLbFlwZfaE7uz6rPjN9f1Z/acbQ6Sa9FLfddiCk1kUKwO3oWei96nMtYPm7ZDQw
         ERhQUOgpSBKDmsK4vHmsrJ6ZUts/jdmUikr/zK6uz/pMd68QzaV83OaXs3n0TQBffTRV
         QMYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757338595; x=1757943395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i3oUSyXBh20XGavn4ZmpQFyjojWktm6chZH/CpBk0Y0=;
        b=U9JA7X2b9pEqq1GE5RwXLh92BVLmaajPsabf03gXEiXcCDhBnNdedrolmuruxhoyZs
         DfhOU15qib2M9L/mLfqIsS87EdbLIazJGrXSLF5hpu4qbYVWR76Gbvoqfoc0m0QUVhpV
         DfNMN7RMwbSnks6X6bvKSLP6fNY3isdizD94X505FB2nUoQTCDnkQkUvNM0Y9R8/IR05
         wB5GZ+fXMrbbLQ8TaBmqi63F1QzM5nNVLzQ3v0xbyVVs+O+wIWSg5W6VP6sPnqBHiHXK
         s1XWDWvsE0S2CGy/nBY4LithP+lhSeLhlZGqOKpD5Pt43wxqePnzVnuooCnp1KLMQpRF
         Nb1w==
X-Forwarded-Encrypted: i=1; AJvYcCXKsvhITaBFfI5B3RyIpXnTdcQ3hWHXd5w+vxDAqyuprBNRuh5hY6CD+Y5wgfwxn27RIrBUwmhrguhHqwg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5YtDov/yf/3hQG6x2ZHZ8+9+8G91NfTIfR2eSAW6frIiwBF8y
	HJkcrQo0o79gCBuIV/zh7gZmAusCvyeC1Q1xShfPm0cQFiJ/xBrjXmPR
X-Gm-Gg: ASbGncuHYHE+xOAaKsu17/yIWeqeHHM42Wsw6viLzoAqrWttDhfBGp7GQmg9RqxTz5R
	4SGE8tloDufwTzAvJSX8pxP0upcaing5Us0/JAIcsiYWrIBmsM3JMN3sp+oalxi1V9hqvui25F/
	18ZTK/nQp4gdoi+RQulyCf1jCY6N8wpP37zFNC+HP+mjeXrlHiesblHc7z8CrBfzx+EaDdf4aOM
	FBJiefku66xlOnSJKSEMnUL/kLwLvzGiQVXf0cR4zF5MtvgwD4iGMX7othfyY1NnoeAjtlkAJLu
	yar76Bkv9qTR4sy+TxsoK87mXGRGFJAwLhklCT3L6gptZLUql2sCUq0BtxUuUhvXqsV0lLXlr4A
	7aYG/YEIP1fVWC96skWTf43se+1gdOxRjnogV1UAr
X-Google-Smtp-Source: AGHT+IE3dnm8NC2yHbKEqBJjVTJ4KyBs3UWalLlUMWcC1z7xFKABR4362dWNo4CXjmdqshL3H/cf6Q==
X-Received: by 2002:a17:907:1ca2:b0:b04:16fd:9539 with SMTP id a640c23a62f3a-b0493291242mr1311237266b.29.1757338594886;
        Mon, 08 Sep 2025 06:36:34 -0700 (PDT)
Received: from hangmanPC.. ([86.124.200.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b040a410817sm2177352266b.101.2025.09.08.06.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 06:36:34 -0700 (PDT)
From: Cezar Chiru <chiru.cezar.89@gmail.com>
To: andi.shyti@kernel.org,
	Markus.Elfring@web.de
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cezar Chiru <chiru.cezar.89@gmail.com>
Subject: [PATCH v2 0/3] i2c: PCF8584: Cover letter
Date: Mon,  8 Sep 2025 16:36:05 +0300
Message-ID: <20250908133608.45773-1-chiru.cezar.89@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <7e155481-b1b7-48db-af64-6a313ade1bbf@web.de>
References: <7e155481-b1b7-48db-af64-6a313ade1bbf@web.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---

Order of patches to be applied:
1st: * i2c: PCF8584: Fix debug macros defines of if statements
2nd: * i2c: PCF8584: Fix do not use assignment in 'if' conditional
3rd: * i2c: PCF8584: Fixed space(s) required after different operators

Testing:
  *built kernel and modules with I2C_ALGOPCF=m and my 3 patches applied on top.
  *installed kernel and external modules generated by build on my laptop
  *rebooted and loaded i2c-algo-pcf.ko with param i2c_debug=2/3/9.
  *No success message related to i2c_algo_pcf was seen in dmesg but also no errors.
  *Module loading and unloading successfull.
  *No PCF8584 Hardware was available.

Patches 1 and 3 report 4 and 6 warnings when running checkpatch on them.
But the warnings will be fixed in a new patchset that addresses fixing warnings.

Cezar Chiru (3):
  i2c: PCF8584: Fix debug macros defines of if statements
  i2c: PCF8584: Fix do not use assignment in 'if' conditional
  i2c: PCF8584: Fixed space(s) required after different operators

 drivers/i2c/algos/i2c-algo-pcf.c | 62 ++++++++++++++++++++------------
 1 file changed, 39 insertions(+), 23 deletions(-)

-- 
2.43.0


