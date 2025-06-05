Return-Path: <linux-i2c+bounces-11254-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D7DACED80
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Jun 2025 12:25:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9D5616FF4F
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Jun 2025 10:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4215A2147E5;
	Thu,  5 Jun 2025 10:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f4PPodmG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA63E20B7FC;
	Thu,  5 Jun 2025 10:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749119115; cv=none; b=N1fpYdbDRomai4tGzlCgStnmce1uxQPuIghxRYxnpkLe1GUZEE/adBGNQLMYdJy+Sm/7egzm4mwz3MDOKqmsP2Dv+CgX6hSeDTc/hohotSo2T3Fe43BQ32G8FgGIVoi1wTmSW6+1W475tfkdTNmiQXJcd417G3s1HQfONYWcclo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749119115; c=relaxed/simple;
	bh=YdJvMMxNeJZ4ws+mkLoEmNugy4D3YfkKWs3ds4JIL/4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=CxN8gLmnvS0NaItUgHx7bKdKFB6i/EU82FFRpbkomdIN83kgGSPT1VcNt0ItxBkrkzE7IH48a+zHgDTkrFQoVd2Ty3uhmB2dvyGm0dumPZBJ51c1i0bHGzy7bECUdnZQhgy5UHdRMZIDNagW6GlvWkothBJmgSoVLZOw7Dn14Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f4PPodmG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFA39C4CEE7;
	Thu,  5 Jun 2025 10:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749119114;
	bh=YdJvMMxNeJZ4ws+mkLoEmNugy4D3YfkKWs3ds4JIL/4=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=f4PPodmGDavBEPsrZH6CTP09Oz6VdO24835qnpwrQF7qR5Ng57NXXpxvd9Fe6yCJ9
	 ZWQs9LT6MR03KUhBwDM+qyCAhlW/qA9J50X9SLcQs4lViFsNGn8mbG7/ExG/rpwBvF
	 HetZqNnqNbBtJYhDcKMwRW5OX0z+RL+shCvGmS6oFnEJpeivlSVd5GGzTMRj/wbffB
	 CNU3TYc10Nm6vaNPxFg7B03NQ9Jx816OJyV79UqJ14fSJ1ef36k/DxAvFNmruTRIuV
	 f696TTLTlqadTX1aCP2YtcxX3zueLEj39X9pXWt/9ttLekYbtlJqC2HjFb8K4Y7JTj
	 98dbQqEkzkQ4w==
Message-ID: <dafd58ae-0a08-4fe6-b94d-c8c6c8c1fa97@kernel.org>
Date: Thu, 5 Jun 2025 12:25:09 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Sven Peter <sven@kernel.org>
Subject: Re: [BUG] rmmod i2c-pasemi-platform causing kernel crash on Apple M1.
To: =?UTF-8?B?56iL5YeM6aOe?= <chenglingfei22s@ict.ac.cn>, j@jannau.net,
 alyssa@rosenzweig.io, neal@gompa.dev
Cc: zhangzhenwei22b@ict.ac.cn, wangzhe12@ict.ac.cn, maddy@linux.ibm.com,
 mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 naveen@kernel.org, andi.shyti@kernel.org, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <5c598fea.3165d.1973e0a9a3a.Coremail.chenglingfei22s@ict.ac.cn>
Content-Language: en-US
In-Reply-To: <5c598fea.3165d.1973e0a9a3a.Coremail.chenglingfei22s@ict.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 05.06.25 05:02, 程凌飞 wrote:
> Hi, all!
> 
> We’ve encountered a kernel crash when running rmmod i2c-pasemi-platform on a Mac Mini M1 (T8103) running Asahi Arch Linux.
> 
> The bug was first found on the Linux v6.6, which is built manually with the Asahi given config to run our services.
> At that time, the i2c-pasemi-platform was i2c-apple.
> 
> We noticed in the Linux v6.7, the pasemi is splitted into two separate modules, one of which is i2c-pasemi-platform.
> Therefore, we built Linux v6.14.6 and tried to rmmod i2c-pasemi-platform again, the crash still exists. Moreover, we fetched
> the latest i2c-pasemi-platform on linux-next(911483b25612c8bc32a706ba940738cc43299496) and asahi, built them and
> tested again with Linux v6.14.6, but the crash remains.
> 
> Because kexec is not supported and will never be fully supported on Apple Silicon platforms due to hardware and firmware
> design constraints, we can not record the panic logs through kdump.

Do you have UART connected to a device under test which you could use to 
grab the panic log from the kernel? Alternatively you can also run the 
kernel under m1n1's hypervisor and grab the log that way. It'll emulate 
the serial port and redirect its output via USB.

> 
> Thus we tried to find the root cause of the issue manually. When we perform rmmod, the kernel performs device releasing on
> the i2c bus, then calls the remove function in snd-soc-cs42l83-i2c, which calls the cs42l42_common_remove in cs42l42,
> because cs42l42-&gt;init_done is true, it performs regmap_write, and finally calls into pasemi_smb_waitready in i2c-pasemi
> -core.c. We noticed that smbus-&gt;use_irq is true, and after it calls into wait_for_completion_timeout, the system crashs!>
> We found that wait_for_completion_timeout is one of the core scheduler APIs used by tens of thousands of other drivers,
> it is unlikely causing the crash. So we tried to remove the call to wait_for_completion_timeout, then the system seems to
> run well.
> 
> However, because we have little knowledge about i2c devices and specifications, we are not sure whether this change will
> cause other potential harms for the system and device. Is this call to wait necesary here? Or can you give a more
> sophisticated fix?

Yes, that call is necessary. It waits for the "transfer completed" 
interrupt from the hardware. Without it the driver will try to read data 
before it's available and you'll see corruption. I'm surprised hardware 
attached to i2c (usb pd controller and audio I think) works at all with 
that change.


Sven


