Return-Path: <linux-i2c+bounces-10290-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AFFA870F7
	for <lists+linux-i2c@lfdr.de>; Sun, 13 Apr 2025 09:54:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECBB63AE3E8
	for <lists+linux-i2c@lfdr.de>; Sun, 13 Apr 2025 07:54:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00155178CF8;
	Sun, 13 Apr 2025 07:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AinuOW0E"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E95AD51;
	Sun, 13 Apr 2025 07:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744530862; cv=none; b=Sbza91Im2DvrmMmBWmdudUcml3dOSvPdXC2Hb8LqLROb3M9UrzKw1r7X3khOr5yvy9zABVKSt3mKLMYJi1lXCA/JJ4K1QFHlainZgqoD2iTTygYnNvGN4YrTpKjtzO2MvUdiwTlC4G15I+F6s1f1gUIlzDsAAZ+3V1Qpfju1vS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744530862; c=relaxed/simple;
	bh=HaMA3Kl+meGFuUQOS/ZfEYd8wtkz83n+WzSGOOL5TFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OybxDci3mHWTgR1+OZnCt+7Vby6idbTHOxaom/Ut1c5oNZNNKWVAJd4EBcsiLASPLJu+wIpLRDKICHJy849NdRgivRA+t6dGW5FHbclkFvcl/e619ALtDkPhamLUg9lQXXRXi6DTT0tvc5uV2i3D2cX7DhKY8qfgJL6UKWUNx64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AinuOW0E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DB1DC4CEDD;
	Sun, 13 Apr 2025 07:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744530862;
	bh=HaMA3Kl+meGFuUQOS/ZfEYd8wtkz83n+WzSGOOL5TFo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AinuOW0EIqPjYFPMwEsVSBNrmH7DDwhnxqqRjuIb45I0zKaxjlTNknmDUXsbY4NST
	 hCjNSXnnCvPMFTYrcDJEjxSa7Qx+5P8mx0c6zVBlwKDsdBhOP2+r8cUZ4eftWXC+Yh
	 Kb3ecfFoirp9ZjMSkB62uAb27onn9Mg0/hwMTtvQkR68gKAELQ7C/1MURxG8CukIL3
	 MK1lpwC40ehUTsoZYRnV8To6TYopbh8L/1Od7XeubxWr9MhprsS1zqDXLhY3GxzlRM
	 tFtLuKNu/gtVDVkKtPpR1Sgy0owxRmXumFb1o1gvWq5ljYOtPtI5bbQm0MoxAR/4nv
	 7N+9aosY45TpA==
Date: Sun, 13 Apr 2025 09:54:15 +0200
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
Message-ID: <Z_ttp0ZNHEpNhh_9@gmail.com>
References: <20250410200202.2974062-1-superm1@kernel.org>
 <20250410200202.2974062-3-superm1@kernel.org>
 <20250411114908.GLZ_kBtN94h79EEN6j@fat_crate.local>
 <dc564c29-38fc-4b9d-8b1c-c6f890b2333c@kernel.org>
 <20250411124157.GDZ_kOFfsGgY4zUXA5@fat_crate.local>
 <Z_rCuLD56IZ4hsNw@gmail.com>
 <5509f044-912b-4d10-bdeb-95ec52002b06@kernel.org>
 <Z_rJ37er9Dc25ne-@gmail.com>
 <BE7BBBD7-BDFF-452E-8FAA-669970950B27@alien8.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BE7BBBD7-BDFF-452E-8FAA-669970950B27@alien8.de>


* Borislav Petkov <bp@alien8.de> wrote:

> On April 12, 2025 10:15:27 PM GMT+02:00, Ingo Molnar <mingo@kernel.org> wrote:
> >
> >* Mario Limonciello <superm1@kernel.org> wrote:
> >
> >> SB800 is pre-Zen stuff.  It's "before my time" - I guess that's the 
> >> precursor to FCH being in the SoC but has the same functionality.
> >> 
> >> So I'm thinking <asm/amd_fch.h>.
> >
> >I went by the SB800_PIIX4_FCH_PM_ADDR name, which is a misnomer these 
> >days?
> >
> >But yeah, <asm/amd_fch.h> sounds good to me too. Boris?
> 
> I was aiming more for a header which contains non-CPU defines - i.e., 
> platform. But the FCH is only one part of that platform. But let's 
> start with amd/fch.h - "amd/" subpath element would allow us to 
> trivially put other headers there too - and see where it gets us. We 
> can (and will) always refactor later if needed...

Yeah, agreed on opening the <asm/amd/> namespace for this.

Thanks,

	Ingo

