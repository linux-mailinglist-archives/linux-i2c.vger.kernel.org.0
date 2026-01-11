Return-Path: <linux-i2c+bounces-15017-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D4AD0F257
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Jan 2026 15:42:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 36F433016F82
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Jan 2026 14:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9619D349B0B;
	Sun, 11 Jan 2026 14:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="c77L/krc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5507372617
	for <linux-i2c@vger.kernel.org>; Sun, 11 Jan 2026 14:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768142550; cv=none; b=QSjoIE2kzRehKWtE8B+cgocnjPRO9SJXtHPGtVqOEs+w/+iKUcVXbuTL9WN2KKXSu563Hh9wE6RTq3EA9bx6p4tQvb2AfvlBAAyWdrcMHAaA6cBf9ImyKlVlGXB8PNq+LrVjhbnR+k8n6amR+pangmxo2v6/7MUWoe1HWk/hB6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768142550; c=relaxed/simple;
	bh=nwibogWEaRHQR0G0uXO7BApOaM+RxcF4pitpiLWDTZg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Q/b/qv0SLwjTh/YvVN4yH6yWAQ8hAVe8F1QjmAbECCqDSLPZ0xfqdaTzP0BjtJvUTK1cigdSpqj0uGeiYZ29BUwVYXHKvaBy/gVdFlMuLO57QSDO/zXEDDsasCn8XpEcpjCrnhRAnHhZ1Gira68DO4FhqADxZWa0hLqVq0XaEFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=c77L/krc; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-64b9b0b4d5dso11681253a12.1
        for <linux-i2c@vger.kernel.org>; Sun, 11 Jan 2026 06:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768142546; x=1768747346; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MkabSAxRfLn0dHpHfPolIqVil9ZYQkOUo+uqCMKmtA0=;
        b=c77L/krcX+Mfr24+FUl4++gD6P5i5AGxy0m+b1eI91GhsDm0sayjulKachXmaIlYnj
         wCOILRVKwoNMqwNVxiWqRG/2EpusMOG+6mI5UGjqQhrvQX/0x8TiI6/sD/LxA6Hib49A
         w1bH1nFUZyZHE7gn2ZaU+W23FBJAHpOkkENkXq3dyjTbNfVtcnT0ibchItmEiZ1Np1qd
         rc0qk+dTF5Uvu980fQlLsCVoritMg6f6VP48BGlFIXsO11MCq0nYJAdrEc8pu+EFAWms
         a9jgZUFbr9W0Mz4E+TgG2PBR7kf7gSyNi/WRoJKvSsndQ8k0T0kWq1Tnsly+JbkLGMdO
         RD9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768142546; x=1768747346;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MkabSAxRfLn0dHpHfPolIqVil9ZYQkOUo+uqCMKmtA0=;
        b=ikcNb+rEGXjwWOjvF9wxxgeorKTr+UdHvM2dxwso+OxlS3Cwifh+XPnJd8fdNr9GbR
         nvm86jmWlJr35NYTog82DQdJRZr07HgpMC+olGxwAapsvoNHFHgcFdhAdExCbVYfnk/y
         7lXNV9oA941tWm2FGE+nPtJPXTKmWodx2pPaFg50iuKqNTq0p52qoVlS3OI03tZrqY2u
         M2VUFpjKj9iIvdJjKZ1GDPjAQ9FOOrtbL3uhVUt1nDXZH+RvjZjG83IqkVEhJN/4IM6u
         hCTkOdEZ76JfORmN/lTSr/PWarPuppGYzTejlE522UqfBKGQm0xJ7rCQdk7g47IGlC/B
         siEA==
X-Forwarded-Encrypted: i=1; AJvYcCX2lEbiJkK+x1UtSS1V5+J7bDE7RBZt+7gCl6vrZIjYqACtz2EonzpiYaGKPBWSkYfq5ETZph4UnOU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcF2sI7sF/Sk8Ha9JwD6e9kd92sv4wq9T+sCpQytaEtKuUUx3H
	U76qs7L6R5DCZgtewqnZZr0NpLkr0eteM00e57xj9gkDDda2IC5yjvNLqaKv+h5W7pU=
