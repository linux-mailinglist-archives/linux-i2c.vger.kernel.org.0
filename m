Return-Path: <linux-i2c+bounces-3682-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3444E8D14CF
	for <lists+linux-i2c@lfdr.de>; Tue, 28 May 2024 08:59:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A1929B21155
	for <lists+linux-i2c@lfdr.de>; Tue, 28 May 2024 06:59:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1B066EB7D;
	Tue, 28 May 2024 06:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LneVG+tZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74BC1BDD3;
	Tue, 28 May 2024 06:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716879553; cv=none; b=XrukjU+DGI7FPePw8GLy/MeJYny0T1Ejbcc++SPkqEVHID2dw5pjvQcDgFLXtvOPOw5PleX0sfuB5a3gTE5++0VMxywdiqtuB+5dWwrdIq4Mp7Fr19eqdgS0Y5TeN2Q2J4kRttfOauShvQAczyygeorVLlOFfwTCMthHL/J8nag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716879553; c=relaxed/simple;
	bh=HiRlZLOzSaOMY7blXOfYLPUrJsTTdSBTJvlHnt/Hb24=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=atRiBsd3ECEp5FVLkMggKyh0UtYcVjXpgD6oR66a75xQyxtZb2qnq8QPDLMtwGv+HUFFN+2/v+5joGNKtngtWR0Sf7VfLp7d3lNwYFXhZvbwCDI1AM1nxVe/ccAAwTmZrzNjn346q0S0/zOE5NspVtygrWfvbjT59jsvIX1Yw4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LneVG+tZ; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E95F620005;
	Tue, 28 May 2024 06:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716879547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OI6f+uIxM6o5IsKGD7gigINySmFK/jOGNB2Gg4O3dJI=;
	b=LneVG+tZiJPidz1EWjz0MJmtxpYZd9klnUiUlwBiGEqdESHNbYuT1/NCJX173KGAXqUMHk
	vky0zDs5rMzAYHQOK6o3x31btrWi9VsbPhrfK6FVvRL1pt8MRgNYFhp+0lK//QorUONjoK
	d1LrDaQFbO6cP0UrcPfOwqTVwQ6ua+MCWJIi7+R+RRXVRqZTp0AdnhSmCHpD0U58PFeXdx
	CTL1TaXV6r5qzVk1lytP8S1E6bzEM9cOnvlpiazx91q0RCgHqdkAkiohvCXiHT2JUiZcAF
	x17A0g+rikkL3JIvvny2beXx2YqGeG8IdhkJ14qv4BCeJomQ6mbH+EZCyp9J0A==
Message-ID: <1cfef2c3-3b24-469d-b55a-377f2d42756b@bootlin.com>
Date: Tue, 28 May 2024 08:59:06 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: i2c: gpio: Add 'transition-delay-ms'
 property
To: Krzysztof Kozlowski <krzk@kernel.org>, Peter Rosin <peda@axentia.se>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Korsgaard <peter.korsgaard@barco.com>,
 Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, herve.codina@bootlin.com,
 christophercordahi@nanometrics.ca
References: <20240527113908.127893-1-bastien.curutchet@bootlin.com>
 <20240527113908.127893-2-bastien.curutchet@bootlin.com>
 <4f4db483-6042-4f85-9c64-8d3ad9290506@kernel.org>
Content-Language: en-US
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
In-Reply-To: <4f4db483-6042-4f85-9c64-8d3ad9290506@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: bastien.curutchet@bootlin.com

Hi Krzysztof,

On 5/27/24 16:38, Krzysztof Kozlowski wrote:
> On 27/05/2024 13:39, Bastien Curutchet wrote:
>> The i2c-gpio-mux can be used to describe a multiplexer built upon
>> several i2c isolators having an enable pin (such as LTC4310). These
>> isolators can need some time between their enable pin's assertion and
>> the first i2c transfer.
>>
>> Add a 'transition-delay-ms' property that indicates the delay to be
>> respected before doing the first i2c transfer.
>>
> 
> That's quite limited hardware description, comparing to cover letter.
> Please provide full description here, not in cover letter. This is the
> binding, so the hardware part.

Ok, I'll add details in next iteration.

> 
> Anyway, this does not look like property of mux itself. If there is no
> isolator, the mux would work fine, right?
> 
In the case I'm thinking about, there is no mux at all on the hardware, 
only two isolators. Each of them have several devices behind. I use the 
i2c-gpio-mux to drive the isolators enable pins to always enable only 
one of the isolators at a time.

> Then why you are not adding this property to every possible bus and I2C
> controller? I2C isolator could be placed there as well.
> 
I actually thought about adding a description of I2C isolators because 
my real use case is only one I2C isolator on a I2C bus. The isolator has 
an enable pin that I want to drive low when the bus is unused to save 
power.
But I didn't find a proper way to describe it. I think a property for 
I2C controllers is not ideal to describe the GPIO, the transition-delay 
and the fact that there could be devices in front of the isolator and/or 
devices behind it (see below)
 

                                                      +------------+ 

                                                      |   GPIO     | 

                                                      | controller | 

                                                      +------------+ 

   +------------+                                           | 

   |    I2C     |------+-------------+                      | 

   | controller |      |             |                      | 

   +------------+  +---+---+  +------+------+               | 

                   | dev A |  |    I2C    EN|---------------+ 

                   +-------+  |  isolator   | 

                              +------+------+ 

                                     | 

                                     +-------+-----------+------- 

                                             |           | 

                                         +---+---+   +---+---+ 

                                         | dev B |   | dev C | 

                                         +-------+   +-------+ 


So I started to describe it as a device itself but then I realized that 
I was doing something very similar to the i2c-gpio-mux description 
that's why I finally submitted this patch series.

> So just like RC binding, that's not a property of I2C mux. Maybe this
> fits usage of GPIO RC / delay binding.
> 

IMHO that’s more of a MUX property than an RC binding because every MUX 
needs some time to switch from one bus to another. It’s just that for 
the vast majority of MUXes, this time is so small that it doesn’t need 
to be described.


Best regards,
Bastien

