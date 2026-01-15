Return-Path: <linux-i2c+bounces-15196-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBD8D26294
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jan 2026 18:12:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EAA16311EBDC
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jan 2026 17:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 970792D73BE;
	Thu, 15 Jan 2026 17:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ALNNE+yo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51C62D7D47
	for <linux-i2c@vger.kernel.org>; Thu, 15 Jan 2026 17:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768496543; cv=none; b=uiVntKXcHtyTUAWbd4hQzSSrAJXdpL1ijcqVMJJL3LyHGDgqRh/w7aJJWuGr7lmUNRlJERJBzER4zSV87PjB48aOGE0w39pFji84X7n5VQC72aZggH0RLxpBK9hm4kQJQ/STQEc5C8/tVwKOXzG9QmxxRYxOIXdkWEF9zJ52a+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768496543; c=relaxed/simple;
	bh=IpwDIvhr5VuqgX4fdAxB6xXe39k/dnAVORQtSR3VM7I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eKGYAjQFZhQG+qSoDybiXI+g4xVeGcjLqmpfmx89fNCTcA8LvDgwndYPPbNBHdctc1mGt72CVVBbr/OT0F6leLUilAOfDXBTDqeotRHN4tHey43PpED0KhUc099x5F/0UIMOUzk8VT7vwiUuc4RiAa28M6YQwmbJq/vEyl88Xic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ALNNE+yo; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8c655e0ee70so110986885a.3
        for <linux-i2c@vger.kernel.org>; Thu, 15 Jan 2026 09:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768496541; x=1769101341; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9lmL4wVgyCel4RaZm/YDnYaY71CyzahaKuw46/jDcwA=;
        b=ALNNE+yovVDKHLBFyd18PDX63XXG8lZgT1V2adakll4e3MdsUUgg5Hm76hLBNYhWnW
         MhDjSDPAk3KnuEFtKmlRGT4jWJD++PrdhIydUbbRaiWsorDBxJNWXqX68fiB4vR2t6Uu
         U+cN1wmHBS3qJLD6LGBirPUX6izHFUiMJYUXexRVrwgwJFxTFXi/xYB/FYvbr2XXw1Rm
         3UZ4sf29L/BYyrcKk33TqRIhSm4n0S5NjRBB2a/LyzXqMijht+92OHWTqQK8AkvHvHnN
         QMEbd9CBSHtNucIxbeinikyDZLMYG/e71pjEXBulvKu9YwM0k2jlL3l5l2vhNJ/f6ZtG
         hDwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768496541; x=1769101341;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9lmL4wVgyCel4RaZm/YDnYaY71CyzahaKuw46/jDcwA=;
        b=WIxzLjSASc3MfbBwAlKtpNs19H2gZ7KfsnugnNJOibf2UFgWZPM2n2rzpwOOm0co0Y
         VGpeY1pV3/XFbfb5Nx+OhtjXRpEv0cm30A0HdrlJqFPeIEY7zqvESBC2lf8yCBPAoKfx
         gZICTBe7wI3hzghBlrvVkRjqr0Pou+jtH1xp6ONCEmmLIIT8lwYjYVh2EHAtKEKv347i
         BxLXvY89kvoUd2FzqpcJ1AsIFml3lorVS8f2SduE6DO/BI1whU/ykvVvVEeLcVVNWnB6
         doOnsaeTMEYz22CT81qHOlFhNQJoQWPiCLMsOTRrfhBd1Xjfi4IKiMEiUk8jS2f1muGO
         QlCw==
X-Forwarded-Encrypted: i=1; AJvYcCXmgdbvYYZL6w49sCmJkjZZnHSkFmwBkMSreuSYphWr+rafVUVbXSUIZleT5E3t3N2k4f8AAQOzL94=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm/HRmmqHM0w0Ix5pl62ooeZp3/AGK45l7dagOQTjJv+AxBDwz
	HzqqsXmSzuN/vHnU6SuAd1buGbrr1iblWk8D7RDzgs8IALCVIAymBk6xep3llMn97Yg=
