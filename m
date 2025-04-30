Return-Path: <linux-i2c+bounces-10704-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A342AA5465
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Apr 2025 21:04:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0ACCE1BC810E
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Apr 2025 19:04:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE2D1265CC8;
	Wed, 30 Apr 2025 19:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="MDUNzwBh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C471E5B72;
	Wed, 30 Apr 2025 19:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746039849; cv=none; b=imxth6R2qyzTdRWbwRFYSaCPvs5GdEJ1FdjsBAA2vve1Ytb9PT0NGNpg95SNxf7YcqcYTIYhLVrD/KVB9dn6S8HXw022uD/FOjm6xEolSPzyPhsJzH7Km0BsGB1hL2SISwxdI2sEGXcSNM2YbYqrmnviI3fVm0RpDkxHjcsZsHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746039849; c=relaxed/simple;
	bh=bOBmZCaLio3PHDE+590GR71RKxO0IpILYud+NalfUIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LPhqWZgF0f+W4hNV4eAcPtl0uPqgzR2+oeJlTZfYQdpXUR2f2xH7uZkJAivqymSWvtl9uThit53k5BDMP6ZpqcuJvy64E7ZlRORg6hNnsYYUvCiT4gxGdSCCkq9molLUojHnxRA42I0AdQvYBRqpv0/np1BVi+Ft1ze3Wyg5ZwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=MDUNzwBh; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 0ADC040E016E;
	Wed, 30 Apr 2025 19:04:02 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 0Kd9ex3xfqLx; Wed, 30 Apr 2025 19:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1746039838; bh=+rv3dT2lLM2mlZEzzsl/PKBPs96f8bVorTvl3aSIvFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MDUNzwBhEJNpVRa6Pjbzt69dqzY0+u3WIR5AbJxRDpsBKFnd84gJxkWWt6UjmSrAv
	 1WpdnwtyD0OlxAnVeo6QJX2v2QD35sqKzjvK23vSCtlXz9wd7SQgEyQ6poggrXx4Ec
	 qUG1esugmdh35YTuRSE78Cuw+WiM3/CGvJ2OP+j2LkhF6SzQUh4WlduKSLrpaG9VCT
	 SUzbg/eo/iBtMybwz5j0bxUU/TklCbahl3grll/GL4ek//azWIK9jnFE/jj8goCQup
	 DxU+KMuBi0/uNzqcxsJpzlRl1wR6g/7vEbO3bnH9gpdqjju97wSBUlNRgthhR4zD6q
	 4uUWxassVblDG5zdscHr5q0lAFF+sjMnzIH3pe/VLcQqVM7Ts0ImJKkFYYcPIiWF0E
	 kGQL09up/r5XroowkUqqVqBtBK8c9X11DLU1TLeviO7gKI3Q2lpTw1N9PhjxZkmp2p
	 LbWxYwCZ5sSk01tjOqalIh10kX5lJlfEoL8QONuZWEsSJb1zBrmlPzKJV0kFD8bTbR
	 tAW1sYH3HQqwLRty2hOXWXWE/P75OaNRrxjqSXVJMmpsF6Kifkp4vUeIAU4B/WkqEJ
	 EChipTFg40CadzaSz5hUzlHapGFZU1xs/Y8e0FK0pvEciyqMj2HHEcoG+cuZhm8zap
	 wVojmU9M/5bKUDEw1xmnr+o4=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E4A0A40E015D;
	Wed, 30 Apr 2025 19:03:39 +0000 (UTC)
Date: Wed, 30 Apr 2025 21:03:33 +0200
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
Message-ID: <20250430190333.GIaBJ0BWuMdZ1KNVQ7@fat_crate.local>
References: <20250422234830.2840784-1-superm1@kernel.org>
 <20250422234830.2840784-6-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250422234830.2840784-6-superm1@kernel.org>

On Tue, Apr 22, 2025 at 06:48:30PM -0500, Mario Limonciello wrote:
> +	/* Iterate on each bit in the 'value' mask: */
> +	while (true) {
> +		bit = find_next_bit(&value, BITS_PER_LONG, bit + 1);
> +
> +		/* Reached the end of the word, no more bits: */
> +		if (bit >= BITS_PER_LONG) {
> +			if (!nr_reasons)
> +				pr_info("x86/amd: Previous system reset reason [0x%08lx]: Unknown\n", value);
> +			break;
> +		}
> +
> +		if (!s5_reset_reason_txt[bit])
> +			continue;
> +
> +		nr_reasons++;
> +		pr_info("x86/amd: Previous system reset reason [0x%08lx]: %s\n",
> +			value, s5_reset_reason_txt[bit]);
> +	}

What happened to that simpler idea:

https://lore.kernel.org/r/20250411125050.GEZ_kQKtYBfEMDQuXU@fat_crate.local

?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

