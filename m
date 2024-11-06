Return-Path: <linux-i2c+bounces-7846-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5C99BF282
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 17:04:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 931E52852F7
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 16:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60476207A0E;
	Wed,  6 Nov 2024 16:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QHHnBIlT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FDF2064F3;
	Wed,  6 Nov 2024 16:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730909014; cv=none; b=loNXQEwgs8jFUpAjdGddldY4BvY7HJYYa794iirQVfPNtTZ1GXcLefkX6tZDmsU18b+lG+wm4vjTyCA4mxGMU3wMhCokPDzZcEfBeHyPo4U3QHE9L2fRis7R7U0gHgVWropBI1aIKSuDZXf35wlJsZ5dc2J9EzlskAxSub4F6DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730909014; c=relaxed/simple;
	bh=eYa9wlnu9E3P2y1lCWwcPAwQK8qAERsjwqOa/z4hWc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tEZ/guxHexr2G2WS4b2K1fM4lpVmrsl7XETLOm4Y9XfX+2TZi8N2idLnEef0C2xgEshdqHji66b7Ebt0rSsLUKMV+5YVNJ/INKPcA1tH5I19ZQu2KWvtTtP4WcXcbKyh7APc7+rv11pWV3hG/U7Yg+LlttA0KSm8JgzHRplE7mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QHHnBIlT; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2110a622d76so53008775ad.3;
        Wed, 06 Nov 2024 08:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730909011; x=1731513811; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZNocM+WdbV87f0ucaFRRKZx/lGWrptiPjNjZfE8UDfY=;
        b=QHHnBIlTTdxUri1LN2nFWB1u8sT05bUs4n4T+IsT9Fhhqo+n2Wxh82bMfl30cCb267
         U+TIxHSrgZlnGdi+qjfKti8hbnjHhBDI9IhQVJ64kh0eeAL8uV16MhjJngr2WT3VdzQK
         nSEQJlC9yCUEREXCMLom6GIjps6iE3cS8m2u1gFwwu94MVaV5joV6UsFKmOWmYUjJS/F
         I+fQxO5o5QBncQ6tE0lD6T/Ko1vQ4wF1hGign4yX3zaBINrjuMR/Q94LZWrRupqkeS3t
         bBDVY2uW2j2xSFR5Y7E33242YjvnJ+FbJnGw5RN1r/RFUA4FGqDBqYZrhAEgqp8tkwqa
         RaUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730909011; x=1731513811;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZNocM+WdbV87f0ucaFRRKZx/lGWrptiPjNjZfE8UDfY=;
        b=imWXyZnKjVewDkgnCujhcMxKRhDfi79wXL18y9ai+mL+QXt569bKZQu557xKx8eyXV
         aQyAAJiDAvdcLIwCmNd/QGQNhtjVzCEWZGBmtdh9RM6BcN2I+fDAIo1KKGqZLEAYORg+
         d5saYE+fGKCy0h6DCk4d0hRbkPkz0HrdCLMxDNaGmquoHVd94PIQUrkOBKLBGes2HTmE
         TgCpioqM37cyErbiUhjtQ079cNyUVvIdOm6WvlI0B2t0xVTfCjXObO2Ay/Y9OCuimIxd
         MvwZyXz16lI+JJnd6bBODgudcSG9EU6xaJRYKtsXn1ayoj/E8qYRK8TWdmWu5L/sPVtR
         KqwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUG8jfpNLiELropoReaAi5funYiFC48dsuEBgF7hRDztAabHV1/OqkbQSLa7FBWnE051rvWxXWILMqh@vger.kernel.org, AJvYcCUu3zh77npibqT7XMHZ0ETBoMz+lVHyOxpbvVcegOFYheYAqY1EfBMIHf4+QmbhlYJBrKJQsDser74j@vger.kernel.org, AJvYcCVoYc0ah9RmxTxu9kxNEZHVZsF1X58RF5qtKQCRVqv3c6Kz1dGEVIggW/mRAdm+qv0DOT+1fo5mRXRY@vger.kernel.org, AJvYcCWkwogD2YYlwpoEvBxMNHYv0nlLsY2b0JVhak0Y5dHUxr+4nssSyMBWRwHqsWuLM3i8+XV+yttTR5QDcRRH@vger.kernel.org, AJvYcCX1DaVTx1cb8IpgMv2aFU4DQ9tZDJeweJcsOWXr9wDhVMItmb4XJOnwwFh9ZAe/lFZpAG3PeyPiyk9c03g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYQVPuuuLFulTTnNbFJGOdT2vEYYce7F+uaNp/cqiSiRlz2HH8
	oZOAiYxmftcr7xbYzAJYN0K7HZNk3+bniUcSl6sG3QRJ2By3u9iV
X-Google-Smtp-Source: AGHT+IFhRVrWIpPInnku4WjWMhMV/MtkoROR+ZMVi9n99hUzxhu1sEQlSsIAG0pSadilzV6mPYRygA==
X-Received: by 2002:a17:902:da91:b0:20c:82ea:41bd with SMTP id d9443c01a7336-210c68d4349mr539228785ad.18.1730909010905;
        Wed, 06 Nov 2024 08:03:30 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e99a541cfbsm1699958a91.18.2024.11.06.08.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 08:03:30 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 6 Nov 2024 08:03:29 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v4 5/7] hwmon: (pmbus/core) clear faults after setting
 smbalert mask
Message-ID: <ec18ced0-c113-4925-8096-3f776f0f11d9@roeck-us.net>
References: <20241105-tps25990-v4-0-0e312ac70b62@baylibre.com>
 <20241105-tps25990-v4-5-0e312ac70b62@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105-tps25990-v4-5-0e312ac70b62@baylibre.com>

On Tue, Nov 05, 2024 at 06:58:42PM +0100, Jerome Brunet wrote:
> pmbus_write_smbalert_mask() ignores the errors if the chip can't set
> smbalert mask the standard way. It is not necessarily a problem for the irq
> support if the chip is otherwise properly setup but it may leave an
> uncleared fault behind.
> 
> pmbus_core will pick the fault on the next register_check(). The register
> check will fails regardless of the actual register support by the chip.
> 
> This leads to missing attributes or debugfs entries for chips that should
> provide them.
> 
> We cannot rely on register_check() as PMBUS_SMBALERT_MASK may be read-only.
> 
> Unconditionally clear the page fault after setting PMBUS_SMBALERT_MASK to
> avoid the problem.
> 
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Fixes: 221819ca4c36 ("hwmon: (pmbus/core) Add interrupt support")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Applied.

Thanks,
Guenter

