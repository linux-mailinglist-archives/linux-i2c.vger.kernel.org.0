Return-Path: <linux-i2c+bounces-15026-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 531E3D0F32C
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Jan 2026 15:46:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D034B3040110
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Jan 2026 14:46:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45D2A3491C7;
	Sun, 11 Jan 2026 14:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Qam1s0sk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E330533C1A2
	for <linux-i2c@vger.kernel.org>; Sun, 11 Jan 2026 14:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768142804; cv=none; b=FvQFqYE8I8OwznKYzugU7N4M4gKNl+KAzugwOOhsovvFEc1Nz6ued2YazFWw1A1tfsmwemZhLxpbGSJlsHLvK/CbAiCHIu/92wsRB/OWpGcAcjdo7K4VYTU8iI2e4IeakYds8CyJ0NRhQDpKVQf2yXxFr2a5EYQ05DA+zM0rJqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768142804; c=relaxed/simple;
	bh=L2SAqNmu61MHKLD0agICr57xkRB0iGTI91g9rMmmRgU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YPgyJmwsblvn7ILVJXee8+WAbfPUYdtL/ha/D4YCrWoPIhhkZ2xdxuwg4Fv2MRGgn1sHoJOXyj8HnjNFVOssMI/5hZIf+2/Ep3O1vkZ+ydOkAiJVwNq2N7XuHx4G+mxvoYfcOcfGCby/2/MZJtFSoXnWQ1NWj+LMmQ9laHSEmmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Qam1s0sk; arc=none smtp.client-ip=209.85.208.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f67.google.com with SMTP id 4fb4d7f45d1cf-64ba74e6892so9306490a12.2
        for <linux-i2c@vger.kernel.org>; Sun, 11 Jan 2026 06:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768142800; x=1768747600; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=998LIQD26tTlqKe1Nt9hPTV8z5SAR5Xb1tsWRfDj7yM=;
        b=Qam1s0skrMJn1KfWZxSe96IKP81h22WhBDibkbxgWIUwpBSQNSN536T77TtojW3nxq
         kLFoyDPha3E1j8A98VyQxWws3pi3XVHEjYrLvuh2AjL/vNPcDkas+WMRnHVItePkIK5p
         yjOS8EtefDgl07rBXwJ/tP65Y/Vw1sE6EhWNK6+VRchLP7n6emPQxYYi/5H9xtlL6/P/
         ns7a6XFDQO9GAFW8hheFyqWsQk6Nsce0VyXmYi3J35Jk+Y3cTtzFIsWLZLPcx+gnyCUs
         9g1Vv5mta+IVdq3zoLjpJHhxhqt9cTIhUzchJVlA7JHMdhTyomaoN/CV+gPsigwenQok
         wOrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768142800; x=1768747600;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=998LIQD26tTlqKe1Nt9hPTV8z5SAR5Xb1tsWRfDj7yM=;
        b=j0Z3QstbUG7Hky4hdctrtJ6p3q6HoWvVg+OfgW4twJm1JpArERWFw9jQ2ggPEhv6rd
         HVa5lsxpN8dMztClVzyIAIizxDHBz/VMx78TfOm8ms5YzTBiTuqC9SavQtCiLpXHPvBp
         +JGKRDuVXxQqSZ8Oni3icPm/u8kCaP4EJb03Fw9xXi5JLytzSHCtC/xUWL2MQMC/xgGh
         p/4Me/26KcrL/K4N2ushadLURqU2g2WdNhNBxy9XOJ/TNGS616Y1yYMCV2pxMTDMOhoF
         GrrkNaD4KaiOskKhCPQigE/pa0XAe1vkKGL5zxYEqBUGvUYvH/aalGVPNrvX9MKTlqg5
         S+CA==
X-Forwarded-Encrypted: i=1; AJvYcCWCuEiEfuU6uPkk4gnPpD89d74C87GALl5bVkm3mAw4AqSnxwpLcvbJ/eFQ/USFJyB058Teq216XDs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2iXkfivN6dqq88jcyot1O3FoAMSlCPSJwgCk1C31/1laPwtis
	e20trgDqTCMu3vA0KNjW4g0WptbhLUbcre9xFsDrfQE3IMXHG+WrMtGriAvmUgyOOmI=
X-Gm-Gg: AY/fxX6VSuSnKJKiw3uwcZY7s7BX4xliC0oUayvfWQ8moTwAwTkWjgS0XQ14Dj849Xf
	etw4a+D9e5wf/0xUHoKBtIZXLnROnq6NpurLQk9ra82P/i33Q1NRPVRy8FQIoq833c+Ph8VOrOx
	6rVDSpOiby/FzcpIlK6YsznokUzkJ3boVnUj9Zp0rarKk07Wb2qOsOcUue6Fxi5HXtuNIxRy5E6
	9MSAsYBbfJPmq8EoroB11D9GCtKotlLAHroBz5CAPw+sJjRrR+ZAvOIPzowWRzeC2ZUs9NzUf+I
	wlkDyN5/8ToKTIlfUmsaulrncIuhR7mmZYXVKuvA/fTg6h9A/3qHn6bVp9/ZbqeUyaXG0XpPBF1
	k3DF7H7FtedrTZ4oZPLX8MJe/s7hKWOFFLERQ3yT1+zKC9ZKCCRkzt6HpQGHUzHjkBZFJCQYWRL
	SaQzrgPfs4Y8YOCeluFO4jf5I=
X-Google-Smtp-Source: AGHT+IEEnxtsLJjgQBqtCtTKdKKJ7nKe93tErDCONdjzSpalyD4Cf1jf8cogFFk+Jwao/l06OHgHEQ==
X-Received: by 2002:a05:6402:26cc:b0:64d:498b:aeff with SMTP id 4fb4d7f45d1cf-65097e8e49bmr13880469a12.34.1768142800347;
        Sun, 11 Jan 2026 06:46:40 -0800 (PST)
Received: from [10.216.106.246] ([213.233.110.57])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf6d4acsm15318996a12.30.2026.01.11.06.46.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 06:46:39 -0800 (PST)
Message-ID: <0ca4477e-cfd8-439f-946f-9d0205b62c6a@tuxon.dev>
Date: Sun, 11 Jan 2026 16:46:33 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/15] dt-bindings: arm: AT91: document EV23X71A board
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
 <20251229184004.571837-15-robert.marko@sartura.hr>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20251229184004.571837-15-robert.marko@sartura.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/29/25 20:37, Robert Marko wrote:
> Microchip EV23X71A board is an LAN9696 based evaluation board.
> 
> Signed-off-by: Robert Marko<robert.marko@sartura.hr>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

