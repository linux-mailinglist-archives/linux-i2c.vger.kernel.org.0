Return-Path: <linux-i2c+bounces-15016-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9B3D0F0BE
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Jan 2026 15:07:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D48DC3017395
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Jan 2026 14:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FC8D33F8CA;
	Sun, 11 Jan 2026 14:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="A5h3J93L"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE83933CEB0
	for <linux-i2c@vger.kernel.org>; Sun, 11 Jan 2026 14:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768140343; cv=none; b=u6t0AattVMvCqHW/xrFEzSe7hQILYxGRtKXaNeJhL3RDDZxO3F21vPiCBZmCSI2vRzfQMU/B0U6re2BHyFzAU1z5NeKxyG/Nj7r9RgxcXzJDoVvmO0MKn9alL5egP9AwpYzBRNIm+74DQ1t8NezgwSGqMH5UhikEobN7KxKyVAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768140343; c=relaxed/simple;
	bh=La7kZA2oSwRqBuL7cT5ghruILrR4PN0GG8fEmUQohxU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EwUX4v2sPZAh7448fKBe7l4eVISnrodM/R/PfqDLd7cqFQnyjgFBwbvfFD2CxIHdeyGPi+Adp4lg3dMK9pOSrnEGIKOkS+94rHf7OZtHhshez8Dh0e97HKn/TYDr32bz8OZOSVrDcB5To9J1kkOeCsXLbvlWMik9V2VRZWTJp+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=A5h3J93L; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b8708930695so81522566b.3
        for <linux-i2c@vger.kernel.org>; Sun, 11 Jan 2026 06:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768140340; x=1768745140; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TXunsOKck5NLaqPP1pj13fhYNQN15zYs+l2jwEoFO8U=;
        b=A5h3J93LIBKbImOKSk/PuMD1cA9Z5C6EZEowbXbuQQWRqoIAibYcsoDlQw3TBJfR+T
         u0BiOjCEJXktgpsZjOdLv3j4NKLAL6vWzf02hINhGw9gtNLdyMqKWd3DOyEcZSvo3jYX
         8ZK4HrP0vXDrFAoG6NVNSCZ3YaSVLqWlNr0VD2t95cLlw4Jh61dPCSWNeQ6oulesS2tN
         wj79fRG7ILgJ3A7li2jIzTbZtZZjrXs2jKlLHtMo0WNwEe++CfnFmumACmX2K4HiMsrY
         hZYR2bZ1STtKcGYBa3SuMqw2+bwsgdTMBUMyBFpULbdi1sES9VrFIvs1UBE/wqWbzzwP
         APAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768140340; x=1768745140;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TXunsOKck5NLaqPP1pj13fhYNQN15zYs+l2jwEoFO8U=;
        b=i8NMut6Plk7qCi1VAgfSGWuAvq2G3sFRocDX5FBwU+MIJOlIw9NbjuPd5wIT+b2Srd
         9RF25ZBVJh6efJ/v0S4iRhzG7NsB+EUzxTZnpDdh0tLz/W7JWx2EBtz3n1IS4Qd/yBp3
         ZJYrgWnj7EUG7zTGroojhBd9f9hat+WmTrYwUdeC54r66Gdr7bRA0HiZmG4k2uRlba7E
         BLDU8JHQZSFKqU1iIV4Ar//s8shaVu38gS8SoJ2MR1EzmUvnAMgJ6GSbB3GTqtl80N7o
         D5lmZ9DVNChSQdgSXh9jrMqQn4GmSjfnkZcRlVSlwINcC3QQa2wseqENqBTUC1X2PVMJ
         BV7Q==
X-Forwarded-Encrypted: i=1; AJvYcCW1NCAwZ+Rfny4bOXlHzi1j7fkmwnwm7F8DvB/KiWvV3nEH+eSbw1TnBTGqiM/Jz/vaYg7N87fLQvg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzNpLU275FwS/donrEQSSWBo/0zpKj7yVtfIaZnXqeHcqUEF7h
	9e8TIF2szq4AK/69ol0VELO7MuaJy5ArIJRZ1WWqpFO5A0fcrlhVibzhoqpAMHHgctI=
X-Gm-Gg: AY/fxX5FLDRZPYTB5xmnRGP1zMDWai1u8AvH9EVRrrcgkWi7hjoXKsaI3gdxlt3JYi9
	G8sJ4zF2L9vvhifM4udW9JEsNg8OQG1fBKCl8jgpiR+yXQ20qSGieebpMvsn94ODU5V1DWI3+pb
	VYdDo/2Svga6phUM+rpF567YMBR7dtCd6Ix+bFTtdy71PBlfNhqMP2AbCXq3qi4SAyFpoF3gU1x
	0KkKzj4EpvT/el9hMfBp76lv2kHVlREGGkEWYrJDc0A6LhWBLT7nQVeh0kJmnNWRi9Z7u1iDvnY
	URvi++6EMr3IG+iS1tAltnfEuyCIKTF8qVqeYsSUGAZC6ZcSbgKPmL1P5lnr/fg/dYfpeKqWqTC
	dVR/cuoBCOuZQGqLNsgnhfvHXoqkg6ccDEJemAC0qsFsyIm4/zhhpHpgGsA1vaY3WAgakV2mheJ
	BZYSkAYbP770sl3zOrOylzx8NMoP3aD5rUtg==
X-Google-Smtp-Source: AGHT+IGAomJOik8MqjiZHm7eirNShLlujIRGUrfTNhxgz3sez9ZGd+euk5Raj7DyHYRFF75x4SXADw==
X-Received: by 2002:a17:907:3fa1:b0:b87:908:9aca with SMTP id a640c23a62f3a-b870908b37bmr200612566b.9.1768140340256;
        Sun, 11 Jan 2026 06:05:40 -0800 (PST)
Received: from [10.216.106.246] ([213.233.110.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b86f1e95273sm439916866b.62.2026.01.11.06.05.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 06:05:39 -0800 (PST)
Message-ID: <05184245-9767-45ef-a4a6-d221f90fd20b@tuxon.dev>
Date: Sun, 11 Jan 2026 16:05:33 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/15] arm64: dts: microchip: add LAN969x support
To: Robert Marko <robert.marko@sartura.hr>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, vkoul@kernel.org, andi.shyti@kernel.org,
 lee@kernel.org, andrew+netdev@lunn.ch, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, linusw@kernel.org, Steen.Hegelund@microchip.com,
 daniel.machon@microchip.com, UNGLinuxDriver@microchip.com,
 olivia@selenic.com, radu_nicolae.pirea@upb.ro, richard.genoud@bootlin.com,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, broonie@kernel.org,
 lars.povlsen@microchip.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-i2c@vger.kernel.org, netdev@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org
Cc: luka.perkov@sartura.hr
References: <20251229184004.571837-1-robert.marko@sartura.hr>
 <20251229184004.571837-14-robert.marko@sartura.hr>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20251229184004.571837-14-robert.marko@sartura.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/29/25 20:37, Robert Marko wrote:
> Add support for Microchip LAN969x switch SoC series by adding the SoC DTSI.
> 
> Signed-off-by: Robert Marko<robert.marko@sartura.hr>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

