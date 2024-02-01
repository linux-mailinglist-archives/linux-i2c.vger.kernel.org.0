Return-Path: <linux-i2c+bounces-1592-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5718458B9
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 14:19:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0459B1F2854F
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 13:19:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A1E05336F;
	Thu,  1 Feb 2024 13:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TtXO4lZo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FCE4D9E9
	for <linux-i2c@vger.kernel.org>; Thu,  1 Feb 2024 13:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706793587; cv=none; b=Jta7Don5W1KmQP7s5GE4hXwLkFGQj+iMTwQQ7RE8CO08Ypc9/HSwqvWcDyGx7RMTeL/Rc4k4RlRcCbXfXFSNtfPWZlmNFNV2ZKxsaIE0JS4QmGXtbd21D2e3sLfQ9fdZIGmCgmrCF0pIwqBnirg9IgrcPziIDIY3VfXbO5LzJUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706793587; c=relaxed/simple;
	bh=k84qtdA9z2Xk6mFLa8WMXJaWHZ4P4I8o+QIg+UPumac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OA6CBVznw2zEdEX1a9bPqy+l8oR4fofdLy2KJqW4K0BUP01ANZbx6+reK7m8i1j31N7HU5wPrqshmY3U1/4ebc0aDOaMQEYBw4U2u2R5DVyP0F98byybLuxIvvTnoNefC6Xzk9x9ae49RgCMOn80/qPvrRIlNI6re0S9syMeHRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TtXO4lZo; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706793585; x=1738329585;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=k84qtdA9z2Xk6mFLa8WMXJaWHZ4P4I8o+QIg+UPumac=;
  b=TtXO4lZoSyEGrJiJnDE0/sfIjo2oUHvrXT+Ia8qt/rVXeXbpbMBDgBlA
   CJNyvszJ/nGP+O8ifwrnnnVdDZm+CN874A2OfX1o+6HIkzi21BUIQSOvy
   I5myk8RmXfag4zNZAsF7vvCHfiQ+nI6fF5B8+I95hym4ulNg9SaoRRA7/
   Gd0PMvVU7gvAB0Vb0ji1hjzEUnObP9FUQfiBR8Ip+Es27DMGrp/EDozF+
   uh7qvtaB+SvHPctQD9AmTCSC4W9+ReC5xc9PuYQNgNq5D3fU/6Y1jyIq7
   ExqeGEba5jXC2Jb70IeX6QrBAyvVnsZtMMZgbuaS4kqwmr//S/4x9orKC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="11268350"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="11268350"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 05:19:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="738426410"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="738426410"
Received: from unknown (HELO [10.237.72.79]) ([10.237.72.79])
  by orsmga003.jf.intel.com with ESMTP; 01 Feb 2024 05:19:40 -0800
Message-ID: <e6241509-4bf4-4144-a7fb-694fc9fc83cc@linux.intel.com>
Date: Thu, 1 Feb 2024 15:19:39 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] i2c: designware: Fix RX FIFO depth define on Wangxun
 10Gb NIC
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
 Sanket Goswami <Sanket.Goswami@amd.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Michael J <michael.j.ruhl@intel.com>
References: <20240131141653.2689260-1-jarkko.nikula@linux.intel.com>
 <20240131141653.2689260-6-jarkko.nikula@linux.intel.com>
 <ZbuHrjeOV7Wd-HBs@smile.fi.intel.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <ZbuHrjeOV7Wd-HBs@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/1/24 13:59, Andy Shevchenko wrote:
> On Wed, Jan 31, 2024 at 04:16:51PM +0200, Jarkko Nikula wrote:
>> I believe RX FIFO depth define 0 is incorrect on Wangxun 10Gb NIC. It
>> must be at least 1 since code is able to read received data from the
>> DW_IC_DATA_CMD register.
>>
>> For now this define is irrelevant since the txgbe_i2c_dw_xfer_quirk()
>> doesn't use the rx_fifo_depth member variable of struct dw_i2c_dev but
>> is needed when converting code into generic polling mode implementation.
> 
> Shouldn't this formally have a Fixes tag?
> 
I don't think so since this define is not in use before my last patch. 
May needlessly bother stable bot & folks.

