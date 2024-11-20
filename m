Return-Path: <linux-i2c+bounces-8086-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A779D3CB0
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Nov 2024 14:45:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 72802B2240A
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Nov 2024 13:45:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 038451AA781;
	Wed, 20 Nov 2024 13:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MNzRVDMS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E351A2C0E;
	Wed, 20 Nov 2024 13:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732110326; cv=none; b=mlQCZmPwqTh3c94UzTo2BnxaZvwI7k17B6hS867qjoZJdTYdJu0APxtQA4/4RNThSATcFQuuylEr74smQkA6iR/sjT1cuagpex4gYNMZpoDWYyBDgZ8RkMR2lmfyP+as1MAksQ2zfUhbw1vCCYwfJ0I+qZqZT0vJn8wseD/hHI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732110326; c=relaxed/simple;
	bh=jhRxJ1OvazakiB3N14Kmm9lyLfmW7hvqPJ5VI0xlsxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JvvWzuHXec8vkID6ofhjTGm3djC2ZmvE70mI40+GYkEInPkKr/kXsKzYKIJnx8YbTK1YM3Qge/ENz2gwl8YGvxY1fLo2YgVOJpnwmK0sz6LqeYOaZSuNG6YMJRwGyNFeVmt7xpYwntnSUewJIC6NWflYYiqm5O5N9u4T7E6r6pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MNzRVDMS; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732110325; x=1763646325;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=jhRxJ1OvazakiB3N14Kmm9lyLfmW7hvqPJ5VI0xlsxA=;
  b=MNzRVDMS+GAicc67deXMjl0RJ0wNUcvyTNF/LU0cCh9D4NaIOpCohldC
   V9CjSnTD52e5Ve0ibkcvPH+zSS23Ft2S9oWEwCpOuLxO2Ndg6q8ELOxTN
   HIIZWfW3DOj6Dk0iN30OZmQ9e07eMgUJCUlFnDCvaToSObppRN3yHbLjY
   q08NaiMY6X8sQ2O/p56MnzPIqZlqBm92YLB7NIxX/rtBiA4E3wnqcYTkh
   UicpjlYiNSr+AS0nzk7GAJrmHntnO8HZ+fQsurnrnjyUTxz19NpqhNgNp
   t838c0KMBRrMmlDC5H3VY0wL+Alc1HlHjTDYcAqk9sW1TdcGq30yRXP3y
   A==;
X-CSE-ConnectionGUID: btArdX5BRB23tXWouYGzWg==
X-CSE-MsgGUID: J4BsryVoQXmEDOUjdCDT7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="54669515"
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; 
   d="scan'208";a="54669515"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 05:45:24 -0800
X-CSE-ConnectionGUID: 86xaPbn1T6Cfa0pRt7M8Jg==
X-CSE-MsgGUID: 9XOE3H3qRRSXb6yjPTfQiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; 
   d="scan'208";a="120857080"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 05:45:21 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tDl1B-0000000Gisy-3QTr;
	Wed, 20 Nov 2024 15:45:17 +0200
Date: Wed, 20 Nov 2024 15:45:17 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Radu Sabau <radu.sabau@analog.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Subject: Re: [PATCH 2/2] hwmon: (pmbus/adp1050): add support for adp1051,
 adp1055 and ltp8800
Message-ID: <Zz3n7afQgdW9nsEz@smile.fi.intel.com>
References: <20241120035826.3920-1-cedricjustine.encarnacion@analog.com>
 <20241120035826.3920-3-cedricjustine.encarnacion@analog.com>
 <4c13b4dc-da2c-4548-910a-cf4138d8422a@infradead.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4c13b4dc-da2c-4548-910a-cf4138d8422a@infradead.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Nov 19, 2024 at 09:00:28PM -0800, Randy Dunlap wrote:
> On 11/19/24 7:58 PM, Cedric Encarnacion wrote:

...

> > +config SENSORS_ADP1050_REGULATOR
> > +	bool "Regulator support for ADP1050 and compatibles"
> > +	depends on SENSORS_ADP1050 && REGULATOR
> > +	help
> > +	  If you say yes here you get regulator support for Analog Devices
> > +	  LTP8800-1A, LTP8800-4A, and LTP8800-2. LTP8800 is a family of DC/DC
> > +	  µModule regulators that can provide microprocessor power from 54V
> > +	  power distribution architecture.

> FYI:
> 
> The 'micro' symbol displays as a blank space in 'menuconfig' or 'nconfig'.
> (It shows up correctly in gconfig and xconfig.)
> 
> This problem is not unique to this driver entry.
> See https://lore.kernel.org/all/20231006202942.GA865945@bhelgaas/ from 2023.
> 
> AFAIK no one is working on this issue.
> Feel free to change the help text or leave it...

If it's part of the commercial / official name, I would leave it.
The bug is not in the help text anyway.

-- 
With Best Regards,
Andy Shevchenko



