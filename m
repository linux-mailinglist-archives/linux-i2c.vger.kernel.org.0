Return-Path: <linux-i2c+bounces-10619-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D25B8A9B3DF
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Apr 2025 18:24:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE84E1893B3D
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Apr 2025 16:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 335782820D3;
	Thu, 24 Apr 2025 16:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="YgzKvSeL";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="i5Y3phdO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C2928136E;
	Thu, 24 Apr 2025 16:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745511873; cv=none; b=aulG1MOSh7NWLKy02A0xhEi83ACQJ325D3avd41a4uvVwuk3tuRq5OOLlI44+F11M0pZtoTPqKYD8hGe4Gr4b3f6fl+5T22JGG/BrIYAgJtQK/RGyB3n026Toe8ly27PoNGYYQFSmqsLuhmwKV/I7MMbjIcASofmJPCg4Zwwkic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745511873; c=relaxed/simple;
	bh=lwfXTFNqu6arICygdBYp0Ar+3QlUICqOzdYJ099eTjM=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=bhp4FJldNp7OCngFFR/KD8fCxHlkmPYyYL5TSIaa+cNIwvZc3fYTlCw50yTchh+zud4PSkwuHDIAxKajhOHhXLa/hYYDThMhE9epzIrN53ATcVW3GP7bQ6eHklwWH6rUIoKMRfSZbMT67rtqU+e8iQipuu3kXkgk6b3I9Y/8Gj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=YgzKvSeL; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=i5Y3phdO; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Thu, 24 Apr 2025 16:24:28 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745511869;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cnw9+9b3xaMv0SgwJiRiztQV+zmR696QM7vkoSzIzjs=;
	b=YgzKvSeLZrS9KwHer24zDshVCe8oqFYDZTlEhcED7MZ+fZg6xeTMKwPKJ2NkY0UzwCqUM5
	aLIOKS27V21HUk+Kw7Fg6lfIYu/4hSPL7quDTHK49AK/OJ+k1Fx5Fz557uk270KoyHnTrR
	CtGKI8XaeK1LF1x/ZWpz8hgoVg+DbpbJ3W6wjA4BzFREMxmc3MnQO6ytX7AP+GTtgplptx
	IVaDUFNK7wFAWp+fuNJhwkivfLVUrUym9XgzAj+h7knKnk7D8aBuidGSW5SxZjqEqzzwQ5
	64KoChhHdDKIgCHUQlsOve1Lm6le9PepCnlsFcZiQkA7KLwPrMt1K2HtitYNUQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745511869;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cnw9+9b3xaMv0SgwJiRiztQV+zmR696QM7vkoSzIzjs=;
	b=i5Y3phdOD/5kqvgJ5ulfj6wxaoOReInSwiT4Wt5GkZDihdyRp1lzZuk3x8AKC6b56hvNoj
	w8E/v4iZRgQY1lCA==
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
Message-ID: <174551186884.31282.8152237268199992329.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@linutronix.de> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The following commit has been merged into the x86/platform branch of tip:

Commit-ID:     0e695391f0a33490d8faa5b5e750069230a14c78
Gitweb:        https://git.kernel.org/tip/0e695391f0a33490d8faa5b5e750069230a14c78
Author:        Mario Limonciello <mario.limonciello@amd.com>
AuthorDate:    Tue, 22 Apr 2025 18:48:27 -05:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Thu, 24 Apr 2025 17:55:18 +02:00

i2c: piix4: Make CONFIG_I2C_PIIX4 dependent on CONFIG_X86

PIIX4 and compatible controllers are only for X86. As some headers are
being moved into x86 specific headers PIIX4 won't compile on non-x86.

Suggested-by: Ingo Molnar <mingo@kernel.org>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>
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

