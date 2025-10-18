Return-Path: <linux-i2c+bounces-13621-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 43199BECC1D
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Oct 2025 11:13:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BF7854E255E
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Oct 2025 09:13:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87E972D97AB;
	Sat, 18 Oct 2025 09:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iANsOHyk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966FE2868A6
	for <linux-i2c@vger.kernel.org>; Sat, 18 Oct 2025 09:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760778816; cv=none; b=JkU1gJI0MKxUBzfsYu5OUDvsYSai+LcORimCGfUsFG+IY08Wd5A/CbQoo0SaN5v0AV9A1GR/gis7PcIgl2UNy59SJ7x5aFBKo4ZcSPWpJpMuKbZ6lFEDJ4NR6a/+V3Si6XHnNaSKkFn/omM3nqztIIHQPsTyr3T5O0TMKYMC2ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760778816; c=relaxed/simple;
	bh=kRWSSYlxeJXOJX56TzIAI3EWsF8tHYoKYVfMeWoobSY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KtOXJ881sxygLUAcm7WY3tn0I7lxxGKha6SKv92QSkT9FZSJIIt9N0OlFzt2Pc+Hoo4s4ZDNCehfMAe3SjLjyYi1r50xW5Y6zaS+2a0a1XAhMImIIhe595BMO2KoegEGQz9nYVP2DI6OySmsYlOAByGmfC9Xzu86WxXNMo/EZK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iANsOHyk; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3f99ac9acc4so2396335f8f.3
        for <linux-i2c@vger.kernel.org>; Sat, 18 Oct 2025 02:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760778813; x=1761383613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ri8ca/eTLwKk89pXw9YmqbW3kCDhRAOEsuWhIOnhH7w=;
        b=iANsOHyks9qoBeryhCIc/QhyYRhSA9karmXFARhOGpPocZPwvGYeTYsaHqLKj6qYbX
         QHqe7cc46MKQIIRT0mm3zDaVybIoPtijb0TfEwfIaUN8Kz4hnykkXZMBdIsh66/1chsZ
         kx//c2Avi6tvby3lz57i9ImC2e6gWf882HcgK/QtfiKv460dbGHVUh1t8Qoplf07LtxK
         0e+gUOUx/bU9q37jRff9qVtIJe5mn0RLjvdK80i9JRQmqtqZlgar5bG2Xflrkkw91i5q
         KWMbgIHlKHhIh8Irz3t7HAeWet5blEGKYOI3SwXeToKEMmFxk/aGcuFsSjl3zvj4XMd1
         Notg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760778813; x=1761383613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ri8ca/eTLwKk89pXw9YmqbW3kCDhRAOEsuWhIOnhH7w=;
        b=PtzSrQVzPgtRU9IvlfoxkSpVXbHDxN6M/sLl02Auc5UZXcEs5A9/4s48LMGOHqgubs
         fAmVj+i1/+CVAxT73ylvQtU0oRVzi95lL4nyvqYvcd8sYom7kuzvLNB/Yr5+9XwyUkaJ
         FVwHjWkqoCkjsqaOxN6Bk30qwoP2il7H6RKYX3Sy6DE+CSpD/IfsFSgk8n0BVZksnxpE
         3yOfoT0JrHf0TSxwhixLyTteMbt/3/Z7GN2lAV3FDhshc3unDmanqhVfg4fWghWFYJ4a
         Sle4NZdHRngKYMJJQFHWim97bkkWNmmyWcY6FB9kabJVnfKSQzCgUePx6MOyiHVP9Ndk
         FevA==
X-Gm-Message-State: AOJu0Yx2k4rU+HmyPhi5EpieIQKLqY7tOqtT8qY3CatsC+hZehmgVUCp
	l5wTXW+dNlWD/zybBtDsOpAro3a9HwVet6qWsOYiGkIs3PAiHnTk8eyy
