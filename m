Return-Path: <linux-i2c+bounces-10262-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1BEA85C3E
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Apr 2025 13:51:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AC493BBBB2
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Apr 2025 11:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 014F52989AD;
	Fri, 11 Apr 2025 11:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Z07myyco"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB3826AD9;
	Fri, 11 Apr 2025 11:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744372183; cv=none; b=D6D41TzJXRJ+DucTmtCvOgfyugnjMRmAWxLp3s9YSXPl/3TiOTXZhOPZnPnTT7Xz0qMNkXhztVdCpkCNLSsU66nI4MsjKkPmnaxV5hxF7F74SZT8MXy6e581IDgyyPKZWs/xKF3NsqURvWLwGze1Mq+Tfxb0B56l+td3kSjFZis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744372183; c=relaxed/simple;
	bh=xvx1leXhtHak3YBGIU8O8wL2kITwgF7bo8fYUAZqL2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a3WmT/KFQjRd58ZkkVb5yIwZP1SJgKqH/6MtbMYa4BJF5p5UkJLBuSDdTt8mTiDbk2OMfshk9WdCtEdZgU8aFekIs5loEC9viSpJr/4hnOgAymBOJSh1DPkHgQPUCrCmFZRBmMvCp7Q+/XwtxFDfLKSVG3OFTFkexQmy9zh3IdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Z07myyco; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 8CF5F40E023A;
	Fri, 11 Apr 2025 11:49:38 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id mYVYs2BvZQ25; Fri, 11 Apr 2025 11:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1744372174; bh=OzxBMBEX/VnBC645dhU3grM5gZ/yXkYnP3kDp5QzLkY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z07myycor6nzKf/ukbPYq2WYuLFMGgAv4WGMSHEHQB0XwbLMQEAo4aHSOeWkjQdEQ
	 T0JzqwqNi2SzX0x4t3yt3vDnyzExDYSubnOodHi4Q7ET0tP7+7wzV838Qm/H97/mWd
	 EP34zxL8oxiNhCtThfuRdotiMBPjC1K7wNtKW78+5kE+HH/vXMiBNdAPLz4SdQFQ+r
	 WDQ9DZNtjGDEurj3qyjMVzYiDwgYtv+mHOflxpub9nsDvTH6f1PAqEwOoXqXTZWy2w
	 0T6kSaEKh4UL2NkFB6lUvOrtFmL3aR5msQXGZRqGmmCjq34sAzbJ3Nl8iOOOLjzEfS
	 n1aHCxeheQEf3NkRjQYuP6if8QJhGO3VDXnqihfelNAciszo+OhDMjg+oZJqNIZVwS
	 vYpd1Qk3cfYnttD5B/bD9RHv4CIJOiGczqT0rYh5erJLlYIZcAkHer8WPMH10mf84S
	 tKfG7CyBc8OWWd0Uz8baMi7ltqpvRCgvT/nFv3mimktcyJHUViaidrdg2X6qYU/0BZ
	 uVSSPtNJGOqWD6fX2czmK3Hm3zYvCiunOtDgoeNrrm9Y74ymev6YIMtCN3ZFNBOTFn
	 qJ7GZTfWjU37mxHDetOVZV1PhLYzdATym3+9OsfpXeLYD69KsLdkpkBVagU3uRsNob
	 G8QO9Bh5K+7xt7Pz4pBmz6kc=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C10C340E0242;
	Fri, 11 Apr 2025 11:49:15 +0000 (UTC)
Date: Fri, 11 Apr 2025 13:49:08 +0200
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
Subject: Re: [PATCH v3 2/4] i2c: piix4: Move SB800_PIIX4_FCH_PM_ADDR
 definition to amd_node.h
Message-ID: <20250411114908.GLZ_kBtN94h79EEN6j@fat_crate.local>
References: <20250410200202.2974062-1-superm1@kernel.org>
 <20250410200202.2974062-3-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250410200202.2974062-3-superm1@kernel.org>

On Thu, Apr 10, 2025 at 03:02:00PM -0500, Mario Limonciello wrote:
> From: Mario Limonciello <mario.limonciello@amd.com>
> 
> SB800_PIIX4_FCH_PM_ADDR is used to indicate the base address for the
> FCH PM registers.  Multiple drivers may need this base address, so
> move it to a common header location and rename accordingly.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  arch/x86/include/asm/amd_node.h |  2 ++
>  drivers/i2c/busses/i2c-piix4.c  | 12 ++++++------
>  2 files changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/x86/include/asm/amd_node.h b/arch/x86/include/asm/amd_node.h
> index 23fe617898a8f..f4993201834ea 100644
> --- a/arch/x86/include/asm/amd_node.h
> +++ b/arch/x86/include/asm/amd_node.h
> @@ -19,6 +19,8 @@
>  
>  #include <linux/pci.h>
>  
> +#define FCH_PM_BASE		0xFED80300

Is that even related to amd_node?

Or should it be in some x86...platform.h header?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

