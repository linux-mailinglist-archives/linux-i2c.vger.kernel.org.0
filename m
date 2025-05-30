Return-Path: <linux-i2c+bounces-11174-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 076DBAC92E3
	for <lists+linux-i2c@lfdr.de>; Fri, 30 May 2025 18:02:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7830161368
	for <lists+linux-i2c@lfdr.de>; Fri, 30 May 2025 16:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FBCB18FC80;
	Fri, 30 May 2025 16:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="irLs2NV/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0DA258A;
	Fri, 30 May 2025 16:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748620953; cv=none; b=FUQMJCsY42gYiNhbLbTLdU71w/N6BaCljTjv4+DGQZ61qtZTa8vzaV2SM4NWTGNKSm59GK/5JWdHXc/VW0h2baOmEyqWIiYkaHUP0/NNDgxlrU2359z/FWZgAN2e+jVdRvgU+fbyAd1AHlZZVbsq4272yyTE+JCNn2ak8F6Ok8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748620953; c=relaxed/simple;
	bh=qtzGHVKWROgUsl/JT7shH/Whylxk7WmScH3cN5YJhls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ExMke1o1eXtZJoNd1MMfI0/m9QGZfzrAeNKk6PpHLxbGoX/H0PH9Kzza+2aQS8i4zDhgY7YgCRY31xiBjBPgnVl0S9jO/Wm/t3stz6TtUltUMQkpPodEMPokKja0nEIHzEvXiniuNt4V5NdFrH+U/Nnnze2EB3MZ5Hu4wU2E5sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=irLs2NV/; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748620952; x=1780156952;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qtzGHVKWROgUsl/JT7shH/Whylxk7WmScH3cN5YJhls=;
  b=irLs2NV/Qu42YkvSltPMt32tF7KeGKzgACsjkbkQfeaaTAFIu2peotb4
   AlrnQWL8xT9HjATRaP29FNGd0xioHGjPwGpFyhMY8F4ktE9nrmEJ49jrZ
   T8ot3hrMJKYABYw9RXVkTN30Bs8+1M8Fc0zX/dJ9BeFSweccm2AroG+PH
   E5+BdfXAw/fL3gCovr0ON/zbBfdak8ybrkDO9X6ogMPbQE30hsj/Oy3ve
   3Os+8UVOq/83EiDEOjG2ZWFHePPlgVhX4fY5oN5bsVmObGLCvNkRSQr39
   zYe74xET5k+9RFMTtKg1VfKDeImnc+ZndkstQkIPCHexmlYugfXAR2gd8
   A==;
X-CSE-ConnectionGUID: PzLQHNSJS828hKN/bfvJFQ==
X-CSE-MsgGUID: +rNPb8SCQWq2oD7fFvY69w==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="50820750"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="50820750"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 09:02:30 -0700
X-CSE-ConnectionGUID: iatMaMblTOCqy9a732VN8g==
X-CSE-MsgGUID: +f6uIb0hSLyOIGX31ICatg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="149187620"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 09:02:27 -0700
Date: Fri, 30 May 2025 19:02:23 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	"Tauro, Riana" <riana.tauro@intel.com>,
	"Adatrao, Srinivasa" <srinivasa.adatrao@intel.com>,
	intel-xe@lists.freedesktop.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: Re: [PATCH v1 2/2] drm/xe: Support for I2C attached MCUs
Message-ID: <aDnWj-AnDxHp9hOj@black.fi.intel.com>
References: <20250530141744.3605983-1-heikki.krogerus@linux.intel.com>
 <20250530141744.3605983-3-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530141744.3605983-3-heikki.krogerus@linux.intel.com>

On Fri, May 30, 2025 at 05:17:44PM +0300, Heikki Krogerus wrote:
> Adding adaption/glue layer where the I2C host adapter
> (Synopsys DesignWare I2C adapter) and the I2C clients (the
> microcontroller units) are enumerated.
> 
> The microcontroller units (MCU) that are attached to the GPU
> depend on the OEM. The initially supported MCU will be the
> Add-In Management Controller (AMC).

...

> diff --git a/drivers/gpu/drm/xe/regs/xe_i2c_regs.h b/drivers/gpu/drm/xe/regs/xe_i2c_regs.h
> new file mode 100644
> index 000000000000..2acb55eeef0d
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/regs/xe_i2c_regs.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _XE_I2C_REGS_H_
> +#define _XE_I2C_REGS_H_
> +
> +#include "xe_reg_defs.h"
> +
> +#define SOC_BASE			0x280000

I just noticed we already have this in xe_pmt.h, so let's not duplicate
it. Perhaps move it to a common header (xe_regs.h) and reuse it in both
places?

> +#define I2C_CONFIG_SPACE_OFFSET		(SOC_BASE + 0xf6000)
> +#define I2C_MEM_SPACE_OFFSET		(SOC_BASE + 0xf7400)
> +#define I2C_BRIDGE_OFFSET		(SOC_BASE + 0xd9000)
> +
> +#define CLIENT_DISC_COOKIE		XE_REG(SOC_BASE + 0x0164)
> +#define CLIENT_DISC_ADDRESS		XE_REG(SOC_BASE + 0x0168)
> +
> +#endif /* _XE_I2C_REGS_H_ */

Raag

