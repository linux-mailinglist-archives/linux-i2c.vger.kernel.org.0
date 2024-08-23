Return-Path: <linux-i2c+bounces-5731-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D9B95CB27
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 13:06:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E161281825
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 11:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A831A181B88;
	Fri, 23 Aug 2024 11:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I1MEMOIu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7D6149C46;
	Fri, 23 Aug 2024 11:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724411153; cv=none; b=X+epTrPogOv5zCZwcEdlT257pRTK3ZYN8erBkeQPLGpTUqm7CmKv0arESksG/xPm4mnjVjnzuPXIDJVHERivVM828UwKIcNvNrg5bs1qMEn47Gqh9w/QjEBNx7xBRrtF+YmmnC6KLijiK8qchGr7HDcbcIfRhapWfHSoEeaVKlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724411153; c=relaxed/simple;
	bh=PG5bjP1PdtwQ/MUmwUkPF3xAPhixMRIfE69TX1jJ+bo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M6HqVTlwT8AM9FVl9hjdJbVcKeIhF75+8RmVLkzpYLxJU4UBSrXR3GLhUw4KgAFGNobFjdtZoUIE0MKXbXs3h12VvbORlXUdRH9qJU4us9xmcxjdrxL3zZk+TC9Usuvzk7xqsPQAROwovd9D8vpkToFstPeZv84NWxxuA0VsJzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I1MEMOIu; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724411152; x=1755947152;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=PG5bjP1PdtwQ/MUmwUkPF3xAPhixMRIfE69TX1jJ+bo=;
  b=I1MEMOIuXkyQ3mMV0fYQ9lBbZyV+xbOlyS8eoczmJKmcAA8GnBp8I1Gi
   UNs5uhQ+so9EZDKfO4ZHcsRRsZ6Ed8BwSNHuSw5LWaXlTpK8gsJFGx/jt
   4/rzW4V7zwU4WsGbGOkZKl1pFHwHk12jV4/ciMShrzGhmt4ApAULGGc0S
   /lvz0ck6rv7id2KKceRmMBnwpwIr8CqveTMnsYxawa10KHAfvv4D/ltEW
   H+VC2XppItWiuHV1EjJ9aY41W1NUh5V2jbbWJfhzrpw0WtzxRT9+rn7be
   LJGbMSwHvNkD2yzGKRvT0hkoRbhlekaIYJN/ejXqq+KThZ2G7b3DoBTS/
   Q==;
X-CSE-ConnectionGUID: 6f8zitXWRqCeTdmYEbGCeA==
X-CSE-MsgGUID: XTZI5dDcSQ6AHnwlDTWg3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="23040493"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="23040493"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 04:04:52 -0700
X-CSE-ConnectionGUID: AOIPDym6RHm7r1Yg+bfoog==
X-CSE-MsgGUID: BntMm/IOT0WTnkDbpF4m/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="99282894"
Received: from mylly.fi.intel.com (HELO [10.237.72.154]) ([10.237.72.154])
  by orviesa001.jf.intel.com with ESMTP; 23 Aug 2024 04:04:48 -0700
Message-ID: <cacbd4a1-1e7f-4067-95ad-215dde7eedcc@linux.intel.com>
Date: Fri, 23 Aug 2024 14:04:46 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 0/3] Add I2C bus lock for Wangxun
To: Jiawen Wu <jiawenwu@trustnetic.com>, andi.shyti@kernel.org,
 andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
 jsd@semihalf.com, davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, rmk+kernel@armlinux.org.uk, piotr.raczynski@intel.com,
 andrew@lunn.ch, linux-i2c@vger.kernel.org, netdev@vger.kernel.org
Cc: mengyuanlou@net-swift.com, duanqiangwen@net-swift.com
References: <20240823030242.3083528-1-jiawenwu@trustnetic.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20240823030242.3083528-1-jiawenwu@trustnetic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi
Hi

On 8/23/24 6:02 AM, Jiawen Wu wrote:
> Sometimes the driver can not get the SFP information because the I2C bus
> is accessed by the firmware at the same time. So we need to add the lock
> on the I2C bus access. The hardware semaphores perform this lock.
> 
> Jiawen Wu (3):
>    net: txgbe: add IO address in I2C platform device data
>    i2c: designware: add device private data passing to lock functions
>    i2c: designware: support hardware lock for Wangxun 10Gb NIC
> 
I was wondering the Fixes tag use in the series. Obviously patchset is 
not fixing a regression so question is what happens when issue occurs?

I don't think e.g. failing I2C transfer with an error code yet qualifies 
backporting into Linux stable?

