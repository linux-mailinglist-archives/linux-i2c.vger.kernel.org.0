Return-Path: <linux-i2c+bounces-12261-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8EDB246FD
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Aug 2025 12:18:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D2A91AA13D3
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Aug 2025 10:13:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7CB22D46C8;
	Wed, 13 Aug 2025 10:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BkxYup6+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3675212541;
	Wed, 13 Aug 2025 10:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755080012; cv=none; b=fHmPuhhps05Wa1XJfz0361Jp/xq2mpruFjckWLcHUL/d8cQrgV3n8VV2tkK/knBQ5azcZpc2W+iKhYnbmuR6pIldytlFzpZBTPi+dAr/vdmj4YFaU7Z+Vj7BcrslBfRB+15deoZzUXRg/i/zcdu981+lZDQVwaEvMIE4hZDwJqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755080012; c=relaxed/simple;
	bh=sGxZPnVNmyGd9Yceizyonkkt+eUWuxv8w3ZCTJZxXzo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=pcjyge1eJyRmtkasJ1ZtMcegpeHJAx/z/cTScJchzp3jmyv8dkkPjji3JMDp5mJ7jQfAWLpus71Q2y7e/+igOdA4SM2R3S3LWG+Y2Ujjqs0m/kzA79tPoiqBDbYv6FhuSO5stod+Jy9OOg7Ak3Y8PIuBeVfPGSCnPOnsZfkRtz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BkxYup6+; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3b7825e2775so5851872f8f.2;
        Wed, 13 Aug 2025 03:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755080009; x=1755684809; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3VcXeU7Q/RhQLvXFV/p9dr4CD3d9sQhgHJ+B5N3rmuM=;
        b=BkxYup6+hojoDR5eg4s7mEAsiTC/PceUN+RSRudFgZFa2PIKyV+v0U/UxTi4eYv9Jq
         /Y2+U5JcmQEJgYlH5f9StesIi4Z2rJUjtRpRk2wRysegTi6l1AaEmpeLJHB+sFJSO7U0
         5b5n629pTZAxgQhDjuG3lFBbUT8iyZ38n5KpqJmTBfLk59b28Z1tocxGLyCPuzkc+CWr
         +vdZM983NZW9MXUte1+/G8cTBw0d67DoNhHHWt2ohDcjZR3hwRoFHgG5EzX/sd5j1Pfe
         kjrtTBcWXuVtf7t53q4u7aQt2EFC26rsMSOE5iJGsiQvE4TrWhSse9GXmwTQ9hbuIgWd
         mnbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755080009; x=1755684809;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3VcXeU7Q/RhQLvXFV/p9dr4CD3d9sQhgHJ+B5N3rmuM=;
        b=hUMfvh3N1K5oFKGb38O2E9K7AOrfnXfb2bjgHIZYnRGfQwJ3CrZsMv6n4eLxhkJz5p
         1C2HhZRbgbUpseXGwpSiPzKZgFJbP/T6dHBuuND6ISVb9YVKuxkbeZmeX1V7RINQlZsR
         /8sTsS4WvuYigTE7xgJonjhLg0CvFFQaaCvrCRPo0FDQqTYQfqSU4QxIlBxr52fV5+8j
         lSM2DCjXAROQGOn8PQotktdQ+KTugOP/rXucUdvVc+mAMuQNZFnfoLIgzj3uwz8DYpuI
         g2xXB0RoS80HWI22UMoKakEw7aF2we06ZJ5Hg6s4Ag/c4GthmpLEAWMSa3FpV2A7OuT0
         vUvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHD+7Oa38xCSLwJgByUDQYMM0nOdLecMDpBWS8tdX51Bsur8CBEIdDLjjb1y5yR6eufwNLg1oFA3M=@vger.kernel.org, AJvYcCW5N0k9Ro4FGRZxy+EtL/v72wC/Ik6mlHhjYQWVvTrfqON/8VJrwzBxeLh3berIz3WlN0C06yF4PFybSgxj@vger.kernel.org, AJvYcCWR9Bh73kttCxsPirZAKLZeIMhwKiHTCQB2KEctcWLnDsNwzGD65ui8iHwToWjK49wexrZiOZ/X@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzzzj3oYhj7mkez6g1a8vtavHh4th2xvIKL4KIMwSqt+Ql9XSv
	AnHbFl9zaZk+Hh8mvGDYqUWLSWeTjIfAD9dx2W/rkxoSnJJaY2YBF1bX
