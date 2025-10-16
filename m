Return-Path: <linux-i2c+bounces-13594-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 140A0BE47FF
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Oct 2025 18:15:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 652174F043C
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Oct 2025 16:14:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9307732D0F3;
	Thu, 16 Oct 2025 16:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IGF+f/dF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABD332D0EF
	for <linux-i2c@vger.kernel.org>; Thu, 16 Oct 2025 16:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760631286; cv=none; b=cJsnt2/dNWAi3nzXZW57/r9RrEq18epYShbMtj+/9/z9j5V5UXYjQwFu4e3ICcjfoFPOqsaWuSulMVhGZ3ngLURoHEcVurV81MyGc+2OxF9Z8O5odzh0h7SPmn0ck9VSe1uD2a5XwxoVoAV+LNA+AHICGgsy1P/UdQlQmeVl1XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760631286; c=relaxed/simple;
	bh=QkK1F0a+kzX8my9YSnIKVxkRpFz6GcOBLwOB3cM8EUE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LNXZCmdSgQni4njNtor09lYApq5SNt2vUZkRSOJRFPrhjQeGIrpj2LcngnulR9CfYSpjbcclAQFSLQTEu2cwNwsZ/jPCKO9zgRhtax/zcTTNDMYOxnRX2N7+mE6F8qcjDwnWF86b7v7tke3adEI6eB52AqKPMPY0NOjyApswCYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IGF+f/dF; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47117f92e32so628985e9.1
        for <linux-i2c@vger.kernel.org>; Thu, 16 Oct 2025 09:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760631283; x=1761236083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QebA45S2Kmxb5ZKr9Gn50ibmhNW02p2JmvNbHpjCTfM=;
        b=IGF+f/dF79NJJN+v57Y4SkpuWESImlpjOcNlaYCOgQjRSqA8x5j/kWlp83SyUhIvyc
         iojylXQGQJl4FHXWi69FIdNcaHoKA2+186nY+tc2bd5/zHchJ4l4sSb0z98EItGCWtlx
         4CYGN1Xd5kUekBkRAOiDbB4BitJpLRVm5ZX2P/hlcfEvauHj95rVMJ6stC36Rs6s8LBw
         EmGJiPXDETSi6BSJVJp1IwrCin5qAtO/uM4kB8WyNdicLsPKmdrcEf7L67608z6AyaL1
         3TY19O8JgQiWR2GDD8InV1kh+MhX2C1moHjHKmxLNKwQNw0RWv33/fqML+rQZMctk/cs
         M5NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760631283; x=1761236083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QebA45S2Kmxb5ZKr9Gn50ibmhNW02p2JmvNbHpjCTfM=;
        b=uRxVHXAUr4aKtat+DefYY6R9zYByAG3eKm4nrgEAUUYOxtOScKMlctGQK8oGXaW0ZM
         YDClBGiq1f7O6OQOuGrWx0p8oKrBwOr8Uwzoa8kyKvyYUN6X2vn/ORUyHJoMUpwjS1l5
         w51gsNeC32Lyyz9Lc46AVZ+UBM7dqReWJG0zSYbkjx+sVFNkBRf95t5VdREbsB7wCE5l
         vThfTZUAlYNyHKygcLXWZsIkuQYE00UV0ns/tK5ftTwLz5CBY4Ovm7ZGW+aPsJGN6E8Y
         WQvVxqcSurxqoKm4Z/qxtEEQmkrba9PvRjRb77D13hbXShh2qYt4OVUBUxFXsNSy6AEg
         SpUw==
X-Gm-Message-State: AOJu0YycujuZJn1h6AmpITBQY825RBRi/6ItrIaMznckH2lTJCfNBU5q
	kPPZdZ0OaMVWMm1lcjuYntOtF2gKVjHX2QCl+KmzbZ7ED+YUneB8bWYP
