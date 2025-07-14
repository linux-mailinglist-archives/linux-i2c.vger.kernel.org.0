Return-Path: <linux-i2c+bounces-11934-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FEBB03DD7
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Jul 2025 13:56:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BA7717CB6E
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Jul 2025 11:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FCC224728E;
	Mon, 14 Jul 2025 11:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=norik.com header.i=@norik.com header.b="ZRjhVP93"
X-Original-To: linux-i2c@vger.kernel.org
Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038DA24728A;
	Mon, 14 Jul 2025 11:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752494161; cv=none; b=NqYLFMcJ2vHP/kdZO7KO1wOt370uLScFK1Go9T+yK1mX1PrAclAaYUczKgbWTIchtkO7JgrYIR4kZWGveeOUvQNjDqkDE7jXqSAETqvZsTNzs9zR1bL/8ujS0isfyL3hrZ3nj1wzIpBt45v/U1v1lX4WJbOTT+/MWbzejP0Ke04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752494161; c=relaxed/simple;
	bh=Cm6YzKm//JNXfOzgNh0nJtI+oglXVJjSAUrrNto/YP8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XhyND8eZ1WBI+V1hgWMJwzDTdDuRK9hyZzaL74BPShPdCySvmGVGef/csrkARgrdFSwS1pq3o1EXFxHmccFuvwXA8j52ieMxpsxdF8Qen/6iOhLrmLVrrE9Esz0QLzDQx3lzTeWfUeWwjZ+jmn6RpSG4ImcXadrEzMBT2rLmSxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=ZRjhVP93; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=uEaMeaKe2woigzgc+/lPc6No3aXg9fhiN7bOQHOaDMI=; b=ZRjhVP93T+UwvSXx6irfyT3WJa
	UmczJCdh551T5xTcztt3rg8rTH9hd2iVJYlRj4Y+twXyC2xr+/YlVfcZkxhP1QuQc4f5CYSlZ7Jp7
	oFW1K8BwP4wE8ylM4mavlMLoeFrAcRvmT8egMnZLYpQhbKQc/bSNu+FmkqDQAJhGauCtHjU44SaLq
	H4lhnF3Ic7ALdJxXzNxZhrZ6SZvdtToR6D0C2jeeU84loAZf9QMJHuH/GwJPy6zyN1e1VgMoaepez
	+Dof4/hoSRqFNDTOs5VXsd+b2jsLF/XpwAkdH1k8fNFxRd2blC9OpxDMtFW3TwtmtE5AKxkIgkB/M
	NoOoq5mA==;
Received: from [89.212.21.243] (port=37122 helo=[192.168.69.116])
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1ubHmn-001QUg-0K;
	Mon, 14 Jul 2025 13:55:57 +0200
Message-ID: <ca5c6c3d-3053-415f-8b16-05cbdf530797@norik.com>
Date: Mon, 14 Jul 2025 13:55:54 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] i2c: lpi2c: implement master_xfer_atomic callback
To: Francesco Dolcini <francesco@dolcini.it>,
 Dong Aisheng <aisheng.dong@nxp.com>, Andi Shyti <andi.shyti@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
 linux-i2c@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250523082931.23170-1-francesco@dolcini.it>
 <20250626075837.GA9216@francesco-nb>
Content-Language: en-US
From: Primoz Fiser <primoz.fiser@norik.com>
Autocrypt: addr=primoz.fiser@norik.com; keydata=
 xjMEZrROOxYJKwYBBAHaRw8BAQdAADVOb5tiLVTUAC9nu/FUl4gj/+4fDLqbc3mk0Vz8riTN
 JVByaW1veiBGaXNlciA8cHJpbW96LmZpc2VyQG5vcmlrLmNvbT7CiQQTFggAMRYhBK2YFSAH
 ExsBZLCwJGoLbQEHbnBPBQJmtE47AhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQagttAQducE+T
 gAD+K4fKlIuvH75fAFwGYG/HT3F9mN64majvqJqvp3gTB9YBAL12gu+cm11m9JMyOyN0l6Os
 jStsQFghPkzBSDWSDN0NzjgEZrROPBIKKwYBBAGXVQEFAQEHQP2xtEOhbgA+rfzvvcFkV1zK
 6ym3/c/OUQObCp50BocdAwEIB8J4BBgWCAAgFiEErZgVIAcTGwFksLAkagttAQducE8FAma0
 TjwCGwwACgkQagttAQducE8ucAD9F1sXtQD4iA7Qu+SwNUAp/9x7Cqr37CSb2p6hbRmPJP8B
 AMYR91JYlFmOJ+ScPhQ8/MgFO+V6pa7K2ebk5xYqsCgA
Organization: Norik systems d.o.o.
In-Reply-To: <20250626075837.GA9216@francesco-nb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

On 26. 06. 25 09:58, Francesco Dolcini wrote:
> Hello,
>
> On Fri, May 23, 2025 at 10:29:29AM +0200, Francesco Dolcini wrote:
>> From: Francesco Dolcini <francesco.dolcini@toradex.com>
>>
>> This series adds atomic operations support to the imx-lpi2c driver and split
>> the previous v3 patch into two separate patches.
>>
>> The first patch replaces the open-coded polling loops with readl_poll_timeout.
>> This improves readability and consistency, and prepares the code for
>> integration of the second patch, while maintaining the same functionality.
>>
>> The second patch implements the .master_xfer_atomic() callback, enabling
>> support for atomic I2C transfers.
> Just a gentle ping to not forget about this.
>
> Francesco
>
Hi Francesco,

just a heads-up that this needs rebase on latest linux-next due to
commit 614b1c3cbfb0 ("i2c: use inclusive callbacks in struct
i2c_algorithm").

Afterwards, I was able to test functionality on PHYTEC
phyBOARD-Nash-i.MX93 and you can add my:

Tested-by: Primoz Fiser <primoz.fiser@norik.com>

for your v5 if you want.

BR,

Primoz

-- 
Primoz Fiser
phone: +386-41-390-545
email: primoz.fiser@norik.com
--
Norik systems d.o.o.
Your embedded software partner
Slovenia, EU
phone: +386-41-540-545
email: info@norik.com


