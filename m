Return-Path: <linux-i2c+bounces-7273-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B41994700
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2024 13:33:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED71A1F2486E
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2024 11:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 074B31D2B0F;
	Tue,  8 Oct 2024 11:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k5OcTMj3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7D218DF88;
	Tue,  8 Oct 2024 11:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728387103; cv=none; b=aTJo8G6hraTs7nuzvWfiGlXDgw2j7ViLe1xQ9Nw8pMZT5FSBMm3G6ODnvsvn/NzsTluZIfDI6bXwj2ERhJzE0Pu6LYjDFnQpqdeEGEtKmvKZlH8Nhsf2dzTGbxWf1DxECH5G5MFeaozLZViGp/+YzeTAaWKHaLBPdZzA5P2GGZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728387103; c=relaxed/simple;
	bh=4MLtgjRxxgNkMelO+GUd2m509woOHNHx71wgXxKEFmY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=azl55tZovLHMg8p37lyl8pR177OdTglmaBakiRWENlySGcxO5NO8trUbEQrhoU1rlf6wFIqWfGCsqqiVTySleofs1fOCk0hh4uvrjKoDQQHcMyf2fgOuGipv0DLXxqHj4KDkfKjmDWSDOX1rBAYMb0bLKA42rt4LOGasHaoev2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k5OcTMj3; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5399651d21aso5012597e87.3;
        Tue, 08 Oct 2024 04:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728387100; x=1728991900; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lvp626noP7oQtVR/zGHIEJU6VmV0Wj8kYermT0He13o=;
        b=k5OcTMj3qwof2Dx7jZz/171pD7L36jWPbr90IqdD+osmJhN7ozCuCO0oUsfCRxRo29
         muJea4OTkTVwZFzte0s06BY1YSlI3176V5yMBtvAxYT4pm8zG84Ps7DJ6fbO/spXrl+i
         YzbMyHea5LtLke25qdSRKxBdQeOUIbU3PLWmZt13nSA6W+8K8oFDDxEhsV/zrs95p9Jf
         fCVZcfuZPa3ZaA6u88K3Zo4B8ECz8qrF8fpNbdVERHj3LCgfXRfC0N4YBXCU4enr2VHy
         5tzN9YxKhBA6thPRNw/RfhpD6kabsmOZNh19LO4MYUWQyoseeutWUaSZSNkCjq6/1I6u
         gD5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728387100; x=1728991900;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lvp626noP7oQtVR/zGHIEJU6VmV0Wj8kYermT0He13o=;
        b=CFflJEzQ2EA99VVXBb5qP0D5KStuQAP52KFOSRDlC9N83LZFUDOQIVcTSn7kRXquDQ
         hesqyVvdagtj3SWhm5tZKS0FetVfRyCIAjnBb6b0z/IHJyjZ/UTsAN5LOjQ1TF81aPYv
         8MPJ64hPQO3tuzIb6Aabq4VubwEk+3vq9adckSs9rbDAj6eLvjCsmgsmBftoZVpt64bI
         TnuqtjNBHxX90ADp+qbW9NRPO+fhlhbhuapqaZV2KJ0KqhY/k9C8xl7PPSG1Hr8Vpu/3
         AA0A9uU4idQFQ3O1BoAIDqROBRTGwcCmx/f05yuSmQpaXRoZ3hld0BLPadqeduEHcrW+
         8P7A==
X-Forwarded-Encrypted: i=1; AJvYcCVG4VrDpM39e3eWndgAaqlFNmOMG8db6SDvWFFvTk7mP5SbUtFCjl6LMAtFi54m2Y/9sxqacFvo+SQ=@vger.kernel.org, AJvYcCVZewQYEl+bNatV+9HpuPZJ4rxp/SKjWA9MNp7c1PjqjiByU7drOeDXVQyax2IAPEuPpWTsH6vYi97fQSs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6miFN/8AVT6XKg7E4hPPVDpkj5RwzPxUGMxDmql16H2E1xffG
	m1s8UYZkDNlOcp9usxr5LEhLC7BbTxLkZbjXx/TmG5ukWBiNm3F+
X-Google-Smtp-Source: AGHT+IFKRePoUOJoo5YlQxFsV7KSx5alX++zJApTJXAMyCafsd1hVw7C8XCpYGKpyt8KRn4KhaCkpQ==
X-Received: by 2002:a05:6512:b14:b0:536:53f0:2f8e with SMTP id 2adb3069b0e04-539ab9dd5f6mr7598911e87.37.1728387099896;
        Tue, 08 Oct 2024 04:31:39 -0700 (PDT)
Received: from ?IPV6:2a02:3100:a123:2000:657f:ba1:5709:f401? (dynamic-2a02-3100-a123-2000-657f-0ba1-5709-f401.310.pool.telefonica.de. [2a02:3100:a123:2000:657f:ba1:5709:f401])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a993a929562sm440959366b.121.2024.10.08.04.31.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2024 04:31:39 -0700 (PDT)
Message-ID: <1186d773-0eb7-438e-9947-fb3de453d2ac@gmail.com>
Date: Tue, 8 Oct 2024 13:31:39 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] i2c: Replace lists of special clients with
 flagging of such clients
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Wolfram Sang <wsa@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 linux-sound@vger.kernel.org
References: <3982b2a6-975e-40d2-bf02-2155e5c36c14@gmail.com>
 <ZtQ0KMWUk9iAUCCl@shikoro> <18306ded-6451-4880-9f74-6bceb0f26dea@gmail.com>
 <ZvqEhntonE9qWnPF@shikoro> <ZwTwoQLAU9emhn13@shikoro>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <ZwTwoQLAU9emhn13@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.10.2024 10:43, Wolfram Sang wrote:
> 
>> Yes, hopefully this week.
> 
> Reviewing and testing now. What tests did you run?
> 
Of course compile-tested the series. Functional test cases:
- Create device from userspace
- Delete device from userspace
- Delete adapter (by removing adapter driver module) and check that
  userspace-created client device has been auto-removed

Driver auto-detection I couldn't check due to missing hw.


