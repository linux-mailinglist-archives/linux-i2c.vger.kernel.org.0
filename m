Return-Path: <linux-i2c+bounces-11369-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C00AD6AEB
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jun 2025 10:36:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 012F23A00D3
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jun 2025 08:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC58821D3EC;
	Thu, 12 Jun 2025 08:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="poeKPkkw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787292153CB;
	Thu, 12 Jun 2025 08:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749717396; cv=none; b=YzzAvT7ayn5TQ63YDUOLrvXNsMAd+2p2qSOLgUG4R8u/Y0bZSsSYupML5Cm6uWY16gvJn8Ju1WI90Xe8/fEUn8jMRKDyF7p+VTJKmns4tCDDGsR5IOObdcjFHUQ9PqKDdibLcXw9pi45ySuRaRplZeMKTbjTW0RqdA/MrkLcqHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749717396; c=relaxed/simple;
	bh=sVgJ8qvJ2VSa38WpIG5GekK+tQbN3qtzWBhqiJ6QI6c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nZyHPCTvScYD8hUTdpJ5rhdb6+PtSaErDDU+HCGRWxoU1WGPNt9KcLG0PJsNspENwWKkGfjZXG94cMztF4nnkdNCfOFtvWnpWt+cnqDBfXDdGil7YmRYA+TJFeoCw5zIurevERM1PP4G7X0WOOhOpp2p/ZwwBOeHDfrxAfi/iSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=poeKPkkw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 060B5C4CEEA;
	Thu, 12 Jun 2025 08:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749717395;
	bh=sVgJ8qvJ2VSa38WpIG5GekK+tQbN3qtzWBhqiJ6QI6c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=poeKPkkwG8en8DfJKEy0RCeiVCsiHOIMUXlvildhQZQOKL99w7Qq7AxVjaIQUU2jA
	 yIWgbiOi9OVQTpeJLOQ0XBBkYsxsD1CK0F3QrnyKugdfMzZYICRXbBQO1s6sXoZHwg
	 a+q8BR3JPf22zZWxPOlyTjo7mQa2VTt9+zeLozl+uDwHrytIoRyBYuMq8u6zap+smA
	 DmkMAQIp0ifOwQgTAjgxr9oaFtRdQNuX9S/AbODm5PyACkhYYy1iCeL2882YdZdmQt
	 fMy1dxD7rB/7GOndPB/R3EtVXid7fHdVOCdkjC+7KhtWNqM2hhjsn8umQWyRukRUhG
	 C28nAsCJXlyAw==
Message-ID: <c3d78272-c80d-47fa-a32d-151c137251e3@kernel.org>
Date: Thu, 12 Jun 2025 10:36:31 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] Move FCH header to a location accessible by all archs
To: Mario Limonciello <superm1@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
 "H . Peter Anvin" <hpa@zytor.com>, Andi Shyti <andi.shyti@kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Shyam Sundar S K
 <Shyam-sundar.S-k@amd.com>, Hans de Goede <hdegoede@redhat.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 "open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)"
 <linux-kernel@vger.kernel.org>,
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
 "open list:AMD PMC DRIVER" <platform-driver-x86@vger.kernel.org>
References: <20250610205817.3912944-1-superm1@kernel.org>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250610205817.3912944-1-superm1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 10-Jun-25 10:58 PM, Mario Limonciello wrote:
> From: Mario Limonciello <mario.limonciello@amd.com>
> 
> A new header fch.h was created to store registers used by different AMD
> drivers.  This header was included by i2c-piix4 in
> commit 624b0d5696a8 ("i2c: piix4, x86/platform: Move the SB800 PIIX4 FCH
> definitions to <asm/amd/fch.h>"). To prevent compile failures on non-x86
> archs i2c-piix4 was set to only compile on x86 by commit 7e173eb82ae9717
> ("i2c: piix4: Make CONFIG_I2C_PIIX4 dependent on CONFIG_X86").
> This was not a good decision because loongarch and mips both actually
> support i2c-piix4 and set it enabled in the defconfig.
> 
> Move the header to a location accessible by all architectures.
> 
> Fixes: 624b0d5696a89 ("i2c: piix4, x86/platform: Move the SB800 PIIX4 FCH definitions to <asm/amd/fch.h>")
> Suggested-by: Hans de Goede <hansg@kernel.org>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

Regards,

Hans



> ---
>  arch/x86/kernel/cpu/amd.c                                       | 2 +-
>  drivers/i2c/busses/i2c-piix4.c                                  | 2 +-
>  drivers/platform/x86/amd/pmc/pmc-quirks.c                       | 2 +-
>  .../asm/amd/fch.h => include/linux/platform_data/x86/amd-fch.h  | 0
>  4 files changed, 3 insertions(+), 3 deletions(-)
>  rename arch/x86/include/asm/amd/fch.h => include/linux/platform_data/x86/amd-fch.h (100%)
> 
> diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
> index 93da466dfe2cb..9543d5de4e7d6 100644
> --- a/arch/x86/kernel/cpu/amd.c
> +++ b/arch/x86/kernel/cpu/amd.c
> @@ -9,7 +9,7 @@
>  #include <linux/sched/clock.h>
>  #include <linux/random.h>
>  #include <linux/topology.h>
> -#include <asm/amd/fch.h>
> +#include <linux/platform_data/x86/amd-fch.h>
>  #include <asm/processor.h>
>  #include <asm/apic.h>
>  #include <asm/cacheinfo.h>
> diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
> index 9d3a4dc2bd60c..ac3bb550303fe 100644
> --- a/drivers/i2c/busses/i2c-piix4.c
> +++ b/drivers/i2c/busses/i2c-piix4.c
> @@ -34,7 +34,7 @@
>  #include <linux/dmi.h>
>  #include <linux/acpi.h>
>  #include <linux/io.h>
> -#include <asm/amd/fch.h>
> +#include <linux/platform_data/x86/amd-fch.h>
>  
>  #include "i2c-piix4.h"
>  
> diff --git a/drivers/platform/x86/amd/pmc/pmc-quirks.c b/drivers/platform/x86/amd/pmc/pmc-quirks.c
> index 5c7c01f66cde0..6648fe0dce537 100644
> --- a/drivers/platform/x86/amd/pmc/pmc-quirks.c
> +++ b/drivers/platform/x86/amd/pmc/pmc-quirks.c
> @@ -11,7 +11,7 @@
>  #include <linux/dmi.h>
>  #include <linux/io.h>
>  #include <linux/ioport.h>
> -#include <asm/amd/fch.h>
> +#include <linux/platform_data/x86/amd-fch.h>
>  
>  #include "pmc.h"
>  
> diff --git a/arch/x86/include/asm/amd/fch.h b/include/linux/platform_data/x86/amd-fch.h
> similarity index 100%
> rename from arch/x86/include/asm/amd/fch.h
> rename to include/linux/platform_data/x86/amd-fch.h


