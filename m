Return-Path: <linux-i2c+bounces-3436-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 365678BD1E2
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2024 17:54:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67F6E1C2240C
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2024 15:54:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1896B155748;
	Mon,  6 May 2024 15:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="mvrt3j3G"
X-Original-To: linux-i2c@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E3884D58E;
	Mon,  6 May 2024 15:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715010889; cv=none; b=MvwxsTvAqfAvjOGVU5S1rYcraHxc6e1DGhGRDsfSHo2fyPI/Shq3VkTStwhrmfAgu2EoTYBpGNBh/SSTOju+SkjWa7Z6g6tOHn0q/d9PvfSyfWCt3AwN7dlP5dwWM8GKcKV2QlLIq4BXzu08vGN+ZASen3Xy5SVPaEK6Wc4mz1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715010889; c=relaxed/simple;
	bh=Crd4eA01Q8OgQOfWxO/qZtC6JCLcKbyjrjCZcY6mXGU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JysOqIjg/0dsNB/NErDcqnBR86sgwCH8qFt7OV23M53goYWfzc6jCCn6u1Th37y7zjXDGreeZzAGjMawVxDA7J23tobv5p/Ze6Gdvq6bLTOuTMPHqm82ZH4bHXgjcko4rn8sgcp3C+bome6JZO52hrfWreF1JzNtJ8XprFzqfyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=mvrt3j3G; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from [100.65.96.57] (unknown [20.236.10.66])
	by linux.microsoft.com (Postfix) with ESMTPSA id 63A2E20B2C82;
	Mon,  6 May 2024 08:54:47 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 63A2E20B2C82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1715010888;
	bh=sn+I7ADMPSvGvZYIULHrdfmxmoEt29gcieDFLNGehhA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mvrt3j3GirQyL+zNWSUJPrkb94vYe3gRE3gFwpfF/00niIyl3fc+VRb5f4AxuoW6y
	 kfky6VeELzBpCgzxTreaammrgxgd2SDXZvPOj7nLeVxJzxzGqiRR6ErGuzVari+m/L
	 Ad5PQJ1lUdbhal6K44JEvCMsC3zo/UFAAL0Irirc=
Message-ID: <82f5b8e3-45c4-4b59-bc96-4cee2b122e9a@linux.microsoft.com>
Date: Mon, 6 May 2024 08:54:47 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 10/12] sfc: falcon: Make I2C terminology more inclusive
To: Jakub Kicinski <kuba@kernel.org>
Cc: Edward Cree <ecree.xilinx@gmail.com>,
 Martin Habets <habetsm.xilinx@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
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
References: <20240430173812.1423757-1-eahariha@linux.microsoft.com>
 <20240430173812.1423757-11-eahariha@linux.microsoft.com>
 <20240503151300.0f202c30@kernel.org>
Content-Language: en-CA
From: Easwar Hariharan <eahariha@linux.microsoft.com>
In-Reply-To: <20240503151300.0f202c30@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/3/2024 3:13 PM, Jakub Kicinski wrote:
> On Tue, 30 Apr 2024 17:38:09 +0000 Easwar Hariharan wrote:
>> I2C v7, SMBus 3.2, and I3C 1.1.1 specifications have replaced "master/slave"
>> with more appropriate terms. Inspired by and following on to Wolfram's
>> series to fix drivers/i2c/[1], fix the terminology for users of
>> I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
>> in the specification.
>>
>> Compile tested, no functionality changes intended
> 
> FWIW we're assuming someone (Wolfram?) will take all of these,
> instead of area maintainers picking them individually.
> Please let us know if that's incorrect.

I think, based on the trend in the v2 conversation[1], that's correct. If maintainers of
other areas disagree, please chime in.

Thanks,
Easwar

[1] https://lore.kernel.org/all/20240503181333.2336999-1-eahariha@linux.microsoft.com/

