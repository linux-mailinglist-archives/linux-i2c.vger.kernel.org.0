Return-Path: <linux-i2c+bounces-11259-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6C0ACF87A
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Jun 2025 21:59:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4422816E4F8
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Jun 2025 19:59:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8077A27D77B;
	Thu,  5 Jun 2025 19:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o0KIL32C"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361572749D9;
	Thu,  5 Jun 2025 19:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749153538; cv=none; b=f05cyCinLdBM49xLyLlcyvp2kA3pBdZYDuE0Ue4pA5qfLEDU1oLTTKGXOzQUGDEobyThp2SnB+DKEzj4ZRWcx2f35fIkFmiKcNvMq6QeVAb1IbFl4lYhBy+6cff9MJ8q6wWIanG9SMRHyVZWjARA73sblFuGIVM6p38tNsBRI3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749153538; c=relaxed/simple;
	bh=iPRe+RK96LZ5d6gxUJftAi/t9mj4gB0KkT4eYaf34vQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IJrIvoI0I2z2MVTjCJfxU2zSz23p1Cu1mDMYS9zBhLZoEmhWoyIS4KOuWvbtN8GYKCFYMCtB0+0AMQiVErgHw7QlsJW7EFPRkG77E0oJR9wtlLdbh6gc1TWW1ndeypRvB2cOi7STaQMsQdCPyN/JfPmtDe0jbr8nPTFR7CyadkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o0KIL32C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9049EC4CEE7;
	Thu,  5 Jun 2025 19:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749153538;
	bh=iPRe+RK96LZ5d6gxUJftAi/t9mj4gB0KkT4eYaf34vQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=o0KIL32CBGN8EHubHuRyqOivRdpEPs2Vty7EHNpNNCGIvPp9qE2aat9S7YF7w+z3l
	 Rr4Psr8WOy3iaa7XpTESSNCLfXrIDDTPNLn6xK8I6JCYVn5dbQCy6lHtaJGQyRh+64
	 e6xxP+9+TJXnGt3G957/CcvudD/EXFRQps0pWFabFb9ZqY3kUd6VPNO8CxXFwKMBLw
	 c1jVVgNTfeuX0U1fW5qinKc02waNP2CnuFbBAXqLkN3usLFudVP0pFgQhuQ5ubLtFL
	 4ijh0Hbs0h/PBJwWYEgMwq8rzpuYI3ebtFRiImIvn6H50Bi+cJjBlai3hZCra4qiQF
	 HEP/T/45KDGfA==
Message-ID: <53fec2fa-b37d-4b87-a8bc-5a056ef16c2f@kernel.org>
Date: Thu, 5 Jun 2025 21:58:52 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
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
 <b3cbeae1-b0c5-43c3-80ec-3b6654582565@kernel.org>
 <6064d018.2b279.19740a7eb1c.Coremail.chenglingfei22s@ict.ac.cn>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <6064d018.2b279.19740a7eb1c.Coremail.chenglingfei22s@ict.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 05.06.25 17:13, chenglingfei wrote:
> 
> 
> 
> &gt; -----原始邮件-----
> &gt; 发件人: "Sven Peter" <sven@kernel.org>
> &gt; 发送时间: 2025-06-05 22:02:35 (星期四)
> &gt; 收件人: chenglingfei <chenglingfei22s@ict.ac.cn>
> &gt; 抄送: j@jannau.net, alyssa@rosenzweig.io, neal@gompa.dev, zhangzhenwei22b@ict.ac.cn, wangzhe12@ict.ac.cn, maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org, andi.shyti@kernel.org, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
> &gt; 主题: Re: [BUG] rmmod i2c-pasemi-platform causing kernel crash on Apple M1.
> &gt;
> &gt; Hi,
> &gt;
> &gt; On 05.06.25 13:55, chenglingfei wrote:
> &gt; &gt;
> &gt; &gt;
> &gt; &gt;
> &gt; &gt; &gt; -----原始邮件-----
> &gt; &gt; &gt; 发件人: "Sven Peter" <sven@kernel.org>
> &gt; &gt; &gt; 发送时间: 2025-06-05 18:25:09 (星期四)
> &gt; &gt; &gt; 收件人: 程凌飞 <chenglingfei22s@ict.ac.cn>, j@jannau.net, alyssa@rosenzweig.io, neal@gompa.dev
> &gt; &gt; &gt; 抄送: zhangzhenwei22b@ict.ac.cn, wangzhe12@ict.ac.cn, maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org, andi.shyti@kernel.org, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
> &gt; &gt; &gt; 主题: Re: [BUG] rmmod i2c-pasemi-platform causing kernel crash on Apple M1.
> &gt; &gt; &gt;
> &gt; &gt; &gt; Hi,
> &gt; &gt; &gt;
> &gt; &gt; &gt; On 05.06.25 05:02, 程凌飞 wrote:
> &gt; &gt; &gt; &gt; Hi, all!
> &gt; &gt; &gt; &gt;
> &gt; &gt; &gt; &gt; We’ve encountered a kernel crash when running rmmod i2c-pasemi-platform on a Mac Mini M1 (T8103) running Asahi Arch Linux.
> &gt; &gt; &gt; &gt;
> &gt; &gt; &gt; &gt; The bug was first found on the Linux v6.6, which is built manually with the Asahi given config to run our services.
> &gt; &gt; &gt; &gt; At that time, the i2c-pasemi-platform was i2c-apple.
> &gt; &gt; &gt; &gt;
> &gt; &gt; &gt; &gt; We noticed in the Linux v6.7, the pasemi is splitted into two separate modules, one of which is i2c-pasemi-platform.
> &gt; &gt; &gt; &gt; Therefore, we built Linux v6.14.6 and tried to rmmod i2c-pasemi-platform again, the crash still exists. Moreover, we fetched
> &gt; &gt; &gt; &gt; the latest i2c-pasemi-platform on linux-next(911483b25612c8bc32a706ba940738cc43299496) and asahi, built them and
> &gt; &gt; &gt; &gt; tested again with Linux v6.14.6, but the crash remains.
> &gt; &gt; &gt; &gt;
> &gt; &gt; &gt; &gt; Because kexec is not supported and will never be fully supported on Apple Silicon platforms due to hardware and firmware
> &gt; &gt; &gt; &gt; design constraints, we can not record the panic logs through kdump.
> &gt; &gt; &gt;
> &gt; &gt; &gt; Do you have UART connected to a device under test which you could use to
> &gt; &gt; &gt; grab the panic log from the kernel? Alternatively you can also run the
> &gt; &gt; &gt; kernel under m1n1's hypervisor and grab the log that way. It'll emulate
> &gt; &gt; &gt; the serial port and redirect its output via USB.
> &gt; &gt; &gt;
> &gt; &gt;
> &gt; &gt; I don't have UART, but I have tried to run the kernel under m1n1's hypervisor. However, it does not trigger the release of cs42l83.
> &gt; &gt; Given that m1n1 provides full peripheral device emulation capability, the most plausible explanation would be an incorrect
> &gt; &gt; firmware loading sequence. But the documentation of Asahi provides little details about how to generate an initramfs with
> &gt; &gt; firmware (I think), can you give more guidance about it?
> &gt;
> &gt; I'm not sure why you are even trying to create a special initramfs. Just
> &gt; load your usual kernel using the usual boot flow as a guest. There's
> &gt; also no firmware involved in i2c and I'm not sure what you mean with
> &gt; "full peripheral device emulation" either or how that's related to firmware.
> &gt; You also mention that the crash happens when you run rmmod so I again
> &gt; don't understand what "it does not trigger the release of cs42l83" means
> &gt; here.
> &gt;
> 
> Well, simply running rmmod i2c-pasemi-platform doesn't directly cause a crash.
> The crash occurs when the module removal triggers device_remove for cs42l83,
> which ultimately calls pasemi_smb_waitready in i2c-pasemi-platform. You may refer
> to the brief analysis provided in my first email for more details.
> 
> When booting the kernel without m1n1, cs42l83 is automatically probed after
> i2c-pasemi-platform loads and subsequently removed when executing rmmod
> i2c-pasemi-platform, resulting in a kernel crash. However, when booting under m1n1,
> cs42l83 isn't probed or removed -- the device appears to be non-existent. This
> observation led me to mention "full peripheral device emulation."

I'm still not sure what "full peripheral device emulation" means in that 
context. If cs42l83 isn't probed that's most likely an issue with your 
kernel or your device tree or your boot device. Hence my suggestion to 
just the regular kernel and boot device.


Unrelated, there's something wrong with your email setup, see e.g. 
https://lore.kernel.org/asahi/6064d018.2b279.19740a7eb1c.Coremail.chenglingfei22s@ict.ac.cn/ 
how your mail arrive.

Sven



