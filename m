Return-Path: <linux-i2c+bounces-6726-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2A4978811
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 20:44:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 565E41F21DD9
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 18:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC7EC12AAC6;
	Fri, 13 Sep 2024 18:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="So+NybYa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355D186AE3
	for <linux-i2c@vger.kernel.org>; Fri, 13 Sep 2024 18:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726253087; cv=none; b=pQtZse3XluqqKspppyU5muJsQwWsrzJKmz7gv2ey88EHaHzZ07pPNXOHE/S1vJQkTAZfOUONyjR0d/g0cOJa4pduI2TJgXNk1aEJ7yTGetqspvHEi5LPDW3CZ/nDXChtbJl0AsUi0jHqD1hGNNPPX2m7jsL4Anofl+nlAHJBSHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726253087; c=relaxed/simple;
	bh=h+tywsCno/26K5gYv9gCqUFRZO1aRJdljFKK4Fuda1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D1d/kTlQPD5uLfy02IxpdsvKztrjFijdx9hJacGoi0KQmuS+TKvGHv5FFbHDUos3a2Ci0A5Zdz3yH3sw/ZWwjfzr4ubWnggqlcaR5n6catQrTtEPZ7E6TI9T8ReVbGU5Iu1Ily9gU/GeNRfymx1vG1d0pDr/2Ew+QRt1npwSJfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=So+NybYa; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726253086; x=1757789086;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=h+tywsCno/26K5gYv9gCqUFRZO1aRJdljFKK4Fuda1Q=;
  b=So+NybYaqkZwNFIcPsmukK20o7SwvnKlehlluz3fExZ8iwCWqALehxB8
   je7DFwp+2aekt2b2wblLSEAxVCea5/drELBg8OANB6T/thBxxoCiTHbjm
   CmzD20GrwJAmCBOrR3dFakpWMTlOjdyUboY60uXBdnXFVWyrXFDDh4/07
   eQMP5lqRWaTB/5TOc9DE1tu4X0j7ekWgE4ZKvZfXDsgjK9b67spkK1FKZ
   gRNMUgDIxS5XXxVyu0eYmTXQaay50zEszsDdtDuwzHiTrQqKYLafEt+Lh
   ZYgFE4x2gNnjnGL00qKeH9UAMaOycTFSf8m4wz+lMWtOWdXKml/wMQ27K
   g==;
X-CSE-ConnectionGUID: KtLz/WSQT1iEieW3OxDUxQ==
X-CSE-MsgGUID: RdtmDD8oQdCxAktnQDMWyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="25263205"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="25263205"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 11:44:46 -0700
X-CSE-ConnectionGUID: V/DWWG/ITH20EYMVxNUeAw==
X-CSE-MsgGUID: Lq2rBSeeTbKEMZxLirFeTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="91419688"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 11:44:44 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1spBHd-00000008OVK-2pJW;
	Fri, 13 Sep 2024 21:44:41 +0300
Date: Fri, 13 Sep 2024 21:44:41 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org, Sanket.Goswami@amd.com,
	Patil.Reddy@amd.com
Subject: Re: [PATCH v5 2/8] i2c: piix4: Move i2c_piix4 macros and structures
 to common header
Message-ID: <ZuSIGYFFRSyXrMng@smile.fi.intel.com>
References: <20240913121110.1611340-1-Shyam-sundar.S-k@amd.com>
 <20240913121110.1611340-3-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913121110.1611340-3-Shyam-sundar.S-k@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Sep 13, 2024 at 05:41:04PM +0530, Shyam Sundar S K wrote:
> Add a separate header file to relocate the common code from the i2c_piix4
> driver, allowing the AMD ASF driver to utilize the same code.
> 
> Update the MAINTAINERS file to include information about the new common
> header file.

...

> +/* PIIX4 SMBus address offsets */
> +#define SMBHSTSTS	(0 + piix4_smba)
> +#define SMBHSLVSTS	(1 + piix4_smba)
> +#define SMBHSTCNT	(2 + piix4_smba)
> +#define SMBHSTCMD	(3 + piix4_smba)
> +#define SMBHSTADD	(4 + piix4_smba)
> +#define SMBHSTDAT0	(5 + piix4_smba)
> +#define SMBHSTDAT1	(6 + piix4_smba)
> +#define SMBBLKDAT	(7 + piix4_smba)
> +#define SMBSLVCNT	(8 + piix4_smba)
> +#define SMBSHDWCMD	(9 + piix4_smba)

While at it, I would suggest to use fixed-width values for all of them, e.g.,

#define SMBHSTADD	(0x4 + piix4_smba)

> +#define SMBSLVEVT	(0xA + piix4_smba)
> +#define SMBSLVDAT	(0xC + piix4_smba)

...

> +struct sb800_mmio_cfg {
> +	void __iomem *addr;
> +	bool use_mmio;

These two need types.h.

-- 
With Best Regards,
Andy Shevchenko



