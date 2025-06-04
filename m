Return-Path: <linux-i2c+bounces-11249-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D64FACDBD7
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Jun 2025 12:21:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1A80175FE7
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Jun 2025 10:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78EA028DF15;
	Wed,  4 Jun 2025 10:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="NIYrsHCd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from out.smtpout.orange.fr (out-70.smtpout.orange.fr [193.252.22.70])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55EE28DB4F;
	Wed,  4 Jun 2025 10:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749032424; cv=none; b=XeQnQG5yhM5zrt03VXmplnUK1x48oWl3i7yIOzgC4lyToCxT/gnZ3kt/FKdi+U5+Til9KfK+pbdct87v+HDvpW6KNI0RlsrR2DShBnn1C0884baUlmr4cVJVXKt5HvzCHZoPrCMvRsvZB8lB64hX6abzk93LLnLMXAvDbJrVn2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749032424; c=relaxed/simple;
	bh=SI8hKINZA8ZOjnngj3VI4gk5fVqroFWExXzS49Plxbg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kU1qh2tiBhfSqR3PDYriOBDbvDMkPGV83nl09vqXaFgtD/i6R/O29Cr9UuX8E/Q1pp70YsTmRhyoyZek7KuY7nte57Qe8gFx4tQvnXRe+S1u3AUpUQkFQ4ySBpBx5DfnWwl93kq+rYZuk1U7RhmqU9DSWX9hBklHpNta+8h4aRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=NIYrsHCd; arc=none smtp.client-ip=193.252.22.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [172.16.82.72] ([124.33.176.97])
	by smtp.orange.fr with ESMTPA
	id MlDzuEUloXQs6MlE1uxdmP; Wed, 04 Jun 2025 12:20:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1749032412;
	bh=f3saFh4IWjuvEXxBtC57if+A82mqTstaTkfFE0fvKtg=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=NIYrsHCdw63o6pQVgtEauY0CxUs3bQOHE+QFt5XnMaFYdI1PC9wWt7jC+7IufUft/
	 93HtXBP7z/ZNIXkbUU4urmoxoQO2V9Z5UR/T9GD38IyOwVUmyiXs5Pj91L7w/X91ep
	 S+MvilUt7wZR6JSuEmZ/YoxHg43mxroFJUyQ79F1yqJSjRKeRa2+xR//ESBMX1SSS+
	 jJrExTzsNfpXIktW+OjrrFGv6Hnvskd5G43guF1ui29xr94gc97cv3/9REgxDjDbfZ
	 752n6Ekgb+sdoDkhW10A0eFzxJ8nxsaQ8P1dAYlRpPgwiNjSOSTwIG6XAuJ1wYcCID
	 VFxECmNYqPH8w==
X-ME-Helo: [172.16.82.72]
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Wed, 04 Jun 2025 12:20:12 +0200
X-ME-IP: 124.33.176.97
Message-ID: <460dee11-4cb2-4ec3-80c4-feca344e0ea0@wanadoo.fr>
Date: Wed, 4 Jun 2025 19:19:58 +0900
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 4/7] can: Add Nuvoton NCT6694 CANFD support
To: a0282524688@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-can@vger.kernel.org,
 netdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-usb@vger.kernel.org, Ming Yu <tmyu0@nuvoton.com>, lee@kernel.org,
 linus.walleij@linaro.org, brgl@bgdev.pl, andi.shyti@kernel.org,
 mkl@pengutronix.de, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com,
 alexandre.belloni@bootlin.com
References: <20250604041418.1188792-1-tmyu0@nuvoton.com>
 <20250604041418.1188792-5-tmyu0@nuvoton.com>
Content-Language: en-US
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Autocrypt: addr=mailhol.vincent@wanadoo.fr; keydata=
 xjMEZluomRYJKwYBBAHaRw8BAQdAf+/PnQvy9LCWNSJLbhc+AOUsR2cNVonvxhDk/KcW7FvN
 LFZpbmNlbnQgTWFpbGhvbCA8bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI+wrIEExYKAFoC
 GwMFCQp/CJcFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQTtj3AFdOZ/IOV06OKrX+uI
 bbuZwgUCZx41XhgYaGtwczovL2tleXMub3BlbnBncC5vcmcACgkQq1/riG27mcIYiwEAkgKK
 BJ+ANKwhTAAvL1XeApQ+2NNNEwFWzipVAGvTRigA+wUeyB3UQwZrwb7jsQuBXxhk3lL45HF5
 8+y4bQCUCqYGzjgEZx4y8xIKKwYBBAGXVQEFAQEHQJrbYZzu0JG5w8gxE6EtQe6LmxKMqP6E
 yR33sA+BR9pLAwEIB8J+BBgWCgAmFiEE7Y9wBXTmfyDldOjiq1/riG27mcIFAmceMvMCGwwF
 CQPCZwAACgkQq1/riG27mcJU7QEA+LmpFhfQ1aij/L8VzsZwr/S44HCzcz5+jkxnVVQ5LZ4B
 ANOCpYEY+CYrld5XZvM8h2EntNnzxHHuhjfDOQ3MAkEK
In-Reply-To: <20250604041418.1188792-5-tmyu0@nuvoton.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/06/2025 at 13:14, a0282524688@gmail.com wrote:
> From: Ming Yu <tmyu0@nuvoton.com>
> 
> This driver supports Socket CANFD functionality for NCT6694 MFD
> device based on USB interface.
> 
> Reviewed-by: Marc Kleine-Budde <mkl@pengutronix.de>
> Signed-off-by: Ming Yu <tmyu0@nuvoton.com>

You are sending this from a0282524688@gmail.com, but your signature says
tmyu0@nuvoton.com.

Can you use your actual email address in the signature?

Aside from that:

Reviewed-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>

Thank you!


Yours sincerely,
Vincent Mailhol


