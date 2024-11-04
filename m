Return-Path: <linux-i2c+bounces-7753-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F699BB499
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Nov 2024 13:23:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 03D94B2218C
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Nov 2024 12:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69A111B3928;
	Mon,  4 Nov 2024 12:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a+M3vrgj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778D01B0F2B;
	Mon,  4 Nov 2024 12:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730723013; cv=none; b=Ao8RuZw3LtPNFwQ8AHez5Xi+rSSE6HAI0UjYXQz98kUTDZDz9BYTEY4H/gyzo9UIEhVFtmnnGYpPGN0Z2qrCj9alKct3idGsb5M6Yo/DsBVvK4KXh6kkYFgSzDpTdAnKjNeRVoWXqwPCcqUtQB6iCkKKneTQvQ2GwvaF91uqGJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730723013; c=relaxed/simple;
	bh=ZFwj51A2gbZA7vJSStsy0TIypVjePjyNWxkZO2XfIEc=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=HKKM9EUxhkZaZD5ulikYBUaDW7wqdfV2C4GOt/prDF2+VC9BMnM0823YehLjSNlBr0tiibPXtoeLY2IClsLH0UohUxYLbLDTNui4mNstpOrKlTXqpmHph1Bd7WGfApAUXnoWT5Onw783kXeT52EpX2//LzfwXSaQqNWEPV2M2vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a+M3vrgj; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-20ce5e3b116so31260885ad.1;
        Mon, 04 Nov 2024 04:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730723011; x=1731327811; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fiCZNrw+g0MfYd+wHoshXkkg40DDzaFGOl5IzkgDf8E=;
        b=a+M3vrgj3twLLQ4O/48ElZVQa8MFsoFKNwgdmouzjw/IZnDpJ4l8slZMTjbccF0RDM
         fTh4sPUEG70nGnYUUoIUdVc3xz28wKTcxWG/evbf3L50HH5O/pI//QUfYVtYVj3Lorye
         ZVuLBHnDTH7tGL0Q3YWAABB1IyJHU3EfAYKqZNxg/kpZvYcofKUtFktuCiM7pKH0xh7f
         d09ExQWeFA7QabUimfSa0qr8crza48cRIevq0mGL1jAs+dTDstHMOqx8iljLLpv7aoFR
         2FIaChyZZcHpodfptS4+P3ySKAXhcKzgmcTFIIhM5rwx/SY32eFwmL8khfpeT8UC3tDr
         yOMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730723011; x=1731327811;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fiCZNrw+g0MfYd+wHoshXkkg40DDzaFGOl5IzkgDf8E=;
        b=M3zP9FbE86Grha/JH+6AWxwRMuMgvvXfy2dBQAA72GnwWhYv963gZgt2EykxUlhe0R
         KZ3gz/Az53qnVpS1e87jnriyEXi/hQklh0YpvIs2AbIAoeeHUMnPXddpTZqq/GHvJnO+
         D1/r88PSEboka+EmUyzkjCre+wrXWRFEYQJbf6pkRCp7HSOlOAiaD05kYCiwR+ZXkoIN
         FLpdt3ie+yWPjke3OMx9C/qI6j618/4ZZPWY32A5EThul+1flCfmaySXWaQ09OwIHsOl
         3TcrebIfP0dG6o97gUJlFcdAFeS0oKNMUIO0NBWDZrJR7HtFwmYew8rGalIoCCjK1Z6f
         os1g==
X-Forwarded-Encrypted: i=1; AJvYcCVyLRfogmS87XCWKNDkVtzifRK2mrvCKY486hBvzP2JcrQ6dxAsWp4PW8IUhoqvUvi6cYioAWhthETR@vger.kernel.org, AJvYcCWDLVteqvozi9ZFBG6PJiAhvP9gDKWVa1pv1sBTOmVHpXGluomkejjN3QSeFssNaRmFunMUR0dyBgHDYkpQ@vger.kernel.org, AJvYcCXQPnbq5R/H1hkggU6f3U4QiNmMXZo1c81phIfSF3jgE6aEb25QJzBeqv4FTuf8M19hd9uwOFenRMNu@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4M0M0WCEQGifFJIeZni3pn3tAiMgwXGvLRTwe3J9zEH3Mg7wb
	hJHlkrEet/Y88EqMkaNgNjHWwkdlgWiH3UgAcUelY45RLBs8xV+o
X-Google-Smtp-Source: AGHT+IHLvWMCkXJUq+FJuMDRusJubVpqKeDmaeSEQmUKm01US5Q5+wIpwJg+l9Cfx8xC6auYaOIr6A==
X-Received: by 2002:a17:903:2343:b0:210:e75e:4649 with SMTP id d9443c01a7336-2111af3fbfbmr177573405ad.17.1730723010690;
        Mon, 04 Nov 2024 04:23:30 -0800 (PST)
Received: from [127.0.0.1] ([2602:f919:106::1b8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057d3c3esm59811605ad.245.2024.11.04.04.23.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 04:23:30 -0800 (PST)
Message-ID: <edfaccd7-ac96-47fc-a174-912c8aaf0f5e@gmail.com>
Date: Mon, 4 Nov 2024 20:23:23 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: troymitchell988@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/2] riscv: spacemit: add i2c support to K1 SoC
To: Andi Shyti <andi.shyti@kernel.org>
References: <20241028053220.346283-1-TroyMitchell988@gmail.com>
 <stpzkggfwseaqy6kbppiog4xfbpq4r2jwix2nvredbmmjqzbsi@wkllt4jlingv>
Content-Language: en-US
From: Troy Mitchell <troymitchell988@gmail.com>
In-Reply-To: <stpzkggfwseaqy6kbppiog4xfbpq4r2jwix2nvredbmmjqzbsi@wkllt4jlingv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024/10/31 19:43, Andi Shyti wrote:
> Hi Tony,
> 
> On Mon, Oct 28, 2024 at 01:32:18PM +0800, Troy Mitchell wrote:
>> Hi all,
>>
>> This patch implements I2C driver for the SpacemiT K1 SoC,
>> providing basic support for I2C read/write communication which
>> compatible with standard I2C bus specifications.
>>
>> In this version, the driver defaults to use fast-speed-mode and
>> interrupts for transmission, and does not support DMA, high-speed mode, or FIFO.
>>
>> The docs of I2C can be found here, in chapter 16.1 I2C [1]
>>
>> Link: https://developer.spacemit.com/documentation?token=Rn9Kw3iFHirAMgkIpTAcV2Arnkf#part5 [1]
>>
>> Troy Mitchell (2):
>>   dt-bindings: i2c: spacemit: add support for K1 SoC
>>   i2c: spacemit: add support for SpacemiT K1 SoC
> 
> As Krzysztof has asked, please do provide the changelog, it's
> important to track the progress of your series.
I saw a compilation warning sent to me by the robot, and I've
fixed the warning. Should I resend V2 with the changelog
what I miss or send V3?

Thank for your response.
> 
> Thanks,
> Andi
> 
>>  .../bindings/i2c/spacemit,k1-i2c.yaml         |  51 ++
>>  drivers/i2c/busses/Kconfig                    |  18 +
>>  drivers/i2c/busses/Makefile                   |   1 +
>>  drivers/i2c/busses/i2c-k1.c                   | 658 ++++++++++++++++++
>>  4 files changed, 728 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
>>  create mode 100644 drivers/i2c/busses/i2c-k1.c
>>
>> -- 
>> 2.34.1
>>

-- 
Troy Mitchell

