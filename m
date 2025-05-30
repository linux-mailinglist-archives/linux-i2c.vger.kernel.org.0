Return-Path: <linux-i2c+bounces-11181-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A3EAC9479
	for <lists+linux-i2c@lfdr.de>; Fri, 30 May 2025 19:17:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 090E03A9FC4
	for <lists+linux-i2c@lfdr.de>; Fri, 30 May 2025 17:16:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E06372356B4;
	Fri, 30 May 2025 17:16:55 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321112D600;
	Fri, 30 May 2025 17:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748625415; cv=none; b=FOup9VnzN1b9K3100+xxGKv2RcDR4kf/M7C0WefsZK2P8XRCnKry5npaut88wZQs2dglOMV0MENd4xO/l6fkY3FB87WwDlHJhN7GrGOMuBIR8aD9tagEg4bQMuoMpw+JyHJmOCZipI/xnClLZwikVQt/s0aK7HEVZ20+GvW6r9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748625415; c=relaxed/simple;
	bh=BK5AyIHNeEUeYQclsfdXf70cKWDjNujBGAp6BjRkDeA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MmPBE0WcBiG4kfohfEqg6NvIhDeJLMqyKBwrS+zBHBfSXVvtSBLsEpfbvq7bG6P9haObI9dftYbGuQ9ngWrbau/V2ShCc7un7qxQ+0M4W1peVszJ4TFreTB2lrqNCi7i1O1FDti7fWwgp9SLLPW9iK+DGVhrOV42dLNl45eKWSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: DImYnFdVSj+KQH7gouek3A==
X-CSE-MsgGUID: czkv6UTkRy2PWwapBQj0hA==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="68149132"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="68149132"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 10:16:53 -0700
X-CSE-ConnectionGUID: FlGvEHdEQoaJHftzoHDuLQ==
X-CSE-MsgGUID: oUn+6bTfRaezIq4Gi2x5TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="149200183"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 10:16:49 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1uL3Lb-000000023zm-0EAg;
	Fri, 30 May 2025 20:16:47 +0300
Date: Fri, 30 May 2025 20:16:46 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 0/6] Add RIIC support for RZ/T2H and RZ/N2H SoCs
Message-ID: <aDnn_n6IsvjXl6s1@smile.fi.intel.com>
References: <20250530143135.366417-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530143135.366417-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, May 30, 2025 at 03:31:29PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Hi All,
> 
> This patch series adds support for I2C Bus Interface (RIIC) found on
> the Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs. The RIIC
> IP on these SoCs is similar to that on the RZ/V2H(P) SoC but has some
> differences in interrupt handling and does not require resets.

Patches 4, 5, and 6 LGTM, FWIW,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

-- 
With Best Regards,
Andy Shevchenko



