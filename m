Return-Path: <linux-i2c+bounces-5342-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2AA9509EB
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2024 18:13:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A3031C2267A
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2024 16:13:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AE861A0B0F;
	Tue, 13 Aug 2024 16:13:16 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9761A0709;
	Tue, 13 Aug 2024 16:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723565596; cv=none; b=UIDEugks3lbSy9fImf1BdIplz+JwPCju3dMQ8BRJ3IxwzPY/USyPkVXssnhmWKl1NgWcVoLhP7GQTKeAew/a8Lcgpoidqq6BgZWH/eC3pg1BMMK6/Wnw4XLDV4prneFm6U6n6AOfqJb2RAL995/56nFYtvPZOD4VsvvX8TCUTus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723565596; c=relaxed/simple;
	bh=tOmTgnpH+kB10iQjIL4bK0ZmD/wuThDLYeHtlrh5aIM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YETYNqlbHM899A543xsa38OK8GJYD/pEwEAYxP88Fv2DEABnQKzWqqOqxLPW83Wta/aTVr4hyT5brxEDvwHXoAYQzye/Nyg+bOEYPauewk6yx8JGIXkjfMeHnakecU6K1E23A4UEyArZAe9TCpUkurP2hTwZzUkOxNJMiWSRGTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a7d26c2297eso649012566b.2;
        Tue, 13 Aug 2024 09:13:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723565593; x=1724170393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LaQLUo5i7elUXPRL0FJej/1GR8HV8NZJO8YJDS87uUg=;
        b=LWzdVQ2A/HJsPn/yY4lgmmQ2A7NUYvrlrtEEhEmAHK1PpOJVBcQMkPQRXpLyJnNJuf
         Pki1HDzc5t3ooY6+iRWtdr/yzzJu8Bh/+oh/r6ec3k2QIu4xwKB6s82ZgsXcxzFDHAxr
         7EZOQUSEsf7HhNhuG5wuKtk2TbQvkt0LDod/v2Aou6u898HYh6HovfULBBYtsphYVQUL
         2L1kkbYnF3nuYr3gYeFjdurMYWGf/95ShojMD/F2P+SjL1jS74PHN0NYnUhxSh8NelTQ
         LySVQOTSn6nkLcEWyrPXeqL1pNiOOUrXtySTMdsCar4ukV2v+z6Zgx93nKn3Q8k+mEdR
         SRtg==
X-Forwarded-Encrypted: i=1; AJvYcCV0yBnhATy2nRemLkDITcf6sfPPjKwZCWeFXZgVihXlV5W4VZhReTBL0bJz/ayl94WkTPMEOfMi6E4TnAHd8jJ8VXOUwusACZ6y15OGLZX2+VnMDxYKEoCTtmpczoWzrFHtNaa0uQOsYWBQL//ZdJgAJWwHF9itTffFOUxn3vLNBdpjc/0=
X-Gm-Message-State: AOJu0YzUWKRtEpql/41h8H5SfpXe12bkcZr4nQ49uHDuu1vNaD/7Dczk
	q2I21xaaZre3JHXm7SmHSf0Wr+z8yXEHXKRx5dEFYzWBOiWgaZob
X-Google-Smtp-Source: AGHT+IEuj9MtSNhaX/+jDeUjTi9lD+86KFlQPkIuuk/wrtzy6d6QuWkOuYHCh+LLYaBVdCOFsi5Mnw==
X-Received: by 2002:a17:907:e68b:b0:a7a:b43e:86cf with SMTP id a640c23a62f3a-a80ed1cece4mr329561666b.27.1723565592788;
        Tue, 13 Aug 2024 09:13:12 -0700 (PDT)
Received: from localhost (fwdproxy-lla-003.fbsv.net. [2a03:2880:30ff:3::face:b00c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80f3f45c86sm80815866b.25.2024.08.13.09.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 09:13:11 -0700 (PDT)
From: Breno Leitao <leitao@debian.org>
To: Laxman Dewangan <ldewangan@nvidia.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: leit@meta.com,
	Michael van der Westhuizen <rmikey@meta.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM HOST DRIVERS),
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] Do not mark ACPI devices as irq safe
Date: Tue, 13 Aug 2024 09:12:53 -0700
Message-ID: <20240813161254.3509409-1-leitao@debian.org>
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
	__might_sleep
	__mutex_lock_common
	mutex_lock_nested
	acpi_subsys_runtime_resume
	rpm_resume
	tegra_i2c_xfer

The problem arises because during __pm_runtime_resume(), the spinlock
&dev->power.lock is acquired before rpm_resume() is called. Later,
rpm_resume() invokes acpi_subsys_runtime_resume(), which relies on
mutexes, triggering the error.

To address this issue, devices on ACPI are now marked as not IRQ-safe,
considering the dependency of acpi_subsys_runtime_resume() on mutexes.

Co-developed-by: Michael van der Westhuizen <rmikey@meta.com>
Signed-off-by: Michael van der Westhuizen <rmikey@meta.com>
Signed-off-by: Breno Leitao <leitao@debian.org>
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
---
Changelog:
v2:
  * Replaced ACPI_HANDLE() by has_acpi_companion() (Andy Shevchenko)
  * Expanded the comment before the change (Andy Shevchenko)
  * Simplified the stack in the summary (Andy Shevchenko)

 drivers/i2c/busses/i2c-tegra.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 85b31edc558d..1df5b4204142 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1802,9 +1802,9 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	 * domain.
 	 *
 	 * VI I2C device shouldn't be marked as IRQ-safe because VI I2C won't
-	 * be used for atomic transfers.
+	 * be used for atomic transfers. ACPI device is not IRQ safe also.
 	 */
-	if (!IS_VI(i2c_dev))
+	if (!IS_VI(i2c_dev) && !has_acpi_companion(i2c_dev->dev))
 		pm_runtime_irq_safe(i2c_dev->dev);
 
 	pm_runtime_enable(i2c_dev->dev);
-- 
2.43.5


