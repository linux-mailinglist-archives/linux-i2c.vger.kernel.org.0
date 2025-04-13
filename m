Return-Path: <linux-i2c+bounces-10291-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2E6A87117
	for <lists+linux-i2c@lfdr.de>; Sun, 13 Apr 2025 10:44:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D700D7AE7FD
	for <lists+linux-i2c@lfdr.de>; Sun, 13 Apr 2025 08:43:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61074187876;
	Sun, 13 Apr 2025 08:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nR6Id4kC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B67BF4ED;
	Sun, 13 Apr 2025 08:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744533864; cv=none; b=UP3/DupH7GHmSQIgTy1tdu+PTSN7B2xSggHvaOgqqxA7IzNJEFxqE8KAbr9zNBf0hUvW35Nz5GNRcG54NoSpJQx8emjaHBVLhEUeq7ikamRg/wG764b3NKRKy6NIPv1aGC1Is7BqHNufKGohbTtjAbHfnwH7qzHG9CaDevx83h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744533864; c=relaxed/simple;
	bh=ggLvSho10J1Z8mBOnN+HJ9YJE6RLIhpzFaDVmfin2ZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M2xTBO3OLOrqUTY9NkQjGuFlibsPz8E9BGupgk+jCUD4x+Arua1yQU8UnCsreDNfW+hZF6ssBHe5OAixOYfkeTBcLhqoPCEoR/xiMbZ0OPuUynbPjgS2rrEjer/1H+7BTaMzE9qExYaWXAz+e6vgyYr8yHqIJFWuThp/8onKS24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nR6Id4kC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FFC8C4CEDD;
	Sun, 13 Apr 2025 08:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744533863;
	bh=ggLvSho10J1Z8mBOnN+HJ9YJE6RLIhpzFaDVmfin2ZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nR6Id4kC12Sj6i3thX+9jE7vJInBAMl/JlgwDDzlz/zHyc004U32fFXawxVZXIoYO
	 YCNxs0ARtNHmHvEVTDk5im3RT6z2xwDlvnXkprCj1oedvYNVzEvIhGiHNstdJaOxVb
	 e32B1+yaSoxkHs+ivnfhzQcSNB1Zl7+3o//slpZ1HAytW0ZZBYJuK09Vc0GUaC6ETX
	 eLfsSjqcA9R4lMS8pjx1bDpjnBqSKL6iZD2zRawPcDZ2wNLXpd/0GOqi7R7xO44kVO
	 jkQMHEKAcikvq8YueZsgLRFFH9Y4kKldlMu6OZturwsm/FDX7lIDTsmHKuTdnxNbjF
	 OnS+xvJMmIr0g==
Date: Sun, 13 Apr 2025 10:44:16 +0200
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
Message-ID: <Z_t5YADNi0vpPqGO@gmail.com>
References: <20250410200202.2974062-1-superm1@kernel.org>
 <20250410200202.2974062-3-superm1@kernel.org>
 <20250411114908.GLZ_kBtN94h79EEN6j@fat_crate.local>
 <dc564c29-38fc-4b9d-8b1c-c6f890b2333c@kernel.org>
 <20250411124157.GDZ_kOFfsGgY4zUXA5@fat_crate.local>
 <Z_rCuLD56IZ4hsNw@gmail.com>
 <5509f044-912b-4d10-bdeb-95ec52002b06@kernel.org>
 <Z_rJ37er9Dc25ne-@gmail.com>
 <BE7BBBD7-BDFF-452E-8FAA-669970950B27@alien8.de>
 <Z_ttp0ZNHEpNhh_9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_ttp0ZNHEpNhh_9@gmail.com>


* Ingo Molnar <mingo@kernel.org> wrote:

> 
> * Borislav Petkov <bp@alien8.de> wrote:
> 
> > I was aiming more for a header which contains non-CPU defines - 
> > i.e., platform. But the FCH is only one part of that platform. But 
> > let's start with amd/fch.h - "amd/" subpath element would allow us 
> > to trivially put other headers there too - and see where it gets 
> > us. We can (and will) always refactor later if needed...
> 
> Yeah, agreed on opening the <asm/amd/> namespace for this.

