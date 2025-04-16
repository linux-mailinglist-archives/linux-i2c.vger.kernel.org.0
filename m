Return-Path: <linux-i2c+bounces-10399-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF33A8B2CF
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 09:58:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20DDC3B3755
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 07:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEDDF22DFBF;
	Wed, 16 Apr 2025 07:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AxUdxyRr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A9521D3F4;
	Wed, 16 Apr 2025 07:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744790307; cv=none; b=qbJhPdVk02EZwzmmM3hYzS/BHMMwlswNy6vqeHdIuxzKo6HVG4VEdp2vHEsAiXG1TY0w5uOtLVR5WSYO9xJgZXGVIuc+cAMHTisfGW3ipRkaO4grsTsLynt19fuC5CwCOYPG8CjwZy+wA1tHh5J5Pzn1kcY+yER2aKSQG7ILmKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744790307; c=relaxed/simple;
	bh=g8YPW39hxmx5YvNcbfIuiJT1dut85FSOVUEZdSWmv5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IOLKeqrpDzfRGLEaUfa7pRQDRUHVh4e6ca65wwn+Rfr2bTD1i1nROlxWAkXBVMZ0tRGslxODsvw2OfbdkHm+iRrlR6Vav/8ZXAg0gEzjG/LlwL2LLi9pwp5YKnwl5A0i26MB/nIPSqmHksSBRyT7B1Yq4NIjE63lHjzcgawQVEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AxUdxyRr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FA2DC4CEE2;
	Wed, 16 Apr 2025 07:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744790306;
	bh=g8YPW39hxmx5YvNcbfIuiJT1dut85FSOVUEZdSWmv5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AxUdxyRr+0hwSePWXRQg5uJqs1WDb20uf76494nsnCj+SUjMJiZ7ntGelXhOqX0TJ
	 cHHuJ+LrlQVB7xPfdqMD+LhYExgPondKE7L+fn3oJXQfUJUq0rRJ95WxSmQ5W1f0Cw
	 OxZ2PFpK6WqXaUHfz94IKBCUCt5FOWv366Wba2ALriB1H/bdwapOhX076N9hCD+iab
	 i2jMditYsnNLPgxXvH3u32wZXdtIDIjq+EUUt0eQR3t5hnJLQ+pZ0z2TjvVs6VSx70
	 ZQgy4w3bszc0ZbepNphCNR9JwUh8VvKZZQPPcq0gJuyx61jSVxUbFOr/4oWyWii0yf
	 tn9AWX93yb+yQ==
Date: Wed, 16 Apr 2025 09:58:20 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: Mario Limonciello <superm1@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Mario Limonciello <mario.limonciello@amd.com>,
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
Subject: Re: [PATCH v4 4/5] platform/x86/amd: pmc: use FCH_PM_BASE definition
Message-ID: <Z_9jHCpbTciJ8d2_@gmail.com>
References: <20250415002658.1320419-1-superm1@kernel.org>
 <20250415002658.1320419-5-superm1@kernel.org>
 <20250415151326.GA624550@yaz-khff2.amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415151326.GA624550@yaz-khff2.amd.com>


* Yazen Ghannam <yazen.ghannam@amd.com> wrote:

> On Mon, Apr 14, 2025 at 07:26:57PM -0500, Mario Limonciello wrote:
> > From: Mario Limonciello <mario.limonciello@amd.com>
> > 
> > The s2idle mmio quirk uses a scratch register in the FCH.
> > Adjust the code to clarify that.
> > 
> > Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> > ---
> > v4:
> >  * Use fch.h instead
> > ---
> >  arch/x86/include/asm/amd/fch.h            | 1 +
> >  drivers/platform/x86/amd/pmc/pmc-quirks.c | 3 ++-
> >  2 files changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/x86/include/asm/amd/fch.h b/arch/x86/include/asm/amd/fch.h
> > index a5fd91ff92df3..9b32e8a03193e 100644
> > --- a/arch/x86/include/asm/amd/fch.h
> > +++ b/arch/x86/include/asm/amd/fch.h
> > @@ -8,5 +8,6 @@
> >  /* register offsets from PM base */
> >  #define FCH_PM_DECODEEN			0x00
> >  #define FCH_PM_DECODEEN_SMBUS0SEL	GENMASK(20, 19)
> > +#define FCH_PM_SCRATCH			0x80
> >  
> >  #endif
> > diff --git a/drivers/platform/x86/amd/pmc/pmc-quirks.c b/drivers/platform/x86/amd/pmc/pmc-quirks.c
> > index b4f49720c87f6..3c680d2029f62 100644
> > --- a/drivers/platform/x86/amd/pmc/pmc-quirks.c
> > +++ b/drivers/platform/x86/amd/pmc/pmc-quirks.c
> > @@ -8,6 +8,7 @@
> >   * Author: Mario Limonciello <mario.limonciello@amd.com>
> >   */
> >  
> > +#include <asm/amd/fch.h>
> 
> Arch headers should go after linux headers, I think.

That's true, but it's a mostly stylistic requirement these days.

> So that arch stuff can override generic stuff.

Arch headers that override generic stuff are very much supposed to be 
able to build stand-alone and in pretty much any order with other 
headers, with very few exceptions. Ordering dependencies are very much 
frowned upon, because if they don't trigger build failures they can 
result in subtle breakages.

Thanks,

	Ingo

