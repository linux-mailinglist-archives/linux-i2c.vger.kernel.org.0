Return-Path: <linux-i2c+bounces-14810-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 034E2CE5A30
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 01:58:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 07B563002929
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 00:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE3451D9A54;
	Mon, 29 Dec 2025 00:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ub5VsRSm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12B578F4A
	for <linux-i2c@vger.kernel.org>; Mon, 29 Dec 2025 00:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766969885; cv=none; b=gqTQiytj+6DqFsluGOhVvr25UZKVuRn9oAMcsXV6WSxxpaEXOQ/pdLwhBpGV5DZjox0EL+32ENpDlw6/+92u3MTPoxG/k4RQ6ybAypkfVTiALY7GCcIe2K5BejqQoEazHLq9ylb/tyr6y0EvveE2BWRwa7dSgMyxgpbAqLI/UHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766969885; c=relaxed/simple;
	bh=eXOy10oeUU64eQXYQ70XYcx1sMmIGm1IbQQLP4gGXVI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WqFivNcpOOADe7oG/TXr9+V4CgB6gDtryvPBW9YtePUyHL1LvewVF1LCrSIuOgfk3CZJWMpw40eC9otDiRLhHxKvsKxMgK/vKSQHSO6QL/Pwh3I7EuwPdmG4lEjDkuLj5Y4V4ZhONFQDHozf0PC7OeOdrGoJLFOhy86YfiDMlbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ub5VsRSm; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8b5c81bd953so1049112585a.1
        for <linux-i2c@vger.kernel.org>; Sun, 28 Dec 2025 16:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766969883; x=1767574683; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=udz/Ywp00lT4GZoeinIo9QMm0ZTiY0IiwK5PiD3CPXA=;
        b=ub5VsRSmVVLT+648b52IithkBBQvshYp3zNWt4nDIbL2M+pFXtnlhBTSFgcdWWS9pk
         N9I8ZCwgonrxA93vJ2oV61ftjZruSfPs8nhc/fgL2hbpcBqoxXoi+zrBYM1wIFKH026Y
         9ogzxvZ10Dybab+ZBhY15zfn25xiKCbJp/7Txnyippx1HZpHdVMy1c31DkNzEHCgczxq
         oC8LSu/fy1gCbNMQxWZQ48BQLkLdu4nGZziCjbbZ8H3U2lViglRNhjUkNrb2zfukYP53
         yOXkrLcnbgVt1q+mX5ti4l8TQeFNKt+eQC2FhQoje9+N5B8vSQC0fgB92DN0EPJsuy32
         fK+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766969883; x=1767574683;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=udz/Ywp00lT4GZoeinIo9QMm0ZTiY0IiwK5PiD3CPXA=;
        b=B7Y6AOZL7ZvsCBAangrxQffeu0ItUTyjoeTccb871WV6RtHyUXGwHAgFpUHzG2qB3v
         jXO9oUMF0clRx9HWvnmBvb6GvHhah2uH5udsKFc1i6HP1E7P2uY+wSjj8Nnx+Klxma8W
         BXhwVlPl9vE+CYpDRc8OmIvxFxRkL8hF6oS1HwOxL7NZSIxJ6FOUJ+5CKFeJi+4NQ9XG
         iop/ecSNl/nMa51R/H0/qIF0fqchssmAAKyc4daQxRlZNExSHAiPRTDnWXhz1E6yKQzd
         wKJDgJ0BjWmVBvnlPcoAQJeccnG5chjMnkWTyTeaOnVySGbXsRGUYKSxuzGZQKs6ThPG
         yxWg==
X-Forwarded-Encrypted: i=1; AJvYcCUVXN1wE3w+pMW6QH988sM+/zCSfixmq2iie7fCTQjfJHwEAc0OcS3JX9TIhx92iNJzKn+//k7vUdY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXadTpEt+ToRcLRPZliDK97MB1Z8Uoq+p7DAVMy88gbZ02AKxq
	4t8TyY88p/4wIjHmrmJVAd9nPuoM8eRQSJeWuC0LgMYUGFrR9H2vKYYzif7jRZniw/U8y2C5MUh
	ysN8Asjw=
