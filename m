Return-Path: <linux-i2c+bounces-15024-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF3DD0F36C
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Jan 2026 15:48:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22BCA304C6E9
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Jan 2026 14:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04EDB34AB01;
	Sun, 11 Jan 2026 14:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="g58+wShN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB68B340263
	for <linux-i2c@vger.kernel.org>; Sun, 11 Jan 2026 14:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768142745; cv=none; b=u6dCzL8EXToaTWcSHfRX+SGAQWrSp0WD5D44VKQZ9BCd/WhI/Cx6T3u8nLuu04wiiSjspZVuyEZT/B9AH24KfL5PZujplCz2ttiaz9qlBQ2+VfjR6SCYLmLq5NbyFq0iBYnZXoWADsKrSq+FpXg3Tng7rTse1P1MUGfsfwHzLBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768142745; c=relaxed/simple;
	bh=8+o9CrQDP9rR7vhYrkmBD4TEK1Ah1Um118V33OBjIn8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lu0a0WjYjVYLfZqSSAK0xesUC1ihYDusWrQ5db3FcBGYYD8s8Vd7kJuP0DXXd8ApLsjD6uiEb8XZcojBU2M88S0PaU58GEe4JRmjgce4FGAC+QWTzJ9VYjyo8sSJhY2kfEZ4QOo7EmeiKD/1YzMw2Bj0KWiA8n3ZMUND3lucgvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=g58+wShN; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b86f69bbe60so99401066b.1
        for <linux-i2c@vger.kernel.org>; Sun, 11 Jan 2026 06:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768142741; x=1768747541; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lfDtjbPnZQpFER+nbClQWcn44IBaDvTgM6H9iNz+Pz0=;
        b=g58+wShNUGm4cSq/cIFs5BcjtBtziWlVwOnRIYJ0JBVThU79/8vxkDEUyOzt7AzJBB
         cTZ9e0Q9nDikPkEBLmzCCkAYBMC9A64/OO6AU4Ed+EOGygTBTQEKuknv7Bvpc0Hq4pfW
         tWuCEazhna5tzsEGgmV/QS1mDV7AI8F7irWQCIvLFAdd6UBceXKAjkUon+m8Sp9IuWPs
         p2XYZJYaezhBjl4awlNqxLX5lYDftU2jHR0SSz7JmKdP4CM//mkBYchNBUXZFooCPe+6
         dp21GWl3JMqXh5qWiJlPzG2nBfXylKpA9kssFDHJxDnXDPKiHgK0Z6Kpaw+F7SivT7OY
         h9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768142741; x=1768747541;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lfDtjbPnZQpFER+nbClQWcn44IBaDvTgM6H9iNz+Pz0=;
        b=KMhU+5kVdajqp9RFeApi6ndKtKh94yGdBkqFuU5iCxVo41TSLZ+fYG35deS3eOdU70
         zAOg2yl0AxYcFvIi1ZMo33LzxfuWcS/Lh63dEenHhbinsOx0Yr8dnj5aO4o+xFa4hlIp
         Fz1BpV+z9WGMsE6RB0TtsR3VH4yeN/AX270w/vnZLYgHSZBZjztVnZcMM5vTQ7D6zJHK
         XwbjOn6pBCq1KIJSaYW+2w40W9a2IYZX3GS/wphrMUPVwE6yTm+cejtlmtrnD503YanM
         dw+xdKIGEnS09rGecQk/tmepjVkZf6PeY7kNyi/9lxK353fjob2MvpsbVg4eTYETLvJg
         +sng==
X-Forwarded-Encrypted: i=1; AJvYcCWjm59LunvxUXYmx1Dx/rFv6YmhVF4//PpKdfdkEyOQHL/HgOgZ7Yaa7GMQdVBkaSq3vsr9stt5v+o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzB1mipnsr206qqGSzHACGz/ghoRnsclWdqt/aXH1eK4vdFhhz
	aQzs2cU6HmK/0OEjJILAy1b67iWjJjZHpLPcH8LWwfz6b+H+oi5NUEeTlBBvZix9/vc=
X-Gm-Gg: AY/fxX68WK6uluYzYpQadGdIFHVCVUEI9KjnV+G/SPIotqdTgMDN25KL9afqnQDVGC3
	xKbHG5aY1puKVes+TBh02LRYQAL4mJE0qu8C7jiUIQdk84r4jSS3kd18V1cTPpHfcnHkEv+d8C/
	aSMTixlT1RWoiM0gadqQkSZzUTu0NV666joamn4Taoikt/feFAryZagFsUBZXQ+clSFId4Zbqtl
	+4En25FlU3mCgssfIufkWjfSYCweMgSeMFnF2HIwE3MhfPcE9E8taNpYEqZJFjzudpypS4vZG9V
	LglMxDlyNAg1Z24uH2MxNoxUK+FU59rmRRt71au9/Wcs+y+Mmv5LxkHr8ORHC4Xi35ZsUgUTZUo
	6AOGmIAvp0yXUFWmTuvWhyu4i5/ZZ3NV9HqFx2dJKU+rjgk9DD8gVj+W7XaK3Iiy66cMbw0cGSs
	dYZD0DmF4Bkd6kpmUEWl3Kgi4=
X-Google-Smtp-Source: AGHT+IGzzRSG9JPiSsYLBto386guzGNBLdjrzZm8+JQDEKUQ0tWs5J3FidjE880cd/bBYxLZJrvW2A==
X-Received: by 2002:a17:907:9455:b0:b3b:5fe6:577a with SMTP id a640c23a62f3a-b8445169517mr1585237766b.8.1768142741298;
        Sun, 11 Jan 2026 06:45:41 -0800 (PST)
Received: from [10.216.106.246] ([213.233.110.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8706c2604bsm260020066b.16.2026.01.11.06.45.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 06:45:40 -0800 (PST)
Message-ID: <555883af-66da-43a0-a4d6-bd3bc52581b6@tuxon.dev>
Date: Sun, 11 Jan 2026 16:45:36 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/15] dt-bindings: net: mscc-miim: add
 microchip,lan9691-miim
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
 <20251229184004.571837-11-robert.marko@sartura.hr>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20251229184004.571837-11-robert.marko@sartura.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/29/25 20:37, Robert Marko wrote:
> Document Microchip LAN969x MIIM compatible.
> 
> Signed-off-by: Robert Marko<robert.marko@sartura.hr>
> Acked-by: Conor Dooley<conor.dooley@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

