Return-Path: <linux-i2c+bounces-9422-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA71BA33ECF
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 13:08:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45C583A192E
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 12:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F7B521D3FB;
	Thu, 13 Feb 2025 12:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WKp9ULP8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C6420D4F0
	for <linux-i2c@vger.kernel.org>; Thu, 13 Feb 2025 12:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739448530; cv=none; b=fZAWjVwbaS2FqNPYG6BrABryUQQ+t2VwBiYDlxmt5IzEoWSIcmt/rCjBIYEo3JWlZLf3p3CJPYgI5o7O3idkD7LSYaOuo5utAGIDcIy1LJUMC5QxpRPUXKCQ0zi6zvURNgrhy4fBt2whuxOImT/SRQ4HJSHLlqLqbeJHk/1Sds8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739448530; c=relaxed/simple;
	bh=1E2id50uaFPfC7LT/+pAYwSJ84qVWP+x2iiRvyauSDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SwZcaNqWxjnsgsSWyqtXDP39R9cNmGQh8yFHvz7m4su7k8X2LjcPVUF29HKJX7vHPyI6Cfr7Qv6zTJRVLxh0AwrzzRNSa/WbTfX/bA8kbblpijybrYyHdlS1LLyh29NTsUIxVgYI51uNOCWHEqcAx35gd4bOLKgCA8w/yuNFEIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WKp9ULP8; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5450268e513so107317e87.3
        for <linux-i2c@vger.kernel.org>; Thu, 13 Feb 2025 04:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739448526; x=1740053326; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y+OUyVkZpcEX7ghjnK0CsopW32NOBTOfeekkc+Viasc=;
        b=WKp9ULP89WDPKUsTpyJzGvK1xorCJ5aQLPg5iVZof3/os25yndzFGVrd3dOc9WUG8u
         3JuOPlaHYdxMEfOAJA9JB2JDz/AdbJgTzpK4Cn8KgK4uzludgrvWsj2OB3MFfV7uPY14
         pAaumR1pW292Ikb4AYgXxpzr0AtkFyWiChT1Dax1dyNog4lazOzQOYTB4gIIXhoHUidO
         SNGa1qUJvz37cMevPaxBM7q9W78IqD/nbeKSWi3qGwA8J8e9WhDp0TNndl23wO1xELaP
         /JCi2ezOyU9Pa5fXAx0E8VCFvzjf2Odi1F+JNDdc3ZaMxRz4yE+84LpOTcuIAumDFJXN
         kIJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739448526; x=1740053326;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y+OUyVkZpcEX7ghjnK0CsopW32NOBTOfeekkc+Viasc=;
        b=P6LcwgnKhoHaqvS3sYmbzCXsGdt3p/A14ATyiUEH9FzWJtqMhS0kD8i+JmYk4Cpp0+
         xlE4cgQttF/h2OKcyDJzlixbqjbY67eycTKjYUkL03LdMGzqKBoOmji8+cNCwIs45co9
         OBSa/uBCt3g6caSD222ppTzYOVC6M3Z7oZ7M16Qdlj74eNtiD4//8b0CrjbBXcP0Z2uy
         FBlWNXQggKcUD5lnHIwwXMXvf+MoqUeUuaEqGflhtFYnwiySq1GT+m87MTVKeghuRbAi
         +22tCQjs7zwIrTh7Sn6XpIvjjzyEwwF+vVaza2ga5beACleVv+EsY/pdl4eU+BlGuOOz
         ri5w==
X-Forwarded-Encrypted: i=1; AJvYcCUV4NJh+c2PUC15MSRqBFviwste+6kaDmUWdmL7B85hBj4jTsV1bYv8mmqxn+mdbnNGMv61pGuU9qg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVTFYRNKDAQmV/aEp4RfTPxhFdQERXOqQIStYEvDAfZseWLRKP
	elwScT7vimblzPIcn7cODR7ABCyevjum6T+PApcuaqd4BZE/mubL8gmf1OsjGdY=
X-Gm-Gg: ASbGncvQQn28wH8eCvPLk+4aTa8g7y3ngXAruu2X3hIAyfcDlCO1GZWKmo018cyRJS9
	LFDLrUJj0YKby1ZIQM532HXhhUA6nHCRQ+RFxsw4u+CTDau4GIasbFpMjKJPkwboTI/eUFVrLHr
	fs/FxZTjrlVQ1zHO5hDFmJiGq2VFiLRYZOXuqNfRBTjKj/wrhl7kYLllVLRXd8sET9nBrV2dOJA
	R9WRxidNUHCAdOTHOLmUoLLur873SHzOSFnavgEq198xbULa2x94OwBCRXm0PD3MsGvRN6C7uJg
	jJ9IbBxFU0UKUAp1B2xHm/HsfjT6VFAl1fyUun8ob7A9tKkPpfPtk+xvt5hmTPoT+C2PYw==
X-Google-Smtp-Source: AGHT+IGsPJrOcFQQnf+A25Wzl5ciCuJH/GUL3mTZ6Ip2nmGrIOQr357sCNfSXwJhOsr7Fk7zmP7O7w==
X-Received: by 2002:a05:651c:a0a:b0:308:ed4d:629e with SMTP id 38308e7fff4ca-309036d922fmr8815131fa.5.1739448526360;
        Thu, 13 Feb 2025 04:08:46 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5451f115ccbsm147666e87.210.2025.02.13.04.08.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 04:08:45 -0800 (PST)
Message-ID: <da37555d-b471-4f3a-94ea-4809fd184dee@linaro.org>
Date: Thu, 13 Feb 2025 14:08:45 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] i2c: Unexport i2c_of_match_device()
Content-Language: ru-RU
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <csokas.bence@prolan.hu>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Cc: Samuel Holland <samuel@sholland.org>, Sebastian Reichel <sre@kernel.org>
References: <20250213114613.2646933-1-andriy.shevchenko@linux.intel.com>
 <20250213114613.2646933-3-andriy.shevchenko@linux.intel.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250213114613.2646933-3-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/13/25 13:45, Andy Shevchenko wrote:
> i2c_of_match_device() is not used anymore outside of I²C framework,
> unexport it.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir

