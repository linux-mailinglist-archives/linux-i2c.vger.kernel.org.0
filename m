Return-Path: <linux-i2c+bounces-9801-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FFAA5D981
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Mar 2025 10:33:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB5313B46F0
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Mar 2025 09:33:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E9FA1E47A9;
	Wed, 12 Mar 2025 09:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aNYEos6b"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E58A234973;
	Wed, 12 Mar 2025 09:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741772031; cv=none; b=LAdLrk2jzmdq9JhG0hRZVz5bQJ6DYAROW5YwZyhK3eBCqbwLlTsEK92JeJ83S3lv4lXKc01BmM/O54fL443GP2PkfSTD/pgoe8sGqWLdoCZlPnq6rSGBi2bu6U4oLx9x1XjVhfcVRozcxw0Rgt1swl5QrlnEU32DujLPNemvO8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741772031; c=relaxed/simple;
	bh=qJVq2tQ/uqY4XgxZm+blhtdxS7KyEDaz44nIhBoEgwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HBo8tj7zWvYadKf4QM7ziD9YS04YHX9NMzX4pGz+MG7FtDLDPoyl/kICUq9eb/kWJaqP+1jQeDc3ZdBcY7Xsl6FnaTzQsn4hQz4jdkhwnUOkuQ8bKI3uJyzKOvacegPm+TY8EeyV6CheuWfeSePFa8ABOxe8WRH/9lQIu+jbhMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aNYEos6b; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741772030; x=1773308030;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qJVq2tQ/uqY4XgxZm+blhtdxS7KyEDaz44nIhBoEgwc=;
  b=aNYEos6bPTxk4wOpNw/OcGYhhzWGtDLLeDU7Xp9WC/EQq58dvlp8d924
   0U/1OJBEEI7ZO6kBgUKxzwClIx3kSb6B3aHtCDDHRkdWB6NSdg0u8BvxR
   p2twdeeNEV0Msx7BO33ZSJeDmZv+dstpSUCunSl8pFUbmhftBaOC4zq3F
   7KEbmwJDtqjJxTwJJ9x7eoyzeDSM7ZrovQY9ksLv2ifvxyA8WVGptHFG9
   irZWPfK7GcxihUcAnoF1Tx5jufh9f2GOsHW9lZPOlDxiTkrQoAyeV9mNy
   ul0knmsIRhdb09xl6YvkDUqZq9vdmRLRAB6JTimtdnoWEO3bOLpTXAltH
   A==;
X-CSE-ConnectionGUID: tQo14EqrRjmtDIi+4A8IcQ==
X-CSE-MsgGUID: DlPtruRbT9a3ymr5okc6yQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="68201248"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="68201248"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 02:33:17 -0700
X-CSE-ConnectionGUID: hykDrp8ETOaBdw7dlJJbsg==
X-CSE-MsgGUID: IHLO9H3oTJWrBK/Y6SLyeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="120611799"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 02:32:36 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tsIS1-00000001oYn-14Yf;
	Wed, 12 Mar 2025 11:32:33 +0200
Date: Wed, 12 Mar 2025 11:32:32 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Krzysztof Adamski <krzysztof.adamski@nokia.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Kamal Dasu <kamal.dasu@broadcom.com>, Stefan Roese <sr@denx.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: Re: [PATCH v2 00/10] i2c: busses: Introduce and use
 i2c_10bit_addr_*_from_msg()
Message-ID: <Z9FUsLC0TcglJZN_@smile.fi.intel.com>
References: <20250213141045.2716943-1-andriy.shevchenko@linux.intel.com>
 <c6xszdhx5ztexlqlmhvdn4dyz5ilzxsm7c62cvkmnwy2y3gaqc@owk2ani2emys>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c6xszdhx5ztexlqlmhvdn4dyz5ilzxsm7c62cvkmnwy2y3gaqc@owk2ani2emys>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Mar 11, 2025 at 02:12:03AM +0100, Andi Shyti wrote:
> Hi Andy,
> 
> > Andy Shevchenko (10):
> >   i2c: Introduce i2c_10bit_addr_*_from_msg() helpers
> >   i2c: axxia: Use i2c_10bit_addr_*_from_msg() helpers
> >   i2c: bcm-kona: Use i2c_10bit_addr_*_from_msg() helpers
> >   i2c: brcmstb: Use i2c_10bit_addr_*_from_msg() helpers
> >   i2c: eg20t: Use i2c_10bit_addr_*_from_msg() helpers
> >   i2c: kempld: Use i2c_10bit_addr_*_from_msg() helpers
> >   i2c: mt7621: Use i2c_10bit_addr_*_from_msg() helpers
> >   i2c: rzv2m: Use i2c_10bit_addr_*_from_msg() helpers
> >   i2c: ibm_iic: Use i2c_*bit_addr*_from_msg() helpers
> >   i2c: mv64xxx: Use i2c_*bit_addr*_from_msg() helpers
> 
> merged to i2c/i2c-host.

Thank you!

-- 
With Best Regards,
Andy Shevchenko



