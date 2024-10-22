Return-Path: <linux-i2c+bounces-7506-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D179AA2CD
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Oct 2024 15:13:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 770CB1F237DA
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Oct 2024 13:13:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A99E19DF52;
	Tue, 22 Oct 2024 13:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CLs1jkTi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD9C1E495;
	Tue, 22 Oct 2024 13:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729602784; cv=none; b=KCKehWQa5Dn7QIDZ3v48pTZTA22BvvXD6TB+r1FoHv6MKRwU3JI/4ao/6q0yWigBXDTxWHjSTEyp4cvexPq6EtLlwjgsZMh3uY17nTm+1CibNEzAA36BRMUCszvOeD+HDFmzbY4rdUdpKUo1BvYupQDQVNWoHFwAMEPKektyQ9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729602784; c=relaxed/simple;
	bh=DZpeEzwsFRRajSicQ/TntycHhyRS3RMldLFiEs9zmdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y3WRKG5M4HdnD50oALaQ1vXMsiEtY+TGHWtTw82EfbO3y7DgXYT/5wi8mox+zFReoUdIj/ijJ5yhAW8Gbe5euFwkTnRDb5I8MyzgU89UXtS7PWZZ4Q7L+sjueDLkbMwxb9rCa0hF3opDnBwPAfGUyKG9DhukteUP4T55UdusIw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CLs1jkTi; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729602784; x=1761138784;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DZpeEzwsFRRajSicQ/TntycHhyRS3RMldLFiEs9zmdw=;
  b=CLs1jkTiWK+a8a7yIybgOjMowIRJ6JCo7CiHfpCS4PrpLjMwMxj2KWiw
   SPcLjcLIEX9nnmPtI7zmyRLo6pWPcxrc+mHwPb2xbmZ4oF96LRVk5QvTq
   6Ukm+iPeOJjH/2PvBzMqrwfSjDFhKt/DLAU39DIWNZlpAW5lKATHUvIgH
   EDH3eB0499bJ2jY4i7mZIGy2hauPxOk2K9Wk6aVA95e1CXguyW2neafAU
   nwpJfO/UwfErAFgfFDFpeLxd3LFpzVay3K//Et05mntnD3Mm2jjb5EhYJ
   WBqZayXP9i0fpPdX5IX2xSdCyES6SVzj2uQK8PHlTj+usT90D60iKXApq
   A==;
X-CSE-ConnectionGUID: 5F0nZs4TS0iOVktaSP2JMg==
X-CSE-MsgGUID: gAqWpCv3QXWKKrtbSbc28g==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="29342889"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="29342889"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 06:13:03 -0700
X-CSE-ConnectionGUID: 0xhNZ4n0T+Cg1nqx14XbUg==
X-CSE-MsgGUID: YzLaLbFYTr+Iq6hUfIlHgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="79806805"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 06:13:00 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t3Egz-00000005r4j-3Qe1;
	Tue, 22 Oct 2024 16:12:57 +0300
Date: Tue, 22 Oct 2024 16:12:57 +0300
From: 'Andy Shevchenko' <andriy.shevchenko@linux.intel.com>
To: "Yoshihiro Furudera (Fujitsu)" <fj5100bi@fujitsu.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: designware: Add ACPI HID for DWAPB I2C controller
 on Fujitsu MONAKA
Message-ID: <Zxek2SsrFg-XnHWP@smile.fi.intel.com>
References: <20241018015826.2925075-1-fj5100bi@fujitsu.com>
 <ZxJXj3holsMIdnC2@smile.fi.intel.com>
 <OS3PR01MB6903FEFE0404D809D62D4628D4432@OS3PR01MB6903.jpnprd01.prod.outlook.com>
 <ZxYQDSCpo8n4g3jM@smile.fi.intel.com>
 <OS3PR01MB6903405361060650429FAC2AD44C2@OS3PR01MB6903.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OS3PR01MB6903405361060650429FAC2AD44C2@OS3PR01MB6903.jpnprd01.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Oct 22, 2024 at 01:14:18AM +0000, Yoshihiro Furudera (Fujitsu) wrote:
> > On Mon, Oct 21, 2024 at 07:22:55AM +0000, Yoshihiro Furudera (Fujitsu) wrote:
> > > > On Fri, Oct 18, 2024 at 01:58:26AM +0000, Yoshihiro Furudera wrote:

...

> >      Device (SMB0)
> >      {
> >          ...
> >      }

> > Hmm... Why Device object is called SMB0, are you sure it's the correct one?
> 
> We considered the string to be the most concise
> representation of SMBus HC#0, given the general
> constraint that object names should ideally be
> four characters or less. We understood that,
> unlike HID, SMBus object names are vendor-specific.

But this all about UART! How is it related to SMBus?

-- 
With Best Regards,
Andy Shevchenko



