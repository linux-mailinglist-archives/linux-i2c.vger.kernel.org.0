Return-Path: <linux-i2c+bounces-10250-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 944F5A83BD5
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Apr 2025 09:56:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 660DE7A907F
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Apr 2025 07:54:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05CAC1E3793;
	Thu, 10 Apr 2025 07:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aEOoJf+y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4AC130A54;
	Thu, 10 Apr 2025 07:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744271755; cv=none; b=k0NRi9PaakvQq43lI3ojzFaB3vpoDDFg0KNUNZhSgpda1XB0drrcRX4VdPZxYZ+N6+geTv/2HaohyAy4XBmTyrdDhg0C7kP4vc63WH6LRO5ZUgtiIxsCCEx/Z74W9MltxNUleF0Vcfhf+9kldwfxPMgviKmzaE3ZYbgqaPNHkUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744271755; c=relaxed/simple;
	bh=rUbEEvvc1TPtm5AtTLAZF2apcyb6fC04ZE3v237YxYo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bIF/Sc4sfssTZPf+GXv1bMTQySZsYiMf0wJbMy6ghi5/Iw7TAt84sMjcDtxO1J6ZGm6Dbdo0cljp0qpynBF716U4EEYM/CWQlw5qgDbBVBCPeH9rdBLZFFptf/yzg3HkJsLQU+gcyE2HlFnTqHapCeJaZArCSzvQfGofGoCfSkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aEOoJf+y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A804C4CEE3;
	Thu, 10 Apr 2025 07:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744271755;
	bh=rUbEEvvc1TPtm5AtTLAZF2apcyb6fC04ZE3v237YxYo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aEOoJf+y5EIXVU1G2BqklP3ajU6AFhPDVq/DpNe0SfrJ/0sQw+nFYebbHs9gv+iW/
	 +5Wv+hx9zxY/X+vef+rP/6mQpDudwHPwU2j9hubWZt6ArWNo10vpG94EpaUG91TLK3
	 acXWWlIYgJSVtK+MliAtKEO7V9dxmqzaUv7rjwxdUoW72baZuLlnZGT5bRDnRo7QSC
	 1NV6Sp+JHvmUHPwe5rBmNceDgd0lA3C1fvqzDkMVyO9gtLRY5vypFCMP8LikMoLEID
	 Lrs3bHgk/rFN68cmyXvcpmjlfVzi9waa99585FBcGT7d9kvHwpVX2JguTA3UurEOKh
	 6A+sZxcjGPI3Q==
Message-ID: <14782b0e-3890-4d11-9a40-658da0951dfc@kernel.org>
Date: Thu, 10 Apr 2025 09:55:47 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/7] mfd: Add core driver for Nuvoton NCT6694
To: Lee Jones <lee@kernel.org>
Cc: a0282524688@gmail.com, linus.walleij@linaro.org, brgl@bgdev.pl,
 andi.shyti@kernel.org, mkl@pengutronix.de, mailhol.vincent@wanadoo.fr,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, wim@linux-watchdog.org,
 linux@roeck-us.net, jdelvare@suse.com, alexandre.belloni@bootlin.com,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-can@vger.kernel.org,
 netdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-usb@vger.kernel.org, Ming Yu <tmyu0@nuvoton.com>
References: <20250409082752.3697532-1-tmyu0@nuvoton.com>
 <20250409082752.3697532-2-tmyu0@nuvoton.com>
 <11d2541e-580b-4060-ad92-ed721e98793e@kernel.org>
 <20250410075225.GL372032@google.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250410075225.GL372032@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/04/2025 09:52, Lee Jones wrote:
> On Thu, 10 Apr 2025, Krzysztof Kozlowski wrote:
> 
>> On 09/04/2025 10:27, a0282524688@gmail.com wrote:
>>> +
>>> +static int nct6694_response_err_handling(struct nct6694 *nct6694,
>>> +					 unsigned char err_status)
>>> +{
>>> +	switch (err_status) {
>>> +	case NCT6694_NO_ERROR:
>>> +		return 0;
>>> +	case NCT6694_NOT_SUPPORT_ERROR:
>>> +		dev_err(nct6694->dev, "Command is not supported!\n");
>>> +		break;
>>> +	case NCT6694_NO_RESPONSE_ERROR:
>>> +		dev_warn(nct6694->dev, "Command received no response!\n");
>>> +		break;
>>> +	case NCT6694_TIMEOUT_ERROR:
>>> +		dev_warn(nct6694->dev, "Command timed out!\n");
>>> +		break;
>>> +	case NCT6694_PENDING:
>>> +		dev_err(nct6694->dev, "Command is pending!\n");
>>> +		break;
>>> +	default:
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	return -EIO;
>>> +}
>>> +
>>
>> Missing Kconfig. Exported functions are supposed to have it.
>           -------
> 
> KernelDoc


Yes, thank you. -ENOCOFFEE


Best regards,
Krzysztof

