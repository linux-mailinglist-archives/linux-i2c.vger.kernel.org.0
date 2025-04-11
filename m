Return-Path: <linux-i2c+bounces-10264-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F39A85C79
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Apr 2025 14:09:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CAD8A1B834C9
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Apr 2025 12:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9D9F298CBF;
	Fri, 11 Apr 2025 12:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="D6e7xQQj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7DC208A9;
	Fri, 11 Apr 2025 12:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744373210; cv=none; b=ifvg+mvi6hK6eJtbfC2NY+y1vwl8QG2URxuAnmwg0BPMhwfSVZdj73ERVPu2ksyYUK4KqoUASY6MbgXgQeVvixnUknAXAHFLhm0NO8/gCxdMJn/nLQZAmjBjYiGHlSk5JQHUXRAsq9elx5tJ7bFEJpduciGgIhsNVudqrdVWiVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744373210; c=relaxed/simple;
	bh=rRjhVuR1tb0lbjoCEfWz8he+Qwzm74vLHB3yguOCXWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bJYK+F7x0siISUalFxEMBNj1SrmwLH2zNsQ7mE61+lRD0dcg54AWPu+cvdSBELhtM9lPVTqih8Pxx2PKEslhhzDMraPTS1hGZE2Zoyszc9DGV5TvzIqO6tsrewNLL44wr9IkYg0UrN8kre5ho9gkojaopx+smHlwO3bHACAmG/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=D6e7xQQj; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 8527240E0243;
	Fri, 11 Apr 2025 12:06:46 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id MDdP29mI7Tsq; Fri, 11 Apr 2025 12:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1744373202; bh=kGIL4c6oWdc54GixFIdNIyeiZ1P260Ul2w9hIogyKPs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D6e7xQQjydg1Yee2WTX0Y2lcL9mOTl5U1ufPOsjYAI7qxD3VLj5VjL7xH4JcGGHIm
	 Q+HhS+mrGmpxT+88MmhtZgU26kie8ORqSAQVZASqCaQPyWqSKtPNy2P2L7q6wj3Dur
	 uPG0h1JpLZHx5jlCk7WV3pFMoqeBisQyJU3VWQxvy7lJkIVvCFkr8obXVQLyZWpS0A
	 u51pn/eU07JLNC4g7KqbZvPrKZJLzJ5rs4dzwY3xQtOVgp3ty/7IUrSGN82QR8EO8j
	 3uUUbZu+GGPtfVOr15CR+LHNxUWutBOG3ga8EFiLyvQV0zGHCsko27lPoQauzO/JWT
	 h8jEaQ9imKTyBztRtBaNYd1oGq/+XpNyF6EnLtJMuhFxH9WAwaZpzyLl/HbwNbjNLc
	 yahOu+lE7u0yTCFinW+DqTJFhjDJ5zTv0m7ZA5tjpWwAli/jH5Dg8kgeexmM+0r+pq
	 vHmXJfb1asJu9bjYonZJz5zY6q9gsbKLp+Bs86y/3KoooUlfL+L9e1LAnivC5iaWBK
	 k8Tk55RwS2sgmDkslctRDJis6FQIxTImgp8I6C1sZ+fjIByoXC9medHVxukEa0sre/
	 6ez2oClcpfSRaNO8Y/yYzLLN2ZwgTg1P7srCCqAC4fMCW0mBDL4laCd1tTYEtqTDY/
	 0n3HFTau+QLOAi1yR3t3RY1Y=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 4E03140E01FF;
	Fri, 11 Apr 2025 12:06:24 +0000 (UTC)
Date: Fri, 11 Apr 2025 14:06:17 +0200
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
Subject: Re: [PATCH v3 4/4] x86/CPU/AMD: Print the reason for the last reset
Message-ID: <20250411120617.GMZ_kFucLFQQ7LJkys@fat_crate.local>
References: <20250410200202.2974062-1-superm1@kernel.org>
 <20250410200202.2974062-5-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250410200202.2974062-5-superm1@kernel.org>

On Thu, Apr 10, 2025 at 03:02:02PM -0500, Mario Limonciello wrote:
> +static __init int print_s5_reset_status_mmio(void)
> +{
> +	void __iomem *addr;
> +	unsigned long value;
> +	int bit = -1;
> +
> +	if (!cpu_feature_enabled(X86_FEATURE_ZEN))
> +		return 0;
> +
> +	addr = ioremap(FCH_PM_BASE + FCH_PM_S5_RESET_STATUS, sizeof(value));
> +	if (!addr)
> +		return 0;

newline.

> +	value = ioread32(addr);
> +	iounmap(addr);
> +
> +	do {
> +		bit = find_next_bit(&value, BITS_PER_LONG, bit + 1);
> +	} while (!s5_reset_reason_txt[bit]);

What's the idea here? The highest bit is the most fitting one?

So why don't you do fls() or so?

> +	pr_info("x86/amd: Previous system reset reason [0x%08lx]: %s\n",
> +		value, s5_reset_reason_txt[bit]);

What's guaranteeing that s5_reset_reason_txt[bit] is still set here?

I'd suggest you check it again and never trust the hw because we'll be fixing
a null ptr here at some point otherwise...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

