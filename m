Return-Path: <linux-i2c+bounces-11257-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98348ACF177
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Jun 2025 16:03:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58DCD166606
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Jun 2025 14:02:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 966982749E1;
	Thu,  5 Jun 2025 14:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gu1SckNE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8581DB34B;
	Thu,  5 Jun 2025 14:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749132161; cv=none; b=AaAx4fv22YZ+6ssubVT/3fLCUO9ioTHOaWX/S5EjK7ctATwkl9NqRArK3YLTRz3ipkn+MpRFIzpe/plbYGGqp+uxfPXrLO2L2ssFVs8JOvmApGJSHrSLHPpel0guVPo/DA7KHC/8DEKn7v6gf+W6PjwudnBaoootUoyizIhNIu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749132161; c=relaxed/simple;
	bh=iat9T/bPiMblSlK8d+zjpseMEDTU2L2gOx5NeoRkbMg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=CsLJrdn0FrVCA8lPIUTCfSrqEExspHNUJ3YREt4lfRRvQ/6abpU7FFwmf0K4cREYpV8zfOaA2EDcxEE0C1gEWIBGjySZmbjWr4sdSZT3Vx/a9RPGv/69Ly1Dhcqv1KTP9eAhEfaKLpge2CrGzAwJn1VceJ/PMmeiQdBPv8tEU4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gu1SckNE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C7D4C4CEE7;
	Thu,  5 Jun 2025 14:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749132160;
	bh=iat9T/bPiMblSlK8d+zjpseMEDTU2L2gOx5NeoRkbMg=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=gu1SckNE3ydDy4+TPJ5hb90KWEtEJL7UQ4YxDNMsCyoErspywvpPZflGF86/Lds8N
	 2CepgkWnmX/C16+jg8uf0zefUHcv5auHG6x2dW5P6PhyMoiB+q5pH51bhoHvYgkb9v
	 tGsLt46b1Jqd/jhpUJI3Jl7q9DCtRCN9yDpqIAviHRmN0ab4xzWs1PixjB96Z5INAT
	 ZsejwGMdmWfHwMfA8LlF1ebjHAbcdqooW1LTqAD6Jxf9E0b70Sk2n5IGeagqT2HfNB
	 WSWBlRXkdzNSbUWRdhhQ8zCHndoIk8LmySF1ueBCBm2mr8YscM9fWJqP8/Rc8vAOAA
	 KK15FRZIK7PYQ==
Message-ID: <b3cbeae1-b0c5-43c3-80ec-3b6654582565@kernel.org>
Date: Thu, 5 Jun 2025 16:02:35 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Sven Peter <sven@kernel.org>
Subject: Re: [BUG] rmmod i2c-pasemi-platform causing kernel crash on Apple M1.
To: chenglingfei <chenglingfei22s@ict.ac.cn>
Cc: j@jannau.net, alyssa@rosenzweig.io, neal@gompa.dev,
 zhangzhenwei22b@ict.ac.cn, wangzhe12@ict.ac.cn, maddy@linux.ibm.com,
 mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 naveen@kernel.org, andi.shyti@kernel.org, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <5c598fea.3165d.1973e0a9a3a.Coremail.chenglingfei22s@ict.ac.cn>
 <dafd58ae-0a08-4fe6-b94d-c8c6c8c1fa97@kernel.org>
 <4cfe2276.2c0da.1973ff1cc40.Coremail.chenglingfei22s@ict.ac.cn>
