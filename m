Return-Path: <linux-i2c+bounces-3893-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D808FE7B5
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jun 2024 15:27:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6AF221F23E48
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jun 2024 13:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AB11195FD7;
	Thu,  6 Jun 2024 13:27:33 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56DC193080;
	Thu,  6 Jun 2024 13:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717680453; cv=none; b=mymNBhuHR8v7g19P537tIJVI+h+36S+ZHb37ITya7C0KsnVloNCIVJ8zUkj+YO/JY0i3koi/+s6pGcu2I8G5vG59hzD19LI3vhHZDyw1TMD4cgrvQnsTqM4Y49hzSS4uc1JXZBdUSpZcyZz7RQHffOBuWchUx7E7nERFm4s8UT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717680453; c=relaxed/simple;
	bh=l00UI0JD6AC6Q+cJo4FKqgL09aX1TgDCu9xOfXS9uoM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ouWzw/29qlqrNXIVI0izSUYT0ofkphUiBC7ANjZBWqBzddoSo7lfRAi/mW7I88NJgfn2leEQE5py8YYa4jgFfkbtdgKAcTuliSV5O39W6rpaWgkOXt6VVxEUWU2/2PjCmNkFoSXgbu3zllJIXO/zW0zEcyCqujZi/gbO7KPBbZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-57864327f6eso355401a12.1;
        Thu, 06 Jun 2024 06:27:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717680449; x=1718285249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iuF5KD5rCo57TyG5EigT3fDurZ74w1tefad8AjM+COM=;
        b=j8ikiYHAggBd94p9/sl8QgN9K/8bcidP+7iCCwstYypOJv6K2V5LLu7R8cPCHmbrd6
         cJ8y0fp/qaqTX9MmKaJEvPqddtF9Km9CqHht98TQYQZ4n9gN5N/619SNf5ScA2ssv1FV
         +SkSQuZwbp1fYkv9JQi+ALfhD0fsfZ0g10aXrJk7ktgvS7cGXzvp0/2MufC5HBwhjz8l
         nTTLtLJLWMmrgC3RT5Akjm+5D+jKXJZVOFf8ojuEJgaLvj8R6AG8a4Em0aNqLqjUXfRL
         oi65iiSLaV6BYqCuxIH4iJWoEfFyZezM7Z/daWgDJvMYFWN39VqxiGIbpoj8wUBgn5te
         hIcQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3ws6I0ZEuxJKPUCUkt8NSTqxdLUcu+5Le4IR/z+3/dWjPfgmOQwUjtUqs5QKO85jNHIh8GSXV+VIlGnA2nQPfoSHw9M6+hUK+frCHMopbyDkXBZS98neqXAO35UvLU7ERR7ef3rRFzlnkqfw7VJYkt/4dfTTXpnUc2r0HZmJxZooNbGo=
X-Gm-Message-State: AOJu0YxioFA+1P+SM47ZKabRc1EQ9XyRxmrPciTnv6JjDS/6suG5ZPn8
	0ehsixZKixgAYsPCOU4gOHuA+FRYQRU4LmUFhEPR1DdZYhpHXm5s
X-Google-Smtp-Source: AGHT+IGkCI92lpY9im28PFCaqOXR0tPwgGp8l0RK7fN48VWfjPlSf/gZ9WuRB7v6N3QBhFb+BZc/Fw==
X-Received: by 2002:a50:ab02:0:b0:574:ebf4:f786 with SMTP id 4fb4d7f45d1cf-57aa558746amr2338378a12.16.1717680448842;
        Thu, 06 Jun 2024 06:27:28 -0700 (PDT)
Received: from localhost (fwdproxy-lla-120.fbsv.net. [2a03:2880:30ff:78::face:b00c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57aae0caa84sm1103288a12.29.2024.06.06.06.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 06:27:28 -0700 (PDT)
From: Breno Leitao <leitao@debian.org>
To: Laxman Dewangan <ldewangan@nvidia.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: paulmck@kernel.org,
	apopple@nvidia.com,
	Michael van der Westhuizen <rmikey@meta.com>,
	linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM HOST DRIVERS),
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] [i2c-tegra] Do not mark ACPI devices as irq safe
Date: Thu,  6 Jun 2024 06:27:07 -0700
Message-ID: <20240606132708.1610308-1-leitao@debian.org>
X-Mailer: git-send-email 2.43.0
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
2.43.0


