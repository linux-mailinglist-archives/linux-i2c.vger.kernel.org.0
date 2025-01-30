Return-Path: <linux-i2c+bounces-9241-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C282DA23369
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jan 2025 18:49:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C826162D52
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jan 2025 17:49:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 879501EBFE1;
	Thu, 30 Jan 2025 17:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zc5rXUin"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2AF12CDA5;
	Thu, 30 Jan 2025 17:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738259362; cv=none; b=b1PFCf0qRxUVojZh6zLhaglHwPLvTXdWsEU52JKlDCBylepYfU4WFGduFC2phTdix01WjtnMC9feo0GORNcYvpWoPZRu5CuTMFD2ccuB7BoiAVSBe0r2v64YR2gmkZ+W6I/iHbhamevB8hPcvmTn+EyGw4Od69NKUX2Iq6iHpfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738259362; c=relaxed/simple;
	bh=k/glph5Z7ozMYiVcEJWbK6kVMBSe9w2c0zCXzxWp8j0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=EFpN5a6gwN1wLrHP0yHgUUCBDKCAubIOJrnThEku+d3ofQ0OBbjJQcXukzDQp1+R38HJD4qALpoEWXOjjAkaalwNUly+b9Mzhrua6vrOaAQcEfW7SNyflhpUWGUXIaBksr096MRb3JFQ06VgF8e3tS9DypaioCTTb7DTVoMKzqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zc5rXUin; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EC43C4CEE0;
	Thu, 30 Jan 2025 17:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738259361;
	bh=k/glph5Z7ozMYiVcEJWbK6kVMBSe9w2c0zCXzxWp8j0=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Zc5rXUinHsm0RexQJOhCyTO5JJpNVXZS0jOlKgFNdLKZaTL/cf+EhzJCzJ2k0Ckv2
	 1jFSUn71jtgE7TxoYVhTWjjPXKP3oXpic0SY88p1LjSbItb0HA0RCUUW1tRZ7/FSa6
	 GEfMYVNYenTHdBhpxEdB4pjmDkFpim8HKFodvod654k4rrO/6p6T6XiTsSdrIIEe5x
	 BJTl8JeyTwtYkgxFgXiAV/7UYPzudyvuCgw6ByUNp2Yxue18rBTCr+ymOtmphkysjr
	 BvbMnmy71U9eCT19ErjoOOy7fAioqhAxj4LDy8KoFa2uHTq3MLpYEH22sYNeMLxeZ5
	 W8yXzrWVRcdoA==
Message-ID: <4b9777cc-0bb3-44c1-92f8-209c30837f20@kernel.org>
Date: Thu, 30 Jan 2025 18:49:14 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] i2c: tegra: Add support for SW mutex register
To: Kartik Rajput <kkartik@nvidia.com>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 Jon Hunter <jonathanh@nvidia.com>, Akhil R <akhilrajeev@nvidia.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "digetx@gmail.com" <digetx@gmail.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20250130143424.52389-1-kkartik@nvidia.com>
 <20250130143424.52389-5-kkartik@nvidia.com>
 <febb1225-3c14-4377-90e0-4d4aee307ede@kernel.org>
 <0daa503e73099085d84d432bb72a5f79db81a9b1.camel@nvidia.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <0daa503e73099085d84d432bb72a5f79db81a9b1.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/01/2025 17:35, Kartik Rajput wrote:
>>>  /**
>>> @@ -372,6 +382,103 @@ static void i2c_readsl(struct tegra_i2c_dev
>>> *i2c_dev, void *data,
>>>       readsl(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg),
>>> data, len);
>>>  }
>>>
>>> +static int tegra_i2c_poll_register(struct tegra_i2c_dev *i2c_dev,
>>> +                                u32 reg, u32 mask, u32 delay_us,
>>> +                                u32 timeout_us)
>>> +{
>>> +     void __iomem *addr = i2c_dev->base +
>>> tegra_i2c_reg_addr(i2c_dev, reg);
>>> +     u32 val;
>>> +
>>> +     if (!i2c_dev->atomic_mode)
>>> +             return readl_relaxed_poll_timeout(addr, val, !(val &
>>> mask),
>>> +                                               delay_us,
>>> timeout_us);
>>> +
>>> +     return readl_relaxed_poll_timeout_atomic(addr, val, !(val &
>>> mask),
>>> +                                              delay_us,
>>> timeout_us);
>>> +}
>>> +
>>> +static int tegra_i2c_mutex_trylock(struct tegra_i2c_dev *i2c_dev)
>>> +{
>>> +     u32 val, id;
>>> +
>>> +     val = i2c_readl(i2c_dev, I2C_SW_MUTEX);
>>> +     id = FIELD_GET(I2C_SW_MUTEX_GRANT, val);
>>> +     if (id != 0 && id != I2C_SW_MUTEX_ID)
>>> +             return 0;
>>> +
>>> +     val = FIELD_PREP(I2C_SW_MUTEX_REQUEST, I2C_SW_MUTEX_ID);
>>> +     i2c_writel(i2c_dev, val, I2C_SW_MUTEX);
>>
>> And how do you exactly prevent concurrent, overwriting write? This
>> looks
>> like pure race.
>>
> 
> The I2C_SW_MUTEX_GRANT field reflects the id of the current mutex
> owner. The I2C_SW_MUTEX_GRANT field does not change with overwrites to
> the I2C_SW_MUTEX_REQUEST field, unless I2C_SW_MUTEX_REQUEST field is
> cleared.


So second concurrent write to I2C_SW_MUTEX_REQUEST will fail silently,
and you rely on below check which ID succeeded to write?

If that is how it works, then should succeed... except the trouble is
that you use here i2c_readl/writel wrappers (which was already a poor
idea, because it hides the implementation for no real gain) and it turns
out they happen to be relaxed making all your assumptions about ordering
inaccurate. You need to switch to non-relaxed API.


Best regards,
Krzysztof

