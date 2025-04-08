Return-Path: <linux-i2c+bounces-10226-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F3EA81278
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 18:35:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 54E607ABC07
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 16:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FE7A22F151;
	Tue,  8 Apr 2025 16:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="I60PPrDw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADE322CBE4;
	Tue,  8 Apr 2025 16:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744130116; cv=none; b=VVoVANc7q1bsx0tbMnspDvQk8C3kef8IAontsmG5qreoIKi23/o1Ax6i10yiSnHNWnCmf/8eILUX71ZftoPMGCF1GsnBQ0VkYj+ZRh1ZeWge4v7Jyn8wBDxkCiyN64nSV6OF2XlxhmJ9FDP/nV+86skmJpzHxGxEU1E2brVWQqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744130116; c=relaxed/simple;
	bh=pRxAE0dN0+ZziDIdhhS507AQceAEtgR9ln0qeRfB0l0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iy8BuG5O9DfplaNCvcKsB6A+DzZzeXH21DedzpHKQekpL+RQ/cSTiGciNeGVDswYqSFDK5VfaqKgSqapaZDoowtFHIAiFZfUiD0y1wR4LfsOw9eIHOuEuVHFPsAJ+9AVDw0Wz8HPmqZyQq3KZpzCtK1FYJMqVim+bw9//wog89c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=I60PPrDw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 932506EC;
	Tue,  8 Apr 2025 18:33:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744129996;
	bh=pRxAE0dN0+ZziDIdhhS507AQceAEtgR9ln0qeRfB0l0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I60PPrDwdqS0peghj2v0FzYAT6WF5k+X/a6tZHcc8RDqMNzCsdFgxI0MWShtCEPXl
	 IVv22d0pctroPrKJPxRFxEpi+FQw0BDWwLOPaOT+27Rnju+G7I0U/diIed8kQGFoN9
	 fK6hfcbY/TzexWpSDubANLn3T0SlLu79N1Z7xnPQ=
Message-ID: <556de433-4621-4f17-b5e9-7cfaea8508f7@ideasonboard.com>
Date: Tue, 8 Apr 2025 19:35:09 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] i2c: core: Move client towards fwnode
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jai Luthra <jai.luthra@ideasonboard.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20250407154937.744466-1-andriy.shevchenko@linux.intel.com>
 <Z_U2HLZN4XrbB-ly@kekkonen.localdomain> <Z_U3VcFg0ZtSnLcg@smile.fi.intel.com>
 <Z_U8Bza932tsZO66@kekkonen.localdomain>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <Z_U8Bza932tsZO66@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 08/04/2025 18:08, Sakari Ailus wrote:
> On Tue, Apr 08, 2025 at 05:48:53PM +0300, Andy Shevchenko wrote:
>> On Tue, Apr 08, 2025 at 02:43:40PM +0000, Sakari Ailus wrote:
>>> On Mon, Apr 07, 2025 at 06:44:56PM +0300, Andy Shevchenko wrote:
>>>> The struct i2c_board_info has of_node and fwnode members. This is quite
>>>> confusing as they are of the same semantics and it's tend to have an issue
>>>> if user assigns both. Luckily there is only a single driver that does this
>>>> and fix is provided in the last patch. Nevertheless the series moves
>>>> the client handling code to use fwnode and deprecates the of_node member
>>>> in the respective documentation.
>>>>
>>>> Tomi tested the last patch, but since it was separate there is no tag (yet).
>>>
>>> Apart from the two minor commit message comments:
>>>
>>> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>
>> Thank you for your review!
>> Does it imply that media patch can go via I²C subsystem?
> 
> Good point. Yes, and you can use this for the last patch:
> 
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> I wonder if Tomi would still be able to test (or at least ack) it. I see he
> has tested the rest but this one is missing hist Tested-by:.

I think Andy just missed it, as it wasn't explicit. I did test the v2, 
with the 7th patch from this series on top (it was not included in v2). 
I haven't tested v3, but I don't think anything really has changed.

  Tomi


