Return-Path: <linux-i2c+bounces-1945-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AE39886153F
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Feb 2024 16:09:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E95E41C22FB3
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Feb 2024 15:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 974A02E412;
	Fri, 23 Feb 2024 15:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BfSvxna4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD1020B02
	for <linux-i2c@vger.kernel.org>; Fri, 23 Feb 2024 15:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708700983; cv=none; b=GlzldubTMJvUC0K265U1lQ49KCTgyzPfpN3RzV1Go3gRt+zGhdnrVzNlRrd46+cmPw6d8PqRsrL6+9mCUPKKqpFFwbQRY+Z9hj4YzUrExkUrbxj5H12cWhS8xqhNcR0N94o+C2D4/VPob56rpqfvrsEMKH7WO+xDP3DH+YbZM9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708700983; c=relaxed/simple;
	bh=QhIzQs9mDbq7cwffyaHbj1EJz6YMEuMa2qoQZcCVhNk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UEW/rxDqlx1+Ank8+KmMhA9rpOOZabS8Z83mMAi0KGssxD7j6HPn5qnTzLP9E/kAquCqZECzZsTkopUv/QyRib2FhZWB9mTh0EXEbVLnNf46ML05KLQtm67UlhtQNcxae3YicEwDP4Ith2wvOD4mD/Uh8EeG+NSAiWMr60AQwKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BfSvxna4; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708700982; x=1740236982;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=QhIzQs9mDbq7cwffyaHbj1EJz6YMEuMa2qoQZcCVhNk=;
  b=BfSvxna4sOtkS1GOWRqY4mdZl6fybm7eZclM/di35Y0lm9yvWMCCCCQd
   fBX/6zYOfSuqWZEaY/IYE5z8v+iykTkpeKheSdrm+IbkzdICZKNaHgeBm
   g1C8Xcec5/JxnpsV9jE3eCopurHjyv+HmchWUZpAv3r897PoBDcuHWbYf
   AwNZMLo487ZiV0MsHJ4V0IljI74IaHLwxIiRhQkL+t5ejWRC0vOv2FxeQ
   EL8YJjgc+2RZR4QpyI3sCQJFlnTXd4ATdjqd9afy0dpQv5ny+TOT0txug
   cJTg1bUYlZlZMWoLw7WcyYBLVgnhIH0x4zoPyzGf1Rs7qYgnUVyyC7WMm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="6805114"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="6805114"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 07:09:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="36945665"
Received: from marquiz-s-2.fi.intel.com (HELO [10.237.72.58]) ([10.237.72.58])
  by fmviesa001.fm.intel.com with ESMTP; 23 Feb 2024 07:09:38 -0800
Message-ID: <c813d6d1-e37f-44d5-be40-67976f49cdb7@linux.intel.com>
Date: Fri, 23 Feb 2024 17:09:37 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] i2c: designware: Generic polling mode code
Content-Language: en-US
To: Jiawen Wu <jiawenwu@trustnetic.com>, linux-i2c@vger.kernel.org
Cc: 'Andi Shyti' <andi.shyti@kernel.org>,
 'Andy Shevchenko' <andriy.shevchenko@linux.intel.com>,
 'Mika Westerberg' <mika.westerberg@linux.intel.com>,
 'Jan Dabros' <jsd@semihalf.com>, 'Sanket Goswami' <Sanket.Goswami@amd.com>,
 'Basavaraj Natikar' <Basavaraj.Natikar@amd.com>, michael.j.ruhl@intel.com
References: <20240213124847.672084-1-jarkko.nikula@linux.intel.com>
 <003901da624b$89c7c190$9d5744b0$@trustnetic.com>
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <003901da624b$89c7c190$9d5744b0$@trustnetic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi

On 2/18/24 11:19, Jiawen Wu wrote:
> On Tue, Feb 13, 2024 8:49 PM, Jarkko Nikula wrote:
>> Hi Jiawen, Sanket and Basavaraj
>>
>> I hope you could give a quick test to this patchset to see it won't cause
>> regression on your HW. This is mostly the same than the first version what
>> Jiawen tested earlier but in this 3rd version I decided to drop semphore
>> touching code patches from v2 due they being out of scope and fix a few
>> things noted by Andy.
>>
>> Changes are in the patch 3/6 with two minor fixes to comments while moving
>> them and the patch 6/6 where i2c_dw_wait_transfer() is slightly modified
>> by Andy's suggestion plus I decided to remove one comment which became
>> unclear after this patch.
> 
> Hi Jarkko,
> 
> I've been testing the v3 patch series on Wangxun 10Gb NIC, it works well, too.
> Thanks!
> 
> Tested-by: Jiawen Wu <jiawenwu@trustnetic.com>
> 
Andy: Was this set ok in your point of view now?

