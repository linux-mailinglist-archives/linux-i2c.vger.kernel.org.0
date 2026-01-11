Return-Path: <linux-i2c+bounces-15022-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 29390D0F315
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Jan 2026 15:46:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51752305B5B7
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Jan 2026 14:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 589BD34A790;
	Sun, 11 Jan 2026 14:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="K9ADx+2q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBFE34A3D2
	for <linux-i2c@vger.kernel.org>; Sun, 11 Jan 2026 14:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768142711; cv=none; b=jQq/Tw951WwixEd5I0VS9X4viPdBwh0WAVBsNykjYOi6ZPCyhh407BPXTINNgNhQXyOgfFTKb8Llttr/BEuR64IiMFeIDX6p8MJRE2XcU2mXbFYI/+k+vngH0mXVKdAUly57Y8JxeG+DyZGJ9n+h0tnhcWUSlDp+A67RLXJwUs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768142711; c=relaxed/simple;
	bh=gDiL7diPPllfiqdrICUaz2pklt2cpfwEzlq/42pPJS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V6sbWRdwMSl8OrPv4yOuwuAiioTyWvljLJrfT6sArFUjqFm+NcdQX5FE1q5625lvb46BMN3Vpd8+ozAUhvIJHckCiv4gOZUqZEepuKXo94M4waSauixIB5FKGEfXhF9BpQQ4BgBi9xQFI70gh7XzejlwUzYrP9O+NSQlRzl2Z1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=K9ADx+2q; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b8710c9cddbso52188166b.2
        for <linux-i2c@vger.kernel.org>; Sun, 11 Jan 2026 06:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768142707; x=1768747507; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bR5pMB9Z21CNTk1B6+opWEfUH+WjtdKh40K9u7GvYSs=;
        b=K9ADx+2q85hi1Y4+enhphqyqyZpZ50jBbUQejVQ9+lAyuPt1J7eUMJcsTH5Bdu91+/
         8uKGBqR2SSjJrxX/lCcEn9SiYTF/WVBgYkIGEyzvckX0wje75OhEfcmjaMUigKJwIZRs
         e06XzNxpm7i19SZ0LSNbNWyN8H9SmAT8nuB4Q15uT1Uv8OpT/U/AiGflgqftkaUx04wS
         FC9tKAq3ltBYaTZkCdn5SXY0EGMBHqbdzuQwDPZYYV0jMRzS64ApUPcVOjXPvySqbrOy
         U8+WS76PxjSbXLX1BI4gqBrNFoWcvXvKZgA6KNPOhcW9KOI4VzIXbxSQNQP75cdKv3IF
         4osQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768142707; x=1768747507;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bR5pMB9Z21CNTk1B6+opWEfUH+WjtdKh40K9u7GvYSs=;
        b=EKQqVViPuLReXNFzqG7BzXc3MGZ/myGQ8Fcr7A58xbyzJ434Rlw9ShWvtqlh9tp6fX
         QGzLU0PmDlJrX4YkK0+a7BCMifRGLsa5RwAY3cArwCpZ3OZrKf+ICxpmmvLMgntokFcv
         /bD10+Y1U8EyPyK6DQzKJguAkZzEIh/CsaY4SfMSA90V8ynQrF1hQvitPbwRBIUm8gZ/
         GslZWltgsialoCfMNzGTv9G6R88rR2P8ZG1A+BuzP1I+c3qubJgnuFgXV3A75WhAVw1w
         IFediYc82jxu4gsG39WWWC5l/iPXrKYHiSLxqXHsI3xfhGcfMvsHboXfs/e2wpAqg2o2
         GhEA==
X-Forwarded-Encrypted: i=1; AJvYcCVrM7YpWkoVeHS0Xa6uSecl/A5eFgXnEorj1BGfZG7KE36fgakLHnBIYiXHoI6ekJ+u+vQlxg7bKqw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9u+qkXGsoqpampRYR0KHT4/P479Y4A77DIgp8zITlxyMG6ZNv
	7euBVqVr2sl3J0zccRFLcZYepNcuU41Tc3u/KEymuiROj3Kge+YAUbfaSMMMRLslH6M=
X-Gm-Gg: AY/fxX60S2gQwFzVMkGExmIM/DeXKQP95OeEF+5lPslH+nRiIJOHDRezu9H6+B/6cRz
	WoYIVDc3CUbZ0iosBS4WceVlcmwLgbCthnX5ZLE2FOAZy82OXtMUFgQpJWxRr/hm363seIZCHqS
	qqiD8M2JB47RuaTxCjrOcNNkH1QWbrXl+pGEwiqnBv4+Lo9DM2y5GEh9HIR79C0LUMk/HM9XiC7
	5dKiMkiR+cJd7UVDV1M2Pya9OYwQ3Pi81Fa1LscQTOc+q65J/XOeoOFU6DI5bt2YRyTi5JF59+z
	DZNpWaRFVSp9Gr9vF/fYLb8023vDnHUMrZsEm/3IoM1ZeZThFxLQ7u81Lq6gyJPRRXBmheVh8Gj
	/f8UcHb8SrOJWX3y8VO+sV5ZvLMuEjzM0l3zYU69mlpe7L02HKNhky5ntWTOFnfX4lHgJt7qkkw
	cWj/9SR7Vhxk7Y8GDF79dVfnUwuZDm2hODew==
X-Google-Smtp-Source: AGHT+IEnRprofKW6iUFW+aOMnt2p1AYruny/NjK8tSS/dtcvBYVRc/tCV4eudi2xBk8lGr0c6zLI/A==
X-Received: by 2002:a17:906:dc94:b0:b87:b87:cdbf with SMTP id a640c23a62f3a-b870b880077mr194416066b.53.1768142707046;
        Sun, 11 Jan 2026 06:45:07 -0800 (PST)
Received: from [10.216.106.246] ([213.233.110.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a235c0fsm1673227466b.9.2026.01.11.06.45.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 06:45:06 -0800 (PST)
Message-ID: <19f25a94-fc90-4298-b3ea-58bd66cad11d@tuxon.dev>
Date: Sun, 11 Jan 2026 16:45:01 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/15] dt-bindings: crypto: atmel,at91sam9g46-sha: add
 microchip,lan9691-sha
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
 <20251229184004.571837-9-robert.marko@sartura.hr>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20251229184004.571837-9-robert.marko@sartura.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/29/25 20:37, Robert Marko wrote:
> Document Microchip LAN969x SHA compatible.
> 
> Signed-off-by: Robert Marko<robert.marko@sartura.hr>
> Acked-by: Conor Dooley<conor.dooley@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

