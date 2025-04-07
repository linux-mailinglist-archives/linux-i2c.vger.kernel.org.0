Return-Path: <linux-i2c+bounces-10190-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48111A7F030
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 00:12:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E3A93AF38A
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 22:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 024F5223710;
	Mon,  7 Apr 2025 22:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K+IUVpal"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F612C9A;
	Mon,  7 Apr 2025 22:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744063730; cv=none; b=uyHfNUdqtf9uEuFoJBpRs5KRoHxpSguHbzO32mq8FB/Th0WjGe7VtrrOJiapohwgEgx7BhypNkU2M6ygKDQFVZm/JiHrmQ1563qfD/nuUdCyT+xNAkAMj5DI/04+VOAvi+QOxe/s8uo6DA+1q1P5s06J9wVAcIhfK4TsBKldgxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744063730; c=relaxed/simple;
	bh=54XBb2J1cz6K+K2Y0S4+hK5ak1QmaqkJmISoWfRSXRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ys9Z9IFHRlqCnInwesfizK2GNsv+uRejJkjPiTQhzviYe/C5p3so2KLko5APraASj8QxEXnSzt+V0n8sEP+OhjL3/FvxQOqACRKDI7TLGnEZ3swLjnFJUCFNAXA/3VpVwM1wmtBl9Z7+ktjyb6G3a+fSj4CP/29MbSUa/vqZI4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K+IUVpal; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-736b350a22cso4227713b3a.1;
        Mon, 07 Apr 2025 15:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744063728; x=1744668528; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oNTMGrJDQoEEwBXfyh9i4Oj3RCHPqHjEU7TmaAAqA2U=;
        b=K+IUVpalY6ITPhCrRdsQbV1htIpt2ERXpgPef1yJ9X1bJpFeUyS7SAY1nCS3iaaCuC
         h7SlRNLzthyehZCU/yDT457VvRfGYQ7tO1zm9wz/KC4yoJQluNFSmqRG4d0mIPg71fac
         mw2vfZOzvGbjOVQDkFHM4MZaGl5dy35VFK8H9p27+9WbzCfb9EA3U4vvRkdZ2t98u/Nm
         QNhZk/3fYg9i8Nl8KjmGLvwqT6/7FZBYSyTj4PLUxdpzHYBHLOrsdaX0DWlUkSr9zfYd
         o9kRyozlKp05jJ7K1VzZpaqM080CzYLEQjp2qAmIdu1nxsQBNCRn+TCxwgJtdB5qR6W9
         cKVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744063728; x=1744668528;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oNTMGrJDQoEEwBXfyh9i4Oj3RCHPqHjEU7TmaAAqA2U=;
        b=IWzYBWRPNKkaacBO2zbHBKjYffMsgIX+PEr4XNtmWJ1qF9Yzpq33mf3cqfywOMX1DZ
         2r85YCoGRSeX5ZlbK/eEtAaD8Ia1PIT28stfiv+ZCq6c8bPlb+KEPtHyfQ2X7eZ0fjxX
         24ooCxu4t97ULdxegJ8aPEjctjtux0u/Tx689U6J5FfKeyQWI8XEgZjVZ3LNLf7S5QRm
         xzGGnECMj+bN1dUKlS0/To9Eaq/N5qr6FzgGOHhdOnW9/kOtTJMu1vanT74QPkmUQnMA
         ZH0qNm1Ww0R4Lrb99/C9zUKQ+/3Y6zYksWEu/dgeLNKhQd8Z8ARgClLE0vXntFLp7RnH
         DlOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaPvVaQnFG7W2RcFUpTTEsZCJ2323bek3TQ9LFYl09xZPi9kxj/n5KBkqu1+L7ukI7/8Wcps6Zxpvd@vger.kernel.org, AJvYcCUbfLDi8oTZbKctjJIr2sexiPmmVmFhB4Q4Unzy6QKDZKsRoBOuQdHl6ex9RULdoBc4w4MWmNKwrBpfMaI=@vger.kernel.org, AJvYcCV2Fk6EkNxgmwJB5XrkWWwPjMB+yC72kz2e8tMiM9EgZkhiLwMm0RRIuAqiNdbTd9eTcuiytSZ4Nmk=@vger.kernel.org, AJvYcCV7OYLq0Fj+RL1NxsFV2qfeHs4u4Lx5SCA8f5+O5D4O9cnTvmyP4SeGvJc8LlpQnL5gDpBo3qvlzchhATFm@vger.kernel.org
X-Gm-Message-State: AOJu0YwnYlmiT5KX0CfeGKngn3MtnIN6tl5cwoiZD2qojgYECJvcFDuk
	VG/37kU3XNKmw9p8u72znn0+AQDbwwkLztUF545hD2poH3c3wdeXoqUzAA==
X-Gm-Gg: ASbGncsJ1saySPcKHIFAd/iN1Z3tqiCpQg/morbSMycUz5xNX/vbQeil0DI0l9xUFOc
	gGH2j5uH2wbOTMMNbMLcAj2LBvwARSsDEcPbGU8tnxGOUnaiSLhXXXMOhTR3bxZkRnDcNZEXqfP
	eGvd2Kb1kGmildoLzuPgEptbyDvmIswFaNPVMSpxKVv7IUWn0tHl3rtCmJHjzn91RDakfwg65Nw
	gDriZL5dQI5jqmG2zfzgg3ER/mtsVb4bj4gawoCbIJVNcMZXvirUzdUPWcxlgRxlliqKxZffqCc
	WMgBONrDDZalPwG3hNaZ1JIh7xLRw9+EeUug1gA0o1FbwezU5WBTcvIrVA==
X-Google-Smtp-Source: AGHT+IFsVW5/hevkyu7ts3ARTXNxM0wMMj7M2iJVlzOPqve3jnfWSK9GdSuCntvaKDWrcCLNQEEJCw==
X-Received: by 2002:a05:6a21:6d91:b0:1f8:e0f5:846d with SMTP id adf61e73a8af0-2010472df12mr24328408637.34.1744063728289;
        Mon, 07 Apr 2025 15:08:48 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc41a840sm7751496a12.65.2025.04.07.15.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 15:08:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 7 Apr 2025 15:08:47 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 1/2] hwmon: (pmbus/max34440): Fix support for max34451
Message-ID: <d916a67c-dd17-4013-9bc7-6b73aa3ec616@roeck-us.net>
References: <20250407-dev_adpm12160-v3-0-9cd3095445c8@analog.com>
 <20250407-dev_adpm12160-v3-1-9cd3095445c8@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-dev_adpm12160-v3-1-9cd3095445c8@analog.com>

On Mon, Apr 07, 2025 at 11:47:24AM +0800, Alexis Czezar Torreno wrote:
> The max344** family has an issue with some PMBUS address being switched.
> This includes max34451 however version MAX34451-NA6 and later has this
> issue fixed and this commit supports that update.
> 
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

Applied.

Thanks,
Guenter

