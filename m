Return-Path: <linux-i2c+bounces-12996-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B45B59D66
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 18:21:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBF053BA6CB
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 16:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB32C2F7AA2;
	Tue, 16 Sep 2025 16:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PbuP21Yd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB0F29E0E6;
	Tue, 16 Sep 2025 16:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758039511; cv=none; b=PCGG3c/6aYJaJG/RCUlMFgXC6DLwxTTziDuH/tZBwXvuFfIjX/GMiLqFlSRLK7ju51tNy5AQQdz/oh5y20u2wBi1o/1TBM874t1WYXVuNdOp9xCwRnwOALGDX8nMdbxKXdKTDns/DsVnzbyZtZQM1I9C08gLKzEmQyy7PMtk6VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758039511; c=relaxed/simple;
	bh=Cq5NfNk7JiXVwVexvjijFakx0T6Ct2rgVmnxiY60eOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YKCLSqDdkihoEX2cZqpkba53TfVRf9A25p0gf+Siz47OqzAR2MsEzD/1dVZQDubgLnAc2UnGnOQtKlIXC8xMs/99iXxGBNvRo50vUw+ga7MRta6eVe0sQjBpKs3/fvEsv5u+YcZeNXdOR0JQxKRwi7zcGWqHafrjyZcp0MhBHfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PbuP21Yd; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758039510; x=1789575510;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Cq5NfNk7JiXVwVexvjijFakx0T6Ct2rgVmnxiY60eOU=;
  b=PbuP21Yd7Pg6gKbKywFpWQN7aNcYGmSLaDXUwwI6VEj9vlo18O0xJTIE
   kMpZji7g/aM2b5A1vZLazRVucGUpnHJonVvfGJAxreo/bd/YuXdMoTixP
   +DfdGE5bDZSzgElz+juePWE8V+ACRbcoSROPEmSVxtvGV2k7sYxnxZh8M
   ynM6HGMBv2Ybtd8/NWxvRWGt/bXj9FytmRNyCnorZW+i38U5Ga+i5ffhh
   zGOioqkskxfs5rUvEr7lQ5ZgE1ANzLZiNW3AOhSVWdtP8ZcPwM8KSjpM3
   TDSRtWi6te1RZCCQ0ctNLMAu0cwmS3LxMLMxi9Fx/vDhM95b+HEjU+e1Q
   Q==;
X-CSE-ConnectionGUID: X20m+nvCQBiU8WMYJIuwSQ==
X-CSE-MsgGUID: 21ZsCP5WSIqVEY8iEDZIGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="59548069"
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="59548069"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 09:18:28 -0700
X-CSE-ConnectionGUID: RhJnTf2vS9W+6zd2tP7TRw==
X-CSE-MsgGUID: yqJP5UYSTtq71NA4WlcsGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="174095797"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.177])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 09:18:25 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D6D95121EFF;
	Tue, 16 Sep 2025 19:18:22 +0300 (EEST)
Date: Tue, 16 Sep 2025 19:18:22 +0300
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
Message-ID: <aMmNzpvVPH04hsIL@kekkonen.localdomain>
References: <20250902190443.3252-1-jefflessard3@gmail.com>
 <20250902190443.3252-2-jefflessard3@gmail.com>
 <aLhAKJBUNQVH1Vmf@kekkonen.localdomain>
 <DCJC7Q9MZEM3.34FU7BXXZ7UGF@kernel.org>
 <aLkqE9c9w9m4Axsp@kekkonen.localdomain>
 <DCJTOIQ4Q0Z5.Q2UE5AQU1X35@kernel.org>
 <aLlDJETaWTjiSP0L@kekkonen.localdomain>
 <DCJVYUINZ7KM.7RCV9P9KHTVM@kernel.org>
 <aLl-ABtFi2R9Wc1a@kekkonen.localdomain>
 <DCK5E8KIEV7M.25EFO2EE7JS9V@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DCK5E8KIEV7M.25EFO2EE7JS9V@kernel.org>

Hi Danilo,

On Thu, Sep 04, 2025 at 06:14:31PM +0200, Danilo Krummrich wrote:
> On Thu Sep 4, 2025 at 1:54 PM CEST, Sakari Ailus wrote:
> > If you're concerned of the use on ACPI platforms, none of the drivers using
> > the two available variants list any ACPI IDs, signifying they're not used
> > on ACPI systems -- I don't think they ever have been.
> 
> Great -- sounds reasonable then.

I opted to add availability check on the ACPI side as well so that DT and
ACPI are aligned in not returning unavailable child devices.

-- 
Regards,

Sakari Ailus

