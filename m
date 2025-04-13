Return-Path: <linux-i2c+bounces-10293-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F0CA87394
	for <lists+linux-i2c@lfdr.de>; Sun, 13 Apr 2025 21:32:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08A9A3B68F4
	for <lists+linux-i2c@lfdr.de>; Sun, 13 Apr 2025 19:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F0E21E1DE0;
	Sun, 13 Apr 2025 19:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rPqrtt2O"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E0A178372;
	Sun, 13 Apr 2025 19:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744572741; cv=none; b=Mqyg91/ltGkAlgB/Bspv0bJHjHvjoyeeZvtI5lnNzpkIcxjWPy+ebyIQL0xf+gcEH1rRnYcnd/dw8SWu7SM9gqFHozf/WVqcqPFFE+ZqFQi2cB92TkwQZ4vWM1Gadn6Wl7w6xY8+V3/twF3Bi5xSN8LNQBqwFmn4X+Tf4UolxLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744572741; c=relaxed/simple;
	bh=aoJ41MTK7om0A4vaNXUhyT4kK5YDNIZ0M5saG+CPtok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LDvpkexbTng7NZKTNZXrL0KEQT7+c3tRf+86c+tWCdjMCIqqudn18A1vIadTZ7v6YM4p4BcPwuApBQKwuVRsGrNNOuDK1KZV0hEXLTOfJEYqMfQK0kuWq8D1YSgUAfgiT2dP5dwab4avgIXT3YbdNUXpsBLf8sr/J5G0eUXPKBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rPqrtt2O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04407C4CEDD;
	Sun, 13 Apr 2025 19:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744572740;
	bh=aoJ41MTK7om0A4vaNXUhyT4kK5YDNIZ0M5saG+CPtok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rPqrtt2OcgL4B22YjLq+3AuJXoQfDMElXqqc3JFIJIC5qZtqHlPpuUK+Srn+zf1a+
	 xOqELQOApmJtN51s9TM6tYOCSKVRbgwCAqUORNCq4mNTvYdfiG93ju40NKevuMtUwc
	 WQy/ZiRSRvSrEC3EQ2XjvKxdoF/lD3Ljdatrdqpof9DbBWuqhf82Dqu06WkHxJuP8q
	 KXfHv9TbnTAwe4fvxauOlQ6Nv61VyscpDGDV2CIr++AC4eqFRvOK9TLQBK7Qowtl15
	 60pvV/gi+cAL0znPCATnXbkqyyujvT8hKbEH2CHGYsbkmXD4MW8a5rdpMf6er8vbbh
	 SoDhzFRjjVw2Q==
Date: Sun, 13 Apr 2025 21:32:13 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Mario Limonciello <superm1@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>, Jean Delvare <jdelvare@suse.com>,
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
Message-ID: <Z_wRPb5H5hi6jmxN@gmail.com>
References: <20250411114908.GLZ_kBtN94h79EEN6j@fat_crate.local>
 <dc564c29-38fc-4b9d-8b1c-c6f890b2333c@kernel.org>
 <20250411124157.GDZ_kOFfsGgY4zUXA5@fat_crate.local>
 <Z_rCuLD56IZ4hsNw@gmail.com>
 <5509f044-912b-4d10-bdeb-95ec52002b06@kernel.org>
 <Z_rJ37er9Dc25ne-@gmail.com>
 <BE7BBBD7-BDFF-452E-8FAA-669970950B27@alien8.de>
 <Z_ttp0ZNHEpNhh_9@gmail.com>
 <Z_t5YADNi0vpPqGO@gmail.com>
 <1b5835f4-cc09-4cdd-ab75-6159793c242f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b5835f4-cc09-4cdd-ab75-6159793c242f@kernel.org>


* Mario Limonciello <superm1@kernel.org> wrote:

> 
> 
> On 4/13/25 03:44, Ingo Molnar wrote:
> > 
> > * Ingo Molnar <mingo@kernel.org> wrote:
> > 
> > > 
> > > * Borislav Petkov <bp@alien8.de> wrote:
> > > 
> > > > I was aiming more for a header which contains non-CPU defines -
> > > > i.e., platform. But the FCH is only one part of that platform. But
> > > > let's start with amd/fch.h - "amd/" subpath element would allow us
> > > > to trivially put other headers there too - and see where it gets
> > > > us. We can (and will) always refactor later if needed...
> > > 
> > > Yeah, agreed on opening the <asm/amd/> namespace for this.
> > 
> > Here's a tree that establishes <asm/amd/> and moves existing headers
> > there:
> > 
> >    git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git WIP.x86/platform
> > 
> > Mario, could you base your series on top of this tree?
> > 
> 
> Sure.
> 
> One problem that I notice though is that by using <asm/amd/fch.h> that
> drivers/i2c/busses/i2c-piix4.c has some compile failures on non-x86.

Hm, should these I2C drivers even be built on non-x86 systems?

> 1) Add '#if CONFIG_X86' around all related code.
> 
> 2) Move applicable code to drivers/i2c/busses/i2c-amd-fch.c (similar to how
> we have i2c-amd-asf-plat.c) but modify drivers/i2c/busses/Makefile to only
> compile it for x86.
> 
> 3) Idea two but also add a new Kconfig for CONFIG_I2C_AMD_FCH that depends
> on CONFIG_X86.
> 
> I am /leaning/ on the refactor with idea 3.

I'd go for something like the patch below. There's X86 dependencies for 
other I2C drivers as well, so it's not unprecedented.

Thanks,

	Ingo

==============>
 drivers/i2c/busses/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 83c88c79afe2..bbbd6240fa6e 100644
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


