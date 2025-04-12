Return-Path: <linux-i2c+bounces-10284-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A79DAA86F30
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Apr 2025 21:45:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B6BC8A64E7
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Apr 2025 19:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09FCE222565;
	Sat, 12 Apr 2025 19:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lzuHVdrl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B035B219A80;
	Sat, 12 Apr 2025 19:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744487103; cv=none; b=Bdqu65YO9qmV8uUKEn8uVSd/JZaftZLwHOiceDM26lGelipnN90P3nRCr6WB6uHzVF0yEMrMS5KS+aE/3y29uy118WTWdmdNgiumNtw+zxBEId1qsQG0vcObslBvViMLqau0QxgwiApmE6jEDJqme1VZoD4EmiFCVPgzL0rXNJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744487103; c=relaxed/simple;
	bh=kzSNmSKS9hY5c47HY+wXva7VoPSYzrY/19XJ4KoEFKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CGdOPyaUDfN/UbIUwoNWIoyiD3ovmi/e11Ax/HT5RRNBB64Xf973UkV1YLbTy/gMkEogtC2iUGy5KniuIVY2cg/MpuLp/kMoza8D00gi4DF2WmLdHNWq2tq74rxpk2QlXgC9eZyXSZ/8YMzw/3cvOfafq0N/zy4mmgW7fYx6X/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lzuHVdrl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30A27C4CEE3;
	Sat, 12 Apr 2025 19:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744487103;
	bh=kzSNmSKS9hY5c47HY+wXva7VoPSYzrY/19XJ4KoEFKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lzuHVdrls0xTg+r1JSH990eoUnF3q16yRYwgF92HWtKRFIxN+JgbmbbZLpaEG+CR+
	 hKXS/UXg0N0n+/xET/GvjuRfRJGCtBtqF96kSIXmgL9NnzPMWAHyC7x6txUoCmW3rd
	 xngJDT/1hwBgzlDZAvHE+fy0x+rcimEsJQfm1OI45rw33uectul4cGEpQArE5zwjiz
	 c9ATmj7VGZIeFWSyRSqlPFB4C4qTzj3be2Lh957o9jCjPrH3fVGEqWSiaAvPMzsSr0
	 6+hgyydHtGemhDu6yVkDSbaJmQ9jIaFCdPjByigwodCfQU3GUpfHJiXk2TXYJWpCXB
	 JiA9V2L/DMYWQ==
Date: Sat, 12 Apr 2025 21:44:56 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Mario Limonciello <superm1@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
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
Message-ID: <Z_rCuLD56IZ4hsNw@gmail.com>
References: <20250410200202.2974062-1-superm1@kernel.org>
 <20250410200202.2974062-3-superm1@kernel.org>
 <20250411114908.GLZ_kBtN94h79EEN6j@fat_crate.local>
 <dc564c29-38fc-4b9d-8b1c-c6f890b2333c@kernel.org>
 <20250411124157.GDZ_kOFfsGgY4zUXA5@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411124157.GDZ_kOFfsGgY4zUXA5@fat_crate.local>


* Borislav Petkov <bp@alien8.de> wrote:

> On Fri, Apr 11, 2025 at 07:09:56AM -0500, Mario Limonciello wrote:
> > I was aiming for a header that we would conceivably use in all these places
> > anyway.
> > 
> > Can you suggest a more fitting existing header?  A new one felt too heavy
> > for a single register define.
> 
> No, the logic is: put it in the *right* header. Not in the "whatever-works"
> header.

Yeah, it's the Linux kernel equivalent of: 'if you touch it, you own it',
a.k.a. 'no good deed goes unpunished'. ;-)

> So you can easily add a
> 
> arch/x86/include/asm/platform.h
> 
> header which contains exactly platform stuff. And FCH sounds like a platform
> thing to me. Or at least southbridge or whatever that thing is called now. It
> certainly ain't part of the CPU so platform should be more fitting.
> 
> Unless someone has a better idea...

Yeah, so I think we can create a brand new <asm/amd_sb.h> header or so, 
because it's an AMD SB800 southbridge chipset register? We already have 
<asm/amd_nb.h>.

'platform' might be a bit too generic and fungible I think: often the 
northbridge and the CPU is considered part of a 'platform' too.

Thanks,

	Ingo