X-Gm-Gg: ASbGncuBfEIhFQWYC017vUFhuS7c/e4dkuty1yq72HOrjC1AqpK7MJL/y9YtWCiTVoG
	YRvqLJ7yqVkixiOwD0JGLlU2BkBE+BNUiz29eSritjsDZsUIzJEGQik1LAxRQAJ06Inr2JOkJuY
	LEZB9E7CSn5YNSxeF+LQnVLWVCWFGMnCmUW2lO2YVIiVVIOgTaaAgd0mJO7LZ49QGY8qQseUEhZ
	VM4xNesUkIMJsmGyFFZmYW1+etSHktL7IH6VXa7mFjbES917TIilOnnFpZM0X1nNwnghFxivEvT
	sCxBd2Scp6zM5bcAyPq4jbSva1kMod4P6duZLDhRMCjOLHyBVL+0HXR5gAXhPUtZ1LQMCQyOzdE
	fNGqRktN1Z8RgQqh4migahwQ2/ileq3wd0PKEnLxSEbwz7aVp3DBMEjuPIoE6szq6Nzsj0q4BcE
	9Z
X-Google-Smtp-Source: AGHT+IEpPJ0gQk4wkR7OiW5nFDXyyImmqlUALDzPrA0+0xmySG0CU6itPykaBoWtyjPp0bLhwshWHw==
X-Received: by 2002:a05:6000:2410:b0:3e9:ee54:af71 with SMTP id ffacd0b85a97d-42704d83de7mr4633959f8f.12.1760778812621;
        Sat, 18 Oct 2025 02:13:32 -0700 (PDT)
Received: from shift.. ([86.124.201.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-471144d17cdsm121034215e9.18.2025.10.18.02.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 02:13:32 -0700 (PDT)
From: Cezar Chiru <chiru.cezar.89@gmail.com>
To: andi.shyti@kernel.org,
	wsa+renesas@sang-engineering.com
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cezar Chiru <chiru.cezar.89@gmail.com>
Subject: [PATCH v7 0/3] i2c: pcf8584: Fix errors and warnings reported by checkpatch
Date: Sat, 18 Oct 2025 12:12:55 +0300
Message-ID: <20251018091258.5266-1-chiru.cezar.89@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The series v1->v4 is a response to the discussion on the mailing list
with Markus Elfring who had comments on my earlier submissions.
He suggested:
 -to split my initial submission in a patch series
 -had some valid points on imperative mood usage in commit messages
 -wrapping commit message to 75 columns per line
 -change some of the commit message to point usage of checkpatch.pl
The series v4->v6 is a response to the discussion on the mailing list with
I2C SUBSYSTEM maintainer Wolfram Sang who requested some changes:
He requested:
 - to remove debug macros from i2c-algo-pcf.c as no code change was done
   for almost 16 years.
 - remove wrapping paranthesis from value assigned of '(0)''.
 - resolve conficts caused by debug macros removal.
 - remove also printk and dev_dbg function calls related to DEB macros.
The series v6->v7 was a result of feedback received from Andi Shyti:
 - Remove not useful information from commit message
 - use better the 'ret' variable by moving it inside for loop of pcf_xfer
   function and inside of loop check if ret < 0 then break;

Here is a brief summary and order of patches to be applied:
Patch 1/3: i2c: pcf8584: Remove debug macros from i2c-algo-pcf.c
This patch remove the define of debug macros and also their usage from
code along with printk and dev_dbg function calls. Removes also i2c_debug
parameter as its implementation was removed.

Patch 2/3: i2c: pcf8584: Fix do not use assignment inside if conditional
This patch takes the assignement from if conditional and moves it by 1 line
up.

Patch 3/3: i2c: pcf8584: Move 'ret' variable inside for loop, break if
ret < 0.
This patch adds space(s) around some binary operators. Also moves ret
variable inside for loop and check in the loop if (ret < 0) break;

 Testing:
   *built kernel and modules with I2C_ALGOPCF=m and my 3 patches applied on
   top of 6.18.0-rc1.
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
  i2c: pcf8584: Move 'ret' variable inside for loop, break if ret < 0.

 drivers/i2c/algos/i2c-algo-pcf.c | 99 ++++++++------------------------
 1 file changed, 23 insertions(+), 76 deletions(-)

--
2.43.0