X-Gm-Gg: ASbGncuo+BElGae9xGEROlvsZwuOLH27WoogzJgKnXHNc6S2rGZtXRf6PuLaM8zCWeS
	9m9LGGFd3Fp6Wvh2TzZwiZ6YxcxFbLL3oIrvFEKL104Zhbqaf/KGpZF+nPfON1jvlDO4nD8anfC
	JfgSyKCnSwW7zxNiPHnWKN1/KQ/gSO67Ft09/Me5IZX/YhAxR6diNjCVmRGYBkG+HHJWsgaKkES
	7fG7uJB73c7yuJlWJrpcJKRyEge9BRNSc4WvzJts+a4SumJfu5tD6QTTknzULpNvoM6j5ScK0Hr
	wOFrGwiXxmpcWw4yv8wdQgIJSCA2TIiEQRCvTiJcvf8MuCw6YRjV2xpJOnajYCM4dzEOn2o2Qm9
	1d40MyKdWKk87pYBBK5e+GxdcMng2lH6PdqZpipTvxa/Vl1ykrbMMfzAAEkEejLGXlg7KN9FT/U
	AtXnXT3Q==
X-Google-Smtp-Source: AGHT+IGtx1i5Q7LForVkl0yTFOOrlfkKTYlJiN17ESVyb+Nxb0A1FTabJKlUAdVFEkZUSPmpz7gq1g==
X-Received: by 2002:a05:600c:4ed1:b0:46e:506b:20c9 with SMTP id 5b1f17b1804b1-471178a1d2bmr4308095e9.12.1760631282268;
        Thu, 16 Oct 2025 09:14:42 -0700 (PDT)
Received: from hangmanPC.. ([86.124.201.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-471143663afsm35654025e9.0.2025.10.16.09.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 09:14:41 -0700 (PDT)
From: Cezar Chiru <chiru.cezar.89@gmail.com>
To: wsa+renesas@sang-engineering.com,
	andi.shyti@kernel.org
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cezar Chiru <chiru.cezar.89@gmail.com>
Subject: [PATCH v6 0/3] i2c: pcf8584: Fix errors and warnings reported by checkpatch
Date: Thu, 16 Oct 2025 19:14:14 +0300
Message-ID: <20251016161417.15545-1-chiru.cezar.89@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250926154520.40583-1-chiru.cezar.89@gmail.com>
References: <20250926154520.40583-1-chiru.cezar.89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello maintainers,

This patch series fixes 18 errors and multiple warnings reported by 
checkpatch.pl on drivers/i2c/algos/i2c-algo-pcf.c file.

The series PATCH v1 to PATCH v4 is a response to the discussion on the
mailing list with Markus Elfring who had comments on my earlier 
submissions. 
He suggested:
 -to split my initial submission in a patch series
 -had some valid points on imperative mood usage in commit messages
 -wrapping commit message to 75 columns per line
 -change some of the commit message to point usage of checkpatch.pl
The series PATCH v4 to PATCH v6 is a response to the discussion on the
mailing list with I2C SUBSYSTEM maintainer Wolfram Sang who requested
some changes:
He requested:
 - to remove debug macros from i2c-algo-pcf.c as no code change was done
 for almost 16 years.
 - remove wrapping paranthesis from value assigned of '(0)''.
 - resolve conficts caused by debug macros removal.
 - remove also printk and dev_dbg function calls related to DEB macros.

Here is a brief summary and order of patches to be applied:
Patch 1/3: i2c: pcf8584: Remove debug macros from i2c-algo-pcf.c
This patch remove the define of debug macros and also their usage from
code along with printk and dev_dbg function calls.

Patch 2/3: i2c: pcf8584: Fix do not use assignment inside if conditional
This patch takes the assignement from if conditional and moves it by 1 line
up.

Patch 3/3: i2c: pcf8584: Fix space(s) required before or after different
           operators
This patch adds space(s) around some binary operators.

Testing:
   *built kernel and modules with I2C_ALGOPCF=m and my 3 patches applied on
   top of 6.17.0-rc7.
   *installed kernel and external modules generated by build on my laptop
   *rebooted and loaded i2c-algo-pcf.ko without i2c_debug parameter.
   *when loading the .ko with i2c_debug parameter an error is seen in dmesg
   and this is expected as the parameter was removed.
   *No success message related to i2c_algo_pcf was seen in dmesg but also 
   no failures.
   *Module loading and unloading successful.
   *No PCF8584 Hardware was available.

Cezar Chiru (3):
  i2c: pcf8584: Remove debug macros from i2c-algo-pcf.c
  i2c: pcf8584: Fix do not use assignment inside if conditional
  i2c: pcf8584: Fix space(s) required before or after different
    operators

 drivers/i2c/algos/i2c-algo-pcf.c | 93 +++++++-------------------------
 1 file changed, 18 insertions(+), 75 deletions(-)

-- 
2.43.0


