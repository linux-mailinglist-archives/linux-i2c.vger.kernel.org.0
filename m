Return-Path: <linux-i2c+bounces-10993-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3E9AB8228
	for <lists+linux-i2c@lfdr.de>; Thu, 15 May 2025 11:12:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3A2717A7042
	for <lists+linux-i2c@lfdr.de>; Thu, 15 May 2025 09:11:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89799296736;
	Thu, 15 May 2025 09:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jJv3vwR0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B651F28CF65
	for <linux-i2c@vger.kernel.org>; Thu, 15 May 2025 09:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747300326; cv=none; b=Wtg+xwUMuJo2e66+y1XO3yskQTGu3vZ3ibk1SWk4RXo0hMiy1mVz8oNw2enBHko+8m6q6EVOZkpBeOwYOO7wQs+PABO0hrRCaeb7ObQ4ekwBHdjGQCfnPOrqA0dQRfWScBC4D3/abr2Uv2hG7M87Q9sZZt8Mw38Ahcif8aAc6vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747300326; c=relaxed/simple;
	bh=Y8fh0ydbwDFuT4JP0Uktyo5VIuBqssqojenovaU59/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mD5e85g0bI/ttM+v/m3HnNFXuLJfoEttp9fY+yheD6Vz8jXYsdLu3584N4vDRivhLHWjxGR7Nj7Vzy/pFfUwYVq3+wKs8Lm3HJjb0s2RjXVk5YuWW6ViaJLuofWwCgRo2S9fCZzVGXWWW/PnQhY1T/4G86ZZsdHLl9WHyyo743w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jJv3vwR0; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-442ea95f738so4914885e9.3
        for <linux-i2c@vger.kernel.org>; Thu, 15 May 2025 02:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747300322; x=1747905122; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CAE9bz2isgxzUGbrKGqqEdeq1PEN+8OwnZGGftLgteU=;
        b=jJv3vwR0aSTmk0oZeJL61m/SKSS731rgOU+85WuPrAwyCrQspNh4lPIk3tIJKmWaYD
         u3zp9d2VeDqo/yRrfPqotiW+R5Jzvu+J386ew48fRkQOEiFKEXrwP05CHUgDflCFgS1S
         bAlh2Cvx1MXcvEE1v4ENNQGy0adlfxzQDXMJ4Ucug9W3v1FXX3STo9cpedj1XwgUII/f
         B4yO/3D0sP4PVAiDBL0iNqWf2eVVGdkauG/LMQkow1Ny/vU6jysg7uK17qJ+6ZyngIIo
         n59n+6/2j13DMfRym3MC6S/QwAmi+XuJb+TKLAxSZ8URqSJvFgdE7WTH4YGU9Z/VqDmz
         RO7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747300322; x=1747905122;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CAE9bz2isgxzUGbrKGqqEdeq1PEN+8OwnZGGftLgteU=;
        b=edM0CG4ypplh23oUJ6IckxGsteyYEj9W7p01uF4rNgTNEmKWrLmReFa66VCss0IdyJ
         2uJlXTgHoPUo0DEar2y3Zv2ZKwWy0S2bW2a0nssyvoL8Ed75F4+hPW78/cCJBLxUm2er
         +l+aUEGhjj3Vqj0PcLByackfFEue4yrc1vA8cEX2MJBEMaCrQyGl8p5fPLMgGZTDVjNK
         PMOsqTljYBkY+ZHpkETupXOBMnAydJtazpEuwEQ92nSaVptASUe3XcikbzJW+mNu4hOX
         G7ShO4EAxjZpeSz9oZa27Rr0WJ+8dNCK17/XUIxgQTRPC53vHTH/5tL5PFZXR8MzGirp
         pv1A==
X-Forwarded-Encrypted: i=1; AJvYcCW41dkHkr2j/2/yTfxZT6+yI6Cimzvibf6d02OtCM/5CsDrgPvsfl6lIOJiWnIB01v1dda4WXHeEMg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/j22gj0Y7rdIAPmI39sGYLcQbAHcra0KVCQxUzVzjaPE2yLUS
	WEkgtwjvbcVm7tfXrIg+ci5pQTLAiu1COxuXS+huoBHg/uW1hdAWP+HBCXGR/90=
X-Gm-Gg: ASbGncuulLJCGTzLi5AR6taJOggEcTNemZ+zUi95k9OVfxJJ/SqXhM61jVAnwoImF8x
	KtHcxoT+iahz9AHmwju0MMYEnk6TBrz3RozKD2+B8IB28LwlTkN6ZWXG8bSq0vH4rjyoCUCh9jw
	1eZdDx5EE67I/wMbaZ60w8eRL1GxE4H0rXv2VP/9Ly+wq+kMbopQCk1g8E5YOjOCfY0qFqTAFs3
	oWrQ6HjyVSpmgPT5XjFnMh9TekP3v1uFz1wcrhU+KHHMCEdwVW8QXWdkkDNbnHclQqravcv/Osx
	DcXCvXosoVHE2RWwMHrC6CDnqzesHOlb7Eaaj0Hh9wQtIxxI5UWBi29Ptsyj3NIx3ukY+h5IbpV
	bjQ+bx0/OYelk
X-Google-Smtp-Source: AGHT+IEiWqZK+wIF0dIQPPNEPiVIMFChIw3pA6T9sTYgeSc0xYst5cv/piO7TsYycRsa/pH81nx0gg==
X-Received: by 2002:a05:600c:b91:b0:43c:f597:d589 with SMTP id 5b1f17b1804b1-442f2177567mr56412345e9.27.1747300321871;
        Thu, 15 May 2025 02:12:01 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a1f57de100sm21837759f8f.2.2025.05.15.02.11.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 02:12:01 -0700 (PDT)
Message-ID: <726e96bd-d4c9-450b-9161-241f05d3d82f@linaro.org>
Date: Thu, 15 May 2025 11:11:56 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] dt-bindings: timer: Add Sophgo SG2044 ACLINT timer
To: Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
 <inochiama@gmail.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, ghost
 <2990955050@qq.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Jisheng Zhang <jszhang@kernel.org>, Chao Wei <chao.wei@sophgo.com>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-mmc@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 Longbin Li <looong.bin@gmail.com>
References: <20250407010616.749833-1-inochiama@gmail.com>
 <20250407010616.749833-2-inochiama@gmail.com>
 <aCSmNRTVXQ51xj0m@mai.linaro.org>
 <MA0P287MB2262A447A98778BF4BC3DB2BFE90A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <MA0P287MB2262A447A98778BF4BC3DB2BFE90A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/15/25 02:03, Chen Wang wrote:
> Hi, Daniel,
> 
> Just a kindly reminder. There is a v2 of this patcheset [1], and I see 
> [1/9] of v2 has been picked by Andi [2].
> 
> Please double check if anything wrong or conflicted.

Thanks for the heads up

I think it is ok, I have the right version in my tree.

If you want to double check, it is here:

https://git.linaro.org/plugins/gitiles/people/daniel.lezcano/linux/+/refs/heads/timers/drivers/next


> Link: https://lore.kernel.org/linux-riscv/20250413223507.46480-1- 
> inochiama@gmail.com/ [1]
> 
> Link: https://lore.kernel.org/linux-riscv/ 
> egkwz23tyr3psl3eaqhzdhmvxlufem5vqdlwvl4y6henyeazuz@ch3oflv4ekw7/ [2]
> 
> 
> On 2025/5/14 22:18, Daniel Lezcano wrote:
>> On Mon, Apr 07, 2025 at 09:06:06AM +0800, Inochi Amaoto wrote:
>>> Like SG2042, SG2044 implements an enhanced ACLINT, so add necessary
>>> compatible string for SG2044 SoC.
>>>
>>> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
>>> ---
>> Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

