Return-Path: <linux-i2c+bounces-7510-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C97AC9ACCAE
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Oct 2024 16:36:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A88E1F2451F
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Oct 2024 14:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E211C1EB9FE;
	Wed, 23 Oct 2024 14:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O5Rx0Hw2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A631E766A;
	Wed, 23 Oct 2024 14:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729693868; cv=none; b=Wy7Tgeg1ywvhUnaI81syYf3HTntb17kBD7P4OLQ2rMhBmJq5owCQq2xWV/raPSYxPoSVHE6ue0FUWP8PhVjkCQ1jkCMoWQ8h+GSYxq42G5YKdGMBQb/Ac78al6dP1fRSQkhV3ncyA8YqjP/90DUbjewerwmO7o9Riu2n9ZH/eTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729693868; c=relaxed/simple;
	bh=4Drijy20k/9A6/MKaRR8MShJ4jkd5wL+ON+4OtSKiUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h2kDXIFCYNgtjw8Z+rkLLOk3ndioc++7k+lDGjbbphtQjLCF1/tQP1nTiasXrCgdpO6kGEmIJCGVEF/dFVmGg5GdRXGGZelGah7AAMK5n766xkX9h9bSGpWWMNtRfU5kBwfMWGuQZFr88D92A+MV7kYOnt5gBkT336yxOx/nr10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O5Rx0Hw2; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729693867; x=1761229867;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4Drijy20k/9A6/MKaRR8MShJ4jkd5wL+ON+4OtSKiUc=;
  b=O5Rx0Hw2XkZ/xaQO+LKIxLRzip9r200Xxyv0IrXGR/9a9MNP9tLbHY4b
   U82JdIlR4i+XRIQzAY0u1ETU3M6bFoarz6rzNKP2UB+IEvKUy+uPuC1SA
   5TThpYqmxTB01mXiR8fbOtayZu165jeeUSmCXFOnDtwk5QtR2ByNVxQpA
   5lSJncje0rDoyLXbvK2UDFlev9m1gzLpn3OLCP97P/iNTJeItswgx0Zka
   vJOj95AQJrQjMNlvOoxLk0ROjEFbpidRIme5Oq8aHtH6SA/JtW4PkTL5i
   pznlx7y5oRbymf/J046mIaCvdbZbHNeG7mvEZrTJ7lCQlJs+SYZ+XI/JM
   w==;
X-CSE-ConnectionGUID: +xjS5Yh5TYS/+Dp5h0lufA==
X-CSE-MsgGUID: YHbuaM5eTjm2jtuxT5sSEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="29393012"
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; 
   d="scan'208";a="29393012"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 07:31:06 -0700
X-CSE-ConnectionGUID: 4FS3pg/7R0+xLLBK3TdUng==
X-CSE-MsgGUID: xWm3ogunRkGxMk/7eMHcpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; 
   d="scan'208";a="81050067"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 07:31:05 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t3cO5-00000006EkQ-2yCZ;
	Wed, 23 Oct 2024 17:31:01 +0300
Date: Wed, 23 Oct 2024 17:31:01 +0300
From: 'Andy Shevchenko' <andriy.shevchenko@linux.intel.com>
To: "Yoshihiro Furudera (Fujitsu)" <fj5100bi@fujitsu.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: designware: Add ACPI HID for DWAPB I2C controller
 on Fujitsu MONAKA
Message-ID: <ZxkIpSlgDcltPK2X@smile.fi.intel.com>
References: <20241018015826.2925075-1-fj5100bi@fujitsu.com>
 <ZxJXj3holsMIdnC2@smile.fi.intel.com>
 <OS3PR01MB6903FEFE0404D809D62D4628D4432@OS3PR01MB6903.jpnprd01.prod.outlook.com>
 <ZxYQDSCpo8n4g3jM@smile.fi.intel.com>
 <OS3PR01MB6903405361060650429FAC2AD44C2@OS3PR01MB6903.jpnprd01.prod.outlook.com>
 <Zxek2SsrFg-XnHWP@smile.fi.intel.com>
 <OS3PR01MB69031E111FDC5B5D302E61A9D44D2@OS3PR01MB6903.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OS3PR01MB69031E111FDC5B5D302E61A9D44D2@OS3PR01MB6903.jpnprd01.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Oct 23, 2024 at 04:40:06AM +0000, Yoshihiro Furudera (Fujitsu) wrote:
> > On Tue, Oct 22, 2024 at 01:14:18AM +0000, Yoshihiro Furudera (Fujitsu) wrote:
> > > > On Mon, Oct 21, 2024 at 07:22:55AM +0000, Yoshihiro Furudera (Fujitsu)
> > wrote:
> > > > > > On Fri, Oct 18, 2024 at 01:58:26AM +0000, Yoshihiro Furudera wrote:

...

> > > >      Device (SMB0)
> > > >      {
> > > >          ...
> > > >      }
> > 
> > > > Hmm... Why Device object is called SMB0, are you sure it's the correct one?
> > >
> > > We considered the string to be the most concise representation of
> > > SMBus HC#0, given the general constraint that object names should
> > > ideally be four characters or less. We understood that, unlike HID,
> > > SMBus object names are vendor-specific.
> > 
> > But this all about UART! How is it related to SMBus?
> 
> We created the SMB0 object according to the following specifications:
>  
> ACPI Specification
> 13.2. Accessing the SMBus from ASL Code
> https://uefi.org/htmlspecs/ACPI_Spec_6_4_html/13_ACPI_System_Mgmt_Bus_Interface_Spec/accessing-the-smbus-from-asl-code.html
>  
> IPMI Specification
> Example 4: SSIF Interface(P574)
> https://www.intel.co.jp/content/www/jp/ja/products/docs/servers/ipmi/ipmi-second-gen-interface-spec-v2-rev1-1.html
>  
> Therefore, SMB0 does not deviate from the SMBus related specifications.

Ah, I see now, sorry I missed that. Thank you for your patience and
elaboration. Please, update the commit message as discussed, send a new version
and I review it.


-- 
With Best Regards,
Andy Shevchenko



