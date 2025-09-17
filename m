Return-Path: <linux-i2c+bounces-13020-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 486C2B7F6DF
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Sep 2025 15:40:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D4FB3AC300
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Sep 2025 13:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42BC330F93B;
	Wed, 17 Sep 2025 13:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KtPl/jKH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7D5221DAC
	for <linux-i2c@vger.kernel.org>; Wed, 17 Sep 2025 13:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758116182; cv=none; b=n8GZBWvCA5neD8R7YtzathG8m95/OTh1CWge5DLisalUCyUZ5fZGP7yXWjl3qvyNY2l/fEOOeWCQNqAuPl5hoZfkn0vZAqMBLpp4wd0MZB9nliGQmnec17bL7uMragV+/Iwh7iIm5fn6NHZm3fcLRUUSH3pRce3QCnfeRG7UJwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758116182; c=relaxed/simple;
	bh=MtQCXnttJR/RcxFaVTufRgSNP+DGHAXDkUOxfUvzCj0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hCZZ68NfDbuhyJVuLnIgni9nQ0kSCeQIENlyNTbnb30h4CBR20fJNFQTgp/PBHb6AEj0cm9leASi9Igw1ZPq0HtmVvpMcfixmEUu7q6/FXT/xj7d/BH3BCjnaFUUh8Wfz2XJIAxN3LW+dh26CjjrIXmh67eANHv+9a32IjyCoDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KtPl/jKH; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45f2313dd86so46744535e9.2
        for <linux-i2c@vger.kernel.org>; Wed, 17 Sep 2025 06:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758116177; x=1758720977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e2581FwEkYAN4RKWLim2gOtzFCASxyCQN0tdBJDniyU=;
        b=KtPl/jKHyufq2LQhLEG/E20LHnN7dCtwhekkaUmpJLlDfJmtfcbxVd0yPKtOPYSryD
         MLQBfRHj0FVuXoe1pzjcUHpHF1kb62hb/5gIee4BLNTYLtKScOAuQ27oXPXoU1EPrPlQ
         UQCWwXFLPB91LAH8oDpgRfpA8HzoIWLlbZvZQhGg9Ku1ue4v/M3kmZ/+mgkRCAQ+izN4
         t6EdMFC4DE2lNt2dBYOe0vNbbnOrjhRofu3aHwL5jqDQlOTq/kAIXAAzwl6ve4fvo5X7
         aJT0d5GXce3vCH7n6rfkrrJiT/f4YUeTu198hyaKRj0Hi1tu/enI42sccs80NruztFYd
         CIjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758116177; x=1758720977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e2581FwEkYAN4RKWLim2gOtzFCASxyCQN0tdBJDniyU=;
        b=abnsUj0lPRJMH/HDJ/HhUN3vskFTaarE4yUmXEPaqo8ks/PZB/QE+9j0TyS85U7U1t
         vNGPTugcdQvhdMF8EEXkUqpjYWR0huHZRIWLQi+EmEPG8LuLlRvNoCfB8iXeT9HlJRGB
         aWTEFyyR6VceIQBK29qvJ+AZiC+Bb3gp60pst9waK0Y9oeWO08NXMSki6TwGRu5c4vQg
         dDuZjsZmggEz69gnYnH728YgeS9fXrQvxnRKwqimsKUXUov7eOmescNq8pQQxSRr+0up
         B7q99EKV9CLkBZChZXa49XsrGCmF49DEWVwi27r84jMV8fr8BfIZsYNP8TxbgdVLQm5X
         QkHw==
X-Gm-Message-State: AOJu0YzxuVqAKogQrHgYAT4SmQm8ER1IHDORjbP7k/W+mJ4uorTQACNV
	FFC8PAYE+jPqGjTSc3igg7+LE/tJiWMMxarPKEAG4HbdeoXatdCJr164
