Return-Path: <linux-i2c+bounces-3661-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E858CDB51
	for <lists+linux-i2c@lfdr.de>; Thu, 23 May 2024 22:24:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ACDE71C2143F
	for <lists+linux-i2c@lfdr.de>; Thu, 23 May 2024 20:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7803B84D35;
	Thu, 23 May 2024 20:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LtVdXSrZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A023D84A50
	for <linux-i2c@vger.kernel.org>; Thu, 23 May 2024 20:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716495856; cv=none; b=rc71WR2lRkI1u1Lz82YE79pKdGj4EkwJKacJnb0T84TInKYC8kOFEE2LsLEV1KwlVRbeCkvyhhfjZK+X22xAwtC7wyAC5WxlorlPIVZQQyTmGF7LEi9To0uLzSXksispLu4yUlH/9QIB9h9n7aP8DdBENbWKtjHmvXxAUX20nPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716495856; c=relaxed/simple;
	bh=trLp/zqMsxPkYHNpAoOaUAFirZpTDPAcqutqKmdqkvo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SIJXx2kkUeNpFZCUckuN/3IkJAzMaQuqHo5RfHM4Xt4JwC+8U0HZ01+DXc+kQxyFzauxzSZ4+wkon7FrmxaxTSupUSbth5ClTMTy00/Az0uqMNhaEugnRloz8HyFOxA0BeBw6VaAEeDMq69ds3c9eSwwUHGFAr16Z9idXoSJ5AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LtVdXSrZ; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-57852015f19so177503a12.1
        for <linux-i2c@vger.kernel.org>; Thu, 23 May 2024 13:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716495853; x=1717100653; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pLYxifaBnTwd6v2VqQzlnZWV2Y1C/HZmXP7m6TLRDnI=;
        b=LtVdXSrZMCsgOfKYNo2WYLkvO1759Y+cusrAS9k2xrDkeNqvtzMlLJQxBO2wbN82Lf
         Xh7O5lY33oQ/PIm26Hg82Ouevq8T44F5UikezP1CMGMQId5w0gWKnnT354eWdNk4XBpf
         nVwfcgOEUmFOGEW2ntp0i7mby9p1ihLYLQhqlPhs3li++/7c2EgSVzi7jDls/UkaAGLr
         FeYFrLC+cvG6gxQF9939PoJh68k6xedj1QoY87zVlQQneEU67QbhocwBtbVn3WqUqdNT
         kkk4QuNE/+BB4ydsWQKGcKAp5axPV4KH+brd/fOEbyuJ6eUAuD5Mi3eyBl1ZAJwCMI99
         zxeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716495853; x=1717100653;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pLYxifaBnTwd6v2VqQzlnZWV2Y1C/HZmXP7m6TLRDnI=;
        b=ixpqtxCHlo7TRuGiumn4nOmAT8CnrnSE7XOpAyDhwTlBHeH8Qty6SSTibV93oAw0jw
         0UQpWwWIGHpmu3FQj3uij5vpFizZPtqFo0ImoxZCpaAnqwW83sySdNlnU46pHi+efvyL
         KTPhFk3FPyIg+RJGtVHq8RwUe5O6t545wgJ8/MM5FXaWfRzmh/CIi1OOhKqekKGBN4Jy
         wxiyRV8i37IaDkCWYnvw/Wtaf1C55RFkJXN0aWNInDHgoRLBVTlv8uwN6SOgmemmJXHV
         4P1O2NiOg2DkHlJFt54dnIYuHGozfq92j02F+Ahd1doUjevF0/lstx8jnr2aBSBD3XWU
         FiAA==
X-Forwarded-Encrypted: i=1; AJvYcCWifNWcMLovvYJo0i7ckXLC00x2wRfutfA3snmNWHZCCJK1JNQj74sWh9O/yn5tdCgQzUvS/WNxtwy5W1pAx3DJHiIP67k8qyhj
X-Gm-Message-State: AOJu0YzYNG7GnfB0TyBAM+MJ7968Ul1TPQq1Z6s7IBvEDHbPk2aBeQRh
	FHhpBpkd7DGl23hNfXxL2USYPloeivnDqXA0muzIVJQCAz9K29ZxJhYAb8xyZ4mw9DeQ7NPdWAE
	G
X-Google-Smtp-Source: AGHT+IEpQcnn/MO2wXSF2wIEtLlbmHIff5/dN2bTkKyHBGbFjuDdyMLgtnQ37NUeIArnmaObSLQcJw==
X-Received: by 2002:a17:906:34d3:b0:a59:ac10:9be5 with SMTP id a640c23a62f3a-a626250e4dfmr40903166b.27.1716495853059;
        Thu, 23 May 2024 13:24:13 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cda5698sm5134066b.205.2024.05.23.13.24.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 May 2024 13:24:12 -0700 (PDT)
Message-ID: <acced98c-79fb-4c32-abf3-66fe93031f36@linaro.org>
Date: Thu, 23 May 2024 22:24:10 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 17/20] ARM: dts: aspeed: Add IBM Huygens BMC system
To: Eddie James <eajames@linux.ibm.com>,
 Markus Elfring <Markus.Elfring@web.de>, linux-fsi@lists.ozlabs.org,
 linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Lakshmi Yadlapati <lakshmiy@us.ibm.com>, Mark Brown <broonie@kernel.org>,
 Ninad Palsule <ninad@linux.ibm.com>, Rob Herring <robh@kernel.org>
References: <20240522192524.3286237-18-eajames@linux.ibm.com>
 <2fe45df6-01a2-488b-99fb-5ee20491554c@web.de>
 <910b18b7-3717-4087-b028-fcaf5f2a604b@linux.ibm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <910b18b7-3717-4087-b028-fcaf5f2a604b@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/05/2024 21:00, Eddie James wrote:
> 
> On 5/23/24 13:45, Markus Elfring wrote:
>>> The Huygens is a Rainier with modifed FSI wiring.
>> Will imperative wordings become helpful for a better commit message here?
> 
> 
> This statement is a description of hardware. I cannot word that 
> imperatively. The commit message is imperative - "Add Huygens system".

Feel free to ignore all comments coming from Markus (or implement,
entirely up to you).

Markus is banned from mailing lists and most of maintainers already
ignore him or already marked as spam.

Best regards,
Krzysztof


