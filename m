Return-Path: <linux-i2c+bounces-1588-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3548456B6
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 13:00:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7AF501F260C6
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 12:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 729BB15DBA1;
	Thu,  1 Feb 2024 11:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WYxbrVpD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEF115DBB2
	for <linux-i2c@vger.kernel.org>; Thu,  1 Feb 2024 11:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706788795; cv=none; b=M0bH//pnXed/RJTahEku7vJjfKngov33IIxVzrl9Cm90sHcNn6nsOBFr6zqAfXhrF4XHfqqXJ5JtBVx3ZGD3OPNCutsn1SXK89PKErsF/SL/GbQTC3SOB35iwW95mkLVRXQqitegk9DBmw2AlOK+MFN02hTxkBw6cLo9sv0pu70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706788795; c=relaxed/simple;
	bh=BKdur3/zDwxSzrO00xLsQ3+H+VHmB4p8dY10aXwOp1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V1TwKejPSudfDBMDLp6zuG17gp8+rw6+gVx9YvUebY7Os4CCFsUpVEwNYU0RyJriWsnuBE4jT9UZP66j1kkIlu7otqoTsQ31brsEOax1+S+0cWgONvo/laXzeqp/hrmoQFN5MPJly9PlehynMvl6lAHlMTMZP+4CKbZGKbfqMWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WYxbrVpD; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706788792; x=1738324792;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BKdur3/zDwxSzrO00xLsQ3+H+VHmB4p8dY10aXwOp1M=;
  b=WYxbrVpDjFO/m2BYGNe5JSR1U9Qpiiw6SffI/fO+QRDqQBkCop+4ptoe
   2MFI6sh7klLU3HIbkOlaUEmSvKGcTHBl5B0/DvTcKsnZLnldxYH22aKcO
   hp4aMnV5uIgMoYPBCRFq6yx5+8rrhakQ8O72yAyQJHadgn63TWyrgRyq0
   YEdVf1URg4N8BEdeZXU1RxBw1h+z2w9FQQ8Enu4DpwqnMQe+1IV2z8dp4
   jgGuyVWMS1iB74ATL3KgBGAGgPIknMeUf/6pxJmkuaoIGN3TwbsFyagS0
   3LdXoK1GlsoMcAf9mEb4jYCdaG9TYGGY+RtugtECCJm5urCaKbqqZbaPj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10531107"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="10531107"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 03:59:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="738409907"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="738409907"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 03:59:46 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rVVjL-00000000pCp-0FI4;
	Thu, 01 Feb 2024 13:59:43 +0200
Date: Thu, 1 Feb 2024 13:59:42 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
	Sanket Goswami <Sanket.Goswami@amd.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Ruhl@smile.fi.intel.com, Michael J <michael.j.ruhl@intel.com>
Subject: Re: [PATCH 5/6] i2c: designware: Fix RX FIFO depth define on Wangxun
 10Gb NIC
Message-ID: <ZbuHrjeOV7Wd-HBs@smile.fi.intel.com>
References: <20240131141653.2689260-1-jarkko.nikula@linux.intel.com>
 <20240131141653.2689260-6-jarkko.nikula@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240131141653.2689260-6-jarkko.nikula@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Jan 31, 2024 at 04:16:51PM +0200, Jarkko Nikula wrote:
> I believe RX FIFO depth define 0 is incorrect on Wangxun 10Gb NIC. It
> must be at least 1 since code is able to read received data from the
> DW_IC_DATA_CMD register.
> 
> For now this define is irrelevant since the txgbe_i2c_dw_xfer_quirk()
> doesn't use the rx_fifo_depth member variable of struct dw_i2c_dev but
> is needed when converting code into generic polling mode implementation.

Shouldn't this formally have a Fixes tag?

-- 
With Best Regards,
Andy Shevchenko



