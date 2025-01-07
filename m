Return-Path: <linux-i2c+bounces-8947-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BDDA0479C
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2025 18:08:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CEC947A1628
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2025 17:08:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95C081F4E3E;
	Tue,  7 Jan 2025 17:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EhoGviDg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2541F3D31;
	Tue,  7 Jan 2025 17:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736269672; cv=none; b=TBzi1mcPw5ySzc6tBxiwniPTAxsJ0uh62mNWX9wSX+3A3gV8YBDBnF4189rQu4Wiju1JsQEzg4C4ftAIJT7g8SeLMsGkNs0AUKv9/xj84FSu0s/mzQxZnb1mK/eKz9jobzNbVYFAoMI6+D0DNNYzfBJ+9WpKqvN/eCRnZzRZYl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736269672; c=relaxed/simple;
	bh=T+Y6iXcDaYH60kkFdgVpQ9Rg8qHxxndfEOWGZzPei5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A2M6GTFdsQRdjyCyhdZ2Xw99YrjbuMsJ0wlTOksB+ICrn+lW3AuMhCtQAHaPIlus9BAx45pKyE0a+BI/L40yZYEnCspiXj+on/7TGWLpSuniURWvGvnNgCTlU+hgMDJReT8stKuKwNgEPPJCL3UNuBwEuoe77WX7naN0UTAUB0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EhoGviDg; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21661be2c2dso212776085ad.1;
        Tue, 07 Jan 2025 09:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736269668; x=1736874468; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a1/XIgmNs19O7VrEuKC/8XgGH8MKVIeqR8vGTjVDJ5U=;
        b=EhoGviDgwS54NXNwUdUg4qvz34m+S+kJmXA/p4wfQalgVEZSMVumMrE1byukZrvdFW
         4KqGKAEEn45SFqLKDFtYTCd4b/Nlo2xSsKXBcUW2UZuPA2y+k2A6X2UuR53bxPYk2kxi
         psJtApPP+j9iKrAwHSIOcRUgsdiw6cU5xc8HyVVYrMj8RIccmF2fpxHnx2C5tT0CKBlI
         xTWMCVs6+ACh/kTjMXWgWb9JuRrajk7YLCAjuu0acVIeF4mh1m6c5+UQ4ueIbrbrvU+4
         yoHVIERHqsdargcy7J4HF8asl3D47uP3UbuuC1sBnJxdf6KL1gl2Rdw1HW5aZwIv7iug
         jp4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736269668; x=1736874468;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a1/XIgmNs19O7VrEuKC/8XgGH8MKVIeqR8vGTjVDJ5U=;
        b=kpYxL8Ox31lzt2NskNvclZ2Rvc2HYJ2cyqBeNH7ZFWhwIYuOugDmyyNWNhKMYtSGps
         8u8309AwjN+aPpfCCVCuUIQJQ1NOUPrbaW1Ja53/18XgV0RiizJSmt8dGfEKQCM9BUoL
         jKhZy+iVOMZKs9VFJ+zeeSgukwTdIq7mG0YIJV3kVKGm6mrcnDlva3HQrD3Fk/jXNZ8K
         lsDMl6j8hMuM/10sygjcWoTuT2BsM+BG5JfQ1Y/wAOjw6MDLhLvYfUtbBPG20WxtLLwS
         4GL86j8zGRSMpHSg+I3psLMo0bBlDrlTNp8p1tUJZZcs2OtTrlr+vz09eiGxa21wm0yV
         rpuw==
X-Forwarded-Encrypted: i=1; AJvYcCUb7Uy+IsK9I1j4vLRaDjkvHHY9GNK/AjilPv/Pt7wl31CODJ0SM6Ketncw3BrXMOFZCpgoo1JLT0pn@vger.kernel.org, AJvYcCVuM4joyQY4flAPtclwtCR6Mt5bblAD+1Kp8qHy4Q/GeTxj3oWEDiVdkp0ncjba3bD8FKjrQDYkXRtf@vger.kernel.org, AJvYcCXBhglVqMZisktjIicOJMnVtQ96dWzre8WPW1qU8XW810SH0tS3cdNxRn221JqlHAw1YvNODsoxvvKL@vger.kernel.org, AJvYcCXQt8xLhpXoilHvG0xERkyasbfNok/tR/N+7ibD4kAeQpbJQkerj5H3LVWXxwfCl4MSxOUKTDd+teISUn3d@vger.kernel.org
X-Gm-Message-State: AOJu0YxGM40uB2lgXqo/Ho9gqxv5gQlB6XCZevKUiWdg5Al7a5u1YC4F
	sjG6e5tvZTB7bXZqlKfMslUcqd7JXycwVo/uh7gvu/Dppb3vcwLA
X-Gm-Gg: ASbGnct+oAYpff6iE5C7AWVPuNbnmcHeyr6fMIO0+UsGgM/jM8QSGM6vM4Yt2/o81fK
	s2ofx40Ay21rdl48KM8w3cgne7kSqereGoTXrXiP1CAQeCqkqtQrHRbuSP544yJI1S05tT8vw+S
	hY/yZi+W/Z8bgvP0lVC8ASIemn9UQCLarPqlWugZl48oM/7XDgI41nXlnuo2ySI1RUWhgPop7K4
	OIeUjo5zEfV9xR6EYgSewe/RurbTWG7n08Vw8SRi7IkCgYM3GHK5fnqQAs3/apldQdZFA==
X-Google-Smtp-Source: AGHT+IHzwOlVl1byvEUZVmul1KsE4nwD0E5VfC2yC9z8ApO7up1Jg3nNX6r4UlAb63h3YDRNpTqJ5w==
X-Received: by 2002:a17:902:c40e:b0:216:2dc5:233c with SMTP id d9443c01a7336-219e6f0e6e2mr881813935ad.41.1736269668450;
        Tue, 07 Jan 2025 09:07:48 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca04f46sm313137695ad.263.2025.01.07.09.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 09:07:47 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 7 Jan 2025 09:07:46 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: adm1275: add adm1273
Message-ID: <ce9786ed-191b-455a-be8f-7963f5c99ded@roeck-us.net>
References: <20250106131740.305988-1-johnerasmusmari.geronimo@analog.com>
 <20250106131740.305988-2-johnerasmusmari.geronimo@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250106131740.305988-2-johnerasmusmari.geronimo@analog.com>

On Mon, Jan 06, 2025 at 09:17:39PM +0800, John Erasmus Mari Geronimo wrote:
> Add support for the adm1273 Hot-Swap Controller and Digital Power
> and Energy Monitor
> 
> Signed-off-by: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied.

Thanks,
Guenter