X-Gm-Gg: AY/fxX55x5NcM9l+YhpT0jUAmYYfo86WR2j7CfcehpHz3ydPq4M0RhKL+HXK2nysvE2
	hYa22LEyCT430t0XhBUEupZ1VFBYHikmkWzhdrQZQZcMKr0RcLI2rkvSznULKuD70DN3bIRGnpd
	ptONCi2XSSlJ9NNddp3iiskazHJC2YtKGl3xVcPJrY5cMdEUEYK++xwzf3nYbzY6zR2QZXH4NOU
	tZVQ/IQZ7GiCEVlI0gPclAjEwOn6Qt2Iu8XTBeH/MqtaCgCU59YK2q6VMC7ht6VccBye5KSnjPX
	STNM1RZhdX8RbZJvjBsAb2ssF3GwgVznmMVVKPvrIRzF/TJOi7SrklpudlQnuQmUib0wg0F9v2q
	yOPRMCVQJj929Xf7PKLhoAK1Vd/Y++2sxXwRm/MpubfW7RN5OM+ui2cPFPPkhVVNzByp+m1URRO
	LS5vMBw80dHsCEhtoPE+Nj1vNDKPmbWDXk3UrshwVgefcwP5Hv2Vo=
X-Google-Smtp-Source: AGHT+IHrk3/Wb1Ax/7CDf4gB7goVnIoiHZHZswEwc447eGOnME6q7KBjOR0207MAY/FczYBzti0BEg==
X-Received: by 2002:a05:620a:4706:b0:8b2:ec00:7840 with SMTP id af79cd13be357-8c08fbde57cmr4105632385a.27.1766969882882;
        Sun, 28 Dec 2025 16:58:02 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c09689246asm2268104285a.20.2025.12.28.16.58.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Dec 2025 16:58:02 -0800 (PST)
Message-ID: <4a76e9bf-926e-4b77-a2f8-ee4a72b2f1dd@riscstar.com>
Date: Sun, 28 Dec 2025 18:58:00 -0600
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] i2c: spacemit: configure ILCR for accurate SCL
 frequency
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-i2c@vger.kernel.org,
 linux-rtc@vger.kernel.org
References: <20251118-p1-kconfig-fix-v3-0-8839c5ac5db3@linux.spacemit.com>
 <20251118-p1-kconfig-fix-v3-1-8839c5ac5db3@linux.spacemit.com>
 <81eca0ab-47a3-4b12-98ae-fbd46a15ff93@riscstar.com>
 <BD74A47E5BB66010+aU4j6CgGxebcBV5I@kernel.org>
 <569E6DA87DE510D5+aU4-1Jl9XxjAWQq4@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <569E6DA87DE510D5+aU4-1Jl9XxjAWQq4@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/26/25 1:52 AM, Troy Mitchell wrote:
>>>> +static int spacemit_i2c_clk_set_rate(struct clk_hw *hw, unsigned long rate,
>>>> +				     unsigned long parent_rate)
>>>> +{
>>>> +	struct spacemit_i2c_dev *i2c = container_of(hw, struct spacemit_i2c_dev, scl_clk_hw);
>>>> +	u32 lv, lcr, mask, shift, max_lv;
>>>> +
>>>> +	lv = DIV_ROUND_UP(parent_rate, rate);
>>>
>>> Would DIV_ROUND_CLOSEST() give a more accurate value?
>> I'll test it.
> Same result. So I'll keep it.

Is that true for all clock rates?  Anyway, it's not
a huge deal, but especially when the number of rates
isn't very high this can make a difference.

					-Alex

>                          - Troy


