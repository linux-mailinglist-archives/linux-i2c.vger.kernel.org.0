Return-Path: <linux-i2c+bounces-7070-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 484DF989081
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Sep 2024 18:39:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06B7A2813A0
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Sep 2024 16:39:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7FF36F099;
	Sat, 28 Sep 2024 16:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aYLwXQuN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D5C17C95;
	Sat, 28 Sep 2024 16:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727541585; cv=none; b=Nv6lPHi6ZSKP+dkzFvP+Vasln/tEjg+RXVKBIFkqUF4BvJHb6JhRhMdzLpfbQQshJ24Cr+oCZ3N7Za/Kk8ogb3uTcHi+5YxophAeFtrxkFAtW0WC/rGD1cBbkxqdYBIY378pzgcmz8RZ/WjcnN32WXJhsnu9yUzbUwL2NorA+C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727541585; c=relaxed/simple;
	bh=oDYgX2j7bOQyyljCF5IWsCSe2FE81M8yuuciAaPzbik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iQtDSJb3VaJN6ZfsmvamQ1zEHYoSl04A3lzmMiYdH4HybreGlLKSSBAGA6cibotdcYknmxudynAqUZmEI7dPx7/GIp9Ug5gtzshHM65AGo1i/R8h3MSFcB/14iieaQuHlyFl5I7635l4/Z0Um0hUb/xJ9CU3kSk301gm/bCUt6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aYLwXQuN; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2e09fe0a878so1969358a91.1;
        Sat, 28 Sep 2024 09:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727541583; x=1728146383; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=kvzo9Dw8yCMA498VifiVQ3iKuvGDh2Xe6iIAnfkituk=;
        b=aYLwXQuNS9yCJmN1pHR9MbDylsf4K+oOv2lR4Yymdq1CX+LNwwz2YxJM1wXjhBiSZe
         UDd0VxXHMxWIiWfuI7Jv1vYb+BE83hK0rXNF6xr6Rla2jmUCxfTUZs+z+Q2p4mTxruVj
         OJo/Wb8eglWeltWkN5pYa/h1JFVSaGhb0juc7b5Qng3dRzje4DoLoMmNxvb67OryJnQI
         ogBFjLCgB18bDHLAnZ7iDDSKm6cpRtV8lF7v1Xu6n5OQXEN1DgqE25jPCbdcZFYelcBS
         5GdK1GBIUtE4bMLbKSb9HQ6L99h3dkTiFr5sw4T85n+66dtDHUVeTTxVhtMm0AjPkwM3
         9joA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727541583; x=1728146383;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kvzo9Dw8yCMA498VifiVQ3iKuvGDh2Xe6iIAnfkituk=;
        b=aBV8Aa5VvJrCbbSOmSAecfIEBzY4hq9HH5vtkuy1wROxfI653+n811gYq+kwE+cAqL
         /ap/24o+PJecVG+lmXEZg6bQmyvcsVbZvcE9gBXt8eruHKUz3bWLk/i8D6nkhRctfv49
         GQn2+X5FFazHBe+oDsHv6Gdw5F3e3pbRJ56rGHtv7eQmUq9Q638o5f7ZzQmj8yllcEXJ
         MtdrRTXSgMsK0xTvFfULhLwrFLf59zu9jRzHgnHWYkcrsI1t4mG/fBU0cogL5TvqKzSL
         V06LXVUeQZM7wlLa1qBtd0JwMu5bxpIUy5NfUTW2L9p4q0SA4Y1SnEKzGKVFkhKElbOv
         8xKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjXFv1yuJMMij7401EEf5R8wx/BKF9cCKewjIv2+HJlyD6BFQNJ36RpK+ZNp84kvUwx8t2uni8BfUnrM0j@vger.kernel.org, AJvYcCXn61l8Y5KcoMC1Y7x8DN1JEnxtkeftFQyFXDH2hNbR1bXxCfbsP1IABb+2aUTn1ej5dkO7aXWvYGdxcFg=@vger.kernel.org, AJvYcCXy6Tboud52zNG5eQ3C+moQWKyeoAUiq1lOGFtbLZveDdCTeMKBBdH2x0MvINQ9ziwQTU0t45omSw51@vger.kernel.org
X-Gm-Message-State: AOJu0YyNz/wXzSkO4pHYYaiiQaHfOonJf//c20BBLrI/IUzomL0hn4Fu
	aYm4pPicvFLIYxMBDA4dLrI8kdVNDXbplST/fxxTtfIsIOvmxgph
X-Google-Smtp-Source: AGHT+IEZbz4+NfKVIi4mSbv0u3LAU6sOozSBItqjzEJ0I7r/FltLIFmJfkdL1HWxN0IK7RD0P60HxQ==
X-Received: by 2002:a17:90a:c790:b0:2d3:cd5c:15bb with SMTP id 98e67ed59e1d1-2e0b8ebd993mr8064593a91.25.1727541583240;
        Sat, 28 Sep 2024 09:39:43 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e1046b8723sm450453a91.14.2024.09.28.09.39.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Sep 2024 09:39:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <4717815c-7d56-450f-8974-15c5ba245aa2@roeck-us.net>
Date: Sat, 28 Sep 2024 09:39:40 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/8] dt-bindings: hwmon: add support for ti,amc6821
To: Farouk Bouabid <farouk.bouabid@cherry.de>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Quentin Schulz <quentin.schulz@cherry.de>,
 Peter Rosin <peda@axentia.se>, Jean Delvare <jdelvare@suse.com>,
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20240906-dev-mule-i2c-mux-v8-0-dbd28a150e41@cherry.de>
 <20240906-dev-mule-i2c-mux-v8-3-dbd28a150e41@cherry.de>
 <df6b9303-155e-4796-adb2-e05c7e76e289@cherry.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <df6b9303-155e-4796-adb2-e05c7e76e289@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/27/24 07:58, Farouk Bouabid wrote:
> Hi,
> 
> On 06.09.24 17:54, Farouk Bouabid wrote:
>> Add dt-bindings for amc6821 intelligent temperature monitor and
>> pulse-width modulation (PWM) fan controller.
>>
>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>> Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
>> ---
>>
>> Notes:
>>      Merge after patch 1
> 
> Patch 1 is merged in next-20240910 and it represents the dependency required for patches 3. I guess we should be ready to merge patches 3 and 4 through the hwmon subsystem.
> 

I'll do that after the commit window closes.

Guenter



