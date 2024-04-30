Return-Path: <linux-i2c+bounces-3354-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1C58B80C1
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Apr 2024 21:46:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 796A8B211C0
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Apr 2024 19:45:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF3EC199E8C;
	Tue, 30 Apr 2024 19:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=o2.pl header.i=@o2.pl header.b="YOKGnkn4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx-out.tlen.pl (mx-out.tlen.pl [193.222.135.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE70512B73
	for <linux-i2c@vger.kernel.org>; Tue, 30 Apr 2024 19:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.222.135.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714506352; cv=none; b=sFTUPTEDOm6u4CMMZFJmkvY2A07v5mCOiQUj9RhV0v28TjnI71x0SkhC+RLOCX5FRPqconvPqtcylVqw7wTTiCrE8Vx+OL5nD5gExPtn0dSNLOeMoM9OcO8Aky1GMR7DFP2ZEqgKAZdLOdomE+e//q3UZA7HmHGbZpXWm1+WY6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714506352; c=relaxed/simple;
	bh=UTLyoG75Ir6VyTi1Ljsv2adrBXLUyrrhJ3Ne35bwJ7k=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=O+fBpFCgIwdOhMryTHXMoPN1jx/4r2bzhKCXFatWG2F0nWkp/cFJay9tM+19Wb0psHHxLf+SnxkwBf4GMAz+w+oxlnoovEVtsNqh0CZnos0h80/vgylsol/rxC227U467tdUsAUTFpmW+WCKnkJfGz+f00J4o5ZdU1/SDrb3HhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=o2.pl; spf=pass smtp.mailfrom=o2.pl; dkim=pass (1024-bit key) header.d=o2.pl header.i=@o2.pl header.b=YOKGnkn4; arc=none smtp.client-ip=193.222.135.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=o2.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=o2.pl
Received: (wp-smtpd smtp.tlen.pl 46190 invoked from network); 30 Apr 2024 21:39:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=1024a;
          t=1714505945; bh=YWZwkq7EM2NyfGtccwxOcrjvn9p9sxp9rxEGKdv/V6Y=;
          h=To:Cc:From:Subject;
          b=YOKGnkn4nCzrvJeKP1hs2kFX2jeLX1vt1CY/mgzpOoOpL5g9BoCwv7gdMSAlM+y6y
           rofrUOHOdb1CY/gssySyvzHPFsG2XEHoaAzBe6WpN+6r+JEFvjdsa4yJkIzYmNKZFJ
           g9YZMuoHUeYun6OoBlojMM0MOqUYXFcDnSb1qOU8=
Received: from aaem228.neoplus.adsl.tpnet.pl (HELO [192.168.1.22]) (mat.jonczyk@o2.pl@[83.4.116.228])
          (envelope-sender <mat.jonczyk@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <jdelvare@suse.de>; 30 Apr 2024 21:39:05 +0200
Message-ID: <53582ef1-6d05-4379-a445-5f879cd676b8@o2.pl>
Date: Tue, 30 Apr 2024 21:39:03 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Jean Delvare <jdelvare@suse.de>
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 ruirui.yang@linux.dev, Wolfram Sang <wsa@kernel.org>
From: =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
Subject: [Regression] dmesg warnings after "i2c: smbus: Support up to 8 SPD
 EEPROMs"
Autocrypt: addr=mat.jonczyk@o2.pl; keydata=
 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
 TANkZ3QqXNX2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-WP-MailID: 7657a08147c299439558a99d372d7aac
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 0000000 [4WNk]                               

Hello,

I have received a regression report on
commit 13e3a512a29001c ("i2c: smbus: Support up to 8 SPD EEPROMs")
as I was subscribed to some kernel Bugzilla thread and I'm posting it here
to make you aware of it.

This thread was

Bug 213345 - i801_smbus: Timeout waiting for interrupt, driver can't access SMBus 

ruirui.yang@linux.dev on 2024-04-19 08:22:57 UTC wrote:
> I got similar issue on thinkpad X1 gen9 with latest 6.9.0-rc4+
> Git bisect the first bad commit is "13e3a512a29001c  i2c: smbus: Support up to 8 SPD EEPROMs
> "
> 
> modprobe without param:
> [ 1290.401393] i801_smbus 0000:00:1f.4: SPD Write Disable is set
> [ 1290.401486] i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
> [ 1290.403340] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
> [ 1290.403383] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
> [ 1290.403410] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
> [ 1290.403437] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
> [ 1290.403465] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
> [ 1290.403492] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
> [ 1290.403519] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
> [ 1290.403546] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
> 
> with param 
> [ 1314.568785] i801_smbus 0000:00:1f.4: Interrupt disabled by user
> [ 1314.568837] i801_smbus 0000:00:1f.4: SPD Write Disable is set
> [ 1314.568894] i801_smbus 0000:00:1f.4: SMBus using po*lling
> [ 1314.570230] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
> [ 1314.570257] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
> [ 1314.570283] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
> [ 1314.570310] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
> [ 1314.570336] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
> [ 1314.570362] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
> [ 1314.570389] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
> [ 1314.570415] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!

Link: https://bugzilla.kernel.org/show_bug.cgi?id=213345

The param mentioned was i2c-i801.disable_features=0x10, which disables interrupt usage
of this driver.

Please decide if this is serious enough to warrant a revert.

Greetings,
Mateusz


