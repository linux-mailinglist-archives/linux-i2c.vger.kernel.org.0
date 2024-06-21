Return-Path: <linux-i2c+bounces-4232-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D7418912AF5
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 18:09:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 143351C21124
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 16:09:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5B9515F40B;
	Fri, 21 Jun 2024 16:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="kSasi6ux"
X-Original-To: linux-i2c@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1CF515AACD;
	Fri, 21 Jun 2024 16:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718986165; cv=none; b=D/WfUIFEmYxBNWvJmBytqkLir377ZQnu/RjTArTZjhMbW7bRaQP341IRu2bTWxDAfLJKbbxWJ6FN3HFzrLP+BsYzTiuXO8auOnooict5OG20tnZrhHz4W68Fh9N/1A8iK46eOV5Xx/H0RQmVPoh/pIl6ESdpTcWNnX2mdZaZWrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718986165; c=relaxed/simple;
	bh=dvWfvNe6dib0dMV5plpJMOjRKiJe/99IRDev5pqBmk4=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=SvYjwQo1LqF0xEKLKixcVYMvu1ZILNg3GSzGw2q4sBPGLo7YPoc70rg4gCk0LnkPmMZ8Bz0ox7MsIGvO+zbvhFLDuaV4JOLqm2wcbdZq5QC77gvTwjkvis5RqG10xuxSHOqPOP9HxyS0oX7ssOUiwlCv+5UhcEAUICU/flxX7VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=kSasi6ux; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from [192.168.49.54] (c-73-118-245-227.hsd1.wa.comcast.net [73.118.245.227])
	by linux.microsoft.com (Postfix) with ESMTPSA id 5346420B7001;
	Fri, 21 Jun 2024 09:09:23 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 5346420B7001
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1718986163;
	bh=HlD4aPIdPUThQZd/pvRtxfoGeetS7LRPjbenqqQPAfU=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=kSasi6uxj3BPtiNQ47E4kGoGhyERM8dNFntaKnFCLY1ad+hffgpN6ISir4PQCjzgz
	 CkUJAiW2+1JL9nY7Se05IbNRRzMQGkraigRvf5dzsamV1DM/nHtQaXWQFMFqu+7wn9
	 1+W9cxXTG6g7FT9eAWf+oWnZuqihR2MW829oPQd0=
Message-ID: <1d5a8d4f-8236-4092-ae9e-3885bce097e6@linux.microsoft.com>
Date: Fri, 21 Jun 2024 09:09:21 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: eahariha@linux.microsoft.com, Andi Shyti <andi.shyti@kernel.org>,
 linux-i2c@vger.kernel.org
Subject: Re: [PATCH v4 4/6] docs: i2c: summary: document use of inclusive
 language
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-kernel@vger.kernel.org
References: <20240621073015.5443-1-wsa+renesas@sang-engineering.com>
 <20240621073015.5443-5-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Easwar Hariharan <eahariha@linux.microsoft.com>
In-Reply-To: <20240621073015.5443-5-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/21/2024 12:30 AM, Wolfram Sang wrote:
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

Looks good to me.

Reviewed-by: Easwar Hariharan <eahariha@linux.microsoft.com>