Here's a tree that establishes <asm/amd/> and moves existing headers 
there:

  git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git WIP.x86/platform

Mario, could you base your series on top of this tree?

Thanks,

	Ingo

===============>
Ingo Molnar (6):
  x86/platform/amd: Move the <asm/amd-ibs.h> header to <asm/amd/ibs.h>
  x86/platform/amd: Add standard header guards to <asm/amd/ibs.h>
  x86/platform/amd: Move the <asm/amd_nb.h> header to <asm/amd/nb.h>
  x86/platform/amd: Move the <asm/amd_hsmp.h> header to <asm/amd/hsmp.h>
  x86/platform/amd: Clean up the <asm/amd/hsmp.h> header guards a bit
  x86/platform/amd: Move the <asm/amd_node.h> header to <asm/amd/node.h>

 Documentation/userspace-api/ioctl/ioctl-number.rst | 2 +-
 MAINTAINERS                                        | 6 +++---
 arch/x86/events/amd/ibs.c                          | 2 +-
 arch/x86/include/asm/{amd_hsmp.h => amd/hsmp.h}    | 4 ++--
 arch/x86/include/asm/{amd-ibs.h => amd/ibs.h}      | 5 +++++
 arch/x86/include/asm/{amd_nb.h => amd/nb.h}        | 2 +-
 arch/x86/include/asm/{amd_node.h => amd/node.h}    | 0
 arch/x86/kernel/amd_gart_64.c                      | 2 +-
 arch/x86/kernel/amd_nb.c                           | 2 +-
 arch/x86/kernel/amd_node.c                         | 2 +-
 arch/x86/kernel/aperture_64.c                      | 2 +-
 arch/x86/kernel/cpu/cacheinfo.c                    | 2 +-
 arch/x86/kernel/cpu/mce/inject.c                   | 2 +-
 arch/x86/mm/amdtopology.c                          | 2 +-
 arch/x86/mm/numa.c                                 | 2 +-
 arch/x86/pci/amd_bus.c                             | 2 +-
 arch/x86/pci/fixup.c                               | 2 +-
 drivers/char/agp/amd64-agp.c                       | 2 +-
 drivers/edac/amd64_edac.c                          | 4 ++--
 drivers/hwmon/k10temp.c                            | 2 +-
 drivers/platform/x86/amd/hsmp/acpi.c               | 4 ++--
 drivers/platform/x86/amd/hsmp/hsmp.c               | 2 +-
 drivers/platform/x86/amd/hsmp/plat.c               | 4 ++--
 drivers/platform/x86/amd/pmc/mp1_stb.c             | 2 +-
 drivers/platform/x86/amd/pmc/pmc.c                 | 2 +-
 drivers/platform/x86/amd/pmf/core.c                | 2 +-
 drivers/pnp/quirks.c                               | 2 +-
 drivers/ras/amd/atl/internal.h                     | 4 ++--
 sound/soc/amd/acp/acp-rembrandt.c                  | 2 +-
 sound/soc/amd/acp/acp63.c                          | 2 +-
 sound/soc/amd/acp/acp70.c                          | 2 +-
 sound/soc/sof/amd/acp.c                            | 2 +-
 tools/perf/check-headers.sh                        | 2 +-
 tools/perf/util/amd-sample-raw.c                   | 2 +-
 34 files changed, 44 insertions(+), 39 deletions(-)
 rename arch/x86/include/asm/{amd_hsmp.h => amd/hsmp.h} (91%)
 rename arch/x86/include/asm/{amd-ibs.h => amd/ibs.h} (98%)
 rename arch/x86/include/asm/{amd_nb.h => amd/nb.h} (98%)
 rename arch/x86/include/asm/{amd_node.h => amd/node.h} (100%)

-- 
2.45.2


