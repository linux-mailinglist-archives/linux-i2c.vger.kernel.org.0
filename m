Return-Path: <linux-i2c+bounces-3961-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D45039027B4
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2024 19:25:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7180E2849FD
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2024 17:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E57B1147C74;
	Mon, 10 Jun 2024 17:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="GXxsBM34"
X-Original-To: linux-i2c@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AA7514659A;
	Mon, 10 Jun 2024 17:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718040325; cv=none; b=sa39qXozccq+OCNbNYNb6HS+thSSB3Q40wVjGzOj++XZen9YKS0/A19vZydaFLaS8u0jhkVFqJg2TVL+CfHFnw5YYXwra/vHRIAKfV4j5Z66M8tHRPBg6wWwZNQiFxf4l8nyAppihertE5EiAW22CZHH3TdUKKrubRRSPv9KJos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718040325; c=relaxed/simple;
	bh=IvBr88+3NGprv74OWhbLkJ1TA2PuayZucSg1C6jsCgc=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Mhvu5cYLGsq22lE72VlwpZN2kq+tTuMjmAVannJe54cZHBTELB4+jO/oqgO78PcSWq1S7GDYh6OMTXwC3Tw+besFvqybzrpXmQdttOz09X0+L5SOAp5jg6vKAXqwmemM9Y6vRn2FvGxfrvppTc1ygYf/5L846GcveuvoT/U9e+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=GXxsBM34; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from [192.168.49.54] (c-73-118-245-227.hsd1.wa.comcast.net [73.118.245.227])
	by linux.microsoft.com (Postfix) with ESMTPSA id 35E2420B915A;
	Mon, 10 Jun 2024 10:25:23 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 35E2420B915A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1718040323;
	bh=rLcSlNIR92Vq01FQcTVxSggAehvgTDxYhmYboQhlr7c=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=GXxsBM34ar2XxgGJsHpm/ipVRPrFodhOAOWJekObZHJnxFlETNA3bGSMkjeF/2oXj
	 agooTXFyuw6VyvEGNUl5st4ZfpmbCufsUoYk6cPj0K1G7Sxryu8GSvz4f/0d0wtQlq
	 QGiSOfv9MRPxCBS9ed4si0pPv3zVDo2se2T5BW5g=
Message-ID: <8e051ecf-a355-4aef-bc40-007f9b709ba6@linux.microsoft.com>
Date: Mon, 10 Jun 2024 10:25:20 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: eahariha@linux.microsoft.com, Andi Shyti <andi.shyti@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/6] docs: i2c: summary: document use of inclusive
 language
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org
References: <20240610081023.8118-1-wsa+renesas@sang-engineering.com>
 <20240610081023.8118-5-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Easwar Hariharan <eahariha@linux.microsoft.com>
In-Reply-To: <20240610081023.8118-5-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/10/2024 1:10 AM, Wolfram Sang wrote:
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

<snip>

> +
> +Outdated terminology
> +--------------------
> +
> +Historically, controller was named "master" and client was named "slave". These
> +terms have been obsoleted with v7 of the specification and their use is also
> +discouraged by the Linux Kernel Code of Conduct. You may still find them in
> +references to documentation which has not been updated. The general attitude,
> +however, is to use the inclusive terms: controller and target. Work to switch
> +over the Linux Kernel is on-going.

What's the combined effect of this documentation update in terms of the
recommendation for switching over the Linux kernel? Are we to use
controller/client or controller/target?

Confused,
Easwar

