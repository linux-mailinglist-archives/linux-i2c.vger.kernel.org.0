Return-Path: <linux-i2c+bounces-10272-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E2CA86239
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Apr 2025 17:46:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1ACD84C4D7F
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Apr 2025 15:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FEFC210185;
	Fri, 11 Apr 2025 15:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b="scwctkd0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from dog.elm.relay.mailchannels.net (dog.elm.relay.mailchannels.net [23.83.212.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3681620DD6B;
	Fri, 11 Apr 2025 15:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.212.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744386288; cv=pass; b=Q9UQMjkLeEqC2E6mCzJQk/pE/HO0wci1SUgt/2oTxfZAoA3zJwwgfPDPyp2mmov5xMN/PzLlukHtI90ZlbUQEj49Dh/Ao+dfCCT0bXGnjvkwSRKiFyQVSxXmvobOAI6uMPYdo6OI03SiFnjZ+sCTM4F6x2YvnKpqOl1vV4CS7P0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744386288; c=relaxed/simple;
	bh=3t86MQntUtxPGvkfEmR+IVFiTubcV3YLknpxY/7jYH8=;
	h=Message-ID:MIME-Version:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:Date; b=MMRLrLvzjBjX+uX6H2ayy2P0iwEpRBJWF3ux8JGyzIir34+3KJLL4QapJ14CvoMtHvDhC9yzKntglU7TgytAqNfNW+U8EJ5dv4vJDWILwJbcG0Mx0oP8SB/WnBn3XvZJsihQicujQbos4aH93x6QGZUF2Y6oE2nsaWZ2bT/Jy8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rootcommit.com; spf=pass smtp.mailfrom=rootcommit.com; dkim=pass (2048-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b=scwctkd0; arc=pass smtp.client-ip=23.83.212.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rootcommit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 363C68A3D59;
	Fri, 11 Apr 2025 15:44:39 +0000 (UTC)
Received: from fr-int-smtpout4.hostinger.io (trex-3.trex.outbound.svc.cluster.local [100.102.82.140])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 2E3868A3B15;
	Fri, 11 Apr 2025 15:44:38 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1744386278; a=rsa-sha256;
	cv=none;
	b=dJdxgvhvZxMJrnVk9TI/eGTYuEHbk88CZEDc/VKYmIbcqR7Dvj2iz0yk0kUcZbWI3+wmit
	Go5IGh3mIzHO1GEMRLfwwImtmqm1nlSX6/ajtCSIVAI5KGVsdLTHmnoNnN/NfhmuhS98GX
	o0R2F0qdiXgybILifiIfWmg3G3tVMcwzPilG0KJa2uqXB5aigw+oM1Q/2ia4j/DPFS/PdT
	iBkF3ZVwClZ3cqz9YB6p6dizjgLE9PrH8M8Y2bQCXZxmBDZ4GAae0lZ8xsgBqacQlriVRr
	rYhcSJXG6Jyl28sqNCrAAJ9oexbhWWIEsckvJT1aBYLdrnBN/BRISHq0hv47xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1744386278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=9QJSQapbF8rlDXleERb7i8Kqaa3j5k66yvH3bh7ZlkY=;
	b=q2Xmka7wqIT800I8dEXPYQfU5srtgZq++4oWn6jGj27R1tQFg9ySBUK9q+s/WFt1hxwdnO
	wh2ZgCF+C03x9dFFiS+gcuX/98SZCgc8GnSHS1bvjgEx7LMZm12zBNNz7CZ+jlDfIOR9+l
	zKmAGgOI1uwkpxCOSX8KuVQ3Bu/xHhyKbRcBcwwr0NZ1B1T2qqNEQFwE2G4I9Abj7UpGPy
	YCrNOiNf+bBXAkT4nf6pBHw7C83o+NgS9h5kUlkkRKfHRzkBg0KIRdR2VoudX722Kgwx1T
	hN/TxHpKZHRMAw/lbiEfQIlbVZqXfouC8fLCAi/52213cAOpqyg0fSLjajc10Q==
ARC-Authentication-Results: i=1;
	rspamd-648cbcd874-bfrwz;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId:
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Abortive-Reaction: 1ee031766fdae0ce_1744386278978_1655867756
X-MC-Loop-Signature: 1744386278978:4078894570
X-MC-Ingress-Time: 1744386278977
Received: from fr-int-smtpout4.hostinger.io (fr-int-smtpout4.hostinger.io
 [89.116.146.83])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.102.82.140 (trex/7.0.3);
	Fri, 11 Apr 2025 15:44:38 +0000
Received: from [IPV6:2001:861:4448:6b00:1ad0:a378:9b21:958] (unknown [IPv6:2001:861:4448:6b00:1ad0:a378:9b21:958])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4ZZ1Fw0kvxz2SrxC;
	Fri, 11 Apr 2025 15:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1744386276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9QJSQapbF8rlDXleERb7i8Kqaa3j5k66yvH3bh7ZlkY=;
	b=scwctkd0T8XsW1WU3AZPFxjV7gCcR6jazxVyW5A72DoJUGbrsISA5umdbxxm2ncunrOEW2
	HdeZuxKU1wyBz8IfT5yVQ4ugAPSX0iqDxzuj21KTH/O6PVzOPC7YvzgN8+AvpHPdubUY93
	CoR44uYLrDk/7pfs2bF77dy+ITOCByvIogZAA+2ZXYmeVGS5rBK6j50hCGrz3KPCrAjaSE
	OrZAvYSMzIBNSzoS8zMi6U/zYB7ig56oF9U02611tHu8EGBM//txsb4Zo5fQhC8VkYvaUY
	0UodpDtdupr7ysEZLyAEmYNZ21kdpxrcdcU1f6w4HExJ+8erVdY2+tk103WwTg==
Message-ID: <8d0c8005-57fa-4883-8a01-343ab9170643@rootcommit.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com, linux-input@vger.kernel.org,
 linux-i2c@vger.kernel.org
Subject: Re: I2C: can't detect Adafruit Mini I2C Gamepad on Linux - other
 devices detected
To: Anshul Dalal <anshulusr@gmail.com>
References: <24f08a7b-4a3c-4cd6-82b7-0f2c9ab4bbef@rootcommit.com>
Content-Language: en-US, fr
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <24f08a7b-4a3c-4cd6-82b7-0f2c9ab4bbef@rootcommit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 11 Apr 2025 15:44:36 +0000 (UTC)
X-CM-Envelope: MS4xfBVEPfC0hAlH4rImMsVbMm0KuU4fFLvSnuW6b4vd3bSlMT1VZ758Ti3QJJFabfPdj9UZABII24+Dqs0iAmNsao5AvpBAtsblJgBEi2sPRF1cd8iHzlo2 YGZiwlp7m+ex836WMYSOk6+Mi1RU7jr0lpRDloobgcVsyeWnzQpppCxqs8GYgIsLHZMplW11ybZmE/+6YmnooWO2O4pLIkoaQyso9aJ7aoe1/4h6F7dItV05 z8lxTAyzftTFAncAVP/3pwHE0VPFTPivTzoyZ5CSobJ9HvC99560kmpa5E5YO9wkCalIJ3Y9cd/jmW/39yLGaC2T+ur8yJZV3kT+qJDddVfcPpmRwVRES8k7 FAoCKkDiLt7fMBUtNxuV4MV1a33psbTDRV1Qic16wG5xfl8oytl2nkfQKn82dFA4KTMJYypFn+ZxxUVaMJ16vWZiUk2Q/w==
X-CM-Analysis: v=2.4 cv=Vv1xAP2n c=1 sm=1 tr=0 ts=67f938e4 a=hJmfl69EHLbX5Pto27Pacg==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NEAV23lmAAAA:8 a=d70CFdQeAAAA:8 a=q1W2NvDeohNq8XC1ktoA:9 a=QEXdDO2ut3YA:10 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com

Greetings

On 4/11/25 07:21, Michael Opdenacker wrote:
> Hi Anshul
>
> I contact you as the maintainer for the Adafruit Mini I2C Gamepad driver.
>
> I'm trying to use the Adafruit Seesaw I2C gamepad in my embedded Linux 
> training courses, to demonstrate driving I2C hardware, and the gamepad 
> would be perfect to play an ASCII Pac-Man clone 
> (https://github.com/michaelopdenacker/myman 
> <https://github.com/michaelopdenacker/myman>).
>
> Even before your driver is loaded, the device has to be detected. My 
> problem is the gamepad is never detected on Linux (running "i2cdetect 
> -r <num>"), while other I2C devices connected to the same bus are, 
> proving that the bus is correctly enabled. This happens on all these 
> boards running recent kernels:
> - BeaglePlay (Linux 6.14.2!)
> - BeagleBone Black
> - Raspberry Pi5
>
> I double checked my gamepads (I have 4 of them) and wires: they work 
> fine on Arduino Uno.
>
> Any clue why none of my 4 gamepads are never detected while two other 
> types of I2C devices are detected on the same bus, and the same 
> gamepads work on Arduino Uno?


Some progress here... On BeaglePlay, which is my primary target, I 
realized that if I declare the device in the device tree AND load the 
driver for the device, then the device seems to work fine. When I press 
the buttons, I get data in /dev/input/event<x>.

Plus "i2cdetect -r <num>" shows the device as UU for address 0x50, as 
usually happens with a driver is loaded.

I thought that connected I2C devices always showed in i2cdetect output, 
whether they are declared in the device tree and have a driver or not.

Cheers
Michael.

-- 
Michael Opdenacker
Root Commit
Yocto Project and OpenEmbedded Training course - Learn by doing:
https://rootcommit.com/training/yocto/


