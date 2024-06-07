Return-Path: <linux-i2c+bounces-3920-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E95900BBF
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2024 20:13:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93C831F21201
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2024 18:13:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BF6F19AA7F;
	Fri,  7 Jun 2024 18:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="OqaWt79u"
X-Original-To: linux-i2c@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1E571805A;
	Fri,  7 Jun 2024 18:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717784033; cv=none; b=EvoptCU/B8J8s7n8kBKgy+Fxi+xiSpotn21J3BiztO99DNrIlVCK4aWWRV4c5egdKtqJBLFKDHkN265uZj2IjDI4tAV2hSZL8VLCC/bPCZ6YPSM3QXwlVmgb80UcaILpMbQUY6SNMwI0jKLNzk3vmQGh2B8zeW+1tyyf9ez9qZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717784033; c=relaxed/simple;
	bh=qRUTf4THqedPmewsgpfJ3wtcr/z83qz85I5RNZ9POuo=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ifBmM/GuWj6yji9+blYWTFqWkb7xY/63aPlkgSd/8PQBljyOY7QlFyIhomzN6sMhD7iphm0vOZyYkAIjM03hGrNZ3vPBIjQ0oA0iy3X6pZFcXau53eXjeDJZ44C+JGWncy7N6jOXnaa2g7aqf1uR5pzmG9qec9xHPWTswKLrGxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=OqaWt79u; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from [192.168.49.54] (c-73-118-245-227.hsd1.wa.comcast.net [73.118.245.227])
	by linux.microsoft.com (Postfix) with ESMTPSA id 875FE20B915A;
	Fri,  7 Jun 2024 11:13:51 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 875FE20B915A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1717784031;
	bh=ZdB1LWbIM0gpuCjCafowNUkuqNz3V3q7jdSzb+Jib74=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=OqaWt79uzyKMN0NzrY6Eq2DryqfgeBzOrDl/mtEQKem3B/PPXjvUqO0VnA7VMDmeD
	 DRYBeh8oLZ04qRqV8UjBQ3YWn/Kn2nG+GAmf62xXrxyVVPuS1G8yh+S4dIa0FBSnY4
	 MHQigjwlIJ2/dD6MjCoXD/ZK38g5LGPiJ8ZmAhfw=
Message-ID: <dcd7adf8-bcb6-483b-859b-06e7b2831e23@linux.microsoft.com>
Date: Fri, 7 Jun 2024 11:13:50 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: eahariha@linux.microsoft.com, Andi Shyti <andi.shyti@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] docs: i2c: summary: document use of inclusive
 language
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org
References: <20240607111726.12678-1-wsa+renesas@sang-engineering.com>
 <20240607111726.12678-5-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Easwar Hariharan <eahariha@linux.microsoft.com>
In-Reply-To: <20240607111726.12678-5-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/7/2024 4:17 AM, Wolfram Sang wrote:
> We now have the updated I2C specs and our own Code of Conduct, so we
> have all we need to switch over to the inclusive terminology. Define
> them here.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  Documentation/i2c/i2c_bus.svg | 15 ++++++++-------
>  Documentation/i2c/summary.rst | 23 +++++++++++++++++------
>  2 files changed, 25 insertions(+), 13 deletions(-)
> 

<snip>

> diff --git a/Documentation/i2c/summary.rst b/Documentation/i2c/summary.rst
> index a1e5c0715f8b..b10b6aaafcec 100644
> --- a/Documentation/i2c/summary.rst
> +++ b/Documentation/i2c/summary.rst
> @@ -31,15 +31,16 @@ implement all the common SMBus protocol semantics or messages.
>  Terminology
>  ===========
>  
> -Using the terminology from the official documentation, the I2C bus connects
> -one or more *master* chips and one or more *slave* chips.
> +The I2C bus connects one or more *controller* chips and one or more *target*
> +chips.
> +
>  
>  .. kernel-figure::  i2c_bus.svg
> -   :alt:    Simple I2C bus with one master and 3 slaves
> +   :alt:    Simple I2C bus with one controller and 3 targets
>  
>     Simple I2C bus
>  
> -A **master** chip is a node that starts communications with slaves. In the
> +A **controller** chip is a node that starts communications with targets. In the
>  Linux kernel implementation it is called an **adapter** or bus. Adapter
>  drivers are in the ``drivers/i2c/busses/`` subdirectory.
>  
> @@ -48,8 +49,8 @@ whole class of I2C adapters. Each specific adapter driver either depends on
>  an algorithm driver in the ``drivers/i2c/algos/`` subdirectory, or includes
>  its own implementation.
>  
> -A **slave** chip is a node that responds to communications when addressed
> -by the master. In Linux it is called a **client**. Client drivers are kept
> +A **target** chip is a node that responds to communications when addressed
> +by the controller. In Linux it is called a **client**. Client drivers are kept

Are we continuing to use client instead of local target and remote target?

Thanks,
Easwar

