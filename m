Return-Path: <linux-i2c+bounces-10735-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BD0AA702E
	for <lists+linux-i2c@lfdr.de>; Fri,  2 May 2025 13:03:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D9164A468F
	for <lists+linux-i2c@lfdr.de>; Fri,  2 May 2025 11:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B29523770D;
	Fri,  2 May 2025 11:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FV9eo+oQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A77B231825;
	Fri,  2 May 2025 11:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746183812; cv=none; b=ix2+AtEbQ4zH0G1nAWFf205VFcJmkkzH3xNv2ZYSzuqOKKypGBCouaI7XexoUr6y6SQ7LuQppjSI8Wa7fKn6RoG1XzdxwbCboXFoK2Vumg9unJ1rQT2PI8C2mtf06vqn5USqyHYwmdcqmCLMaWQCkqw6XwAdM5S/nlf7wONoMn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746183812; c=relaxed/simple;
	bh=7B/Fs9f12a/EfZazo7rvvUt2On0lD//L6IQUV+aiOCk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QxenjAmOG1OAIcACNMMrdPWxfSeYLcqgAmG3IF7ZhiWJsHAxmCTMP4CtZjXCsmqzv5W5TR9CcypkrFu6Qf8eKJV5qQt1pbucN3HY2nqYzOVJ7xw2EYsjJpPWwNIUJrpCrA/NupITzzfD9g2scrGaMrJ08PqjEzj5ThFTK0LlBIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FV9eo+oQ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746183811; x=1777719811;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7B/Fs9f12a/EfZazo7rvvUt2On0lD//L6IQUV+aiOCk=;
  b=FV9eo+oQE2Xa9oDwfi6fD+YZDZVvdmmtBfDzuJSM5CPHoyitjYBB3x8A
   I0Tp0Wqwmm9+hyPW8ufpO4juuVyW7vRpdlCrGSQ4x3yeoZwsWDlXoXH8D
   uo0VXzqgLSqc/tfCN7HfTsYsvRpZxXYg7CZBv50ecbo3Nueha9riA37tM
   VwSVo5Q9+ZeyggAVGF+pKXVUit3yd4gsfmBm+BqasiM9oeT7IYxkm/mp5
   o7qRv2yqUtPTyeuhF34PTG+jGjRwLzgi3DC0kM69Pl1mRGOIwS7Yvp3dF
   Zkc/jxMwR2xd8sjhaYBqQTPLOxwVo2rMlir6he8B5/r/pkFTdY3E9zYso
   g==;
X-CSE-ConnectionGUID: QIbEIllLS3y4t14Wc08lhQ==
X-CSE-MsgGUID: 2iNDd2yAR8WwY68DbJOsOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="51680488"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="51680488"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 04:03:30 -0700
X-CSE-ConnectionGUID: Q7u3S9JzQ/qGa9N64ULX0w==
X-CSE-MsgGUID: AH+Hw+WDRuyKN+bf962HHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="165540944"
Received: from mylly.fi.intel.com (HELO [10.237.72.50]) ([10.237.72.50])
  by orviesa002.jf.intel.com with ESMTP; 02 May 2025 04:03:27 -0700
Message-ID: <6a3b756f-6fbd-4ee5-b511-c5a32e4a6a34@linux.intel.com>
Date: Fri, 2 May 2025 14:03:25 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [1/1] i2c: designware: Ensure runtime suspend is invoked during
 rapid slave unregistration and registration
To: EnDe Tan <ende.tan@starfivetech.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Cc: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
 "jsd@semihalf.com" <jsd@semihalf.com>,
 "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Leyfoon Tan <leyfoon.tan@starfivetech.com>,
 "endeneer@gmail.com" <endeneer@gmail.com>
References: <20250412023303.378600-1-ende.tan@starfivetech.com>
 <6e155241-3403-49df-8f0d-5aa63e2e74ab@linux.intel.com>
 <NTZPR01MB10182E9F6E50D679A6EAC3B4F8B92@NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <NTZPR01MB10182E9F6E50D679A6EAC3B4F8B92@NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi

Sorry the delay. Comment below.

On 4/20/25 6:31 AM, EnDe Tan wrote:
> It appears that when performing a rapid sequence of `delete_device -> new_device -> delete_device -> new_device`, the `dw_i2c_plat_runtime_suspend` is not invoked for the second `delete_device`.
> 
> This seems to happen because when `i2c_dw_unreg_slave` is about to trigger suspend during the second `delete_device`, the second `new_device` operation cancels the suspend. As a result, `dw_i2c_plat_runtime_resume` is not called (since there was no suspend), which means `i_dev->init` (i.e., `i2c_dw_init_slave`) is skipped.
> 
> Because `i2c_dw_init_slave` is skipped, `i2c_dw_configure_fifo_slave` is not invoked, which leaves `DW_IC_INTR_MASK` unconfigured.
> If we inspect the interrupt mask register using devmem, it will show as zero.
> 
> Here's an example shell script to reproduce the issue:
> ```
> #!/bin/sh
> 
> SLAVE_LADDR=0x1010
> SLAVE_BUS=13
> NEW_DEVICE=/sys/bus/i2c/devices/i2c-$SLAVE_BUS/new_device
> DELETE_DEVICE=/sys/bus/i2c/devices/i2c-$SLAVE_BUS/delete_device
> 
> # Create initial device
> echo slave-24c02 $SLAVE_LADDR > $NEW_DEVICE
> sleep 2
> 
> # Rapid sequence of delete_device -> new_device -> delete_device -> new_device
> echo $SLAVE_LADDR > $DELETE_DEVICE
> echo slave-24c02 $SLAVE_LADDR > $NEW_DEVICE
> echo $SLAVE_LADDR > $DELETE_DEVICE
> echo slave-24c02 $SLAVE_LADDR > $NEW_DEVICE
> 
> # If we use devmem to inspect IC_INTR_MASK, it will show as zero
> ```
> 
Good explanation and could you add it the commit log together with the 
example?

