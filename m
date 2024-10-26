Return-Path: <linux-i2c+bounces-7603-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC17D9B15FD
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Oct 2024 09:36:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 897331F21FB5
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Oct 2024 07:36:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B649717CA02;
	Sat, 26 Oct 2024 07:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="TNbvmC+L"
X-Original-To: linux-i2c@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9C6179204;
	Sat, 26 Oct 2024 07:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729928192; cv=none; b=kz4vxT6GOKfhcWsaN8htUs9RMihcAh8HLFEIrWzexPzql1heqXALzM/4D3VEJZa5fXc3hylPoL0esWmpYoxYGFfekHQA0S9Hh5E+8Nd7eQb00GhYb/eVtMjKyLEPLeunircQ6B8WPlJCl9uulHWxDfJuY5LdwRSHSG9df34eTlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729928192; c=relaxed/simple;
	bh=ghOHCd85W1SEttx5eOkwz8Ab/rdPxKNXJOKH6Mv1xoY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=cAPMY/TcLOFOxyfPYP3f+oMf7+EtiT/Y0JNz24BmGmRehhlaIwGvWwE6HLuE8H+kYp+dLqEV5rbxtWInpiIl774M0foYPhe5vTjqNivbKNs/SSaYJFe0NeCdHqueM2BwcliEVwWiziLGc9QPYnGBH5ObSeu29W+bp6dtcj39xlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=TNbvmC+L; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id E577B888D5;
	Sat, 26 Oct 2024 09:36:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1729928188;
	bh=wHka7sleUKomqJ1u6yoHtHMYA0rpYE9SlaAW8un5fLU=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=TNbvmC+LFdNOpnASZaIl8Dqkr50ECm2rBgzQXxUXZr0OgA+0dU5VgsAF0SHmgfOg8
	 4+T4K6EvQZBTmlBbjEUL4UHBIn/1bBoVuF/RaePn4iQQNESg04Xa2Yxwv53Cnf7A4b
	 RmBPl5bollFrUo99J97RbM2OTDQzC8Lt3Yq3PGMPCtdkP9hsqulaP46JxqAgfiVniA
	 harGbV4KEneij4ZkxG41Ql0/RlE9TStEGqsJKioyfNlfMEqI9YJ7S/svFphjgIu5Ld
	 vdeOZg0xJ2O89Kze2A3q4X7YgB5G9RvrwfK/uw+nnIS8ducKhLA39Y9mRrndOm7Bgi
	 5lYcjgvZWutUA==
Message-ID: <f924e2c1-2466-4e93-9a3d-b4c380bb29b1@denx.de>
Date: Sat, 26 Oct 2024 09:36:27 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] nvmem: core: Check read_only flag for force_ro in
 bin_attr_nvmem_write()
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-i2c@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
 Thorsten Leemhuis <regressions@leemhuis.info>
References: <20240713154001.107439-1-marex@denx.de>
 <c181a856-164b-41cf-b512-b8dba3247ae3@denx.de>
 <d2b8f767-c5c9-409d-a6fa-1c101b90c9fc@denx.de>
 <d8b903ff-4a66-4d9d-8bad-099ff9d83a54@linaro.org>
Content-Language: en-US
In-Reply-To: <d8b903ff-4a66-4d9d-8bad-099ff9d83a54@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 10/26/24 9:21 AM, Srinivas Kandagatla wrote:
> Apologies, some how I missed this email.

No worries, the commit was still in my upstreaming queue, so I figured 
it was time to remind upstream about it.

> On 26/10/2024 00:15, Marek Vasut wrote:
>> On 9/25/24 12:42 AM, Marek Vasut wrote:
>>> On 7/13/24 5:39 PM, Marek Vasut wrote:
>>>> The bin_attr_nvmem_write() must check the read_only flag and block
>>>> writes on read-only devices, now that a nvmem device can be switched
>>>> between read-write and read-only mode at runtime using the force_ro
>>>> attribute. Add the missing check.
>>>>
>>>> Fixes: 9d7eb234ac7a ("nvmem: core: Implement force_ro sysfs attribute")
>>>> Signed-off-by: Marek Vasut <marex@denx.de>
> 
> Applied with CC stable.

Thank you !

