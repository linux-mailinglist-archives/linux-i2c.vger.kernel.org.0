Return-Path: <linux-i2c+bounces-15021-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFCCD0F2D1
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Jan 2026 15:45:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9AE493043F78
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Jan 2026 14:44:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 463F7349B07;
	Sun, 11 Jan 2026 14:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ookWjjOm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8D1346AE8
	for <linux-i2c@vger.kernel.org>; Sun, 11 Jan 2026 14:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768142689; cv=none; b=U/8iwdSXgVka0AmltFYxrwRFqnmDDiLQbTO4lPTfjo8n4eUIxbjJAE7z44hZLXKyLfVn3UTDVI7Z2n+lLch8GZ3CoQNqJjtf3lxmhp3m45Lk6elrjKk99H0G4fMpaOA7fhNidSTlvknlcWege7wl7OvBBKOlUmnmyeMBNwX7Dj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768142689; c=relaxed/simple;
	bh=6nDyEm7V4aXX61sF6eUN6LhYpH2LhvalQYGjX/umKoE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D8HmbMRggV0IxuzWpjjOZTL86bdkZG+qW2ol8UnZfIYU7lFCuCmkl/zosBeJDZqEP2c+H2cqA1MC9vriSElR3LuVVqeh+olNQVgUu5+agzH6u351t68vBdJ7QuggssjFAL6wGx4WXT4FLOvtnNG2LY5VTJ8lN+KXsIGARwnjAGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ookWjjOm; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-64d1ef53cf3so8209940a12.0
        for <linux-i2c@vger.kernel.org>; Sun, 11 Jan 2026 06:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768142685; x=1768747485; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j5bvCXfrw0wJAyvC451z7sPKX85y6guKkf78mDKwHw0=;
        b=ookWjjOmWIYoGV8NQWvwlqznn4j8X/9cIu1N+sDUGIRZyYgwPku/XDBbuWd6K70V+Z
         P7HY/w/F6flzBr5IXDYHVEB3ltopxlY2WHQAhLaOCeZR/Hrc1OWjU/V0asR/RmmmcEc3
         tbjCh+t/BspEkplUHtFz+y05jDP3wSvjg3CpDLl8Q1Bh5+kq3Y2fFlpvC/a4tjSPRZgV
         /s9DK4NFB7cEl6zQXNMcpwOkQ/LYani5uYAJvLM+ZJjDPhc1ZKQqnqz5mjqsBNhxaSmo
         d4j1Vc6VbI8lJrz1ATl82rXlA+iKCYIQCQ//J+lmO8a7bTRC9QTjtYFdAUSJ22DHDbQg
         LgTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768142685; x=1768747485;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j5bvCXfrw0wJAyvC451z7sPKX85y6guKkf78mDKwHw0=;
        b=pQ2mlQnnnBFCpyrrF6tj3KrHMNOiugsIaExih5yxLN2MsmRk1R4MtSJXca/oAh9xFw
         PZd4Nznu2TtOBgWU038D3td/XA4IS3TmSdQuEst7KS8Hl7/DVbyLBEPHV0Cb4+r7CtZP
         1SMmP4Ww9DybFvvjzyaFkmzx56C5kSr+JpM+pwx964GXoxb/IYxzGB7bHMpMh7aQ4fny
         icYy5ckRShkPgMV3n7MOrkLjQ34H0bh9vPol/ap10+42wLrRzAZJMYN57wdxCbecrY1N
         QDDcV+Kay8ne0aKtH10KFYlKgE3L31YWJchKNYMAg4tkpuwLSjrjx1bHCgRnIH1LHVv1
         mBRA==
X-Forwarded-Encrypted: i=1; AJvYcCVIx3euQ9YqelQWDU9UHX8nhirbeeDIbnddpYahKEKQ4GvKbCTnIsMpL59NbVvk0ELh4rSYsa23eGg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyplakvBV+YpeDV9vsBo/zKozJaKomwm/RA6g9LB9x5TsANSxr3
	ho6VpqZsHYcI0+ga5CsmY1GTASbEdq8LGHzuOYqYa8jMQT/iVwOGg/qxusroOO96Dxw=
X-Gm-Gg: AY/fxX4atrn+3Pwv/ujmwQRVX4k6AhffFQzvkv9heONucyDuLpc07GoQnUtk9ar2kHQ
	XtJkVblOITthrvyyTc+xu1JMPaXw0+9lm9pebjGo2BFTfogb+OB6+T6XxWs7eXksx61C9iMBKAq
	BHS0BGzkVJAZgLYA69K4bepNNdfzUsxrw3VxToGhtce81LwZJeIUN6ZTwo9kgRV1SxuyXM6ZzBK
	esijnZbQA4M52J5DeYOTU2ldvlZFnYf4xNCb9YKjwqEYiL8dv8SwBKD/gg38uMgalsQCg2a+uUy
	TpmyQhZIDaSM/vtgUp6ak1P4SBF8DIr47MLl05h+WFV8v7sn4b3aAIiQBtYdQH5bYNhLqdbWOJR
	Ou+mJ/AXYakMknYExskMnPbR8ezadFbXEgSipODCI585cNKXSGFbSnOqy7Ej7iYNP3dusAzxg3A
	1BeQ5SaoVhzHZAd7Bc7yEneyk=
X-Google-Smtp-Source: AGHT+IHGUu5OYQ17yt0Sks10puH6ECXvHmROUNTsHAGUEt843jNznhl0Fa7GBLD0pgo1znXFARhYGw==
X-Received: by 2002:a05:6402:146d:b0:64b:4540:6edb with SMTP id 4fb4d7f45d1cf-65097e4ce77mr13908239a12.22.1768142685334;
        Sun, 11 Jan 2026 06:44:45 -0800 (PST)
Received: from [10.216.106.246] ([213.233.110.57])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507b9d44bfsm15272072a12.8.2026.01.11.06.44.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 06:44:44 -0800 (PST)
Message-ID: <ff941a66-cc09-4f57-a511-d253f48d7137@tuxon.dev>
Date: Sun, 11 Jan 2026 16:44:39 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/15] dt-bindings: crypto: atmel,at91sam9g46-aes: add
 microchip,lan9691-aes
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
Cc: luka.perkov@sartura.hr, Conor Dooley <conor.dooley@microchip.com>
References: <20251229184004.571837-1-robert.marko@sartura.hr>
 <20251229184004.571837-8-robert.marko@sartura.hr>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20251229184004.571837-8-robert.marko@sartura.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/29/25 20:37, Robert Marko wrote:
> Document Microchip LAN969x AES compatible.
> 
> Signed-off-by: Robert Marko<robert.marko@sartura.hr>
> Acked-by: Conor Dooley<conor.dooley@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

