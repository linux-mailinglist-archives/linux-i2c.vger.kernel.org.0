Return-Path: <linux-i2c+bounces-2802-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAE089ACC7
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Apr 2024 21:52:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B181FB2202E
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Apr 2024 19:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B19BA4D9EA;
	Sat,  6 Apr 2024 19:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k5ruHrHP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67D1482EA
	for <linux-i2c@vger.kernel.org>; Sat,  6 Apr 2024 19:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712433163; cv=none; b=r+zKQzVnr2jRiL82fvw2sea4/leo3U5oHIe676HHS0xXTOYT7pmrymf4M7zSm1BeS7DU2cA9vNDPfJ+qmJ2azsyz7/h+qyade6vaCD1SzwBlIkCIkuYABup1V40j+vY9YHtNZh13chjAYWDi3A6Arq8LB0HTtOkSojfLKZFnLgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712433163; c=relaxed/simple;
	bh=n0iE8d6F6vBadnXtUlFdxkRD9SjQ7swomjgdvK0aQnQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OVhxFf/QozmM3xDwc2WTP5r3/bYxysj7JIrr654/gO9zk28CNTr2EqThFLf0kZBJ5nnvEaFsz1umMYiOHWVzObRlvsYr3J2D3mM40mUUoBdr0BBbcfhK3LSefcucAmOHvShRD+A0ipY7HLl3JVuMr//5+392Gbwvi++sQ+fqKcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k5ruHrHP; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-345600106d3so266262f8f.0
        for <linux-i2c@vger.kernel.org>; Sat, 06 Apr 2024 12:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712433160; x=1713037960; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=N0Oy1r4PlkwKd/UuWhr2TcHoAbaNDgKSD36d9uy665w=;
        b=k5ruHrHPbw1joQyXzwickA3vBkComVl+heLpVCYIOxYEajjzRrjeoaQcZGA7ssC/o9
         TAo6hy1YiRTad4MNJyAnStM4DT8vrb8Y5FlSH6LSej7QRX77oV1lOtUC8IsHrIC9tIMi
         fJ2tR8699Q0U3Tdpj7uMRQAXclzHdBHKIEg6Z4VdbV3018xNJgmKTvBJjVkoYCdkOK+W
         N6FtsW8qsDr1euADfvD2+UaaNq09RkcNzkkkdY8RoOQmXHd4l/A12iXDh1TAWnflqt0C
         l9H7NOZAlX5VMlof5OZGOIdyXw+tJ3ZqQLtmTI7VmQNYxlw4Dlc0IM8xO6r/fXoZON0w
         HGfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712433160; x=1713037960;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N0Oy1r4PlkwKd/UuWhr2TcHoAbaNDgKSD36d9uy665w=;
        b=Xzsg0bTAdLHaG5h2y/pKy0ypADlvLSyZGyCwolrpfNVyRF3ypeRvhqtj6ENvfX6s7j
         93i15gG+IgwYbJt0fOUe+sf4x5ZdO/hU7frS3kncS25pe7kxeuwKeoRuenV1antFpITm
         06zE0K85q+gxg4oru1Z6buCfajzt/6hfRInyv758FPPs8M2nGUffipP7Vy/96u7EpNQt
         hqo13Ry/QCPVjJYs2NMk+r4+PW7gRC84vXPEI8SY/UOKiQl6zXvlbFB6ZoCONK65L2Ac
         EFg3HCeQFiDVq1sgBuDGfDskilKx+S4WpCG4XlZ2st+yqaPk+NMkbqt3YWHA4HpvuQtV
         ZPnQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+QKQhIZs7tymyKHj8YAE0knhpccSRD76wO0sXGZfvELkclvm0LhM066gqg+h/zattSsTRdBlHTEABMG5plzEVL9HIuMWrdgEL
X-Gm-Message-State: AOJu0YzHWImGa9QlfAWk86x7uEYUrca0nQW+G/DgmsVbuk2BQfWQes5H
	3Jzm5Z3ThwUz3IpAgnz2pj1IA+Rnxb8q48SQqHykZxeJH4V6v09f
X-Google-Smtp-Source: AGHT+IFEzwQwrpCr1mqVfIcAsHqORhvA557mDG23VrbM0aX+hCuOnSfgv2hhYiVoLbx/ikKUXk5v0w==
X-Received: by 2002:adf:e449:0:b0:343:80d7:6b32 with SMTP id t9-20020adfe449000000b0034380d76b32mr3503791wrm.62.1712433159791;
        Sat, 06 Apr 2024 12:52:39 -0700 (PDT)
