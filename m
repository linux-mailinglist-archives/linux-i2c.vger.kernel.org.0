Return-Path: <linux-i2c+bounces-10292-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B6256A8738A
	for <lists+linux-i2c@lfdr.de>; Sun, 13 Apr 2025 21:27:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6F6B18911A2
	for <lists+linux-i2c@lfdr.de>; Sun, 13 Apr 2025 19:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F6AF1F30BB;
	Sun, 13 Apr 2025 19:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pFfS402t"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0032E1993BD;
	Sun, 13 Apr 2025 19:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744572452; cv=none; b=kJeepB01bP3mWBRNn8gRqu3wj0wZ7+XI3BSm4M3+kSvY8HVzsiwcXaJ/FfbrJ9YQMkdtp2pg2+6GhLY4fQbVjr8daED+QrjOWCXANP6wtDMFHPBophVQY4knIm23UP+EeuhdYrryls6CJfqKGz4x49zp39woURYNMf6d1L/y5wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744572452; c=relaxed/simple;
	bh=zbe78LzyQnr54VkPXOkJAiqjPOtZuTJgjJ34BXUcNSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M4+cQdTFsHQZKDnUukPG0ujzhBbphckEnqim2qPBE+zy/kFzom38iaPDIyZa7wj/ZiumENIt17mXBQbTCKXmYg6T+AjEKQHhCfu+ByE62J78qoAZ+NMD1qaVd23rxHhp0tFmOgG80uDNqXP7ygveknS5GOPEfiMU6GG4uC1j+zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pFfS402t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C66D1C4CEDD;
	Sun, 13 Apr 2025 19:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744572451;
	bh=zbe78LzyQnr54VkPXOkJAiqjPOtZuTJgjJ34BXUcNSE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pFfS402t1IVMRZbh2DiMXdX54pl79RMP8TBpoqKxdZSaP05aEZusH1B/HLJJw1syF
	 f1Ey5IG0w1LF2NYyKDxisSTpjbpcYL2LUGkWg8hiYWPYf17XT7lwp4DP/j0WJcuOsS
	 uspjpcc+iBb5EIK2du0EaF9DkNFbHw6zLlWKe10EwzDKFd9RPY0GNQteKFtRCUQP/U
	 JUCbVwfEijpNh0SdXKFdwpBLc3BRTtZERgD6W9YQYV1sZMRu7N8ZWSSf1auQAxYSrz
	 MAqKJOI00WekF5RgKDLOrs+Pexuchfx7Sa7oJWaE8AmsMnuhohVwMN+BDtiDEABNp1
	 SZTrAGzZPH8MQ==
Message-ID: <1b5835f4-cc09-4cdd-ab75-6159793c242f@kernel.org>
Date: Sun, 13 Apr 2025 14:27:28 -0500
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] i2c: piix4: Move SB800_PIIX4_FCH_PM_ADDR
 definition to amd_node.h
To: Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Yazen Ghannam <yazen.ghannam@amd.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
 "H . Peter Anvin" <hpa@zytor.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Hans de Goede <hdegoede@redhat.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:I2C/SMBUS CONTROLLER DRIVERS FOR PC" <linux-i2c@vger.kernel.org>,
 "open list:AMD PMC DRIVER" <platform-driver-x86@vger.kernel.org>
References: <20250410200202.2974062-1-superm1@kernel.org>
 <20250410200202.2974062-3-superm1@kernel.org>
 <20250411114908.GLZ_kBtN94h79EEN6j@fat_crate.local>
 <dc564c29-38fc-4b9d-8b1c-c6f890b2333c@kernel.org>
 <20250411124157.GDZ_kOFfsGgY4zUXA5@fat_crate.local>
 <Z_rCuLD56IZ4hsNw@gmail.com>
 <5509f044-912b-4d10-bdeb-95ec52002b06@kernel.org>
 <Z_rJ37er9Dc25ne-@gmail.com> <BE7BBBD7-BDFF-452E-8FAA-669970950B27@alien8.de>
 <Z_ttp0ZNHEpNhh_9@gmail.com> <Z_t5YADNi0vpPqGO@gmail.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <Z_t5YADNi0vpPqGO@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/13/25 03:44, Ingo Molnar wrote:
> 
> * Ingo Molnar <mingo@kernel.org> wrote:
> 
>>
>> * Borislav Petkov <bp@alien8.de> wrote:
>>
>>> I was aiming more for a header which contains non-CPU defines -
>>> i.e., platform. But the FCH is only one part of that platform. But
>>> let's start with amd/fch.h - "amd/" subpath element would allow us
>>> to trivially put other headers there too - and see where it gets
>>> us. We can (and will) always refactor later if needed...
>>
>> Yeah, agreed on opening the <asm/amd/> namespace for this.
> 
> Here's a tree that establishes <asm/amd/> and moves existing headers
> there:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git WIP.x86/platform
> 
> Mario, could you base your series on top of this tree?
> 

