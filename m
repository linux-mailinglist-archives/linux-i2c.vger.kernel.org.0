Return-Path: <linux-i2c+bounces-10680-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2181DAA0F37
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Apr 2025 16:40:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67E293A524E
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Apr 2025 14:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05013217F29;
	Tue, 29 Apr 2025 14:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L4KdXSAn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D30D18A93F;
	Tue, 29 Apr 2025 14:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745937556; cv=none; b=QvM1B3QPCdK1xJyYOuxo9+8bkHNX8RgZNmEif++oxuC1V7yD3N4IHqgkbekZGcBxqABgLrYxJB6gpyi+ROdS/dbR5I58l/nzwdvCit/9nyCDIzMTh5xShvepWlsR1dFyj2dMePhoGkN0aCPBdBXMKRFvozmReWQIeabqayTE3RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745937556; c=relaxed/simple;
	bh=ZC8ueqExZjMa8LECXOCWJ/qGA+lpkuk87Elx4I4QX4M=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=M91gqtAEhrQpjV9cPXy990ge7bimTn0RFz2jEmVw2+/65kpzszd2Xsin9mo+embwBSQL5j0N14E+0pcngAONFrTsoOed90uGxnKTWFun9PRLD7keIqCHipY3kUFKsi2nIRp0XqU5gZ3v7AbAU/1tKEK1TDOxNoA5UbJ65z+BLZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L4KdXSAn; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745937555; x=1777473555;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ZC8ueqExZjMa8LECXOCWJ/qGA+lpkuk87Elx4I4QX4M=;
  b=L4KdXSAnDwPt/kUjauaW8cShmbA6kao+JcBz4tGeIOYOj7WJfUObL9L3
   X1NzGAJtVVBRhlscGZOSauJHT7H537dPiaBftTsSlWlnVEHpOZZnbYzV/
   kBgqR6Bw4colGQz395Df/WqiHfmDScNbn3ZdJwlHBYrgKv8qI1TZME0wy
   81fS8jjfVgQq495z7Sv4EbuNU4dhwcEI7NVwMe236pDJUolt2gvu76TMU
   ch340Bepot0xA1bKpkZqh2HBNn9n5m/gMOw/k9LSTCqe+mzwXAbDWPe9W
   vBOZQ540XKFUoWbAwxpwEwiPmslOar97TOyCxy13ET8abAxfuaG7pt/To
   g==;
X-CSE-ConnectionGUID: Ek/4+rg6SwiVt0oQQty9YA==
X-CSE-MsgGUID: 4T252o0uTF+HCnv+KTc66w==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="51231565"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="51231565"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 07:39:14 -0700
X-CSE-ConnectionGUID: KkqNdPTISbWg3K8s1DQf+w==
X-CSE-MsgGUID: m/Rk5MezSIKyMqFe+gT75w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="134361173"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.205])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 07:39:08 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 29 Apr 2025 17:39:04 +0300 (EEST)
To: Mario Limonciello <superm1@kernel.org>
cc: Borislav Petkov <bp@alien8.de>, Jean Delvare <jdelvare@suse.com>, 
    Andi Shyti <andi.shyti@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
    Mario Limonciello <mario.limonciello@amd.com>, 
    Yazen Ghannam <yazen.ghannam@amd.com>, 
    Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
    Dave Hansen <dave.hansen@linux.intel.com>, 
    "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, 
    "H . Peter Anvin" <hpa@zytor.com>, 
    Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
    Hans de Goede <hdegoede@redhat.com>, 
    "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
    open list <linux-kernel@vger.kernel.org>, 
    "open list:I2C/SMBUS CONTROLLER DRIVERS FOR PC" <linux-i2c@vger.kernel.org>, 
    "open list:AMD PMC DRIVER" <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH v5 4/5] platform/x86/amd: pmc: use FCH_PM_BASE
 definition
In-Reply-To: <20250422234830.2840784-5-superm1@kernel.org>
Message-ID: <21363441-13a0-b5bc-4674-238526b16b5b@linux.intel.com>
References: <20250422234830.2840784-1-superm1@kernel.org> <20250422234830.2840784-5-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-352066760-1745937544=:938"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-352066760-1745937544=:938
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 22 Apr 2025, Mario Limonciello wrote:

> From: Mario Limonciello <mario.limonciello@amd.com>
>=20
> The s2idle mmio quirk uses a scratch register in the FCH.
> Adjust the code to clarify that.
>=20
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

This is quite trivial change, but here is this for completeness in case=20
x86 maintainers want to have it:

Acked-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--
 i.

> ---
> v5:
>  * Move <asm> header after <linux> headers
> v4:
>  * Use fch.h instead
> ---
>  arch/x86/include/asm/amd/fch.h            | 1 +
>  drivers/platform/x86/amd/pmc/pmc-quirks.c | 3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/x86/include/asm/amd/fch.h b/arch/x86/include/asm/amd/fc=
h.h
> index a5fd91ff92df3..9b32e8a03193e 100644
> --- a/arch/x86/include/asm/amd/fch.h
> +++ b/arch/x86/include/asm/amd/fch.h
> @@ -8,5 +8,6 @@
>  /* register offsets from PM base */
>  #define FCH_PM_DECODEEN=09=09=090x00
>  #define FCH_PM_DECODEEN_SMBUS0SEL=09GENMASK(20, 19)
> +#define FCH_PM_SCRATCH=09=09=090x80
> =20
>  #endif
> diff --git a/drivers/platform/x86/amd/pmc/pmc-quirks.c b/drivers/platform=
/x86/amd/pmc/pmc-quirks.c
> index b4f49720c87f6..b706b1f4d94bf 100644
> --- a/drivers/platform/x86/amd/pmc/pmc-quirks.c
> +++ b/drivers/platform/x86/amd/pmc/pmc-quirks.c
> @@ -11,6 +11,7 @@
>  #include <linux/dmi.h>
>  #include <linux/io.h>
>  #include <linux/ioport.h>
> +#include <asm/amd/fch.h>
> =20
>  #include "pmc.h"
> =20
> @@ -20,7 +21,7 @@ struct quirk_entry {
>  };
> =20
>  static struct quirk_entry quirk_s2idle_bug =3D {
> -=09.s2idle_bug_mmio =3D 0xfed80380,
> +=09.s2idle_bug_mmio =3D FCH_PM_BASE + FCH_PM_SCRATCH,
>  };
> =20
>  static struct quirk_entry quirk_spurious_8042 =3D {
>=20
--8323328-352066760-1745937544=:938--

