Return-Path: <linux-i2c+bounces-2765-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3EF898ED8
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Apr 2024 21:18:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73AB628724E
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Apr 2024 19:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C429133987;
	Thu,  4 Apr 2024 19:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="RwqT6YsJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDBC1133413;
	Thu,  4 Apr 2024 19:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712258290; cv=none; b=PVcFauwgrDCQbleavT3X7D76QcALh/RCMYRPsql1+oFF2Ymbg/lHEIi0M78XwZpWOlFPVGHt2t+y3K9xc0fkqzvzywYKrOCDraE1O4YRXX6tcRabtotMMbqqpkclFZHnTX1xb4Q1Ei5zT2uHwjiMQyiqomQS7iTuI8PSIIR4udA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712258290; c=relaxed/simple;
	bh=hQsnH1190673HPRgjVKyfoJUxLWZ/psXgZYe+KtS/p0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=praF+cH34qWqQQh1TXjL5H69FujFZKKWqfTrvD3GV0WrqN4thMzhk1H2pPEzfbTu33EGoDde/EyoFgFlcRTjXOAZt5sWg8F6clkTl+50JruvbqsgzR1QcB2RqLGVKJ3f8t+h4CEgYEWpjM9k55F5CiS66OY0Iass9CI4mi6JaNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=RwqT6YsJ; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from [100.64.1.95] (unknown [20.29.225.195])
	by linux.microsoft.com (Postfix) with ESMTPSA id C9C2320E94A7;
	Thu,  4 Apr 2024 12:18:07 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C9C2320E94A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1712258288;
	bh=A7Q2axkjCx78vPEBshdngJM72aZQ9s5wZHp2jmg55+0=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=RwqT6YsJmdnnrXHHFSbq9RKV256RC5Z2Qt1RVhzqRL41d+g/++plFbI7OaU0y5lXa
	 xK8Id/EOOOiRvURMOaHIKIxUsjRApKXm1zpvse7+6DRvz6Eo35XBhJyn02mxudZJMU
	 R8AAFulwPcZAJ5CM+lurbHElalUA+2ztG0FICXFk=
Message-ID: <0c6ff90d-0709-4fc5-951e-1b0f0b1273dc@linux.microsoft.com>
Date: Thu, 4 Apr 2024 12:18:06 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v0 10/14] sfc: falcon: Make I2C terminology more inclusive
To: Edward Cree <ecree.xilinx@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "open list:SFC NETWORK DRIVER" <netdev@vger.kernel.org>,
 "open list:SFC NETWORK DRIVER" <linux-net-drivers@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-gfx@lists.freedesktop.org>,
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-xe@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>,
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
 "open list:BTTV VIDEO4LINUX DRIVER" <linux-media@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>
References: <20240329170038.3863998-1-eahariha@linux.microsoft.com>
 <20240329170038.3863998-11-eahariha@linux.microsoft.com>
 <20240402090028.GA1759653@gmail.com>
Content-Language: en-CA
From: Easwar Hariharan <eahariha@linux.microsoft.com>
In-Reply-To: <20240402090028.GA1759653@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/2/2024 2:00 AM, Martin Habets wrote:
> On Fri, Mar 29, 2024 at 05:00:34PM +0000, Easwar Hariharan wrote:
>> I2C v7, SMBus 3.2, and I3C specifications have replaced "master/slave"
>> with more appropriate terms. Inspired by and following on to Wolfram's
>> series to fix drivers/i2c/[1], fix the terminology for users of
>> I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
>> in the specification.
>>
>> Compile tested, no functionality changes intended
>>
>> [1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/
>>
>> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> 
> Reviewed-by: Martin Habets <habetsm.xilinx@gmail.com>
> 

Thank you, Martin, for reviewing. I believe that we are settling on controller/target
terminology from feedback on the other drivers in this series. Would you want to re-review
v1 with that change, or should I add your R-B in v1 despite the change?

Thanks,
Easwar


