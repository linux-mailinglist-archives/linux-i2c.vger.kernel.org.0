Return-Path: <linux-i2c+bounces-10634-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 26388A9D9F2
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Apr 2025 11:57:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0DEAE7B5C42
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Apr 2025 09:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF51225178F;
	Sat, 26 Apr 2025 09:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="XXbEmsQg";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="f3E9de0e"
X-Original-To: linux-i2c@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309662236F4;
	Sat, 26 Apr 2025 09:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745661425; cv=none; b=spakh/8Bpan+qXoQhk+i3JkM1qlT2wIsgzXD0qfvTCyVoJFRhk6bc4/DzyiPmgiw7EwqqSYE+NaTNvrxlorXr3Z9GhGatIl+4jgq5Q1YAlqUT7XZpAYOFdwFRWbAYURW4cAivbA4LbchObkP8LKROZotwrZN85HyAhzH4Gh6qIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745661425; c=relaxed/simple;
	bh=UFdFohhvUI0lR9JUpGGDnGXuOYo6YMXj5OM5Or86BY4=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=O+CV+gpB9vTKKyU6tHlGNJK8y+WfEksqLd1eOqRHX9YZutOugUucp0Y81oAHJr619pHlxg+SuMLmYgXXTrpu1CG7LbcTZZBnqjcGnZi3pR8+605JRty4JyZLWdf5LZZpxhtL1s+jPkx7h4UOXmdJ/9zPVpXsEPANAopZ7eh/aqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=XXbEmsQg; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=f3E9de0e; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Sat, 26 Apr 2025 09:57:01 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745661422;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0jm/nIph0Am0JXbeYwRs+q0ixelAuTMn8AaY5zmnzZc=;
	b=XXbEmsQg4wudVXqNG+hO3/9dKPWiZmkfdmRfqrNmkpt5dY7B5DhNyXe+W03hCLBysyl547
	n43RqU1UU99Dz4l7i6aztZkBt3FS868eI0gK8qpk47HvD3gDENupbJaaELrlnuCoeTGsYX
	pBfOHAUreGrxYudhKz6k26ammxfw/MfLdXhybqZza4pr5107sviYSHfjIM8xouARsz72o9
	9nxREW5fP5cGs4d9XFI6rA5w8PU79KBFyqrhMQ7KCCKtdSLNBZNUTTLvrcl89fQlJOB4u2
	rK+VlQGdZgnqAzM99tzOthiWbrYuOFlQ7AzXs7b5VurPHkWiTwNtg9Uw8XyF+A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745661422;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0jm/nIph0Am0JXbeYwRs+q0ixelAuTMn8AaY5zmnzZc=;
	b=f3E9de0encpsYLafLGeCEg6MOpzdkoUvxCjbDAS8IevA61GQMx3Co/oAEzkRfHgti4cI1E
	+Hf3a0Uhp0u862Bw==
From: "tip-bot2 for Mario Limonciello" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: x86/platform] i2c: piix4: Make CONFIG_I2C_PIIX4 dependent on CONFIG_X86
Cc: Ingo Molnar <mingo@kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Sanket Goswami <Sanket.Goswami@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Yazen Ghannam <yazen.ghannam@amd.com>, linux-i2c@vger.kernel.org,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250422234830.2840784-3-superm1@kernel.org>
References: <20250422234830.2840784-3-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <174566142162.31282.14563943332282106355.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@linutronix.de> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The following commit has been merged into the x86/platform branch of tip:

Commit-ID:     7e173eb82ae97175fd1ae8390259227f1a76a41f
Gitweb:        https://git.kernel.org/tip/7e173eb82ae97175fd1ae8390259227f1a76a41f
Author:        Mario Limonciello <mario.limonciello@amd.com>
AuthorDate:    Tue, 22 Apr 2025 18:48:27 -05:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Sat, 26 Apr 2025 11:40:46 +02:00

i2c: piix4: Make CONFIG_I2C_PIIX4 dependent on CONFIG_X86

PIIX4 and compatible controllers are only for X86. As some headers are
being moved into x86 specific headers PIIX4 won't compile on non-x86.

Suggested-by: Ingo Molnar <mingo@kernel.org>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Acked-by: Andi Shyti <andi.shyti@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Sanket Goswami <Sanket.Goswami@amd.com>
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: linux-i2c@vger.kernel.org
Link: https://lore.kernel.org/r/20250422234830.2840784-3-superm1@kernel.org
---
 drivers/i2c/busses/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 83c88c7..bbbd624 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -200,7 +200,7 @@ config I2C_ISMT
 
 config I2C_PIIX4
 	tristate "Intel PIIX4 and compatible (ATI/AMD/Serverworks/Broadcom/SMSC)"
-	depends on PCI && HAS_IOPORT
+	depends on PCI && HAS_IOPORT && X86
 	select I2C_SMBUS
 	help
 	  If you say yes to this option, support will be included for the Intel