X-Gm-Gg: ASbGncv0pR3E77/kFLq80yfyfUDNYFeRjVxkuyUT/p7p96P8VgbkvBege9HkuDGIE6T
	ti9awKGq6VUN0O7W7/iPbt1l284RB6VcJ9UK3SI+XAALm2NczUkX8MwN3ndWDsaC4FVh1wVLs4p
	zmJ5ekcN2SvCujs4u5XaJARwekaDHbFRp6f53QXXBv8npUCYsh0EVdyCmvFYM/CXaU3Qf954XlW
	QsgftjCxiRmgoI9jCdmuwQOuB1bw12R0g+4kAe2pxuFNK2t1ywGY6Td0NYpYEopB9GOVepF1YY5
	DQ1YxoYswVTWPPXotDBUuGvtMvIgzaEjLQwRVFcSoBCF76bLv0ztoMu+dj0ReduyRaEPgjL7w9i
	HBJ/DgN2RD6p+w9u932zdRowui2OctMry6YqDKFas4EySqvQl0HktxyWD7AesH1B/GlKHQeie1A
	==
X-Google-Smtp-Source: AGHT+IHTH7wQ/DM1riP8mGfCNOOY6mu29ZxIpOrfWgcTJfETBDY8IpnmMP++rI1zrIhW2rRbIJTrow==
X-Received: by 2002:a5d:588b:0:b0:3b8:d2e1:7889 with SMTP id ffacd0b85a97d-3b917e2d98fmr2092073f8f.12.1755080008825;
        Wed, 13 Aug 2025 03:13:28 -0700 (PDT)
Received: from [192.168.20.170] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3abf0csm46216026f8f.14.2025.08.13.03.13.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 03:13:28 -0700 (PDT)
Message-ID: <4cd3efbd-4798-4f25-9440-879ee289d8ed@gmail.com>
Date: Wed, 13 Aug 2025 12:13:26 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Gabor Juhos <j4g8y7@gmail.com>
Subject: Re: [PATCH v2 0/3] i2c: pxa: fix I2C communication on Armada 3700
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Wolfram Sang <wsa@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andi Shyti <andi.shyti@kernel.org>, Russell King
 <rmk+kernel@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
 Hanna Hawa <hhhawa@amazon.com>, Robert Marko <robert.marko@sartura.hr>,
 Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Imre Kaloz <kaloz@openwrt.org>, stable@vger.kernel.org
References: <20250811-i2c-pxa-fix-i2c-communication-v2-0-ca42ea818dc9@gmail.com>
 <aJpOyWKzBt-tDWUF@smile.fi.intel.com>
Content-Language: hu
In-Reply-To: <aJpOyWKzBt-tDWUF@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

2025. 08. 11. 22:12 keltezéssel, Andy Shevchenko írta:
> On Mon, Aug 11, 2025 at 09:49:54PM +0200, Gabor Juhos wrote:
>> There is a long standing bug which causes I2C communication not to
>> work on the Armada 3700 based boards. This small series restores
>> that functionality.
>>
>> Signed-off-by: Imre Kaloz <kaloz@openwrt.org>
>> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> 
> I didn't get this SoB chain. Who is Imre here and what is his role in all this?
> 
> 

Imre reviewed the patches before publishing those, but we were unsure about that
the Reviewed-by tag can be used when it is offered privately before the
publicaton, so we decided to use the SoB tag instead.

It can be changed to the Rewieved-by tag if that is applicable in this case.

Regards,
Gabor

