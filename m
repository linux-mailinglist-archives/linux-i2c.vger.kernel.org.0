Return-Path: <linux-i2c+bounces-7856-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE2F9BF52D
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 19:23:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C4241C233DB
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 18:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9A7D208983;
	Wed,  6 Nov 2024 18:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZkfYjObI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCEB201104;
	Wed,  6 Nov 2024 18:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730917412; cv=none; b=SkNMSWveQriqK4npP95ur1Z7DTzsBMmCtXXCheLQdLf6FkRmbYrMa3AVBndQioWbHZzh2kZMM9FEPBSRbUDhJTK4whC9EHtgQan5vMba7N67Dyr7CSU8FP9+ZVZsTz+h1r0F6D+eKkbSlp50eQyR8cC7opM1xzuBXWKNjsPPN/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730917412; c=relaxed/simple;
	bh=HjN3rLy4E2747D+6+vQ7hUSMrKAlRBWAk4h1rZ0dyIA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g88Rs1WDawLG4B5QzZ/8XkksfaDxZCh9w3vm5XJsHtRfN2HxsfOl8FBGL6suPTZRSqQN1uWv6g1HA5HKUI/9Bwtzuog+FNXLR0G4BOkKZbFpvmkbeEO90ILSpSNK19JuJOFoDwhDIbgxGtSWvQFUaVOqqaudtAZqEGNI9jqa2o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZkfYjObI; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-20cf6eea3c0so1649485ad.0;
        Wed, 06 Nov 2024 10:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730917410; x=1731522210; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=G1XRbaNW9aRnzIC8Q0HFvNZCSCGK1ouUEbeXMVaIIts=;
        b=ZkfYjObIUnQx+A+utkNw/tbMj7IeVVcaQF3PfmcqAF9ia4fOND3ROg35oa+AKrat+5
         as6yWJWKcrUH1XpBUO62nml827t4ZADcTzzDDoC1JnSHeY6+AUmqqtO3JohVdupHb2dF
         102PyvnUT3udJAxjKCTb5IgYJRPynXKuIJG7J7GVcc9hb4BdawiKaqlBgs5hKFV+tJnr
         dtFVgbhve9pEmxmkhMQ0jhfhr9pSiAwT2Czy+p9xntrBuYcsUBZ2G1VzBvpQZRxsJXAH
         yGNsUGsbYs8MGhzNEbdNgBDscZlR2Ak7BmapR367131vX948G7Wb7aEd4x1z+jBbEPem
         BYjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730917410; x=1731522210;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G1XRbaNW9aRnzIC8Q0HFvNZCSCGK1ouUEbeXMVaIIts=;
        b=WR+CSiN2Qvncm64G75RHE9MNE28EEN7YFzSWooynWBh340u/gzVqL72zx8YBFEt0zX
         fpSJANOsV0vkYAIdLhUs9cL0ije9bAIu5P2kwvfSCpt6dmYNzQxLU/LwEhMUpf4Jqhtw
         YQByA+d+NWrkSSNLVqiKkPgdKw4yLygD2NZkbNbzs87n5A3RincUgg+lR8ADM+XHd7Yw
         2c+1kJFEvzXaFMFgAK6gvORy2zbmD3qnDyZQxyXlG7aAKRvTMyqPKnAigcnNdc0jjyBg
         yO5z+7wlOoTOF5vGJy2ToKmPomkP/4pawmc3lwNF25A8rcYmvcqQvZmnpuXOEhA4uNOO
         TyCA==