X-Gm-Gg: AY/fxX66joujJPDzs8jc5JqT7grJMyYcoZoJ9On8QbGl6HrXy1rFPlhOtFSuKnw7Twu
	HfmznLDHVChDPLKs5FyFw+aONzNpM75mf4WohMu2hH4WaNU6v1o2xyLOFRuWGczDpKGk9LriN3T
	+QBKzzLA7mpsVcMs6bJPvTCjH+RTJWCm4n6Opha97Y39eTXpHeQUwt8lvtq+MvVKm3skBjW8ODH
	zyM5qiFtLYP+WPCLPGPgCV8C0q3np/YXb6d4O+B9Vch9I/kN9Q8p/g7Az091XZdwt1Ed+bW9mVP
	wki/NiZ3M15eD2gdx8ue2XewHl5vc9Qq/kJ+RSj2MaFMkHzv3C0pdKPE2BpjqKyJ2WCQIU8WrC8
	uRL+ZVZ5024HUO7nvqKgoZZ6LUKvJw+oo5SeX/5D9zoDkqpM1NOL4EoRkBRi5Rcf76wHjHGN2U5
	4zmitgEZkBqJwee950JyWr05nwlSh/lJpqUw==
X-Google-Smtp-Source: AGHT+IFonU/ClDvId9huEtx8OVZbpqDSrZa3cVBTJbulbnKxAZxCbWxaUM02TgbsxBJ1Mah6guhUAA==
X-Received: by 2002:a05:6402:1469:b0:641:8a92:9334 with SMTP id 4fb4d7f45d1cf-65097dceb25mr14589135a12.6.1768142545311;
        Sun, 11 Jan 2026 06:42:25 -0800 (PST)
Received: from [10.216.106.246] ([213.233.110.57])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507be658b3sm14914417a12.18.2026.01.11.06.42.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 06:42:24 -0800 (PST)
Message-ID: <2cdac084-4924-4ca2-85d6-2e6d9bf284aa@tuxon.dev>
Date: Sun, 11 Jan 2026 16:42:18 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: claudiu beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v4 12/15] arm64: dts: microchip: add LAN969x clock header
 file
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
 <20251229184004.571837-13-robert.marko@sartura.hr>
Content-Language: en-US
In-Reply-To: <20251229184004.571837-13-robert.marko@sartura.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/29/25 20:37, Robert Marko wrote:
> LAN969x uses hardware clock indexes, so document theses in a header to make
> them humanly readable.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
> Changes in v4:
> * Move clock indexes from dt-bindings to a DTS header
> 
> Changes in v2:
> * Rename file to microchip,lan9691.h
> 
>   arch/arm64/boot/dts/microchip/clk-lan9691.h | 24 +++++++++++++++++++++
>   1 file changed, 24 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/microchip/clk-lan9691.h
> 
> diff --git a/arch/arm64/boot/dts/microchip/clk-lan9691.h b/arch/arm64/boot/dts/microchip/clk-lan9691.h
> new file mode 100644
> index 000000000000..f0006a603747
> --- /dev/null
> +++ b/arch/arm64/boot/dts/microchip/clk-lan9691.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */

Shouldn't this use the same license as the dtsi including it?

> +
> +#ifndef _DTS_CLK_LAN9691_H
> +#define _DTS_CLK_LAN9691_H
> +
> +#define GCK_ID_QSPI0		0
> +#define GCK_ID_QSPI2		1
> +#define GCK_ID_SDMMC0		2
> +#define GCK_ID_SDMMC1		3
> +#define GCK_ID_MCAN0		4
> +#define GCK_ID_MCAN1		5
> +#define GCK_ID_FLEXCOM0		6
> +#define GCK_ID_FLEXCOM1		7
> +#define GCK_ID_FLEXCOM2		8
> +#define GCK_ID_FLEXCOM3		9
> +#define GCK_ID_TIMER		10
> +#define GCK_ID_USB_REFCLK	11
> +
> +/* Gate clocks */
> +#define GCK_GATE_USB_DRD	12
> +#define GCK_GATE_MCRAMC		13
> +#define GCK_GATE_HMATRIX	14
> +
> +#endif


