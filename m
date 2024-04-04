Return-Path: <linux-i2c+bounces-2764-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 874AB898ED0
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Apr 2024 21:17:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B89081C28098
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Apr 2024 19:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87D9D133425;
	Thu,  4 Apr 2024 19:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="ouUr4Yzr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E215513119B;
	Thu,  4 Apr 2024 19:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712258250; cv=none; b=cuyS+kDZCNFLG7Z10tBJP2KSds6QISDlcao2l0S+4Op2sZP9XVwzkr2DUBcd0PO4vymElQ8WSYh/pJJw4wuYI7VfGpPk4p1a2KUBiVtZWUhIeB6BVIMdx242SuXn0uPpsxaqwLp0e3TJ7SwcLitbEw4My9p7HxOed1oOIqmi0wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712258250; c=relaxed/simple;
	bh=DIPK6f6CAa3cqdVDKBGfl3pnOMadHOz2VC8QjAmhrbw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lIjpIWseVi7pRpbJRad4QIzXTV8Sg0LhEkG5UR8xm/c2JU7YFoVYmHtFzA3pq2T7x2baCPgM07wC3y/K6xlaP3QrAdfs19uUveP0jwPU1K7717D4H9wV84OspIa7FN9en7M6az/fa/+f9NsiWzHQEeHt7bEqgkC4+PEIawjCR+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=ouUr4Yzr; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from [100.64.1.95] (unknown [20.29.225.195])
	by linux.microsoft.com (Postfix) with ESMTPSA id DEEC720E94A7;
	Thu,  4 Apr 2024 12:17:27 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com DEEC720E94A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1712258248;
	bh=ZrJyqrC7sT3JNnbsQN7FmNZAzW2Ic4NFV4xHepZ1iyE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ouUr4YzrTeT1xQ1G84VlDGr/wpUk6MGHRGIQMB7WoEeMZ+IPgpdMcvtmzPFc3Klyf
	 aGnO13FEkkfhZT6ZBcqpgxS84Ob9Fza2JbfZXbMQXPvtNWxBeefu162cM7VQ0yCR/H
	 fdTWdfJov5qRIM4zOKJufV8tFIV67xSnLc0hYGik=
Message-ID: <cd983b4d-70dc-47b8-96cd-55bba39eb892@linux.microsoft.com>
Date: Thu, 4 Apr 2024 12:17:26 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v0 10/14] sfc: falcon: Make I2C terminology more inclusive
To: Simon Horman <horms@kernel.org>
Cc: Edward Cree <ecree.xilinx@gmail.com>,
 Martin Habets <habetsm.xilinx@gmail.com>,
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
 <20240402082951.GG26556@kernel.org>
Content-Language: en-CA
From: Easwar Hariharan <eahariha@linux.microsoft.com>
In-Reply-To: <20240402082951.GG26556@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/2/2024 1:29 AM, Simon Horman wrote:
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
> Reviewed-by: Simon Horman <horms@kernel.org>


Thank you, Simon, for reviewing. I believe that we are settling on controller/target
terminology from feedback on the other drivers in this series. Would you want to re-review
v1 with that change, or should I add you R-B in v1 despite the change?

Thanks,
Easwar