Received: from ?IPV6:2a02:3100:9072:5c00:7038:9efc:32f0:4d2d? (dynamic-2a02-3100-9072-5c00-7038-9efc-32f0-4d2d.310.pool.telefonica.de. [2a02:3100:9072:5c00:7038:9efc:32f0:4d2d])
        by smtp.googlemail.com with ESMTPSA id 19-20020a05600c26d300b0041644e9f3a9sm1057479wmv.0.2024.04.06.12.52.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Apr 2024 12:52:39 -0700 (PDT)
Message-ID: <32f71a94-1997-486f-905c-90d3cee2370c@gmail.com>
Date: Sat, 6 Apr 2024 21:52:38 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: i801: Fix missing Kconfig dependency
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <5b43041f-4f97-41dc-87fb-c2da425e7654@gmail.com>
 <4dhfyaefnw2rtx5q7aaum6pfwha5o3vs65iqcrj2ghps34ubtw@b3bw3gggudjs>
 <b31f445a-6f9b-47ed-94eb-b80360846625@gmail.com>
 <ilxot5cgzlivhmxpuiifpnyx3jxymlxy2avnkqjgfzcgmmk3wd@glnv7nlydz56>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <ilxot5cgzlivhmxpuiifpnyx3jxymlxy2avnkqjgfzcgmmk3wd@glnv7nlydz56>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.04.2024 02:29, Andi Shyti wrote:
> Hi Heiner,
> 
> On Fri, Apr 05, 2024 at 07:57:24AM +0200, Heiner Kallweit wrote:
>> On 05.04.2024 02:54, Andi Shyti wrote:
>>> Hi Heiner,
>>>
>>> first of all, thanks for the fast reaction!
>>>
>>> On Thu, Apr 04, 2024 at 10:09:50PM +0200, Heiner Kallweit wrote:
>>>> The original change adds usage of i2c_root_adapter(), which is
>>>> implemented in i2c-mux.c. Therefore we can't use the multiplexing
>>>> if I2C_I801=y and I2C_MUX=m.
>>>
>>> What is wrong with select I2C_MUX?
>>>
>> It would solve the issue, but:
>> We would uselessly enable I2C_MUX also if I2C_MUX_GPIO or DMI are disabled.
>> W/o them the mux part in i801 is a no-op. The call to i2c_root_adapter()
>> is in a conditionally compiled code part, controlled by:
>>
>> #if IS_ENABLED(CONFIG_I2C_MUX_GPIO) && defined CONFIG_DMI
>>
>>> And is this covering all the cases?
>>>
>> yes
>>
>>> Last thing, how have you tested and reproduced the issue?
>>>
>> The CI bot report included a link to the kernel config. So it was easy
>> to understand the root cause of the issue. I could reproduce it by setting:
>> I2C_I801=y
>> I2C_MUX=m
>> I2C_MUX_GPIO=m
>> This config was also used to test the fix.
>>
>> Underlying reason for the issue is that i801 has a code dependency on i2c_mux,
>> but not on i2c_mux_gpio.
> 
> Even though it might look trivial, I need to reproduce the issue
> first and check the various cases.
> 
> Because I'm not at home and, anyway, the report has come late in
> the week, I can queue this up in the next week's pull request.
> 
> I'm not extremely happy with the new _CONFIG but I understand the
> reason behind it.
> 
Whether an additional config symbol or an equivalent expression for conditional
compiling is better may be a matter of personal taste. I had a similar issue
in r8169 and followed the suggestion to put the logic to a new config symbol.
a2634a5ffcaf ("r8169: fix building with CONFIG_LEDS_CLASS=m")
Therefore I went the same way here.
Sometimes I encounter concerns when using macros like IS_REACHABLE().

> Thanks,
> Andi
> 
Heiner

>>> Thanks,
>>> Andi
>>>
>> Heiner
>>
>>>> Handling the dependencies in the code would become unnecessarily
>>>> complex, therefore create a new config symbol.
>>>>
>>>> Fixes: 71b494e043d2 ("i2c: i801: Call i2c_register_spd for muxed child segments")
>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>> Closes: https://lore.kernel.org/oe-kbuild-all/202404042206.MjAQC32x-lkp@intel.com/
>>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>


