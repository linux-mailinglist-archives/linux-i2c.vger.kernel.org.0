Return-Path: <linux-i2c+bounces-11279-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7695DAD19E2
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 10:36:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6581C3A9E42
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 08:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 685191F4C9F;
	Mon,  9 Jun 2025 08:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XO+uIp87"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EF113B58B;
	Mon,  9 Jun 2025 08:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749458190; cv=none; b=GBmgeANY+8gp0v0w8RpEkrPiDCmbM9QCElgy3SB/YLJjdUfG/nLA1zv4HQ4yHvcEhNULfEUORbGE+DstJekVj90tyUhtk0n8fmPZqwNYWTCHp2tbUysdkgyMAWSwIGQVz4hACHEy4oHBy63qFhuXWnyElsHmmLs77djEep78WA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749458190; c=relaxed/simple;
	bh=8QNRwHCuxJbDFi2bGOl3QM6WNpa0T685U6On908e3zg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=cGE+epXmyNgFyO0ZJticNShF2hA3RDZrECNj0dJZHJecaC9OvwGI/jiEq4bVb7iJEscxNcEP0pAjvvDac0HFNIteGjjngwzKWF+eGS54+Q2F6YGRH5kwV+gZigoIicaJPxXzH4ZMTq99g13FSh93BtefBHuXlhQlLnKqkKWPvRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XO+uIp87; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749458188; x=1780994188;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=8QNRwHCuxJbDFi2bGOl3QM6WNpa0T685U6On908e3zg=;
  b=XO+uIp87P3DxlnnbY5dtVTqb07pt4nxRC02kO3R/L21BTwMJYEW2t96L
   Dff+Vxyx9igl+xTwxM5W9Ej0hMsPRlTgNfzWwIrHBhCWRpk3uf1Harxn8
   +PBtaarFU9qYPfU7zeYa+qIDMXFLAEcKvxMXc/Ej7ngizlJxJ9Mq/0RHz
   y8hqP3mqRnrEnByuVflFgh86OUXW9odgJHLqG4JoUXqK/L/+Xu+jXgLLb
   9gpXGRMidbvyQQaObFyQ+qmzqB0TxGXGVIUE3KZ9gDpsetUcGxF52jJcM
   wL7usH7mlqddckBsAM5dWzmMZyO8lG8JfOYHqMrSk1WPrq6QAg6KiN2MD
   w==;
X-CSE-ConnectionGUID: w7apxO1gQgKp2Ydusvfxlg==
X-CSE-MsgGUID: orks4UjpTiGCo92pCyZLQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="54161131"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="54161131"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 01:36:27 -0700
X-CSE-ConnectionGUID: oV5OVo1VR/mpeE07O42iQw==
X-CSE-MsgGUID: 8tCg/4BQRS2YyU+FnCGwmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="150264707"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.22])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 01:36:22 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 9 Jun 2025 11:36:19 +0300 (EEST)
To: Pratap Nirujogi <pratap.nirujogi@amd.com>
cc: andi.shyti@kernel.org, rdunlap@infradead.org, 
    Hans de Goede <hdegoede@redhat.com>, sfr@canb.auug.org.au, 
    linux-next@vger.kernel.org, linux-i2c@vger.kernel.org, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com, 
    king.li@amd.com, dantony@amd.com
Subject: Re: [PATCH v3 2/3] i2c: amd-isp: Initialize unique adpater name
In-Reply-To: <20250606213446.1145099-3-pratap.nirujogi@amd.com>
Message-ID: <6136cfca-45ca-5832-cf5b-f49e16f6ed5e@linux.intel.com>
References: <20250606213446.1145099-1-pratap.nirujogi@amd.com> <20250606213446.1145099-3-pratap.nirujogi@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 6 Jun 2025, Pratap Nirujogi wrote:

> Initialize unique name for amdisp i2c adapter, which is used
> in the platform driver to detect the matching adapter for
> i2c_client creation.
> 
> Add definition of amdisp i2c adapter name in a new header file
> (include/linux/soc/amd/isp4_misc.h) as it is referred in different
> driver modules.
> 
> Tested-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
> ---
>  drivers/i2c/busses/i2c-designware-amdisp.c |  2 ++
>  include/linux/soc/amd/isp4_misc.h          | 12 ++++++++++++

You forgot to add this new file into MAINTAINERS file.

>  2 files changed, 14 insertions(+)
>  create mode 100644 include/linux/soc/amd/isp4_misc.h
> 
> diff --git a/drivers/i2c/busses/i2c-designware-amdisp.c b/drivers/i2c/busses/i2c-designware-amdisp.c
> index ad6f08338124..450793d5f839 100644
> --- a/drivers/i2c/busses/i2c-designware-amdisp.c
> +++ b/drivers/i2c/busses/i2c-designware-amdisp.c
> @@ -8,6 +8,7 @@
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/soc/amd/isp4_misc.h>
>  
>  #include "i2c-designware-core.h"
>  
> @@ -62,6 +63,7 @@ static int amd_isp_dw_i2c_plat_probe(struct platform_device *pdev)
>  
>  	adap = &isp_i2c_dev->adapter;
>  	adap->owner = THIS_MODULE;
> +	scnprintf(adap->name, sizeof(adap->name), AMDISP_I2C_ADAP_NAME);
>  	ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));
>  	adap->dev.of_node = pdev->dev.of_node;
>  	/* use dynamically allocated adapter id */
> diff --git a/include/linux/soc/amd/isp4_misc.h b/include/linux/soc/amd/isp4_misc.h
> new file mode 100644
> index 000000000000..6738796986a7
> --- /dev/null
> +++ b/include/linux/soc/amd/isp4_misc.h
> @@ -0,0 +1,12 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +/*
> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
> + */
> +
> +#ifndef __SOC_ISP4_MISC_H
> +#define __SOC_ISP4_MISC_H
> +
> +#define AMDISP_I2C_ADAP_NAME "AMDISP DesignWare I2C adapter"
> +
> +#endif
> 

-- 
 i.


