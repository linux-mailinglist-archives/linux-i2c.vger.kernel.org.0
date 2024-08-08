Return-Path: <linux-i2c+bounces-5216-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E6794BD2A
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2024 14:15:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71B4F1C22847
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2024 12:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 887D218C355;
	Thu,  8 Aug 2024 12:15:04 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF72D146A68;
	Thu,  8 Aug 2024 12:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723119304; cv=none; b=uoNVr3gzQsktPLCyR/uG0rFoHgFgHLzpRLD9oTnEgYwNkKeovr0VhwZ27wYpsYUMjgfzsH7he5EgZepUlI70jk+WRiZY1i+f5yWQsLxREU/m3E7KJgfIgVfvkkXUUJ9EtjVvbm07WNYV6n2p6L5hTiFmC228xCp6JpTRJcjA4CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723119304; c=relaxed/simple;
	bh=CKThhCZanICJhopLFK61jjDhfM+xol9M87zX/V/w1uM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Uk3Kf7Wlvxpm69CnW88eLTjNh+fxOpNaEaWSWDMzeiLLvonZTVD/UAFzgVXB0flKW5DsvNTe1fBBDR4iDm8FM9DrC91mb7N+7uUzuq0Mk2wdo3zwEgfQ2XXHM9jJoWRKlZgjPnypLx7doeWpeEGiEr/xjbiB3ZUbS00qOLELT7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a7a975fb47eso102629666b.3;
        Thu, 08 Aug 2024 05:15:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723119301; x=1723724101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fMcUzMkBN+al8N+NC2mYEn1bCR1LycpJRZmeNbrc0BQ=;
        b=rfoy5OOqcdhbG85GFn2YheVLvLEeI3L4KuVp2wZdxtAVl+rsShlSrUBSNF38uTog1B
         rRCzltPycY4efgPYF6KIQm1BK2eztPMNKeS7ZI01arGlp/dFLQ5+KHH5xx17GUIm/mV/
         W7GNdRi7xj3x+U1ndWRp5EYG7v3R0zHaY2i4Y4BzLCh9N1NSoZGq6UdsWhN60CX3GvMO
         IVgGHe7PwgF+7L/uXZ66U943DEZn8KrNJmRAfO71nsfhsVqdnLjiEX/7Mm1h+1JGqxTH
         3fmpuZd8nk8JvlnIxpiPWg8tG7kOBIHv+MRhi7YYHR17qu9K/oJwIPOlMhuosXhiSXD/
         1xyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcJsjSU3Td4ltnxaw8lsCrgPnX4x8/CVO9BM9HtsANQSkUWooyCUksSEd9WsZNYn5snqEKsxBkPBVNTV6Gfykt9nThGwnBorTckM5N01O2ycPem5C1lM1rI6BxNCvllZZzMFLbSm+1mp+FoJAs2+7CkYKDKUwuwe7wH3gBdHaS1P/Ne4E=
X-Gm-Message-State: AOJu0YzpP4ShKjOX4m0/ywd/a/l8K2k2KN6pPwmWcey8Ky3IYA8PSuxH
	fV18CC9tZ4DD/c8RVfjz23ac5pxbBHy6mMGajy6zHzFJTFBd+6Oq
X-Google-Smtp-Source: AGHT+IEq0fqh/fbFvC/CeimiMiT98URyhBh3Ul0GS07CDuW/RAGUPulUBmrdoQeqvoPEl82acqw/BA==
X-Received: by 2002:a17:907:e683:b0:a7d:a080:baa with SMTP id a640c23a62f3a-a8090d94768mr130061266b.34.1723119300808;
        Thu, 08 Aug 2024 05:15:00 -0700 (PDT)
Received: from localhost (fwdproxy-lla-112.fbsv.net. [2a03:2880:30ff:70::face:b00c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9bc423csm738210566b.26.2024.08.08.05.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 05:15:00 -0700 (PDT)
From: Breno Leitao <leitao@debian.org>
To: Laxman Dewangan <ldewangan@nvidia.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: leit@meta.com,
	Michael van der Westhuizen <rmikey@meta.com>,
	linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM HOST DRIVERS),
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH RESEND] Do not mark ACPI devices as irq safe
Date: Thu,  8 Aug 2024 05:14:46 -0700
Message-ID: <20240808121447.239278-1-leitao@debian.org>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On ACPI machines, the tegra i2c module encounters an issue due to a
mutex being called inside a spinlock. This leads to the following bug:

	BUG: sleeping function called from invalid context at kernel/locking/mutex.c:585
	in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid: 1282, name: kssif0010
	preempt_count: 0, expected: 0
	RCU nest depth: 0, expected: 0
	irq event stamp: 0

	Call trace:
	dump_backtrace+0xf0/0x140
	show_stack (./arch/x86/include/asm/current.h:49
		     arch/x86/kernel/dumpstack.c:312)
	dump_stack_lvl (lib/dump_stack.c:89 lib/dump_stack.c:115)
	dump_stack (lib/earlycpio.c:61)
	__might_resched (./arch/x86/include/asm/current.h:49
			 kernel/sched/core.c:10297)
	__might_sleep (./include/linux/lockdep.h:231
			 kernel/sched/core.c:10236)
	__mutex_lock_common+0x5c/0x2190
	mutex_lock_nested (kernel/locking/mutex.c:751)
	acpi_subsys_runtime_resume+0xb8/0x160
	__rpm_callback+0x1cc/0x4b0
	rpm_resume+0xa60/0x1078
	__pm_runtime_resume+0xbc/0x130
	tegra_i2c_xfer+0x74/0x398
	__i2c_transfer (./include/trace/events/i2c.h:122 drivers/i2c/i2c-core-base.c:2258)

The problem arises because during __pm_runtime_resume(), the spinlock
&dev->power.lock is acquired before rpm_resume() is called. Later,
rpm_resume() invokes acpi_subsys_runtime_resume(), which relies on
mutexes, triggering the error.

To address this issue, devices on ACPI are now marked as not IRQ-safe,
considering the dependency of acpi_subsys_runtime_resume() on mutexes.

Co-developed-by: Michael van der Westhuizen <rmikey@meta.com>
Signed-off-by: Michael van der Westhuizen <rmikey@meta.com>
Signed-off-by: Breno Leitao <leitao@debian.org>
---
 drivers/i2c/busses/i2c-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 85b31edc558d..6d783ecc3431 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1804,7 +1804,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	 * VI I2C device shouldn't be marked as IRQ-safe because VI I2C won't
 	 * be used for atomic transfers.
 	 */
-	if (!IS_VI(i2c_dev))
+	if (!IS_VI(i2c_dev) && !ACPI_HANDLE(i2c_dev->dev))
 		pm_runtime_irq_safe(i2c_dev->dev);
 
 	pm_runtime_enable(i2c_dev->dev);
-- 
2.43.5


