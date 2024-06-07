Return-Path: <linux-i2c+bounces-3919-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A1E900BBC
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2024 20:13:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88A5D282352
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2024 18:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F72919A2BE;
	Fri,  7 Jun 2024 18:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="h+wvZN29"
X-Original-To: linux-i2c@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DBF51805A;
	Fri,  7 Jun 2024 18:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717784015; cv=none; b=WwBLgdXWQ04plAZtJHdxR1eIH5hiJ7nPN1qu2RD9c+3TY8LYr6hKOmeQUQ0h/KStMffHJrOAS8R061wyJA2rXE2TaDjdPHpvVD5tiLJx7G6YEf7OC4R1pa9rpwzO8AugDGSozJQzRlOSErI9zvXGp1qLp1xP40m4fsAcmAShRVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717784015; c=relaxed/simple;
	bh=s5GSFaFoJcsg/hAU2dY/KMvqsMAVK1Cf04UTs2129N8=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=bWfQHpF10NXKiswQ94R3eEkzE1OxGSpMUsP1pFPrK68CSx8tiiNenq+uuEz8eiHBa4i+H+uBrSEgGixcwFAKVs1nZy5e3h1J6atnHkrYuavqBy117i6QLTRLaPZv9loY65XTBkYgPRTMkX5E5jwREoveiAQ1lIIaN2Joj9opCA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=h+wvZN29; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from [192.168.49.54] (c-73-118-245-227.hsd1.wa.comcast.net [73.118.245.227])
	by linux.microsoft.com (Postfix) with ESMTPSA id 0434E20B915A;
	Fri,  7 Jun 2024 11:13:32 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 0434E20B915A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1717784013;
	bh=aXOI8I3hDZWU29vODgReaIQCdEBRorPPInPYeuxKqCQ=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=h+wvZN295NR2froIv2yYq2O9EWCYJfvCb5LYzNhr2NBU8AENEBflZGzyyKVQDXCHr
	 zv5AOxXzeaGaDCTmCD7GVQhQt/kFphLn5vn5BUC+NDscnoTQ6ijoOefPgmMng3N5Av
	 ZCpyZJHlzjIIqzwjjWLKcJhmeydE0djoqX1Xr310=
Message-ID: <b50da76e-bb46-4761-87ed-116e06d19ff5@linux.microsoft.com>
Date: Fri, 7 Jun 2024 11:13:31 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: eahariha@linux.microsoft.com, Andi Shyti <andi.shyti@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] docs: i2c: summary: start sentences consistently.
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org
References: <20240607111726.12678-1-wsa+renesas@sang-engineering.com>
 <20240607111726.12678-2-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Easwar Hariharan <eahariha@linux.microsoft.com>
In-Reply-To: <20240607111726.12678-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/7/2024 4:17 AM, Wolfram Sang wrote:
> Change the first paragraphs to contain only one space after the end of
> the previous sentence like in the rest of the document.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  Documentation/i2c/summary.rst | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 

Looks good to me.

Reviewed-by: Easwar Hariharan <eahariha@linux.microsoft.com>

