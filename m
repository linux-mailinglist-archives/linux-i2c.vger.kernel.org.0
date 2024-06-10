Return-Path: <linux-i2c+bounces-3963-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 28704902ABE
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2024 23:43:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 352A11C21035
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2024 21:43:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 433D1745D5;
	Mon, 10 Jun 2024 21:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="BJUcu28b"
X-Original-To: linux-i2c@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C740574060;
	Mon, 10 Jun 2024 21:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718055807; cv=none; b=qD6ZGEuPCLflJama5Rfq8HSqyQ52qj6rpK2JQccS0QubGoSTpLmtU1c9AGSweYWR8aURzX59CF3atBK3wGyZ1FbY3R+BpKSYL7MK83eoPBd/hW8Y+NyIEkDdlTf6waC6P06TdFrDPo/+hPG9HYJLY9Q0p3gUAii0V6VUqfGH2l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718055807; c=relaxed/simple;
	bh=e/IpumEt/umiRZ/NL03DcupEXr4PX2XKKgGXUNzuR3o=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=HnjNcwteyhe6DpQx2b7c1yhICs7f6tNXGqLx0gXrOtQOmHUFdJnPI17HqUcve/A7dxkhi0+xsemQx7NlJV/8XLlSTgnsZ4N7senKmUCiY4eo/Smowhg/2PISnODkOG7hxKjLxwReGdZj9acg9o7xdlkuJod+Tu6gMPOyvvRKNNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=BJUcu28b; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from [192.168.49.54] (c-73-118-245-227.hsd1.wa.comcast.net [73.118.245.227])
	by linux.microsoft.com (Postfix) with ESMTPSA id 029AB20B915A;
	Mon, 10 Jun 2024 14:43:24 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 029AB20B915A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1718055805;
	bh=JwNQ/Z6sfe+WqXeKaCQIG2RVvPIzJrT1kwDvM2zlUbA=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=BJUcu28bYTmQ5LzUMkoxIvkyDMXqZ0NMYzuFqoLmnU/Za/pNeDbpMRd6eALdp+Gr1
	 Y/gxUOKYLa4mZuvwyG9qsIe/Rjs+EZ1sPFOobPBs1wbJjeCtyVma6YR+LnjGOehrEa
	 na9pv/5Gw6xmvNz++ZftTESM1tPzblDsWo2O0YEM=
Message-ID: <2770eb46-7322-4638-a5fe-9d994458a5c2@linux.microsoft.com>
Date: Mon, 10 Jun 2024 14:43:22 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: eahariha@linux.microsoft.com
Subject: Re: [PATCH v2 4/6] docs: i2c: summary: document use of inclusive
 language
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240610081023.8118-1-wsa+renesas@sang-engineering.com>
 <20240610081023.8118-5-wsa+renesas@sang-engineering.com>
 <8e051ecf-a355-4aef-bc40-007f9b709ba6@linux.microsoft.com>
 <iizkptuud2bcqnfvyvfomdbsakywyszzfmyawgsymsdvkatyyz@eze75wfqoczl>
Content-Language: en-US
From: Easwar Hariharan <eahariha@linux.microsoft.com>
In-Reply-To: <iizkptuud2bcqnfvyvfomdbsakywyszzfmyawgsymsdvkatyyz@eze75wfqoczl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/10/2024 1:29 PM, Wolfram Sang wrote:
> Hi Easwar,
> 
>> What's the combined effect of this documentation update in terms of the
>> recommendation for switching over the Linux kernel? Are we to use
>> controller/client or controller/target?
> 
> I am not sure I understand the question properly?
> 
> "controller/target" as in the specs, and "adapter/client" when it comes
> to the Linux implementation (which has been like this forever). I'd
> think it is too much churn to change this as well.
> 
>> Confused,
> 
> Heh, me too now...
> 
> All the best,
> 
>    Wolfram

I am wondering what the impact of this doc update is on my series[1]. I
am looking for a straightforward recommendation for what terminology I,
and hopefully others, should adopt *outside the i2c subsystem*, where
Linux (typically) has a driver for the controller and is communicating
with an unknown OS/firmware on the target.

a) Spec-compliant "controller/target"
b) Linux implementation/spec hybrid "controller/client", or
c) Linux implementation "adapter/client"

I prefer (a), FWIW, so do apparently reviewers on my series.

Thanks,
Easwar

[1]
https://lore.kernel.org/all/20240508234342.2927398-1-eahariha@linux.microsoft.com/