Sure.

One problem that I notice though is that by using <asm/amd/fch.h> that 
drivers/i2c/busses/i2c-piix4.c has some compile failures on non-x86.

This is the same problem that lkp robot raised for v3 when it was on 
<asm/amd_node.h>:

https://lore.kernel.org/linux-doc/20250410200202.2974062-1-superm1@kernel.org/T/#mc33abfcdc434c85fbc94d03498759db631efcf53

What's the preferred way to handle it?

The three ways that immediately jump out to me:

1) Add '#if CONFIG_X86' around all related code.

2) Move applicable code to drivers/i2c/busses/i2c-amd-fch.c (similar to 
how we have i2c-amd-asf-plat.c) but modify drivers/i2c/busses/Makefile 
to only compile it for x86.

3) Idea two but also add a new Kconfig for CONFIG_I2C_AMD_FCH that 
depends on CONFIG_X86.

I am /leaning/ on the refactor with idea 3.

> Thanks,
> 
> 	Ingo
> 
> ===============>
> Ingo Molnar (6):
>    x86/platform/amd: Move the <asm/amd-ibs.h> header to <asm/amd/ibs.h>
>    x86/platform/amd: Add standard header guards to <asm/amd/ibs.h>
>    x86/platform/amd: Move the <asm/amd_nb.h> header to <asm/amd/nb.h>
>    x86/platform/amd: Move the <asm/amd_hsmp.h> header to <asm/amd/hsmp.h>
>    x86/platform/amd: Clean up the <asm/amd/hsmp.h> header guards a bit
>    x86/platform/amd: Move the <asm/amd_node.h> header to <asm/amd/node.h>
> 
>   Documentation/userspace-api/ioctl/ioctl-number.rst | 2 +-
>   MAINTAINERS                                        | 6 +++---
>   arch/x86/events/amd/ibs.c                          | 2 +-
>   arch/x86/include/asm/{amd_hsmp.h => amd/hsmp.h}    | 4 ++--
>   arch/x86/include/asm/{amd-ibs.h => amd/ibs.h}      | 5 +++++
>   arch/x86/include/asm/{amd_nb.h => amd/nb.h}        | 2 +-
>   arch/x86/include/asm/{amd_node.h => amd/node.h}    | 0
>   arch/x86/kernel/amd_gart_64.c                      | 2 +-
>   arch/x86/kernel/amd_nb.c                           | 2 +-
>   arch/x86/kernel/amd_node.c                         | 2 +-
>   arch/x86/kernel/aperture_64.c                      | 2 +-
>   arch/x86/kernel/cpu/cacheinfo.c                    | 2 +-
>   arch/x86/kernel/cpu/mce/inject.c                   | 2 +-
>   arch/x86/mm/amdtopology.c                          | 2 +-
>   arch/x86/mm/numa.c                                 | 2 +-
>   arch/x86/pci/amd_bus.c                             | 2 +-
>   arch/x86/pci/fixup.c                               | 2 +-
>   drivers/char/agp/amd64-agp.c                       | 2 +-
>   drivers/edac/amd64_edac.c                          | 4 ++--
>   drivers/hwmon/k10temp.c                            | 2 +-
>   drivers/platform/x86/amd/hsmp/acpi.c               | 4 ++--
>   drivers/platform/x86/amd/hsmp/hsmp.c               | 2 +-
>   drivers/platform/x86/amd/hsmp/plat.c               | 4 ++--
>   drivers/platform/x86/amd/pmc/mp1_stb.c             | 2 +-
>   drivers/platform/x86/amd/pmc/pmc.c                 | 2 +-
>   drivers/platform/x86/amd/pmf/core.c                | 2 +-
>   drivers/pnp/quirks.c                               | 2 +-
>   drivers/ras/amd/atl/internal.h                     | 4 ++--
>   sound/soc/amd/acp/acp-rembrandt.c                  | 2 +-
>   sound/soc/amd/acp/acp63.c                          | 2 +-
>   sound/soc/amd/acp/acp70.c                          | 2 +-
>   sound/soc/sof/amd/acp.c                            | 2 +-
>   tools/perf/check-headers.sh                        | 2 +-
>   tools/perf/util/amd-sample-raw.c                   | 2 +-
>   34 files changed, 44 insertions(+), 39 deletions(-)
>   rename arch/x86/include/asm/{amd_hsmp.h => amd/hsmp.h} (91%)
>   rename arch/x86/include/asm/{amd-ibs.h => amd/ibs.h} (98%)
>   rename arch/x86/include/asm/{amd_nb.h => amd/nb.h} (98%)
>   rename arch/x86/include/asm/{amd_node.h => amd/node.h} (100%)
> 


