Return-Path: <linux-i2c+bounces-4017-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CC4907D03
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jun 2024 21:57:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC2E21F23CB9
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jun 2024 19:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2572F78C90;
	Thu, 13 Jun 2024 19:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="e+uEZUaY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAB486E5ED;
	Thu, 13 Jun 2024 19:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718308663; cv=none; b=MtC6wn/GxS5hARNwqtMoZnc5DbMqfzppC3aTjnqnZH2/0hDmQRDKZn/mr8KRgrp1AmfKSDnnrx5F3zoL85alYIXDSlNX7DWr4wiirxiMgLu85BJGstlb/EesYYSOVAXBinUnrRR/m4Mx4H5br1h9WfLdNg5mRbqoRxRITlf2mq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718308663; c=relaxed/simple;
	bh=10Up4pLQbh1sTowpv00CDu7qpTRbGCdLV8pYCsnjQBA=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=p9JHSSO+jtabYOLpW//vdhV0TfzXPgqk6FfN2OyH3XzwUXK7A/KFNgv3DjFHdoISDSJgQbUYxkGEV37/jy7ZVuju8diP7PBuugkuseZxloDSGUuijVIeQuvUyizy6HITpmtE7D6yHK7VoGAwg4pPWvp54UWJhKWo3yT21LNcw3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=e+uEZUaY; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from [100.65.161.70] (unknown [20.236.10.129])
	by linux.microsoft.com (Postfix) with ESMTPSA id 597E620B7001;
	Thu, 13 Jun 2024 12:57:38 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 597E620B7001
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1718308658;
	bh=smopO76CjEbi8aKHPsSQSJR4k3IP4QqeNesoZuUdTsc=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=e+uEZUaYJTXa1CMu8J+ek2tLxB3DbrjOPFauN51ESnGgjKi+BCzveK1SFnD1pg6lP
	 CiyfQt+TrDAz+a4A15HjRtm/qkXvl9uboXPwq86t9D4n1cyjF9yMASJB/K8hzAEAcn
	 EgEcL5yxBxhtPHuTp6gZySdVBl2ZwJw5Hc6BP3Ac=
Message-ID: <c9cdeb4f-6073-49aa-b1fe-05787067cbc7@linux.microsoft.com>
Date: Thu, 13 Jun 2024 12:57:37 -0700
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
 <z7j5debqyetpts7xdufguiprzqvd4swupnbdenhl7brx4dtt3j@j67j5ufyzrtn>
Content-Language: en-US
From: Easwar Hariharan <eahariha@linux.microsoft.com>
In-Reply-To: <z7j5debqyetpts7xdufguiprzqvd4swupnbdenhl7brx4dtt3j@j67j5ufyzrtn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/13/2024 12:52 PM, Wolfram Sang wrote:
> 
>>> +Outdated terminology
>>> +--------------------
>>> +
>>> +Historically, controller was named "master" and client was named "slave". These
> 
> Ahhh, while reworking the series I finally saw that I wrote "client" in
> the line above. That was an oversight, it should have been "target", of
> course. Next time, please quote directly below the errornous line, that
> makes it easier for me to understand what we are talking about.
> 
> Nonetheless, the rework is not in vain. I think the texts have gotten a
> tad better.
> 

Apologies, but that one word wasn't the cause of the confusion. It was:

a) "In Linux it is called a **client**", combined with
b) "The general attitude, however, is to use the inclusive terms:
controller and target. Work to switch over the Linux Kernel is on-going."

I'll try to quote better in the future.

Hope that helps,
Easwar

