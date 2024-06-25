Return-Path: <linux-i2c+bounces-4323-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CD57A915DED
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2024 07:07:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E6B52838BE
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2024 05:07:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63621144306;
	Tue, 25 Jun 2024 05:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="qrP3uHEz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1143113C9B8
	for <linux-i2c@vger.kernel.org>; Tue, 25 Jun 2024 05:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719292029; cv=none; b=UONAE6QMt/Gjtm8Q1DplcBMYk59Nr/K4UcJAUcDxZ7qEuTc0bZFlsnKNob+5ZPXBWXTRxkzf31yM2Nd02XDfQDMtUukJTG5iBF+FXEwL0aoKiwHDhXWRWwpE13aUFAerD3DfwkFYBYYfvWDY3eLCegDULuVs0gO9kNhVUWhYsbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719292029; c=relaxed/simple;
	bh=XFnA16kYW5gGBpSDrWeOV5VEpEAexRRRucWlNmOgnjI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PHEDf2WF3OL0jGnCpbskA6CkL/R0EZ1RSmZ1gZiB4FNiWzhpbH7b1JVrTNCxiOAZ0RBRVuEhkXZxstw2OhEEVMzQFj2siUyfbFFofvfRXrVG2ve09VrHL13DY83/X3t67XvgUBdolBpBhWKg6Dfub/xkjxSz/RNX7P3Xb20upuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=qrP3uHEz; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52cd628f21cso4172413e87.3
        for <linux-i2c@vger.kernel.org>; Mon, 24 Jun 2024 22:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1719292024; x=1719896824; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iMTfoPJSp/wlWQYq7ramEp8kDhcvFWSvsJvWkHGYsCg=;
        b=qrP3uHEzfNLNzM2yRBsn4IrZUYI+bNIFcB1A+Wn0rAhuZDg0ulZv2VOB58bK0QGkjW
         19LtbjxRhflLujofe+2Bu4+kflhzVXoOidNHWTcQWu1FF6o2A0xmSR20YGk/84lPEkb3
         X/IdGBbEuvbQULId5SojIBaw4ifrx6p2A5SXw3KJQMLcONfKB8aotKL1TK1/DjhIQl+i
         b7OeJrceaUb2fn825ntM+I6bZ9Lm22zfETIZrS5DN1ukIBHXYA4YQv84e4nKaveJPJAM
         cWxSMYwlb0CmG5YBLpi5KLgJ4KkSttGgClXktgbfq822xCHOoqDyiOg6hLNSuOHi1tre
         2/+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719292024; x=1719896824;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iMTfoPJSp/wlWQYq7ramEp8kDhcvFWSvsJvWkHGYsCg=;
        b=ADqxaYdorSqM/SAjso3lYfB4Lad8zNYckCNGEWxB7qxNwQdsRjte8dIqXhcDoilXPc
         9G+t51DDgLS0nR+MJZburZMS0mEvvusOj7sjHxsOoRj3GxuxGYx706YdLM2sblww55qt
         NZr5IlSjnKyWYDwbSZ9EhZmK2agOkd2CJExxI16cy061cAc/boPISkCjFf84lk51Y8Oc
         tZv31WB+Y45f9b4+9S62cs2JUIPpw75zdXD9n4r8Z24HmVeCrcr109QNplSkBCkuCrhh
         q22UPjSyC6qW4TZO6kfE/cTEfyAX7EdRPJHeNDPb87DfNHjocdLW9IrIllL6bzwV1VRa
         QgAw==
X-Forwarded-Encrypted: i=1; AJvYcCVVckGyNtlFv7ywL1KkVlVzzN0Ti7XviO9SNq8j6vfP001P322zEwYo4tyk0ekOfiLmRl6m4ClWhyepzTLdekpFRmsz4EGZZzUg
X-Gm-Message-State: AOJu0Yz6CZtznhIaae5N3YnrtRksVek9t92hfrj53081dd9iem33padr
	3dVBBRm+QMKsfnf5GipCOuzfyeDjr0oH+UPZMLJjCWEfl4FC57PjDecxbpstj6U=
X-Google-Smtp-Source: AGHT+IG7HDx2+AdxqahzNH7iyEFC9rGrJpKDudbwOlrJIC/1s7QOXQZz7eUKgfpp4ZPXuAssY8mYtA==
X-Received: by 2002:a05:6512:2355:b0:52c:9468:c991 with SMTP id 2adb3069b0e04-52ce1832bffmr3986238e87.14.1719292024114;
        Mon, 24 Jun 2024 22:07:04 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4249b4232f9sm6119065e9.0.2024.06.24.22.07.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 22:07:03 -0700 (PDT)
Message-ID: <908ff65d-e9f0-47c2-94ab-47cac3aa58ce@tuxon.dev>
Date: Tue, 25 Jun 2024 08:07:00 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/12] dt-bindings: i2c: renesas,riic: Document the
 R9A08G045 support
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: chris.brandt@renesas.com, andi.shyti@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com,
 mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
 wsa+renesas@sang-engineering.com, linux-renesas-soc@vger.kernel.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240621112303.1607621-1-claudiu.beznea.uj@bp.renesas.com>
 <20240621112303.1607621-9-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdULaO2dH_wrcM5P6=rDYzRXcMSGfVsBz3okWPGjOsMN4A@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdULaO2dH_wrcM5P6=rDYzRXcMSGfVsBz3okWPGjOsMN4A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Geert,

On 24.06.2024 18:40, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Fri, Jun 21, 2024 at 1:23 PM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Document the Renesas RZ/G3S (R9A08G045) RIIC IP. This is compatible with
>> the version available on Renesas RZ/V2H (R9A09G075). Most of the IP
>> variants that the RIIC driver is working with supports fast mode plus.
>> However, it happens that on the same SoC to have IP instatiations that
>> support fast mode plus as well as IP instantiation that doesn't support
>> it. For this, introduced the renesas,riic-no-fast-mode-plus property.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Thanks for your patch!
> 
>> --- a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
>> +++ b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
>> @@ -25,6 +25,10 @@ properties:
>>                - renesas,riic-r9a07g054  # RZ/V2L
>>            - const: renesas,riic-rz      # RZ/A or RZ/G2L
>>
>> +      - items:
>> +          - const: renesas,riic-r9a08g045   # RZ/G3S
>> +          - const: renesas,riic-r9a09g057
>> +
> 
> LGTM.
> 
>>        - const: renesas,riic-r9a09g057   # RZ/V2H(P)
>>
>>    reg:
>> @@ -66,6 +70,10 @@ properties:
>>    resets:
>>      maxItems: 1
>>
>> +  renesas,riic-no-fast-mode-plus:
>> +    description: specifies if fast mode plus is not supported
>> +    type: boolean
>> +
> 
> Do you really need this?
> The bus' clock-frequency property should take into account the combined
> capabilities of all of controller, target, and wiring.  It is up to the
> DTS writer to validate that all timing conditions are met.

On a second thought, I tend to agree with you on this.

I added it to comply with "chapter 47.5.15 I2C Bus Interface Access
Timing, note 7, Tfmin cannot meet the specification in fast-mode plus for
the RIIC ch2 and ch3" statement from hw manual.

Thank you,
Claudiu Beznea

> 
>>  required:
>>    - compatible
>>    - reg
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