X-Forwarded-Encrypted: i=1; AJvYcCU2qyMo0iurc1ij3VsXM1lJFXgtClw37s61QZkI7OQ+Ki7Mb4x4nNxx7T7s9dcQzDRLq916XlAoMP+N@vger.kernel.org, AJvYcCV7RzWtSB8PHcjvCZoibkn4/ZUGXN2mol0teSWQiqcskswzlQO+6c9IxonacUaNQaxgH6qwkgfYo0+w@vger.kernel.org, AJvYcCWHwK/+lo33Qg7itOG6DfaVKKHwjQcU18/gyDFjbjyGW++Coxoajk/rD7Nr2ujj1iG8oCRGQ+Mnwrsz@vger.kernel.org, AJvYcCWdkgMhUytYX/2VymBu1jpwd9vGrWEp2fhHmqRTwPclXByNFEAkX0/Fsrxc5H+hCc8mkqRkxQRWMeKMUi8=@vger.kernel.org, AJvYcCXbNjhVaFVO60Mbh22td1nRITDd2FG8DJxOfLDz5/6s3yqx6aXUm7rIKBjGnnP5wGvD4yQLZfHMld10QAg/@vger.kernel.org
X-Gm-Message-State: AOJu0YwJdfQbLZWTMKbrMAvSnqyiyVF6jE9+6LwnYQYHzbdX3j2Xi25Y
	dhXLXf0W6pSIWExErCuURiUdIJWifMAjr59XGSKoYDcO7B2BAFut
X-Google-Smtp-Source: AGHT+IFh3/HPgUngzs8OSNFVR5MkDDZV+io/PZQOsijvyw5nbM7X03VMLrfBiNJg9tL5cu855JpUfw==
X-Received: by 2002:a17:902:e843:b0:20b:b39d:9735 with SMTP id d9443c01a7336-210c6c823dbmr577150155ad.54.1730917410110;
        Wed, 06 Nov 2024 10:23:30 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057d8158sm97951015ad.275.2024.11.06.10.23.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2024 10:23:29 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <bf8e8a47-19a2-4bee-8044-4ca25c17115f@roeck-us.net>
Date: Wed, 6 Nov 2024 10:23:27 -0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: trivial-devices: add ltp8800
To: Conor Dooley <conor@kernel.org>
Cc: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Yin <peteryin.openbmc@gmail.com>,
 Noah Wang <noahwang.wang@outlook.com>, Marek Vasut <marex@denx.de>,
 Lukas Wunner <lukas@wunner.de>
References: <20241106030918.24849-1-cedricjustine.encarnacion@analog.com>
 <20241106030918.24849-2-cedricjustine.encarnacion@analog.com>
 <8e4dc080-d779-4b06-8fd1-74784e06323a@roeck-us.net>
 <20241106-gatherer-glancing-495dbf9d86c7@spud>
 <2bdc5b60-2442-4291-a2f2-2e3802b7e982@roeck-us.net>
 <20241106-rancidity-unexpired-bd3baf858fef@spud>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241106-rancidity-unexpired-bd3baf858fef@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/6/24 08:46, Conor Dooley wrote:
> On Wed, Nov 06, 2024 at 08:35:33AM -0800, Guenter Roeck wrote:
>> On 11/6/24 08:06, Conor Dooley wrote:
>>> On Tue, Nov 05, 2024 at 08:34:01PM -0800, Guenter Roeck wrote:
>>>> On 11/5/24 19:09, Cedric Encarnacion wrote:
>>>>> Add Analog Devices LTP8800-1A, LTP8800-2, and LTP8800-4A DC/DC μModule
>>>>> regulator.
>>>
>>> A single compatible for 3 devices is highly suspect. What is
>>> different between these devices?
>>>
>>
>> The maximum supported current is different.
>>
>> -2:  135A
>> -1A: 150A
>> -4A: 200A
>>
>> Programming is exactly the same, which is why I had asked the submitter to use
>> a single compatible property. Sorry for that if it is inappropriate.
>>
>> Is there some guidance explaining when to use a single vs. multiple compatible
>> properties for different chip variants ?
> 
> TBH, I'm biased and a bit paranoid, so I'd probably give them all
> compatibles and set one of them as a fallback. If the programming model

Sometimes compatibles have been rejected because a new chip variant is fully
compatible with an existing one. Now you are doing the opposite. A document
providing reliable guidance one way or the other would really be useful.

Thanks,
Guenter


