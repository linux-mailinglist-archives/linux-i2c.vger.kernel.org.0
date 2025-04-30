Return-Path: <linux-i2c+bounces-10706-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 316A8AA548B
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Apr 2025 21:11:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 019C03AEAD2
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Apr 2025 19:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18DCB268C73;
	Wed, 30 Apr 2025 19:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="gGliN0zj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BD41D5CD7;
	Wed, 30 Apr 2025 19:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746040253; cv=none; b=NeWBzZOVvHf/h1tvwpvB9hz7SyS+WV4dgCIhEmegJeCCWppUSBiPRWa0c3CdJMD5gHdtWA12Mv2uh6aPWCYk7LybDw86V9uqVi4QPafXu/mdAH62vGOs6EVhjFxRiEXfzpEY9orPMMYVVKs7hkf5lr6aeHfu33zdHqjI1LbfR8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746040253; c=relaxed/simple;
	bh=JFZOzv+Pa59yT1BiZLznVMUPvz3h5oOEPdBLnz0SXdM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EX+OlFwK/bUpildnKEF7I75Txc3ylayOBQGVLLXoRbxOvkgRlr5u4mWvQdnq0+jd+945IC6M/9JOw4ySS/E7ogDadTceGMKMs0Uvrc4BRpyr1tYnT7ZTgPKifCLs1UMld8fNKmhqqCfN1vhMJeZEF1bH7KlCXDnVkXCAIMMu1g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=gGliN0zj; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 63CAF40E015D;
	Wed, 30 Apr 2025 19:10:48 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id bES_WUmzj5HT; Wed, 30 Apr 2025 19:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1746040244; bh=+GxwUY+OrQPGQti8LGT5sJqHDoKiwDBO7yvuR8OwXZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gGliN0zj3BucYOcRKDOe31esmTuD3YgxoafUKf3Zfzhde02nxzJ9SZvs5j62tHuCQ
	 4Z9ey9NS9nJzSovgvOX2lEb1Zv8d3ylk+e+I53Aq5DqsrZCcfZGeCisNaSCCw9mT4n
	 gh+v3kxBl2Kth+tn5xQ+zxBZr1hhuiYgg8+Clj5lqr5NgCbHnDSkjR+Xm3w14gRx5r
	 f08n0Ram6ffuu4UgbMUgCLoMGO7LwCP1Ma8l8QZXYB6ooBJ/UbP4OrxrkaHxts8mpw
	 V6VfV8SIW0u7hqoIeJnP4CSAe/TV9UsNVWg9FXIJJZQr1UL8hhd8H/ZV5vOjyc0qUe
	 HX/ehnSooHulQj/67Arg5zD/KJtZ6+G2ik6f/xxT4lYY2pYjB+BpmZWJRKXXhIaIO1
	 HoY8z1U+jqtkfcmgubczYC4gaG7YU5OPnS0to4ItnHCd7V5s/adW3TDRxut89NwG5F
	 UI1l8gSNtZpeiMFP+PA3dy8QdfFYl5JDH94O5kb5O02h/KnFuzbvwzanbpxCh2aSUP
	 Aeq4qUwxwzEbEjc2vR13+54vJ0FU9CHy/pu26S+df1MMXBrSl7hmqXOyEOTS3LdBXQ
	 JGLes384W9N253Rf1beTtjhgbPOuaqq5jCn0I5d/VSLIwdOjn5KSS3/NNPxIsIgAVW
	 CvmHo9WheNlLYx1lG9eb67Og=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 63F2440E0174;
	Wed, 30 Apr 2025 19:10:26 +0000 (UTC)
Date: Wed, 30 Apr 2025 21:10:25 +0200
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
Message-ID: <20250430191025.GFaBJ1oQjxCuig1vS6@fat_crate.local>
References: <20250422234830.2840784-1-superm1@kernel.org>
 <20250422234830.2840784-6-superm1@kernel.org>
 <20250430190333.GIaBJ0BWuMdZ1KNVQ7@fat_crate.local>
 <e80be47b-5f8d-409c-8c3d-cd1af46944d0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e80be47b-5f8d-409c-8c3d-cd1af46944d0@kernel.org>

On Wed, Apr 30, 2025 at 02:05:44PM -0500, Mario Limonciello wrote:
> On 4/30/2025 2:03 PM, Borislav Petkov wrote:
> > On Tue, Apr 22, 2025 at 06:48:30PM -0500, Mario Limonciello wrote:
> > > +	/* Iterate on each bit in the 'value' mask: */
> > > +	while (true) {
> > > +		bit = find_next_bit(&value, BITS_PER_LONG, bit + 1);
> > > +
> > > +		/* Reached the end of the word, no more bits: */
> > > +		if (bit >= BITS_PER_LONG) {
> > > +			if (!nr_reasons)
> > > +				pr_info("x86/amd: Previous system reset reason [0x%08lx]: Unknown\n", value);
> > > +			break;
> > > +		}
> > > +
> > > +		if (!s5_reset_reason_txt[bit])
> > > +			continue;
> > > +
> > > +		nr_reasons++;
> > > +		pr_info("x86/amd: Previous system reset reason [0x%08lx]: %s\n",
> > > +			value, s5_reset_reason_txt[bit]);
> > > +	}
> > 
> > What happened to that simpler idea:
> > 
> > https://lore.kernel.org/r/20250411125050.GEZ_kQKtYBfEMDQuXU@fat_crate.local
> > 
> 
> This one was more advantageous in that if multiple bits were set for any
> reason we could get messages for all of them printed.

I don't understand - you dump an array element for every bit now too...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

