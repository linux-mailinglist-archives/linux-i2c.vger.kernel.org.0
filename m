Return-Path: <linux-i2c+bounces-5084-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FF4940087
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jul 2024 23:40:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A9631C21FA5
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jul 2024 21:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADCB218C33B;
	Mon, 29 Jul 2024 21:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SqB+A25r"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB962188CDA;
	Mon, 29 Jul 2024 21:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722289197; cv=none; b=dZQCf5m77IZ4yeRn2Iq8Of+EH4cuMP9v1p37JGYuK5qea/WbIiq66is1256Heqa8Zgi2IPnjwpIDpI7+sMGW9ZTtgZu1nq9uHKCt/w2Qgre0XE3V5Y16kxkJUE86H+zRFLNkCfDZZ7S79Hh51Umc3kupdBVRdhgtjqdD7cqWqWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722289197; c=relaxed/simple;
	bh=8NJS9WBX+e7dJ8GlELhlavHZj7up4ytOChrqdXvZ3wE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=BdeMI6C06sCUwPSO3Cx/L3JTtVfxWTLOb3xgH5rjdcs+Kyc4E29hdlRnqsJw5+Uy6K10BMVtPHFw2P5JZqslFEFw5fw/yiwLAuc3dAyYLywbRtg/+p9pPaSOiXPAO/0XyetO9T3bdzAV04fAsSQZZEkNcrUSIfBRrUX6HmakFkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SqB+A25r; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-70d150e8153so2324548b3a.0;
        Mon, 29 Jul 2024 14:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722289195; x=1722893995; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=2K8xU1Yp4xIG9y9LhgxcxdPcCtx5Q+FyrYxql6OyC0o=;
        b=SqB+A25rdf09oCpvtGRV1ezUkEcutCR4LGkzELyNvQ7yD/AdJx0wp7XMcBHmQChx3f
         l3FzQBzI/iQJSY/qMxYW+b7ewK3Xx3jRQZNcqkbgXJSzE/L+K0x/ScSrMUdjjflOMgYM
         SZTigZWyHRs+PiD0sWWTyFu2IBlOl8KjDnWrTuCHHnv2JccJSQt+VOnbosBSPKsJzc8w
         V0B+WfgVFjI4cYKlQ+dh79k9nSYkKHUNcAYrHOWt8mX1xBBpmGqb7HEiwrUb5StEe7kq
         nxvkgWhmDZzoad/s6GUas8nmlj/m6I9cMx8ChH2fSn8CwozqLcvO2/R/RnSFAKgdGFON
         GEZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722289195; x=1722893995;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2K8xU1Yp4xIG9y9LhgxcxdPcCtx5Q+FyrYxql6OyC0o=;
        b=oAPzIYPs8Ng1MNKWxzz18IsrCBcfU6f1DfyMzYu08ZhV4iLnt7EmM9QVwFG3fNgCIj
         HEbv62nrTv0tjNRaP14sDMhjvID+EZe5YhFjpm/14U6JwON8X7ooUYRr+PeROaDsLCkS
         aQQ7N/V4gnYpQ5JC2Vr4j54GjMWVBfXeSNTsO5PREU4QfMxiY+Ns0O2R/hdJylsT+dFZ
         MuUg/xSA5uRyvmOXVTgq1fDZ8mOEdUdtvk8Nwhj8eaTQ2O1kfYBuEYFWohvDoCph4gTq
         1AqvqNvZvMpHRcRumX7lW3glOKSElOvFgwSLI4O1+y7gRI2R9qZJSqRiJllQOxpTV78F
         Fa2w==
X-Forwarded-Encrypted: i=1; AJvYcCVD9XaDT97zgTQeemuoo2/6ZOid3jwua3rvwUBKjHPrlf3sNX3VPbr7yweKPURJj098KkhN7nhE/wU2AgEIxFbv5A637HQ7z8NOMlRacb5Qwp7ujeCmw5ZgtZ7myIY7ehVBVoG6I1fb
X-Gm-Message-State: AOJu0Yx413JZAMWPMeeis6wxMitNIxnJzWobJNpd1kL9An+Zax6/mcNS
	vVBoP3xTma1k1N3jZqHg50MHRdfNFN140DsldiXEclna5VGl4Rka
X-Google-Smtp-Source: AGHT+IH9oiRXKYj5KqgFDUxdxDDVDKqb6yfa1+CMpqVnswHTIk7B2oPpckfIoyX92jDxskZgCZhRYw==
X-Received: by 2002:a05:6a00:91c7:b0:708:41c4:8849 with SMTP id d2e1a72fcca58-70efe45180bmr63274b3a.9.1722289195116;
        Mon, 29 Jul 2024 14:39:55 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7a9f9ec4241sm6568525a12.57.2024.07.29.14.39.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jul 2024 14:39:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d9eafaa6-64cd-4b38-9cec-9b2045817a48@roeck-us.net>
Date: Mon, 29 Jul 2024 14:39:52 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] i2c: smbus: Send alert notifications to all devices
 if source not found
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Wolfram Sang <wsa@kernel.org>, Jean Delvare <khali@linux-fr.org>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220110172857.2980523-1-linux@roeck-us.net>
 <20220110172857.2980523-3-linux@roeck-us.net> <ZqakaAn3f9Kg6Lgy@shikoro>
 <7ad68f35-2e90-41b7-a95d-efe5f7db8f3b@roeck-us.net>
 <ZqdLVg6IVTjsTWb4@shikoro>
 <3adf0b8f-2e12-413a-a76f-866e56bf096c@roeck-us.net>
 <ZqfhPffOTu53bfwU@shikoro>
 <c58ca576-2763-4f73-bc0e-c33677c5228b@roeck-us.net>
 <ZqgA-Qo8bccaouUr@shikoro>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <ZqgA-Qo8bccaouUr@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/29/24 13:52, Wolfram Sang wrote:
> 
>>> The code I am suggesting is bascially yours without the retries
>>> variable:
>>>
>>> 	status = device_for_each_child(&ara->adapter->dev, &data,
>>> 				       smbus_do_alert);
>>> 	if (data.addr == prev_addr && status != -EBUSY) {
>>> 		device_for_each_child(&ara->adapter->dev, &data,
>>> 				      smbus_do_alert_force);
>>> 		break;
>>> 	}
>>> 	prev_addr = data.addr;
>>>
>>> Makes sense or am I missing something?
>>>
>>
>> Yes, that should work and is indeed simpler. You are correct, the
>> additional loop should not be necessary since smbus_do_alert_force()
>> should already call all connected drivers and hopefully clear
>> the alert condition on those.
> 
> Great that we are aligned now! Do you have time to rework and test the
> patch?
> 

I'll give it a try.

Guenter


