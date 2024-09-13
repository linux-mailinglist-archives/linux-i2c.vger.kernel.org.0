Return-Path: <linux-i2c+bounces-6732-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EDD9788D1
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 21:20:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C03B289AB4
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 19:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C98012DD90;
	Fri, 13 Sep 2024 19:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bGljUl68"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D176381ACA
	for <linux-i2c@vger.kernel.org>; Fri, 13 Sep 2024 19:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726255229; cv=none; b=jt0T6mG3f5tzxL5tTF7+G6WGdqIZztp+EPihmsm5Q4xXooIDtAjn2aXursAJKN2U3bRW8w9zToKMyv231V3J1/tUDos4gz7gaM5eU56bBZaMhgU63O5gtNM9YT8xO5DsnV+/nZpsqz2Eeraqc4Od/4idS//EAh1rZze9tQRjM1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726255229; c=relaxed/simple;
	bh=Q5rCCBOPChYqhYFoTy5VjjghAx3YUtekp8Me7CY2/5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gdmMGDZbP+wDLl3rn96lfB7TM0yThORWECYJuFP+v19/Y1YSqunTi1/NmUCXtySALoQqbQwGursSYr+XzonbUEHY7+EpaKA/Pe/CWKlFKQemqO6mEG0714U0SVGnHNaslKbW3vJM9LFUoVudYXfc8k7uDiO9kZayNYpKh4da+kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bGljUl68; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726255228; x=1757791228;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q5rCCBOPChYqhYFoTy5VjjghAx3YUtekp8Me7CY2/5w=;
  b=bGljUl68AFt8dCWzpKhdxdDutM0FVYW1MaoN6xYZ/88NSNvis3uxyior
   Tmvx4d3QLI/DGjZEggLnTL6Uk8OzutI/oigY15QAaEl9MF1hXCvbBeRIO
   8EK0+bSEKLRbsgAAeZbG+qwF+rLRXz6eJGQfuxdXgCxNzEbHzarnZADOD
   NaeR9GcHzmqfY9nTcOOE/cVUJFls3R/TMq+5nKe8zD8tMZGRxQ8flFi/1
   cgUbW+iSM8svGVZsTEr4xFOr++PHFIYYsoeDztecxg7+hNjGIfEg+LA1a
   La8qF1kQ3jK6O9Td/Tp3IPvV3a+QuR8mFQX5dVYiUB/8RwIXH7pIt17pD
   Q==;
X-CSE-ConnectionGUID: KL+/kRv1QOKkr/6cOlfvdQ==
X-CSE-MsgGUID: Wd4NbNWPRUSq976wpbY4Iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="25041541"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="25041541"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 12:20:28 -0700
X-CSE-ConnectionGUID: JRjVZN9fQ3qTRNNqr0QEGA==
X-CSE-MsgGUID: IvESwozGSV68pbPU5qS2sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="72986721"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 12:20:26 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1spBqB-00000008P6L-1ilU;
	Fri, 13 Sep 2024 22:20:23 +0300
Date: Fri, 13 Sep 2024 22:20:23 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org, Sanket.Goswami@amd.com,
	Patil.Reddy@amd.com
Subject: Re: [PATCH v5 0/8] Introduce initial AMD ASF Controller driver
 support
Message-ID: <ZuSQd0sXKEvgfjw-@smile.fi.intel.com>
References: <20240913121110.1611340-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913121110.1611340-1-Shyam-sundar.S-k@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Sep 13, 2024 at 05:41:02PM +0530, Shyam Sundar S K wrote:
> The AMD ASF (Alert Standard Format) function block is essentially an SMBus
> controller with built-in ASF functionality. It features two pins SCL1 and
> SDA1 that facilitate communication with other SMBus devices. This dual
> capability allows the ASF controller to issue generic SMBus packets and
> communicate with the DASH controller using MCTP over ASF. Additionally,
> the ASF controller supports remote commands defined by the ASF
> specification, such as shutdown, reset, power-up, and power-down, without
> requiring any software interaction.
> 
> The concept is to enable a remote system to communicate with the target
> system over the network. The local network controller, such as an Ethernet
> MAC, receives remote packets and relays the commands to the FCH
> (Fusion Controller Hub) through the ASF. Examples of these commands
> include shutdown and reset. Since ASF uses the SMBus protocol, this
> controller can be configured as a secondary SMBus controller.
> 
> This series of updates focuses on extending the i2c-piix4 driver to
> support the ASF driver by exporting several functions from the i2c-piix4
> driver, allowing the AMD ASF driver to leverage existing functionalities.
> Additionally, this change incorporates core ASF functionality, including
> ACPI integration and the implementation of i2c_algorithm callbacks for ASF
> operations.

ACPI code is much better now, but can be even better.
See my individual comments.

-- 
With Best Regards,
Andy Shevchenko



