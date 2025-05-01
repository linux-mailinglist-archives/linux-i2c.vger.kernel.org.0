Return-Path: <linux-i2c+bounces-10718-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE36AA5C2A
	for <lists+linux-i2c@lfdr.de>; Thu,  1 May 2025 10:32:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C92E6981BD6
	for <lists+linux-i2c@lfdr.de>; Thu,  1 May 2025 08:32:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12AA41E9B29;
	Thu,  1 May 2025 08:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="grdPDUNk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821531411DE;
	Thu,  1 May 2025 08:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746088350; cv=none; b=Hb3DIwsKsnGLmT4LpvxLo1J6f+kC8MejVlt+39SQ8dsRtOS6En36TGo4WbXvi0ocKJmX74r9vaA8kiEvj3AMxUd2lbMt4p2aQSzl+Wpt1I/eVu0Wf51SH9G0IkkafMqchHyJ/T3vkl9M4LWUC6HqxwShpl5PBjduWdh557/ZGWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746088350; c=relaxed/simple;
	bh=xhScCuujTBLSHXMAWc67rVw37G+w/pTe/c1qVenSZ0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dr2qtBdvI/BF+1/wEPOzWsA1LfqGbTot7l9SnwMmGdG4vG3/7IpzTecyMAlfg5PGQqdX08af+mfTwCcnhbPQx59xZgk1AyK6r1T7NjObmS4Gfo+ttBmff5hT1ZFp+Hu26olj89WVz4i7c1rD1dB/uzY9K2nKeu5NV62gQrZrgRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=grdPDUNk; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 1368640E0192;
	Thu,  1 May 2025 08:32:20 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id pu2YYr3UXysN; Thu,  1 May 2025 08:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1746088336; bh=vkoqS5AVfaq+JA/SmzMOmYIXh6QXvrBBLiDRYKQCsoE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=grdPDUNk3MRwcnlAj50ykrP8/RpPIXq0+q1OXSKSfu/3NJiWbrqT+Nz0jPrO9Snz5
	 DluI8QnPWFKpUjoB5dzRSL5T+6D/strKiUrlH1gA5G2MIwsxvKnKQNMDTtAsygPEyq
	 4/qJ6GKvub3QZLVwYPsfO32FEqFCQ9bymYKhKrG2rXo8NOauuACBwlgk1s994YoHmB
	 DOF+9ckNWAi/dHOzdFHjcvtVm8pblsvgSSK/W6yn91YmBb4jQuQL/EvqWIALS9KRMr
	 ZbqceWZ95RyMq/wtSDO3KGHiLW6K3xvJ51/Aa9g0iJrCPedhctKiS/pT/NgOlA4TCt
	 2u6H5ZGUfXtLWenkZl90TxIK9oUwO9KbRPCr/q7FsWM0xdd3qCGUa/KTYaMwvX4zb8
	 QZaknUC0KSd+hdRL0DQFv1lfRwOCLr1v4rb6VbdjqQA5y1vPA2oC8TLxkuM1mtNy1a
	 NKuyZIHIq6OFvuDPFJlPSzjQpZR4iJVUa97vbWKEuCsijtgcw22H1nrxmxBM6rwlkl
	 SFfqGyStkN1vQqjsC6YZxXGCkq5qTKvh/VzbGA8nifHrDkLN5n7ekysctfmIxtrtr0
	 bVTx24vg8CkfIJ6JlXf4eVwa8rlpF4/mCfXTnbFW7LpaGqNw10BTwQRGXgfbFiF9+b
	 1KTVQoxQb0RpuG1eX2VcSuQg=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id D03C240E01FA;
	Thu,  1 May 2025 08:31:57 +0000 (UTC)
Date: Thu, 1 May 2025 10:31:51 +0200
From: Borislav Petkov <bp@alien8.de>
To: Mario Limonciello <superm1@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Hans de Goede <hdegoede@redhat.com>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:I2C/SMBUS CONTROLLER DRIVERS FOR PC" <linux-i2c@vger.kernel.org>,
	"open list:AMD PMC DRIVER" <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH v5 5/5] x86/CPU/AMD: Print the reason for the last reset
Message-ID: <20250501083151.GBaBMxdyrtpcVlQaei@fat_crate.local>
References: <20250422234830.2840784-1-superm1@kernel.org>
 <20250422234830.2840784-6-superm1@kernel.org>
 <20250430190333.GIaBJ0BWuMdZ1KNVQ7@fat_crate.local>
 <e80be47b-5f8d-409c-8c3d-cd1af46944d0@kernel.org>
 <20250430191025.GFaBJ1oQjxCuig1vS6@fat_crate.local>
 <35bae46e-3b57-438a-a561-c93868120dcb@kernel.org>
 <20250430192538.GGaBJ5MuS4CEKa4kIX@fat_crate.local>
 <4bf62335-2e67-43c5-b2dc-4b0bed0521ed@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4bf62335-2e67-43c5-b2dc-4b0bed0521ed@kernel.org>

On Wed, Apr 30, 2025 at 02:32:44PM -0500, Mario Limonciello wrote:
> This would work, but would still need to track if "no" known bits were set
> to emit an "unknown" message.

No, when no bits are set, you don't emit anything. Because the information
content of "oh, your system rebooted due to an unknown reason" is minimal and
even actively confusing at best.

Let sleeping dogs lie.

---
diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
index bef871adbf84..9a8c590456d0 100644
--- a/arch/x86/kernel/cpu/amd.c
+++ b/arch/x86/kernel/cpu/amd.c
@@ -1264,10 +1264,9 @@ static const char * const s5_reset_reason_txt[] = {
 
 static __init int print_s5_reset_status_mmio(void)
 {
-	void __iomem *addr;
 	unsigned long value;
-	int nr_reasons = 0;
-	int bit = -1;
+	void __iomem *addr;
+	int i;
 
 	if (!cpu_feature_enabled(X86_FEATURE_ZEN))
 		return 0;
@@ -1279,23 +1278,13 @@ static __init int print_s5_reset_status_mmio(void)
 	value = ioread32(addr);
 	iounmap(addr);
 
-	/* Iterate on each bit in the 'value' mask: */
-	while (true) {
-		bit = find_next_bit(&value, BITS_PER_LONG, bit + 1);
-
-		/* Reached the end of the word, no more bits: */
-		if (bit >= BITS_PER_LONG) {
-			if (!nr_reasons)
-				pr_info("x86/amd: Previous system reset reason [0x%08lx]: Unknown\n", value);
-			break;
-		}
-
-		if (!s5_reset_reason_txt[bit])
+	for (i = 0; i <= ARRAY_SIZE(s5_reset_reason_txt); i++) {
+		if (!(value & BIT(i)))
 			continue;
 
-		nr_reasons++;
-		pr_info("x86/amd: Previous system reset reason [0x%08lx]: %s\n",
-			value, s5_reset_reason_txt[bit]);
+		if (s5_reset_reason_txt[i])
+			pr_info("x86/amd: Previous system reset reason [0x%08lx]: %s\n",
+				value, s5_reset_reason_txt[i]);
 	}
 
 	return 0;

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

