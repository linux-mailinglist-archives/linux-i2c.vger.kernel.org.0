Return-Path: <linux-i2c+bounces-15023-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B960D0F361
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Jan 2026 15:48:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA73F3078DAD
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Jan 2026 14:45:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52BD934A3CB;
	Sun, 11 Jan 2026 14:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="pDmecLIQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A8F340263
	for <linux-i2c@vger.kernel.org>; Sun, 11 Jan 2026 14:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768142731; cv=none; b=d70Audv0LHNeOdOPvcxGdXaunNIW9HTgbmUTj4Uo9gqaHEXZw5tz/iSztqyEl2jFqSUud9BwNqe/amH8qStRdDD93hCTge+xfXC9xn4aULQGxHBhLU1c/WkPKwDNbhVQy4rPQGcwS/NncCVC+7R0Pt0ykTzC4EQVkP2kaC/FQ5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768142731; c=relaxed/simple;
	bh=YDHNGLJfluFKzT2RaL2uk9Ugi0ok4Sk7jIeMDkApg6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qP/rvb69WZdcXn9NaX+8VVCotdp7ZQ/DWIgAlpop2T4v9KOaZoHfNpXj62pij2laDXiALnKEB/V5bsuY2xgOioMWfm0QunpC+TcKQPbDeo4MUE2tK4pIB+Cfjuek/NZLOaCdmeP2Azj5dlzQFLeD4Fn82Fxg94WWbSpOkuBsFwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=pDmecLIQ; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6505d141d02so9069103a12.3
        for <linux-i2c@vger.kernel.org>; Sun, 11 Jan 2026 06:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768142727; x=1768747527; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I6rwalswAWwTHAknUrP94zFyJo4NhuP+T6GegkCWM/M=;
        b=pDmecLIQu+e0yUjm9QEFw2IwtSYDlhtvRT2Y/dlNeWGD5EjtYYHo/7un5skZAdBoUv
         NpsykCAJlPeeQMBPdOdEqIC2m6t1cvpqcarU/BahIV3lMW7XKkJj1ACOSxQYVxpkfIdX
         jv6KtxLRPICuyWJPwXnicMadzjdG/zoRCDNIuEXOC/bcZFPA/xK6Bls7TSNg86ruzF+r
         z7ZeRdkGXbOxlB0Tjh9g0XkDTlUdNo1uJgMT+3HvWQqpsiuRRkMOB8fDhp9Pi8WgOFEJ
         IFKk+YlnC3RTkpu/b6m4eXEJFYRVfrUdstAa1sDhFQr5vffl9W5Hz0llDMVYR+S/0ge4
         jAtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768142727; x=1768747527;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I6rwalswAWwTHAknUrP94zFyJo4NhuP+T6GegkCWM/M=;
        b=kN+LxzQzQnxs8n+TtnKwMQPzmGmagTAG7YSW8s1I+/No8vuiel5FG8IYJMmIwU7Zzl
         yk/97rpxYIR4hq560xrJhUssqz5x1d9PDi7EjBBiQhdBlLHWbXRrwRGALPQBey3FsjQe
         UUbA9wire9tR12hxBZXwXf2FFS5yGCHycPLR5sIVOTwNGx2K5zxU6NYe5xPZDxbaTLNH
         taTE/aLLQcVkWzwyQpIcCbQJzEruzPidzCJTvPUTfnzH1Jc6r3wVmIWwG4RZUJLQACU8
         dG5iiYa7S7QCl94E7XiT9ASqX1IwLTGWDHPHZFt8DWFrlTEs+OYvDZtSSBDTQvjY6oxF
         fOTw==
X-Forwarded-Encrypted: i=1; AJvYcCXC+65C9u5w3bg/ZOXpGHc9F3s/a08n6H9l7BbxdMc91urUaW3xUOTrOqm2sFJk6GZJgxA/ffkV6EY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZE3LSsibuFut1m3mJ8LOe10f0DvA0rGoGFjo9UAnMDrLpHqsY
	kChD7oFCLSZw6BBcQqrtzESl09sh2xz0unP9JCA8Qxi9Y+dxT6a6u4/eLtT1IjVZyAY=
X-Gm-Gg: AY/fxX4sypvM0KdXeJp0bmx4zatIClMGAsrANLJSdxpOkAQbnpetqpK2xQsX1DKKI01
	bFliY58xHPYhyYQqqffLCchvEJil5yJEfi2xZQM85b1SLBWktH/6pt2MKKafQ+fdREurM4UcrEK
	5dCqC20Ujtq2celvxkbhIaslk3xXHpgZtDLzUO200IjKTMHXwYWIwaVCgCY9Seea+YQ+C4HNvtN
	1SOjonNkfvO2Ylukx2Hw/Pg/VpXm8uf4ADa4+Iv4J3UK5owSWAnn/Dfx3Bdivim8IFA3OI59n9Q
	cGbSc/xSOs7MGQp1pPUJ8wfB4N53BOWTSoJ/W1SbNT9188Z5UPSiLKFOEab16eRqRS4tBNUpN7P
	EiQ9pTzh/Ve+DjAunnu82XQLU8ApJQC/gHg/2sbU2vNhoL+jj4ixwEWmyRFn6oVhX2CXfKH4QL0
	0fmIai/rqsIbJXXdT+RnY3SfA=
X-Google-Smtp-Source: AGHT+IGvS7IBApFn5Y6caZIpVWCcEKkW6+CPDWe6wxvm6P/BpWNKX4ZQoy1X15u9d+HjeZrWR8LDZA==
X-Received: by 2002:a17:907:6d10:b0:b84:40e1:c1c8 with SMTP id a640c23a62f3a-b8444f4afb5mr1764352266b.33.1768142726523;
        Sun, 11 Jan 2026 06:45:26 -0800 (PST)
Received: from [10.216.106.246] ([213.233.110.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a56962esm1699865166b.66.2026.01.11.06.45.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 06:45:25 -0800 (PST)
Message-ID: <7081b61b-599d-4a59-8a27-291c55a0e52a@tuxon.dev>
Date: Sun, 11 Jan 2026 16:45:20 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/15] dt-bindings: dma: atmel: add
 microchip,lan9691-dma
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
 <20251229184004.571837-10-robert.marko@sartura.hr>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20251229184004.571837-10-robert.marko@sartura.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/29/25 20:37, Robert Marko wrote:
> Document Microchip LAN969x DMA compatible which is compatible to SAMA7G5.
> 
> Signed-off-by: Robert Marko<robert.marko@sartura.hr>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