X-Gm-Gg: AY/fxX4OMkg163X5dhi5wZrdr0DAikVrSFbWRX3k0dt7A+TUhM9npm3Ih9m+mS8ubjo
	1YD+PnaVZav8xF6WEKlNLKYJMDpi09/Mer9cweuOFcGqT9EulqyZMrZTnMz9geXZY3SOn4n+6a+
	jTXe5YDv1u+UpZDd9IapaPaATIL0fti4CaoXKRyH7TOcQI8e0WJu0jddScw8XMq8I7eldmnJ8h+
	wD+KVvdArH8SSA+3fa5AhamkV7HNOnd6NmI6ri2M7AKmD0hBV38Rvxu5VbD/WvkJURpEJb8rNHp
	PGPw2HE4INv70MbG8XSRl4bAD3XQ17hAFEP2FxhbH27+Qgb/USRPaM4T8Lkng2mkch1PqVpGgM4
	eK0n0Ae5AJz3AgyRk7YC80Cv23mLuBcfqfrjLobtl1+UfeEHViLDNplyv19E3smLnQpNMJYZ3hV
	PG6EL6NOf7rg8p1A2PyQPGLWZi71/RKmx54coilybCCOngRmdoyBnD
X-Received: by 2002:a05:620a:700b:b0:8c5:3376:3326 with SMTP id af79cd13be357-8c6a67c857amr5981285a.80.1768496540568;
        Thu, 15 Jan 2026 09:02:20 -0800 (PST)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c530b74bc4sm455422485a.32.2026.01.15.09.02.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 09:02:20 -0800 (PST)
Message-ID: <00f42b6c-857b-4eef-a0da-83053998135a@riscstar.com>
Date: Thu, 15 Jan 2026 11:02:17 -0600
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] i2c: spacemit: introduce pio for k1
To: Andi Shyti <andi.shyti@kernel.org>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@gentoo.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Michael Opdenacker <michael.opdenacker@rootcommit.com>,
 Troy Mitchell <troymitchell988@gmail.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev
References: <20260108-k1-i2c-atomic-v6-0-41b132b70f68@linux.spacemit.com>
 <20260108-k1-i2c-atomic-v6-2-41b132b70f68@linux.spacemit.com>
 <aWeyT8gb8Z31S_V9@zenone.zhora.eu>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aWeyT8gb8Z31S_V9@zenone.zhora.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/14/26 9:47 AM, Andi Shyti wrote:
> Hi Troy,
> 
> ...
> 
>> @@ -171,6 +176,16 @@ static int spacemit_i2c_handle_err(struct spacemit_i2c_dev *i2c)
>>   	return i2c->status & SPACEMIT_SR_ACKNAK ? -ENXIO : -EIO;
>>   }
>>   
>> +static inline void spacemit_i2c_delay(struct spacemit_i2c_dev *i2c,
>> +				      unsigned int min_us,
>> +				      unsigned int max_us)
>> +{
>> +	if (i2c->use_pio)
>> +		udelay(max_us);
> 
> We need some control on how much we want to sleep in atomic. This
> can have effects on the whole system.
> 
>> +	else
>> +		usleep_range(min_us, max_us);
> 
> If we assume that max_us = min_us * 2 we don't need to pass it as
> a parameter. Even better you can use fsleep here which does it
> for you.

I agree with both of these comments/suggestions.

And if fsleep() were used, spacemit_i2c_delay() might be able
to just go away.  (The range used in fsleep() isn't quite the
same as what you're using, but this is heuristic anyway.)

However the delay used in spacemit_i2c_check_bus_release() is
90-150 microseconds, which would lead to sleeping in fsleep().
Is there any chance 10 microseconds (or less) could be used
for all delays?  Even if not, fsleep() might help here.

>> +}
> 
> ...

. . .

>> -	if (i2c->state != SPACEMIT_STATE_IDLE) {
>> -		val |= SPACEMIT_CR_TB | SPACEMIT_CR_ALDIE;
>> -
>> -		if (spacemit_i2c_is_last_msg(i2c)) {
>> -			/* trigger next byte with stop */
>> -			val |= SPACEMIT_CR_STOP;
>> -
>> -			if (i2c->read)
>> -				val |= SPACEMIT_CR_ACKNAK;
>> -		}
>> -		writel(val, i2c->base + SPACEMIT_ICR);
>> -	}
>> +	spacemit_i2c_handle_state(i2c);
> 
> Next time this can be on a separate patch as a preparatory patch
> to make the review of this one a bit easier.

Yes!  It's a next-level skill:  beyond just changing the
code, breaking the change into good, independent pieces
that build on each other, to facilitate review.

Thanks!
					-Alex

> 
>>   
>> -err_out:
>> -	spacemit_i2c_err_check(i2c);
>>   	return IRQ_HANDLED;
>>   }
> 
> Thanks,
> Andi


