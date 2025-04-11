Return-Path: <linux-i2c+bounces-10274-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B77F1A86516
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Apr 2025 19:53:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3FE2177F88
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Apr 2025 17:53:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AFFE258CDB;
	Fri, 11 Apr 2025 17:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b="AKiza7mn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from siberian.tulip.relay.mailchannels.net (siberian.tulip.relay.mailchannels.net [23.83.218.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19F9221F1E;
	Fri, 11 Apr 2025 17:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.218.246
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744394007; cv=pass; b=GggVLfOmClxpB7YtGCbBk+XXdO2G8tUrUsOoTS6xkNYr9M6ms1yG5peWzhysQBe2qDnn5ASJsIHwU3MFB9/IOzkR2785hL10+R574G5k1yvL8PiM/0olb1R80afWg1aX5/EsZs32sVfItvurTBoxjTIpSetBfE5zYPC4VEfXtHA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744394007; c=relaxed/simple;
	bh=3Te018ymARb9OJQisgpYqkrhlyjic0WNTUR6A/isCzw=;
	h=Message-ID:MIME-Version:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:Date; b=RZ+AUU6k/21zC+MPgS3iPSfaYhRxb5FJNHQd2Oc1xXSKsGuedW8uykQ+we5CM8rkWfBKSTH+8uiSQ12R2U+yK2CJRIjN4bz0tTN6zG04mIgiy/wGl3g1WKuNrJC2LHZn2Rgl6WCM4WjbFchH7k4GBFPLiFN3Cq7V1+86mfNYWnQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rootcommit.com; spf=pass smtp.mailfrom=rootcommit.com; dkim=pass (2048-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b=AKiza7mn; arc=pass smtp.client-ip=23.83.218.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rootcommit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id D7FAA161981;
	Fri, 11 Apr 2025 17:34:46 +0000 (UTC)
Received: from uk-fast-smtpout1.hostinger.io (trex-4.trex.outbound.svc.cluster.local [100.109.60.75])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id C6BBC161F63;
	Fri, 11 Apr 2025 17:34:45 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1744392886; a=rsa-sha256;
	cv=none;
	b=ic7DZQkmo/WLPh3UWwKS3mUT85qqnsQJjRz4yjy287VZLvBDWoJgdYJUP6FYsHK++T2ER1
	CoeMPa1eV8oNZpce4tmVBgpQ72+CAHnDwQ4giIc1Y+ycIrjzmrW4zScAjvCalpQ6LvnGgZ
	eQine+N1+Zi7ho9POaW4j5IwdUsEKUz86LbBqH8nw0LMDYlf/RBPPJe/luTyy0FYULxi0q
	W1XEkEm6KmOyoN2pxsZe0QlI3onXOIida8c0ag68sG0lIu+5qhgsGv8afFhGC112E0qmUi
	R0NUWpnC31aJ7QygMuiEXqCxp72qJawLT9e9LzcexJ9aC16pr/qgBvZ/siBf4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1744392886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=IR70u5pSjiQTvH4Qpr768a2B+lg0Y2Ahl8LNQlhHtBI=;
	b=xmS14znzGwIZ0EnSn+dJMBBvC/d49+Gcn4e1Bii6v0LTvpBK0646y0MoDwJPmG5BXlVBsD
	sJUcxvZFMBZNbWJgcTUjU+xOEjlwqYWdPMv+0dtnEscAzT/5bjxeOVxY66IzXdnPwBRcas
	vGDy+L8Rf+6/jDbuZ5aFzn6Z8/GTVr/LlmRIWWoVSvdnN78QAZuvnNYAmfTMyDcRXr8STH
	lvFX7uvpRi9qJ7DTg4JWMGqoMSyqun1tnrr1PeJYih8yys1aHJxk1HQyvVfUmo7XM2CWDv
	2SCNiRZDv+DAIvhS1Sr2jhyIhAzTwvvvPbSaWPNn84a3A6kCTZt3m+RAYhPiNw==
ARC-Authentication-Results: i=1;
	rspamd-648cbcd874-npbt8;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId:
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Wide-Eyed-Rock: 292cd8f62c5ee466_1744392886733_2015690649
X-MC-Loop-Signature: 1744392886733:3072200107
X-MC-Ingress-Time: 1744392886733
Received: from uk-fast-smtpout1.hostinger.io (uk-fast-smtpout1.hostinger.io
 [31.220.23.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.109.60.75 (trex/7.0.3);
	Fri, 11 Apr 2025 17:34:46 +0000
Received: from [IPV6:2001:861:4448:6b00:3b54:3b90:1804:f6d6] (unknown [IPv6:2001:861:4448:6b00:3b54:3b90:1804:f6d6])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4ZZ3hz4f8mzd5LL;
	Fri, 11 Apr 2025 17:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1744392884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IR70u5pSjiQTvH4Qpr768a2B+lg0Y2Ahl8LNQlhHtBI=;
	b=AKiza7mnSj2hiXpS2p/xMfhUYKYDJLc3Nx6vY3QDMuUNkmkNmRBPShrnJLBOlm4lsIHY1s
	9v/oMTH9yW0352ooF0u/3eVKHfWTN2ya6zPxzXYvZnh5eaEkJRcbzYb77KE7X+i1LJX86v
	luoZuMlBFclGqtsaltK2/rSRx1lcKIHxdVLcyltcFEdr0JLPHgVi95RNlsmtSFDsFxdWWt
	2q7Na65QYmtLDtaDGRdkGCevWNUm3/PwzzJR5VkYtV/BObD8krnEygpzhanV3kr5wRz6SX
	BDK5Ou2W2Ya1IfcnfTSdEVXTCkgGrCJcITCx2a2kWhLUTMHcBquT4pyklyfvLA==
Message-ID: <57906b7b-5d4a-4571-a5b2-1ed51ff09824@rootcommit.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com
Subject: Re: I2C: can't detect Adafruit Mini I2C Gamepad on Linux - other
 devices detected
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Anshul Dalal <anshulusr@gmail.com>, linux-input@vger.kernel.org,
 linux-i2c@vger.kernel.org
References: <24f08a7b-4a3c-4cd6-82b7-0f2c9ab4bbef@rootcommit.com>
 <8d0c8005-57fa-4883-8a01-343ab9170643@rootcommit.com>
 <Z_k74yFvIHRy7UpP@shikoro>
Content-Language: en-US, fr
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <Z_k74yFvIHRy7UpP@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Date: Fri, 11 Apr 2025 17:34:43 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=IrhMc6/g c=1 sm=1 tr=0 ts=67f952b3 a=nZsC+j4qa04Bprp8VP9BxA==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=d70CFdQeAAAA:8 a=te1mGRHHQNFW8GT_5BgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NcxpMcIZDGm-g932nG_k:22
X-CM-Envelope: MS4xfK8QRshPhXI6ChB9L0z78hKAn2Wz3uOsrgk9JubfMVLQQmzIPUl0uMyNEVY7Sne10a4Te+ipnWshS0oyIwsKDZApQ21dTwRd1WDYWTT7CICzGYT1wN+b 9LrICMgFaFUuCDocEUhJDmq3Noi1xW2pP0L25Gnj9PVprltf4AOVHhUdqVhFy3Y+4B0IZdzSuaFgZ8a5/zQ0lRym6HbAKKV98UXCnx+YW2KWi7VgS1FHsVmr sPYemSx+7S92Rn1UTAqEmMUo9ib3NrpYhqk844wk0bOKQgd53CFPGV3Xyj0WkEGECtGlH3IS3CiqTSzjhaBrIk7TeqmWjKaWREw0RygIlpuYrS4HwpHyJEOB 07uJjHB8Fo2AUJU7HBCw4Ap732d6aZKpIv/2S/l9zvJFVCVsqv5w43g5MgZAHdzMo8SRmyL4zTuKmcUM+IIEQ/9JaDGc4PO6KVnf5dZSKWSDBl2Ki0Rytrjt 5RVFnpYf/v8PgI+c
X-AuthUser: michael.opdenacker@rootcommit.com

Hi Wolfram

Thanks for your help!

On 4/11/25 17:57, Wolfram Sang wrote:
>> Plus "i2cdetect -r <num>" shows the device as UU for address 0x50, as
>> usually happens with a driver is loaded.
> Always. The address is blocked for userspace in any case.
>
>> I thought that connected I2C devices always showed in i2cdetect output,
>> whether they are declared in the device tree and have a driver or not.
> This is a valid expectation. Since you used 'i2cdetect -r', it means
> that the device does not react to the read_byte method. Very strange (if
> not even against the specs). Did you try without '-r' to use
> SMBUS_QUICK? What driver are we talking about anyhow?


Without the driver loaded, I get this...

~ # i2cdetect 5
i2cdetect: warning: can't use SMBus quick write command, will skip some 
addresses
i2cdetect: WARNING! This program can confuse your I2C bus
Continue? [y/N] y
      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:
10:
20:
30: -- -- -- -- -- -- -- --
40:
50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
60:
70:
~ #
~ # i2cdetect -r 5
i2cdetect: WARNING! This program can confuse your I2C bus
Continue? [y/N] y
      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:          -- -- -- -- -- -- -- -- -- -- -- -- --
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
70: -- -- -- -- -- -- -- --

When the driver is loaded, there's UU as expected for address 0x50.

The driver is drivers/input/joystick/adafruit-seesaw.c
Cheers
Michael.

-- 
Michael Opdenacker
Root Commit
Yocto Project and OpenEmbedded Training course - Learn by doing:
https://rootcommit.com/training/yocto/


