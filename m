Return-Path: <linux-i2c+bounces-3036-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F378AC331
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Apr 2024 05:45:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 202801C20925
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Apr 2024 03:45:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69928101CA;
	Mon, 22 Apr 2024 03:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ts8Tx5NC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B676AF9EB;
	Mon, 22 Apr 2024 03:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713757520; cv=none; b=ASfS1IJHFy0/1pKhzbRZgDkfJ+9e4OoSM1SISauS0gVIcgiH4tIm0nRay5o8WZ+I+SwpCJjCBziMde/TfdZdsGa8wHLoa9AUfblq4uvPP3qemFrASp4E55Nmzr1wTmoDQN9/DNPJNcOolprhsfaKgZVoq6z3hu+G8UISk9zckf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713757520; c=relaxed/simple;
	bh=zNoXo1/AVupkmv7b218tu2hclJ27YyJRICEPmqRwkcE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cDDapt3SdTqfFIAUHV9jVx96CaZkO5i7CsjvPUnEV5yvDjEz0z7hNrTyTQAT0Dwa1Rh/Me6JgVmF7DqxjaSwvmDjBdhq8ofrdfLPkA5lUGRuqOgD/k67zYRZbpAMfDMfNJ7LooqjQHIC71RJ2z3OkLqS/vWIA9Qz20ZKeOvQ1G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ts8Tx5NC; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1e651a9f3ffso20975075ad.1;
        Sun, 21 Apr 2024 20:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713757518; x=1714362318; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Nf4KaBBQc1eU/osJJoNCSgJgXclg3fCamG238o4Yjps=;
        b=Ts8Tx5NCg5hJlMTLCOXE3wWtaWkVilI20xjTdYtVh17rW8TXR8M5ZA/ybCQ/c8jrZH
         LN+HJWPmfYQQm0sHWZH5Y/b8hL36cuqKg83X4kO1mdTMWn5e4sgOd55B/wtFydqh6+a3
         2ygzbH3uINNA7OhgLB4bNAREZBrHl5XDA16hbDrgdoQfovWSCNXC4UFW7xkL4MFbWcUc
         M3GcftOfAsV/pBr5gh9/z86kmFkjwVS5iZ6Z4/kOZaPe9WVaHVLHzQTafg1Njwb8AVcl
         8JBBChf1S8zIJUCz0bLIqHz5saGMdu7Sgk+itqrX3MoLducKtvgmAFmjhJH08swxmxzI
         tGJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713757518; x=1714362318;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nf4KaBBQc1eU/osJJoNCSgJgXclg3fCamG238o4Yjps=;
        b=uMe5p2Q3lnUk6qaD9SfAJIFIpRjwsyEFTYt5R4zNiL1MCbq0syu6eYgXZQnf1cY4jj
         hG3EMzk3y1Z1mcy0YnuHqBSBhZfe0twsXmnH+TjRIu6sDT+imLZea+jbslfpMdTKvQtd
         4vxn8yj9MbB7H1td/L8Tjro/iB9yyAvNk5XwvBxBuAd37sq6OiKb+QkgAK//ee9ZeRFU
         DBKVqoyWSxgIovdXoCoS4XbO36KrkNAZiVGre8YPuwf0nXYfoi4CEhVSGZdfizwm95wb
         7glADWqXoK5Nw+uuf3K7OPopOWHSQ9fqPNxNuKbVGqwLC8ZjHDCMQC05T3JrP/TuugGE
         WVKg==
X-Forwarded-Encrypted: i=1; AJvYcCUV+Ty0siCVTcuWIsd+XpQpo9N3QRvY+qsHbaDTXqpcexGbuWcF5EYPO34RJ7I3frRFZSKdfUmZLq6d3U0dN51OOqUOvluP3RYQleZxMdZpP3CGjM7KnkrJOAxtkvga3x8LbYqYBTm82w7U4T3ipHr7KrSW5s3CnolsDPlqHD8SXBepUHf9R29OUH7Le09+TL/8hlFCf/SHX1B2uGFM7eGdNde9arUn+Xn82/6i6Zm83zgNiHcCyaAR/AGU
X-Gm-Message-State: AOJu0YxY3bnpMjkvVUpEmYNpRvnZBxO1jy3kX8oDkoOKfz88AwVHJJHa
	xrdduzubSLRDt5Ve1fWLTcq+eRu0uAPKTJ3kHkgzF2hkckygVu2I
X-Google-Smtp-Source: AGHT+IHEK/fw9nlNaA7U+Krk+YW8g2fVhz24fRiQVs/UDKZV39KW5RuKnz7nW07De04qaVnl47ubVg==
X-Received: by 2002:a17:902:ecd2:b0:1e9:9fdb:567d with SMTP id a18-20020a170902ecd200b001e99fdb567dmr2306241plh.68.1713757517924;
        Sun, 21 Apr 2024 20:45:17 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w16-20020a170902e89000b001e8ab6b927asm5789774plg.39.2024.04.21.20.45.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Apr 2024 20:45:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2292b566-7fde-4834-a9a4-a74b14235541@roeck-us.net>
Date: Sun, 21 Apr 2024 20:45:14 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Add adm1281 support
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Jose Ramon San Buenaventura <jose.sanbuenaventura@analog.com>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-i2c@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
References: <20240422025123.29770-1-jose.sanbuenaventura@analog.com>
 <9b95f926-b96c-4266-b292-3c3cd362905e@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <9b95f926-b96c-4266-b292-3c3cd362905e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/21/24 20:28, Krzysztof Kozlowski wrote:
> On 22/04/2024 04:51, Jose Ramon San Buenaventura wrote:
>> This patch removes the extra case added in the adm1275_read_byte_data
>> for STATUS_CML reads. Upon checking, the reads for the STATUS_CML register
>> is already handled in the pmbus_core.
>>
>> It was also clarified and agreed upon that any other actionable steps
>> involving the STATUS_CML error flags should be added in the pmbus_core
>> and not on the specific chip driver.
>>
> 
> Where is the changelog? It's v2, so what happened here?
> 

Same question.

Guenter



