Return-Path: <linux-i2c+bounces-5508-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7650095690A
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 13:10:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2AFC71F22960
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 11:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEDF91662E7;
	Mon, 19 Aug 2024 11:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="THTsQOob"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE21165F1A
	for <linux-i2c@vger.kernel.org>; Mon, 19 Aug 2024 11:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724065820; cv=none; b=ZhCafVw7K4Qz+BIAtdenbgzjJ+EyY19ouytodmSg1h6ZgZpc678xYkTmDVCkAtuyW/JS7Ba4B+0Jffj3GBTqAsyep8Xpn9Sk2uXtCB4HFh1tX3+OPUsTMc/pbqZe1IdqgC7tJKx72/e+kTtqVVr1DgMXefNIyYQbsgtaoTaPScE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724065820; c=relaxed/simple;
	bh=zOlYH3GTgzKAHU8di3VALmbBP8ocav6kVwNdHek7zxo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XsCqnvEMzdJWBotEbfHk5jCLsqKoHxYhuJjyyoBMVe6hsGG/5GPz60hGFlIaYfUwhS8JcqULX47iq5r/Bw0UjhkpnkXAab9UKroi89EY/j3YE+juw5wzOD7O/1oKvWl5BMtbX19k+pC+6lUn54g+OTvyU7EIe4qJv+WQqV0oxHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=THTsQOob; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-530e2548dfdso4719529e87.1
        for <linux-i2c@vger.kernel.org>; Mon, 19 Aug 2024 04:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724065817; x=1724670617; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XE2ug3irN3B0PzcH/qnDG30H87tv6xYk/Cf9lQioacg=;
        b=THTsQOobrrifUcn+RgJmj6zAOqWzfiDCjRaXYBr+Q1JJediOe6MBj11XFNDyPMKBCg
         G4swmIjtcNdTSGXkajU7Lr7kr1ZqcHZEeLWf2h+fSly9jdvq0ksOqlZkGqH9OQevJblI
         hQvy+zrJzqAkkJp+RE8dCkhJpPFD2thP7ulVfORQnv2mrn4fA+aTKN6d4REmOEb1UGbl
         ffRnScbZ/z4whweQewhjqJas1Z/8T+3TNKsnwQgJ67m3AP6x3VfAs1/wUMISFHe/18yy
         BGp8GMfVWTbiheNIkISXFd05Y/FirXXFBMzNi2izqCl0Ze4DpwlHUibBQ5m46fMaPYD7
         wpWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724065817; x=1724670617;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XE2ug3irN3B0PzcH/qnDG30H87tv6xYk/Cf9lQioacg=;
        b=XrhGMyBk8FpUA0UC+R9P9HNGWI999CQsTRqnqDc2JHoPKubDawhdW4KaYTlS4tzAqZ
         Q09/8zpW88nOOwlEID5klEFezd1oXqhLwXnEidphJqhY7qFwIf72aFZl4cEbQTNlNmE7
         TKIMgghHeY8f3Cr4buA+q9n0xi2W5moktCtoJw/SiuwSR3NqCk8ugcH4vp8Aeb6hO5MU
         PegQF571xh+D574yOiJDLQc9ovLQWE9nOL8smBjHJ65eEq1qRMh0wKWcbgPrGpBx3TNS
         y39GQTDUIRHpD/82ZuuaawKzOu9mEPC8CeCRvDDvqOKu8cqVxKStcBdWVxS4Kdb7hweK
         TrCw==
X-Forwarded-Encrypted: i=1; AJvYcCUvumlGvLYxa4cIgaXv2v8gABzAOfAUS+NZdNqD+okWdUoutsisxGAFkdWG44C6C6s9OMi4L2FmnSM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCIyw+I1d8FXqcMYaau3TETQI2NFCH4J8/cbUKRE32wacH6yGt
	B5rCTdrNwwWz069nTaNxNCQX4nzaKfE6gg3/gCbk4+sybaYTvLM9W7jCWLdzzjg=
X-Google-Smtp-Source: AGHT+IFVSravI8lfSdiu804ftuzvsmERhC3uU+IGlqmkWfmDLfcT8JqBkHBmuPpnv9kff6wDZ8wXAQ==
X-Received: by 2002:a05:6512:3e22:b0:52f:307:d5ee with SMTP id 2adb3069b0e04-5332df3699fmr4142624e87.4.1724065816798;
        Mon, 19 Aug 2024 04:10:16 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83838c6998sm627728366b.19.2024.08.19.04.10.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 04:10:16 -0700 (PDT)
Message-ID: <e6377448-9af3-4807-a8fd-197f5b2b4aa4@tuxon.dev>
Date: Mon, 19 Aug 2024 14:10:14 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/11] dt-bindings: i2c: renesas,riic: Document the
 R9A08G045 support
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: chris.brandt@renesas.com, andi.shyti@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be,
 magnus.damm@gmail.com, p.zabel@pengutronix.de,
 wsa+renesas@sang-engineering.com, linux-renesas-soc@vger.kernel.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240819102348.1592171-1-claudiu.beznea.uj@bp.renesas.com>
 <20240819102348.1592171-8-claudiu.beznea.uj@bp.renesas.com>
 <gxjlmdjicwzlexitsx673beyn7ijuf47637nao2luc5h6h6hvi@qstobttin7dw>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <gxjlmdjicwzlexitsx673beyn7ijuf47637nao2luc5h6h6hvi@qstobttin7dw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 19.08.2024 14:05, Krzysztof Kozlowski wrote:
> On Mon, Aug 19, 2024 at 01:23:44PM +0300, Claudiu wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Document the Renesas RZ/G3S (R9A08G045) RIIC IP. This is compatible with
>> the version available on Renesas RZ/V2H (R9A09G075).
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> Changes in v4:
>> - added comment near the fallback for RZ/G3S; because of this
>>   dropped Conor's tag
> 
> That's not a reason to request a re-review.

Sorry for that, I wasn't aware of the procedure for this on bindings.

Thank you,
Claudiu Beznea

> 
> Best regards,
> Krzysztof
> 

