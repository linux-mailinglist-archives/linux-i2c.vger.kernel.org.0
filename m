Return-Path: <linux-i2c+bounces-10345-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BD0A89E0E
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 14:29:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AEF6B19015F0
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 12:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FC10207641;
	Tue, 15 Apr 2025 12:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gjN9PcmA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE4428E3F;
	Tue, 15 Apr 2025 12:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744720144; cv=none; b=OW9EuV8lR72s6uv17q550xw6WiAYtMhmDXddGm464MHbPg+U2q/h6paWuVyh5ku/iaCTito6lXnXA/O4F7ha4bWJt7UeLpzb+pPqjY8JtNLqQFMAs2WDUGHvxmZQwB1155LUIPBVXM/92D0I2TWUpa3/RZ1xTMX81pMzw15arWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744720144; c=relaxed/simple;
	bh=jeNGGQ+jl6TBlSSFvy0LEjx1D5vJ6qTXvhhUGlok6Jg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ErJ9QvEg8nzgTMXzlw9+gC1lFBm/Nv66qDL52DxAGQqbMVT+mljfrxGC/y978gudpQg8UeVTt6doHZdkznSURnxjFb8pjpAicnyCfOlAuaExBbgEOhmClCsZ2D7OS8nFGzri4DYwD2xST//4zeLqWQF7rYOnghbjBXT6UbgFusE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gjN9PcmA; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744720142; x=1776256142;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=jeNGGQ+jl6TBlSSFvy0LEjx1D5vJ6qTXvhhUGlok6Jg=;
  b=gjN9PcmAXgUqDbxPM5Hqzr4RzDUUAfCsZjHEku8up5oJVjfKwAq5vyv3
   UihFSTKpXfqo67CHoN8O8nijovIdMD+KJWgpxMtu3DnSzDH+gM96ASmkD
   IV3DBEN0+zuFaR0Z1IN33GBW93YwhoSBVdHXT0I5khKTlmeUnRaOBXgLw
   RQpfl5VbQi07kadb9LLIUti4gEdpIQQfF8XppwnBsesb6zTEYqs0x6ErD
   KMKdIKyzg86sOxtyyQNq8Ujbd9zPEY0nFgWcpMVIL7RM9reyby63jPK7V
   Js4MfXUc4atcxsERH1Hbp8V4NmDYua6m+N1E5B950tIwDCRF0lLHrYsgL
   g==;
X-CSE-ConnectionGUID: iAkLR3iYSFWgYh77TisJSg==
X-CSE-MsgGUID: RbKB4DZJTQ6MMZU5soS+MQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="45460456"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="45460456"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 05:29:02 -0700
X-CSE-ConnectionGUID: 83ODqVSOTNWV6/am7Zekhg==
X-CSE-MsgGUID: eWvKcCs4TFy4v5tMYMIh7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="134205081"
Received: from mylly.fi.intel.com (HELO [10.237.72.154]) ([10.237.72.154])
  by fmviesa003.fm.intel.com with ESMTP; 15 Apr 2025 05:28:59 -0700
Message-ID: <715d883f-184f-474a-a222-208d3aa03d2c@linux.intel.com>
Date: Tue, 15 Apr 2025 15:28:58 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Hitting WARN_ON_ONCE in i2c-designware-common.c
To: Jesper Dangaard Brouer <hawk@kernel.org>,
 Luis Oliveira <lolivei@synopsys.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 linux-i2c@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 kernel-team <kernel-team@cloudflare.com>
References: <20c191d9-5f7a-4ec6-a663-dcc8d0b54c18@kernel.org>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20c191d9-5f7a-4ec6-a663-dcc8d0b54c18@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi

On 4/15/25 3:03 PM, Jesper Dangaard Brouer wrote:
> Hi Maintainers,
> 
> I'm hitting a WARN_ON_ONCE in drivers/i2c/busses/i2c-designware-common.c
> when booting the kernel on our Gen12 hardware.
> 
> I'm using devel kernel net-next at commit 1a9239bb425 (merge tag 'net- 
> next-6.15').
> 
Is this a regression so was this working before?

Support for this platform was added back in 2016 by the commit 
e4e666ba74d4 ("i2c: designware: Add device HID for future AMD I2C 
controller").

> [   10.062651] i2c_designware AMDI0010:00: Unknown Synopsys component 
> type: 0xffffffff
> [   10.073312] pps_core: LinuxPPS API ver. 1 registered
> [   10.073372] piix4_smbus 0000:00:14.0: SMBus Host Controller at 0xb00, 
> revision 0
> [   10.075433] i2c_designware AMDI0010:01: Unknown Synopsys component 
> type: 0xffffffff

These "Unknown Synopsys component type: 0xffffffff" errors indicate IP 
is not alive. Perhaps linked to the missing clock or not powered.