X-Gm-Gg: ASbGncuWPmMKPaCI+xLxc+tcXf7vFvAhsJ8GsfXGu04iDNX4NiCfEEDiMKxwFxfV4n9
	hjK5OO1CeJ83+4hZjUhxPk5vYoV4smXmwDJEA2Fb6kFiIN3Nb6x4Bcz3OFq9lpvbno4meJwxcvs
	pEZuJNwwB+K4V/8e9ANWVJoF/9GTSUyAptD2oLzaX0vhGaLEGtCKdGciwib9ZBPoFS9QjYGmBvI
	QuAlRhkb2l2l2DJnpJdzdRV/oP/mCYWF974m75SJXbaDBJh3FZneqQ0qxuLyEeR0W3P1fUSozM3
	qD8yg2Bfo+76a9ayU/iRLBtCE9FCRFWpMijeMHSfakEkKxYDflUZV+7tSRVVwzpm6gwy45VlrCH
	ChGJ+lzXp4/FL4AhswaKNzNhm2CuIuQ==
X-Google-Smtp-Source: AGHT+IGS+zF0/zQwksQYOyUdRfb5vrA+loY0yqP1AHLYXXk/GAthk5FmNpqgANWxGaRWb7A7en8cCQ==
X-Received: by 2002:a05:600c:4fc4:b0:45d:d0d6:223f with SMTP id 5b1f17b1804b1-461fca45769mr23225415e9.0.1758116177331;
        Wed, 17 Sep 2025 06:36:17 -0700 (PDT)
Received: from hangmanPC.. ([86.124.200.102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46139ab391bsm38198075e9.21.2025.09.17.06.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 06:36:16 -0700 (PDT)
From: Cezar Chiru <chiru.cezar.89@gmail.com>
To: andi.shyti@kernel.org
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cezar Chiru <chiru.cezar.89@gmail.com>
Subject: [PATCH v4 0/3] i2c: pcf8584: Fix errors reported by checkpatch.pl
Date: Wed, 17 Sep 2025 16:35:21 +0300
Message-ID: <20250917133524.85063-1-chiru.cezar.89@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250907114557.15453-1-chiru.cezar.89@gmail.com>
References: <20250907114557.15453-1-chiru.cezar.89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello maintainers,

This patch series fixes 18 errors reported by checkpatch.pl on 
drivers/i2c/algos/i2c-algo-pcf.c file.

The series PATCH v1 to PATCH v4 is a response to the discussion on the mailing
list with Markus Elfring who had comments on my earlier submissions. 
He suggested:
 -to split my initial submission in a patch series
 -had some valid points on imperative mood usage in commit messages
 -wrapping commit message to 75 columns per line
 -change some of the commit message to point usage of checkpatch.pl

Here is a brief summary and order of patches to be applied:

Patch 1/3: i2c: pcf8584: Fix debug macros defines of if statements
This patch encloses the debug macro defines of if statements in do-while
loops.

Patch 2/3: i2c: pcf8584: Fix do not use assignment inside if conditional
This patch takes the assignement from if conditional and moves it by 1 line
up.

Patch 3/3: i2c: pcf8584: Fix space(s) required before or after different
           operators
This patch adds space(s) around, before or after some binary operators
and punctuation marks.

Testing:
   *built kernel and modules with I2C_ALGOPCF=m and my 3 patches applied on
   top of 6.17.0-rc6.
   *installed kernel and external modules generated by build on my laptop
   *rebooted and loaded i2c-algo-pcf.ko with param i2c_debug=2/3/9.
   *No success message related to i2c_algo_pcf was seen in dmesg but also no
   errors.
   *Module loading and unloading successful.
   *No PCF8584 Hardware was available.
 
Patches 1 and 3 report 4 and 6 warnings when running checkpatch on them.
They appeared because of two errors/warnings on the same line of code.
But the warnings will be fixed in a new patchset that addresses fixing 
warnings.
 


Cezar Chiru (3):
  i2c: pcf8584: Fix debug macros defines of if statements
  i2c: pcf8584: Fix do not use assignment inside if conditional
  i2c: pcf8584: Fix space(s) required before or after different
    operators

 drivers/i2c/algos/i2c-algo-pcf.c | 62 ++++++++++++++++++++------------
 1 file changed, 39 insertions(+), 23 deletions(-)

-- 
2.43.0


