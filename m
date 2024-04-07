Return-Path: <linux-i2c+bounces-2809-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F5B89B388
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Apr 2024 20:34:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F2831C20F81
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Apr 2024 18:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71E0D3BB48;
	Sun,  7 Apr 2024 18:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kkZ2sISO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B911E864
	for <linux-i2c@vger.kernel.org>; Sun,  7 Apr 2024 18:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712514887; cv=none; b=QOCsz5+r6pjgBkiLyAG8BkXQ2zi0pVdK9qDnV+tNkR0qK5Br7jq3qXDg2EEzeaqgEBB2OfMjEOXzZx8LgPPFdxIbw5FU96ogQ0seFhcdUVMsh4wDpUxbFRxEgxG/50BdyJcdRduNX8QdEO/bza+ErWWjpmqV0d8z+AtWBeWhTwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712514887; c=relaxed/simple;
	bh=7LmRS19KFO736D4brquMmbDkEUL9hM5+pkffCH18p+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dbJxjPgMFwlzT2lZseliPniFKF/TmDEYx5IkKtft1naMO4NzeoEAYh0QerBZWz9PDc2lm48AZuK4tfnnZYcOwjiMXDrfP3ftBsVwDIhtyFhujPD9rL4KpVbBM9JhytlGfEcfE8Brw+A6h+uDaQhMbpPIW04tZGASFkbkRzCSb9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kkZ2sISO; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-343e70dd405so2031361f8f.3
        for <linux-i2c@vger.kernel.org>; Sun, 07 Apr 2024 11:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712514884; x=1713119684; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SvQXjGJQPBA401XBIlsS/tD/XGeY87TdwEejHrIn5oE=;
        b=kkZ2sISOo4PqxBa+Ts6tn0EoHgtvm8FaN0FMu1hd4BdscLAtqIDg99p5PCKHwY5lH2
         Cm+aGh2gPMxrFJ2xxceTzOZUg/1jPGrad31rdnmMaqkhGan/if7PLCe3U16JkYdAmP6k
         dcgbl3zQshi2ArKIZPVm9OB4DaXN/SgfgWQgMDhrMMDCTvQP2mp+pMpCTxkQclZ47xZv
         xffeEh7RwrmXANGzLAUg8D/D/RAeRptnt5dgMBOqVsOlqoQqxHnXxJ2ZPBuMkko7L7ZJ
         ZJhifpjwuahV4pYd25TK2SGs/Ik2Evlo1EP7dIjHuoATA0LvLwdG9aufU+wBCans09HC
         JVtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712514884; x=1713119684;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SvQXjGJQPBA401XBIlsS/tD/XGeY87TdwEejHrIn5oE=;
        b=H+TGaUBgjtpr8Af+GLhOfDBBEsDTaNYUiJN0E41m7O4/VCvoQPmcTKbyY3ngGcQV/k
         PAj66DBwI7YAb6iF2CD/lbpuWFUdPqGJl7iAqZa+ZYJAlY8hcpHYAoZAr1XsXDuqjvxD
         MykGtxVRwixyfq3r6f15zZ38AqyAWaoV0daFR8us8KPbGwSGpVlCC1K4F+7bPJuKrBfu
         PH80nbewC708b7f0yDQdAUgOSWkY4ISDZlGPnXi35g4TCiTeiMEu0ruBE50NRo8gwoiL
         nsZj8G575e7gSjvGug5zoAsL4w7Kdu2Gakn43IWQNiSIjPVM/MHlnx1damDjItIdI5K5
         kxjw==
X-Forwarded-Encrypted: i=1; AJvYcCXfE6UbcYt0xV8Xu19+Jpe+K/y/Oa6V1EMg46ojOGEweelKuoz50qX8cEVcj97bju6AoLWRVPsh+m4UXHP0ahstb2+XtuVUj8qp
X-Gm-Message-State: AOJu0YyzfCEqKoYx0OGB9hSLS4lT4IP3Oxzr+JpKJnNjR3fGpkl90Gk3
	Wg+jANVe4P5sgbUobSuheNqg/hz6G1xEnWFfulLsg5cb19dYZtKSLTpaoDNd
X-Google-Smtp-Source: AGHT+IEGygyKbPtWH1R9xetATz50fKhv3Qo2cv5S7pGEMhnxJ+Hqg454vEi4aCzgVBi367AOglF9fQ==
X-Received: by 2002:a5d:60c4:0:b0:33e:72f4:2ae with SMTP id x4-20020a5d60c4000000b0033e72f402aemr6591401wrt.68.1712514883511;
        Sun, 07 Apr 2024 11:34:43 -0700 (PDT)
Received: from ?IPV6:2a01:c22:6fd4:f700:9085:be89:559c:1393? (dynamic-2a01-0c22-6fd4-f700-9085-be89-559c-1393.c22.pool.telefonica.de. [2a01:c22:6fd4:f700:9085:be89:559c:1393])
        by smtp.googlemail.com with ESMTPSA id a4-20020a5d4564000000b00343826878e8sm7131604wrc.38.2024.04.07.11.34.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Apr 2024 11:34:42 -0700 (PDT)
Message-ID: <a4092c9c-372f-4020-9a47-72941b8690b1@gmail.com>
Date: Sun, 7 Apr 2024 20:34:42 +0200
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
Another simple solution would be to move the implementation of
i2c_root_adapter() from i2c mux to i2c core. It just uses
i2c_parent_is_i2c_adapter() which is an inline function of
i2c core. What do you think?

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


