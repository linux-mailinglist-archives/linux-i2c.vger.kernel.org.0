Return-Path: <linux-i2c+bounces-12605-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF80EB431D8
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 07:56:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A5E63AF67E
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 05:56:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92C1424395C;
	Thu,  4 Sep 2025 05:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KKsUy0ZL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8CD23B627;
	Thu,  4 Sep 2025 05:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756965403; cv=none; b=snUQbK9qan1Xt0kq37pBNXFCFV7PWI4mWzf3CJK+66gCf0sXSZanR5jDwopvKx4bpIauryEkI7MI5BGzxZXmagViOgHEEKatSZJyCZagwn4ic4Bl8s5qE6qNEeKU7Zd5yCAtwKD8kNwHb7xEtRH2uiaYFFr699PpkCKFfAdaxgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756965403; c=relaxed/simple;
	bh=2FUF9/AZ90Tc3jWoa4Xj4LmbacqR49vDZIUoq2ouBqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TC0K5OUQ5Ha/9OsTz458igQl+y1+u4/3L4gjz9DqNH12iuF7KBJWanEprfIdDHcQvGApOkRIs1UFiaNimftIiCdcZQTmelBAliaVa+esdBEGn38novw9efUgee7QHfd2PizgvNWaopOC1eVOlqB26gC125PctuNkb9+W2USaVq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KKsUy0ZL; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756965402; x=1788501402;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2FUF9/AZ90Tc3jWoa4Xj4LmbacqR49vDZIUoq2ouBqI=;
  b=KKsUy0ZLhbw27/5+h6imrW+oB9L1zoWaUkD6oB8d0ZR/QPoP/AvOTJmP
   WKqLtskrqvMcf99t3ewFNO50ApdW3E0Nws4xFbZj44v3M1ChFsUbNkS8b
   QqmfFXoNCmoSUXNwTOQD1GnErHIMkzaCyN1SSnhCA8TxB5/i2WfhoY56s
   vUEqp/VnWqBYOjlCWCOFrZxtqfEPdOkytsjl4sWDltU2c1Zo+KOU0Sgrk
   MX6tqoHjHJaNuoL/qMCXo87ku4vojcItTHCvOl9vov5Az/8/bMemKUAx4
   bt91RdHJC+ehiORUdWf77MU8gKgAkuDFwPtE6w4KopUzk41pBygLWCSyZ
   Q==;
X-CSE-ConnectionGUID: tyOKc1bzTcOgn7nTX4aj6w==
X-CSE-MsgGUID: CUsobBc6TTWad/gy9nIpvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="69556343"
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; 
   d="scan'208";a="69556343"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 22:56:41 -0700
X-CSE-ConnectionGUID: R8f1XNCMRMue4lcwx7LKMg==
X-CSE-MsgGUID: c2G9+WPQTKWaPtvrGFe4Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; 
   d="scan'208";a="171087081"
Received: from agladkov-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.92])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 22:56:39 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A6D3111FCC7;
	Thu, 04 Sep 2025 08:56:35 +0300 (EEST)
Date: Thu, 4 Sep 2025 08:56:35 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: =?iso-8859-1?Q?Jean-Fran=E7ois?= Lessard <jefflessard3@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: Re: [PATCH v4 1/2] device property: Add scoped fwnode child node
 iterators
Message-ID: <aLkqE9c9w9m4Axsp@kekkonen.localdomain>
References: <20250902190443.3252-1-jefflessard3@gmail.com>
 <20250902190443.3252-2-jefflessard3@gmail.com>
 <aLhAKJBUNQVH1Vmf@kekkonen.localdomain>
 <DCJC7Q9MZEM3.34FU7BXXZ7UGF@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DCJC7Q9MZEM3.34FU7BXXZ7UGF@kernel.org>

Hi Danilo,

On Wed, Sep 03, 2025 at 07:22:29PM +0200, Danilo Krummrich wrote:
> (Cc: Javier)
> 
> On Wed Sep 3, 2025 at 3:18 PM CEST, Sakari Ailus wrote:
> > Do we really need the available variant?
> >
> > Please see
> > <URL:https://lore.kernel.org/linux-acpi/Zwj12J5bTNUEnxA0@kekkonen.localdomain/>.
> >
> > I'll post a patch to remove fwnode_get_next_available_child_node(), too.
> 
> Either I'm missing something substantial or the link does indeed not provide an
> obvious justification of why you want to send a patch to remove
> fwnode_get_next_available_child_node().
> 
> Do you mean to say that all fwnode backends always return true for
> device_is_available() and hence the fwnode API should not make this distinction?
> 
> I.e. are you referring to the fact that of_fwnode_get_next_child_node() always
> calls of_get_next_available_child() and swnode has no device_is_available()
> callback and hence is always available? What about ACPI?

On ACPI there's no such concept on ACPI data nodes so all data nodes are
considered to be available. So effectively the fwnode_*available*() is
always the same as the variant without _available().

-- 
Regards,

Sakari Ailus

