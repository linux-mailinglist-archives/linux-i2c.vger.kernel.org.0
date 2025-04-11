Return-Path: <linux-i2c+bounces-10259-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AA9A852FD
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Apr 2025 07:21:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D9C34A629B
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Apr 2025 05:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3627527CB1D;
	Fri, 11 Apr 2025 05:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b="Dxi03vPx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from iguana.tulip.relay.mailchannels.net (iguana.tulip.relay.mailchannels.net [23.83.218.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4B326F462;
	Fri, 11 Apr 2025 05:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.218.253
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744348912; cv=pass; b=e2ENkxVa5u4R3u44Lfe53th/CmZggKBBZL6Exlfqbn7TKDvyrZGLjx6CkiVYFXEF/EMR9HVXDQ+nKer3dM1YlwWbZ0w+C3mDmSx13BoK2mibP+bkXCpxBKFdcxZMhCLMvFr8U0IL5jKBt06MiILjWPm2j8mbzN8yCS4kHxEHoQw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744348912; c=relaxed/simple;
	bh=ghJg1fzJlUqK2ACARda3ABDItb6T2P9W/s7Gb/UsuVY=;
	h=Message-ID:MIME-Version:Cc:To:From:Subject:Content-Type:Date; b=lV0J64tSq/bRxqcOmNXX+TGVNV0Lkqy1WFsw9Y/URelQD8SC9X2+FmzfvSN40LgfkLs9wjRRbRziLWPvii32NfxyLXT9H84rxhLsLXWpViFKpSLEyppU032V8ysopkT5D3MugBLSVMoc7r/s1Lsy1GLB83PLZIXRmzwUeUkeuhw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rootcommit.com; spf=pass smtp.mailfrom=rootcommit.com; dkim=pass (2048-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b=Dxi03vPx; arc=pass smtp.client-ip=23.83.218.253
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rootcommit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 8127D783A89;
	Fri, 11 Apr 2025 05:21:43 +0000 (UTC)
Received: from uk-fast-smtpout6.hostinger.io (100-101-172-36.trex-nlb.outbound.svc.cluster.local [100.101.172.36])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 831D4782DA3;
	Fri, 11 Apr 2025 05:21:42 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1744348903; a=rsa-sha256;
	cv=none;
	b=51SRycbY/fZ8hrpt97EA2sciMsRWNj7PvmaeFM7wcGUvI5JdSoJZSSH3mzOnHgE/QrF7X4
	OEG0VHMuCrZaV8ZIdtgji4beBKgrWukYUlhP1ofuad+5Uy0OY4ONEzr6F39ciKY2EF3tMv
	RKtPOTEOCPxyrwXtkebyBgo+sowkSNJToohkJqzjHlAjqllMM4IQQuFZ0YyGAbyGG1HIvt
	zdib0tjxVhmJVvi0k9CSfoF3C3VJ5+7V+8+y+nJxLZOr9mzGhpachdMZm1XkUT5aUKBXyd
	7V/d2jZm9EjnbaCnZvWU1vU4M7/rSdEeC4wk36DqpdWiTu5DQj+WDNKkoqLcrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1744348903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=7WQSLHWxiG2839YngCI+C460yPq7/TxwoGIFaGZ+IDM=;
	b=jAf6kN7ODPBqjmgXqhVVPd6pVmqPd5YjNn/0srsgWkRR2l7Z7AKKNpvnvBVbvUBXy9R1qT
	wTwSBYoNE3q9D7gmxfgbXbW4KUuNDA9tq2jeQsgB34DgPyQNE+IuzmmPpdcEHVi48yfyga
	FEi23fWbNdp3CJt1xkJ7tNLA370dfsipf4+D7xzBFKTYeERCewU4Av+aKhhUsiD+RBXyGq
	N4yk3IWVz/c2PM5h/npBCoIJpfGRMJGjUZv4m4t05vWR/r3eQ2E70gWcRPo96ot50yesx8
	HxHmkamp0XP4LRjxN+YRJ7UsyGq8fYL1n3jHkPmd/W5mMHxB+C9XjsAsG8ZBYA==
ARC-Authentication-Results: i=1;
	rspamd-5b8c5f5bfd-6fqm6;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId:
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Tank-Supply: 4f9b6ebd536be484_1744348903315_4233801821
X-MC-Loop-Signature: 1744348903315:3045225038
X-MC-Ingress-Time: 1744348903315
Received: from uk-fast-smtpout6.hostinger.io (uk-fast-smtpout6.hostinger.io
 [31.220.23.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.101.172.36 (trex/7.0.3);
	Fri, 11 Apr 2025 05:21:43 +0000
Received: from [IPV6:2001:861:4448:6b00:bbea:d018:4fdc:24e4] (unknown [IPv6:2001:861:4448:6b00:bbea:d018:4fdc:24e4])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4ZYlR82qfkzFJxJT;
	Fri, 11 Apr 2025 05:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1744348900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7WQSLHWxiG2839YngCI+C460yPq7/TxwoGIFaGZ+IDM=;
	b=Dxi03vPxWwJhCVw480Sfs2PctY4Sg6CVXygOhYB5ypG/lllrlDTDMpxx6UlS1EoL0Wx3oU
	05WKg3MLb4ZgWirDF0S3fxCFrH3j4rbyWexpe6m4+2GCOzu3Ts3BlP+lUlf6M8Bh4vX0UY
	uLBO5s+5ddvQ+aXgnHTlX5gKV/nEmRZJhlDD4xVfVLXMzWheFMncvafuS6SFSyTjA/vtsk
	/gAHOaOrP4JaeF6nYJqVFbTu/vH8JWUQd7I5Rfvs/elYqPGCD2w82yrXmF4ZoiwSDMry+z
	RCfbW/ZZ1Lz/HYv+CfQVnDCj/vy0q0X7rnPZpMue7/U2wIQfsLechy29ZEbv5A==
Message-ID: <24f08a7b-4a3c-4cd6-82b7-0f2c9ab4bbef@rootcommit.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com, linux-input@vger.kernel.org,
 linux-i2c@vger.kernel.org
Content-Language: en-US, fr
To: Anshul Dalal <anshulusr@gmail.com>
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: I2C: can't detect Adafruit Mini I2C Gamepad on Linux - other devices
 detected
Organization: Root Commit
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 11 Apr 2025 05:21:40 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=IrhMc6/g c=1 sm=1 tr=0 ts=67f8a6e4 a=8+4xeDqrJsAY8/1lIYDdcg==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NEAV23lmAAAA:8 a=cju8CbfmAAAA:8 a=d70CFdQeAAAA:8 a=9rg4GbEzaSoKOJLvICAA:9 a=QEXdDO2ut3YA:10 a=cIk2X3N1rHUA:10 a=tW1rARU34SgA:10 a=YB-nZ-73YzLyBzHtmm9I:22 a=NcxpMcIZDGm-g932nG_k:22
X-CM-Envelope: MS4xfAiUXJl8aGsPifmbOQIn5XvFkV5tLWLIPwi3/e2Teb2RSe/nWasGo7dt/iu+xIdAjgQo5FyAwxgm3g1Ofg6eWWhdkF4M4d9Qg7mGap3TBE54aW1oiK5e mFuerPTMcGJnPRbrqmjm98LVfw1gTzOr3Y4gva2+hA5TMDXn90z6lvHlJazgWPV9aGiPRFiC8li42Gpvt0IFyW/SweN1hL3je5ryr5SkSER2oB2EWdNzi1FE yFdle1zTmR7MTZWM5tT2bPOwfAHVZU/UM7QRJzh3QgP+F0HfpuS1lcjtHBCNv647pHDXD59m0UjRMFT4BNxclbxy9d6xBH3qJOtbLviMnbF6VmmOSibZ+ejT J1fQzV8zoVtYk7wGsmJxBL4/CbAGD2aT55HSYnSnVbNCAKYZPPIPFO040HnHbptBj+7gXiQ9ifn9eJ9yzItL0UqmIldgjQ==
X-AuthUser: michael.opdenacker@rootcommit.com

Hi Anshul

I contact you as the maintainer for the Adafruit Mini I2C Gamepad driver.

I'm trying to use the Adafruit Seesaw I2C gamepad in my embedded Linux 
training courses, to demonstrate driving I2C hardware, and the gamepad 
would be perfect to play an ASCII Pac-Man clone 
(https://github.com/michaelopdenacker/myman 
<https://github.com/michaelopdenacker/myman>).

Even before your driver is loaded, the device has to be detected. My 
problem is the gamepad is never detected on Linux (running "i2cdetect -r 
<num>"), while other I2C devices connected to the same bus are, proving 
that the bus is correctly enabled. This happens on all these boards 
running recent kernels:
- BeaglePlay (Linux 6.14.2!)
- BeagleBone Black
- Raspberry Pi5

I double checked my gamepads (I have 4 of them) and wires: they work 
fine on Arduino Uno.

Any clue why none of my 4 gamepads are never detected while two other 
types of I2C devices are detected on the same bus, and the same gamepads 
work on Arduino Uno?

Maybe something stupid but I'm running out of clues...

You can also have a look at the questions I asked on the Adafruit forums 
and the pictures I shared:
https://forums.adafruit.com/viewtopic.php?p=1052577#p1052577

Cheers
Michael.

-- 
Michael Opdenacker
Root Commit
Yocto Project and OpenEmbedded Training course - Learn by doing:
https://rootcommit.com/training/yocto/


