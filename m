Return-Path: <linux-i2c+bounces-10122-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBAFA7D2CE
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 06:04:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2486C7A3627
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 04:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F16D221F01;
	Mon,  7 Apr 2025 04:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wf9Wjbkc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB94213254;
	Mon,  7 Apr 2025 04:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743998674; cv=none; b=ZHHqwYJp2rhTJ74dGnY56BDLOT/gLgRghMb9KbDp7o/ZK9hUas0JPnSjBLFS3Ef0OqeLwcHcHwXkrwhX07zp0RehFQG2uqLmR/pTINCXV+hlP9bEjcKX28RGUl4eevDtneuWB/fhIcS4CvFlcfA4bn1TrE0a30TbxPp1Jrk+2kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743998674; c=relaxed/simple;
	bh=m6Xuj0TJRW756Jn/RBGPzGsbpImEdtEG9o3zvOpUzyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FPuJQTctd8NvPpWAiRjIslVEh43Ex2X5sVS5VKwKVbRHs9nfpHbfuhpeqY0L8mYF+210UIv00+rT1cLOdXl/gNdqXrRmQ7Rfu2VtSB2LubG9MO3b67IK7GZB9gdJDtgUvEm8j3+1LohEhH/KLluvdJw2TegGKgfzHl7jMQi3TF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wf9Wjbkc; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6ed0cc5eca4so52372586d6.1;
        Sun, 06 Apr 2025 21:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743998672; x=1744603472; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fOq1SITZwZx53Waxl1kAcNYG/rxGN0T4WohynMVLlhw=;
        b=Wf9WjbkcCXQHS6+HadNVXSvDAo9E0LbOAORfzsz4eNefTQXgIOYJiLdO1LFNnQImHW
         UtFBT2Tx8DAPkfMYpJFSg2Y+HRGx5Q3VzP66Kw4Xh8gpz9DuUt/nqL4Fc0Q5/TgbKGD2
         QBLuQp2nh1GnbUsvOPrwmvVCLFrn19QQSOH/lE4zEcYxXtSl/pKz5aVIc/pVVYP0M93r
         02Hp5MnSKsAKYzK7f0IUcaFpA3vgrY0hQ7q1Ks1EwhaeDDj0OHFZqvZloqVlK80XMeTJ
         a0eS8CwiYWSMPZ/pjyTWHtb7WFpLUIhVrLTMk7qSMvOjgGBsU+NCQP09XVCostSp4a39
         XQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743998672; x=1744603472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOq1SITZwZx53Waxl1kAcNYG/rxGN0T4WohynMVLlhw=;
        b=aJ7pqm9KXAC2KXcMvp7oOWPBQ4jIYUC6hbLwFcQENllg+Co1RFmSdsfr6RzH+ZJ7PB
         9czKkK/HLpfSx9DZZ3oufXcaPTOozu4vkbtwBQBLlG3odmZVzdgCWlOCQNL3npYMBg/F
         dazvpiKkOdE6Ot6yK462sM4nVEGGM/eaXO05kyGfJyV6meigSWrPdR0CF/YA7Xj7Opbm
         LGLXAgGX75m+XFakQBuBQYStoZtU1ukyw2eWEPsZqJFbCTUdPEGo5h6RHkxbPFF3Mozt
         zw/67/qdkRJoSTXwvOutXs8RnVZ+pTl1n3x5qGWR+SUgGhk5b7+xXdP7zrZeZlxmCczC
         jnVA==
X-Forwarded-Encrypted: i=1; AJvYcCU3sqc6buOiDSQrQhYHW1SeolAxBwalZpas2WJyXLUHwho+bEbyiaNCbIAZv5ifLSIqjxQ6Wq6SDKbqHr3d@vger.kernel.org, AJvYcCV4UYoRP5gbWwjs62vW/WI62UAZ2X9Eyn24uCqOzfgLfI+jnhMKy1R3xsHUWlkW0Kt1PTSfoWApuw8u@vger.kernel.org, AJvYcCWo1kWnTxW26FBYZGcvfYLqX8l6oGjMK4QBN734DDCNlH0F40kemxyVKNb3fNMQuqd/v4im1G3Ag583@vger.kernel.org, AJvYcCXD07UulJPTscrrSRbJHBaDddodqoeJomtMh6F69MXfR6QqBwJDZkMp/L6r1o0PoXGigVrQealHFXR1BcQ=@vger.kernel.org, AJvYcCXxKRXatiBGnq+ENWWtPgmZIajU23kBCnhV/GYbas4M1HrX7bCN7NQK42OGE249qwpKlyj8eJRLOTJf@vger.kernel.org
X-Gm-Message-State: AOJu0YwCws+58sJ95a1essJbmGDQmaPh3Gep0zn1tj1o/xnFIDIpsUcR
	Qu9+/h2LuU2lyZCKdfDZXVTKV6Yyil6VKJCdm0nJceQJV1VSNbpG
X-Gm-Gg: ASbGncsLb2G5U9vD2xgrglIhQP/p/UcmesA3vOCiJEsVpci6Jt/GA+QOkYmhvd0tsWl
	H5W4AxlSNs1hGVyvFhlsd0tnjzLw+9zasjWsjQpRNYX8YHNirDjr57K3I27bAMtZtWlhnrjbM81
	sUW5xgBmeHJhMdSRk0sDotUxsIKijyTbtZNxxRg8yRlDfrqvj7J3YCN/Hg9CEekTR12HVmDDENX
	tYs1U13EGTaTJkpeWcwnIYVprM2U+0ITY2jcDeh71drLH0DJyhENM1WeMONRxtV6P+cFd+KPg8L
	Z2ljBpbbT3MkGVxbqPTb
X-Google-Smtp-Source: AGHT+IEFWeaPs0k9l/nRl6SOPQWLI77kf3bipNHxa565PpRnQyV/lSkvI2bJRICX3oG/ZiqYwkUBpw==
X-Received: by 2002:a05:6214:1c07:b0:6ea:c5be:f21b with SMTP id 6a1803df08f44-6eff5515024mr175586886d6.13.1743998671997;
        Sun, 06 Apr 2025 21:04:31 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c76ea7ee17sm542867685a.92.2025.04.06.21.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 21:04:31 -0700 (PDT)
Date: Mon, 7 Apr 2025 12:03:56 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Yixun Lan <dlan@gentoo.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, ghost <2990955050@qq.com>, 
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Chao Wei <chao.wei@sophgo.com>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-mmc@vger.kernel.org, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 5/9] dt-bindings: hwmon: Add Sophgo SG2044 external
 hardware monitor support
Message-ID: <wqbglycwmrfqxr7cus4vpaksobxvubozx44giwtfnv3ikwvpqn@kszl3yo6mcry>
References: <20250407010616.749833-1-inochiama@gmail.com>
 <20250407010616.749833-6-inochiama@gmail.com>
 <20250407020517-GYA13159@gentoo>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407020517-GYA13159@gentoo>

On Mon, Apr 07, 2025 at 02:05:17AM +0000, Yixun Lan wrote:
> Hi Inochi:
> 
> On 09:06 Mon 07 Apr     , Inochi Amaoto wrote:
> > The MCU device on SG2044 exposes the same interface as SG2042, which is
> > already supported by the kernel.
> > 
> > Add compatible string for monitor device of SG2044.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  .../devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml  | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml b/Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml
> > index f0667ac41d75..b76805d39427 100644
> > --- a/Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml
> > +++ b/Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml
> > @@ -11,7 +11,11 @@ maintainers:
> >  
> >  properties:
> >    compatible:
> > -    const: sophgo,sg2042-hwmon-mcu
> > +    oneOf:
> > +      - items:
> > +          - const: sophgo,sg2044-hwmon-mcu
> > +          - const: sophgo,sg2042-hwmon-mcu
> > +      - const: sophgo,sg2042-hwmon-mcu
> 
> the compatible added here but not used in dts (or driver), e.g 9/9 patch
> I'd personally prefer to add it when actually being used
> (so it can be validated in the real use cases..)
> 

The dts patch is blocked by the dependency (in most case, it is
the clk). I choose to sumbit these binding patch as they can be
reviewed in early stage so I can throw the dts patch only when
the clk is ready.

In fact, these binding changes are trivial so I think it is okay
to go with the initial patch.

> another concern is whether better to just use 'enum'? (maybe not)
> but I got your idea to fallback to compatible of sophgo,sg2042-hwmon-mcu..
> 
> same with mmc, i2c..
> 

I do not think it is a good idea to use enum. It lost the fallback
info.

Regards,
Inochi

