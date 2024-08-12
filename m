Return-Path: <linux-i2c+bounces-5309-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B5494EE23
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2024 15:28:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F86A1F2322C
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2024 13:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0273917C230;
	Mon, 12 Aug 2024 13:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MCsV3OPB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C4B17C210;
	Mon, 12 Aug 2024 13:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723469324; cv=none; b=XqeABK+I9ODayXFTsnVyvwamIQISSk37cZZQ0mUQSEeHfbSRVvfhc5/MlLkzyomonbaLOOLNnQbB4QpqPTGVVXeYaiVfffbICLj9CpvNDSh6nMQodAVS1vwz+uDskVMGznA4xlCt4JRuFjeC6xldkZP3lDlO8LQOvZQMQQkwvww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723469324; c=relaxed/simple;
	bh=kKHBu/ugCjOiE0dvX4g6zx2IAeyh8jt5+kY4xBe7Azo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=HgGwaxITy5njyqug+hpEHKYLhlwmWo4HsOlXayD9Kg6Bvk7xAeTKgCD0DH1LUGGIdbvNHpRsHUNpf65ly/L5fps0jPc9Bi9qtACngvdwxocxyLQ8RTxn3NuasvNvIHo55QtXzhp5ritZEZtinQ9+dpihzltPJQzBfspZ/h1obtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MCsV3OPB; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1fed72d23a7so31893015ad.1;
        Mon, 12 Aug 2024 06:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723469322; x=1724074122; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=q2T3wy2zFPohUzm4HYI93e1fa0m6wxGlFeG9XBGXZAY=;
        b=MCsV3OPBCLbgeo1IvEdeMp5YAkpcqsN/V+9G35ls2T11L7AVqtW3fBifVAh7/vkcVb
         IKrsW5gWG3JMHb1fbdBdCSi2PTd2GtFpNs35t4mjhC80hgQ7Vt4Qqgy32i1rYgoYCMkk
         yQg8NBu/wFAZMSfSjXeOr0X2XbGsuwiR7Y1TBVWa0dXST7mqhZfd9rSmIc2Syr/yLMtG
         kDGvSC5BxEezEeyedQlq0ogZZT3kIyB4KTrYG1k3Uu5QthlAAlAa1hEqkRMZtq6QFc0U
         3t7dWWNg1q2FEP/TUOA75BT/mhVGm8oLhecPyhv0fywbawx1U4eal2mv1pzJhbuaOrEw
         xA9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723469322; x=1724074122;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q2T3wy2zFPohUzm4HYI93e1fa0m6wxGlFeG9XBGXZAY=;
        b=F9QhGaExZt5hzBPK9/vtDndawkAbgAz2a94I6pUbyDYj5y/GpUc5vQhO+BA8k3/4GP
         w2HVEkyn6XuwHo4JmKSHoRYnKoxgkY9VC2k/d7fHmHRJgCuRmBv+fnZasO7JGXqnXnFX
         DIr56rahf+Z7Ewp/I4zSuAq/68QtEQAaAtEh4MqFbTWqL1CDXgnikFjT9AAJJHBvKLD5
         kBsO1hTdhQy9gWKC+haiDS2E7PETMPdvTySrnpiomdZFRM7pdi+iS45BcIXN2t1HkJj8
         qZnMjgTTmhHRkbDGbzg1y73ZbgffKXnBnTf9MOFMTrwIh/KA5NHkDf4/c1HMk0JrDMY6
         Xz9w==
X-Forwarded-Encrypted: i=1; AJvYcCUB/nhjPbyItsb6D59WTEaSErtTtITv7GsM+HnWbwQ6R/qaqJfO+K1JbTWccMBsJH421IDERpwY1GLbBIA=@vger.kernel.org, AJvYcCV6M3Fj5Tfh4x4K1sNYxVqCD5tAFCyh4xhIYSafzCzsxwvaXNShkAKCyD3z2wWhojff3dQurMBmmeLc@vger.kernel.org, AJvYcCVMJB2SRIKI8S9g1i3RWpNm1lV5CgkpKVOt5UdZ9/Cv6AlojfgKJLZuyBb4x8YTuERG9xJRVtrTND8Lmb6T@vger.kernel.org, AJvYcCXiMAxpLmr2NaxA7EY+QXUZVS/nHepQ3X7ODdm9Wi6wyATN9JxnpvWDKRzA/dkPFHAe28Uzy5+uQ7ZS@vger.kernel.org
X-Gm-Message-State: AOJu0YylYxxd+9tAuyE8fumlx45s7ei8NszDflFvVPDDHlwotFBxOB3H
	3d6eGy+Ur+7ewt79vUt0sHufY819zA9GxW1aRMpBOKYtzuGp+n7Q
X-Google-Smtp-Source: AGHT+IHI16o8h0cxGZnxLOohq5pcdnp5N1uzUWBszGCX0V5kdHTEkUTdtF0pBgubs+IfbeLdQI7BIA==
X-Received: by 2002:a17:902:ccc7:b0:1fa:d1df:d41e with SMTP id d9443c01a7336-201ca1d4959mr4070225ad.58.1723469322418;
        Mon, 12 Aug 2024 06:28:42 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-200bb9085e7sm37776505ad.97.2024.08.12.06.28.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Aug 2024 06:28:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <acfe6acb-725a-4e62-9b82-35a887a3813b@roeck-us.net>
Date: Mon, 12 Aug 2024 06:28:38 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/8] i2c: muxes: add support for tsd,mule-i2c
 multiplexer
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Farouk Bouabid <farouk.bouabid@cherry.de>, Andi Shyti
 <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Rosin <peda@axentia.se>,
 Jean Delvare <jdelvare@suse.com>, Heiko Stuebner <heiko@sntech.de>,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20240725-dev-mule-i2c-mux-v6-0-f9f6d7b60fb2@cherry.de>
 <20240725-dev-mule-i2c-mux-v6-2-f9f6d7b60fb2@cherry.de>
 <728a8e06-81f1-4771-8031-ea043b9baf20@cherry.de>
 <3a36e89b-b4e2-4eb8-9197-a7a1d04a7fb6@kernel.org> <ZrnekeUKciV4eAKC@shikoro>
 <f6dfc6cc-365d-4f0a-9a4c-dc34cf4c5b7d@kernel.org> <Zrn-ZkgYKVquarDX@ninjato>
 <426eb8b6-9b2f-4594-9cc3-320ef0cee835@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <426eb8b6-9b2f-4594-9cc3-320ef0cee835@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/12/24 06:13, Krzysztof Kozlowski wrote:
> On 12/08/2024 14:21, Wolfram Sang wrote:
>>
>>> Yep, but to be fair the patchset did not say anything about
>>> dependencies. There is absolutely nothing in cover letter, nothing in
>>> the patches, so I do not wonder that this mishap happened.
>>
>> Still, one shouldn't take DT patches (which are even the last ones in
>> this series) until all other patches are at least in -next, or? Yes,
>> mistakes happen, so no big deal, but i2c is not to blame IMHO.
> 
> No, it's not. It was just a ping. The issue is here not describing
> dependency, allowing Guenter to take the patch and not even telling him

Oh, I knew that the i2c patches were not yet in the tree. I just didn't
know that I must not apply patches in this situation (where the actual
patches are perfectly fine but assume that something else completely elsewhere
is applied). After all, the amc6821 patches do not actually trigger anything
in i2c mux, they just trigger instantiation of nested devices.

We live and learn. Patches now dropped from linux-next.
I do wonder though if the rules for applying a sequence of patches with
non-technical dependencies is documented somewhere.

Thanks,
Guenter


