Return-Path: <linux-i2c+bounces-11757-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B094AF0D1F
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 09:49:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC9DC162E76
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 07:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B1B723184A;
	Wed,  2 Jul 2025 07:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TRZ5IeWH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF85321CC40
	for <linux-i2c@vger.kernel.org>; Wed,  2 Jul 2025 07:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751442575; cv=none; b=ubxsHXlmJLtl7KGaCFZ+YHvf0OaY1jpnr24WEkoTfJbevFLD0e50g4bDgIU713TT4SPNVlyc1kdUO/Y9nASj6+1r7sjx4tG9t7RXd4qvFJN1ZtIg7aq1B6JsAEriFEGLdIxJ0cnODKoxkGWPkjkdIYRXc9mzoe3a0LdILGMjGS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751442575; c=relaxed/simple;
	bh=t53c92tc4QWn7xk0hzEkYIVhGDJ6zpW5fwcjSg16GSI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gK74G4AzhCm489Mcnqlv0KZezYwveKSPA3UaDtemzL/nWUEsOlM3FhHFzenbjfUpHGNCES/+DKnRxKboQm5zQSnA0ZwNy/6dyfXdWvfHZcrvSJRdq1EChDdGKc6eYIIvvJtTvrqejozGN2z4x1zFkH51uhFZeYsKCCs87GC8fcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TRZ5IeWH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DBA0C4CEED;
	Wed,  2 Jul 2025 07:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751442574;
	bh=t53c92tc4QWn7xk0hzEkYIVhGDJ6zpW5fwcjSg16GSI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TRZ5IeWHHWLAIr6BNQBLVvc3dTip7qhLRHkhVH28092Vw284GU2qPrgeSq46lEodq
	 DgKONe8kV5vkOmfnXrFngajwQY+wmYWaC42CfSDRV1jmS/3BXjYZT0g3hjXo5CLMUS
	 CzM/cScqMZR+ylxarvZxJEyD5dw2gZhRcBNCzn1zgWdLLRtTvur5AvFYX5DRtss7Gt
	 B5hqufqWt8Xlco8YJrXn9bH9bWUEHCmtVT4Oc8WOZsSkevvqJbNFJGcRnyI2XNCG0q
	 3Vw0BHd53zQC8hSkm+KpBvJbHVJQ18zXj2wDYsXgBF/SMAd0JlXUQIxlmCPgX4yH/l
	 RrjZQkhYC8Pkw==
Message-ID: <07cd4e2c-0419-4877-9a2a-d66f8dbe4279@kernel.org>
Date: Wed, 2 Jul 2025 09:49:30 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] dt-bindings: i2c: realtek,rtl9301-i2c: extend for
 RTL9310 support
To: Jonas Jelonek <jelonek.jonas@gmail.com>, linux-i2c@vger.kernel.org
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Markus Stockhausen <markus.stockhausen@gmx.de>
References: <20250701091737.3430-1-jelonek.jonas@gmail.com>
 <20250701091737.3430-4-jelonek.jonas@gmail.com>
 <d123375e-48ec-43f1-bc5a-1256c2f377ec@kernel.org>
 <ad8d7f0b-1c25-4a1b-89db-6631d918f9a1@gmail.com>
 <b3e58bf1-d51b-481c-892c-4115bd106ed9@kernel.org>
 <123042be-63dc-46bf-b781-6da022a8f4c5@gmail.com>
 <8d671dcc-bcc2-4b1d-9063-f7d69d52d29d@kernel.org>
 <3b357cd4-017e-43d9-a662-4f26fb9b8d68@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <3b357cd4-017e-43d9-a662-4f26fb9b8d68@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/07/2025 09:34, Jonas Jelonek wrote:
> Hi Krzysztof,
> 
> thanks for taking the time to deal with this.
> 
> On 02.07.2025 08:11, Krzysztof Kozlowski wrote:
>> On 01/07/2025 16:31, Jonas Jelonek wrote:
>>> For the purpose:
>>> RTL9310 changed the register layout compared to RTL9300. Activating
>>> the SCL line is done by setting bit 12 for master 1 and bit 13 for master 2
>>> in a global register which is located before the master-specific registers.
>>> Thus, the driver needs to know which master (1 or 2) it is currently doing
>>> something for. That is what this property is intended to be used, naming
>>> to-be-discussed.
>> There is no global register space here and no syscon, so I don't
>> understand how can you access it, especially when they are located
>> BEFORE your address space.
> 
> Probably this explanation is still missing some background and 'global'
> was misleading here. The I2C controllers are part of Realtek switchcore.
> This is defined as a syscon in DTS and the I2C controller has to be
> defined as a child-node of it. (see 
> https://elixir.bootlin.com/linux/v6.15.1/source/arch/mips/boot/dts/realtek/rtl930x.dtsi#L45-L72)
> The driver takes its regmap from this syscon node as the I2C registers
> are within that switchcore address space.
> 
> Address layout in RTL9310 is (addresses relative to parent syscon node):
> 0x1004 - 0x100b    I2C 'global' registers
> 0x100c - 0x1023    I2C master 1 registers
> 0x1024 - 0x103b    I2C master 2 registers
> 
> The driver has to access both the registers for the master that it is
> configuring AND the 'global' ones (for SCL + SDA activation).
> 
> For upstream RTL9300 it's similar with the difference of having SCL
> selection in the master-specific registers and the register layout
> having the order:
> - I2C master 1 registers
> - I2C 'global' register
> - I2C master 2 registers

I think I will keep bookmark this talk because this is perfect example
of writing bindings rule: they supposed to be complete.

If people sent complete bindings, they would see that you are now in
tricky spot and this maybe has to be redone to standard approach - I2C
is not a child of syscon block, but separate device. When it is a
separate device we solve it (plenty of examples) with phandle to syscon
with offset or value argument.

But no! Some incomplete hardware description was sent, stuffing
everything into syscon and claiming that everything is child of syscon,
and now you are stuck with this:

system controller
        |
        |
   i2c-controller-for-multiple-SDA
           |
           |
       i2c-controllers-for-each-SDA

This is not only just confusing but maybe even not correct.

I understand that either i2c controller can take any SCL line. If so,
that could be a pinctrl, but again this is child of that device, so
pinctrl to parent would be odd.

Vendor (not generic) property seems the only solution, but then this
should not be part of the existing binding or you should clearly narrow
this per variant. It was made very clear that rtl9301-family has only
one SCL per controller and you cannot choose.

> 
>> Best regards,
>> Krzysztof
> 
> Just an idea to discuss regarding the DT compatibles:
> I was proposed out of this conversation to use something like
> 'i2c-otto-mango' ('otto' being the codename for their platform,
> 'mango' being the codename for the RTL9310 series). Based on, that
> technically(!) it doesn't make sense to distinguish between the
> variants of the series.

I don't understand what does it refer to, but anyway, soc compatibles
are the only preferred way.


Best regards,
Krzysztof