Content-Language: en-US
In-Reply-To: <4cfe2276.2c0da.1973ff1cc40.Coremail.chenglingfei22s@ict.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 05.06.25 13:55, chenglingfei wrote:
> 
> 
> 
> &gt; -----原始邮件-----
> &gt; 发件人: "Sven Peter" <sven@kernel.org>
> &gt; 发送时间: 2025-06-05 18:25:09 (星期四)
> &gt; 收件人: 程凌飞 <chenglingfei22s@ict.ac.cn>, j@jannau.net, alyssa@rosenzweig.io, neal@gompa.dev
> &gt; 抄送: zhangzhenwei22b@ict.ac.cn, wangzhe12@ict.ac.cn, maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org, andi.shyti@kernel.org, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
> &gt; 主题: Re: [BUG] rmmod i2c-pasemi-platform causing kernel crash on Apple M1.
> &gt;
> &gt; Hi,
> &gt;
> &gt; On 05.06.25 05:02, 程凌飞 wrote:
> &gt; &gt; Hi, all!
> &gt; &gt;
> &gt; &gt; We’ve encountered a kernel crash when running rmmod i2c-pasemi-platform on a Mac Mini M1 (T8103) running Asahi Arch Linux.
> &gt; &gt;
> &gt; &gt; The bug was first found on the Linux v6.6, which is built manually with the Asahi given config to run our services.
> &gt; &gt; At that time, the i2c-pasemi-platform was i2c-apple.
> &gt; &gt;
> &gt; &gt; We noticed in the Linux v6.7, the pasemi is splitted into two separate modules, one of which is i2c-pasemi-platform.
> &gt; &gt; Therefore, we built Linux v6.14.6 and tried to rmmod i2c-pasemi-platform again, the crash still exists. Moreover, we fetched
> &gt; &gt; the latest i2c-pasemi-platform on linux-next(911483b25612c8bc32a706ba940738cc43299496) and asahi, built them and
> &gt; &gt; tested again with Linux v6.14.6, but the crash remains.
> &gt; &gt;
> &gt; &gt; Because kexec is not supported and will never be fully supported on Apple Silicon platforms due to hardware and firmware
> &gt; &gt; design constraints, we can not record the panic logs through kdump.
> &gt;
> &gt; Do you have UART connected to a device under test which you could use to
> &gt; grab the panic log from the kernel? Alternatively you can also run the
> &gt; kernel under m1n1's hypervisor and grab the log that way. It'll emulate
> &gt; the serial port and redirect its output via USB.
> &gt;
> 
> I don't have UART, but I have tried to run the kernel under m1n1's hypervisor. However, it does not trigger the release of cs42l83.
> Given that m1n1 provides full peripheral device emulation capability, the most plausible explanation would be an incorrect
> firmware loading sequence. But the documentation of Asahi provides little details about how to generate an initramfs with
> firmware (I think), can you give more guidance about it?

I'm not sure why you are even trying to create a special initramfs. Just
load your usual kernel using the usual boot flow as a guest. There's 
also no firmware involved in i2c and I'm not sure what you mean with 
"full peripheral device emulation" either or how that's related to firmware.
You also mention that the crash happens when you run rmmod so I again 
don't understand what "it does not trigger the release of cs42l83" means 
here.

> 
> &gt; &gt;
> &gt; &gt; Thus we tried to find the root cause of the issue manually. When we perform rmmod, the kernel performs device releasing on
> &gt; &gt; the i2c bus, then calls the remove function in snd-soc-cs42l83-i2c, which calls the cs42l42_common_remove in cs42l42,
> &gt; &gt; because cs42l42-&gt;init_done is true, it performs regmap_write, and finally calls into pasemi_smb_waitready in i2c-pasemi
> &gt; &gt; -core.c. We noticed that smbus-&gt;use_irq is true, and after it calls into wait_for_completion_timeout, the system crashs!&gt;
> &gt; &gt; We found that wait_for_completion_timeout is one of the core scheduler APIs used by tens of thousands of other drivers,
> &gt; &gt; it is unlikely causing the crash. So we tried to remove the call to wait_for_completion_timeout, then the system seems to
> &gt; &gt; run well.
> &gt; &gt;
> &gt; &gt; However, because we have little knowledge about i2c devices and specifications, we are not sure whether this change will
> &gt; &gt; cause other potential harms for the system and device. Is this call to wait necesary here? Or can you give a more
> &gt; &gt; sophisticated fix?
> &gt;
> &gt; Yes, that call is necessary. It waits for the "transfer completed"
> &gt; interrupt from the hardware. Without it the driver will try to read data
> &gt; before it's available and you'll see corruption. I'm surprised hardware
> &gt; attached to i2c (usb pd controller and audio I think) works at all with
> &gt; that change.
> &gt;
> &gt;
> &gt; Sven
> 
> Are there any methods or tools to systematically verify its functionality? I am not sure whether the devices attached to i2c
> should work well even after the i2c-pasemi-platform has been removed.

I don't understand. You say you saw a crash inside pasemi_smb_waitready 
when calling wait_for_completion_timeout and decided to remove that 
method. When you remove the call you break the entire driver because it 
will now try to read data long before the i2c transaction has been 
completed.
Obviously, no i2c device will work when the driver isn't loaded but 
without waiting for the completion they also won't work when the driver 
is loaded.


Sven


