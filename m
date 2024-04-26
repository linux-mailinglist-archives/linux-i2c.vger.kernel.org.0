Return-Path: <linux-i2c+bounces-3238-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5028B3E7F
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 19:42:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B4101F227FC
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 17:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69C4315E80A;
	Fri, 26 Apr 2024 17:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PWxSOA6U"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9937E13F434;
	Fri, 26 Apr 2024 17:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714153362; cv=none; b=FiLkUAwOEABFHhrBwIWInnQdc5Nm8N1VQt2hkYn2LicEjHAuD4UeCwcZPGMcAxLBQJdeLEv77WyjICyFj2mpzYwtI25NGC4BFy1CjSeGX6nnVaX98Fg470dnCNT8L4/Y2yNVkQETrztrs0L5YY3x1q64GvchlzEZQybLWkSY4dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714153362; c=relaxed/simple;
	bh=iew28E6SC8pRlfabYLSUCkUcxy4Vusz3YMlLvT5iEuw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lEGwWpl3dd4qrix8bYSVFl/56Z0JaFMVwoO63GlX5Yh0aatJ4R6hxAs+/7iFVaF9jyUPESllNaDjWCYCy+p8uPCWBhkU/tTKvKPrGTWYIksUU12duHCeqq1LI22wrftB9mmLy5l94hZmiWm5n2B6yCgPqyUAq/JFaWBfg8mSFiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PWxSOA6U; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1e5c7d087e1so22100855ad.0;
        Fri, 26 Apr 2024 10:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714153360; x=1714758160; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=S4hrJlRgAOCqHQ08bNE8svA7F79OU54ygXfhfZNWWO4=;
        b=PWxSOA6UnzNIQqvudb3CdouD7PGP2KVSkVj3mqsQoG0NH+cecSfaKzzO0ZlhnbRBRr
         1oJG3PtL2lpQDeGTHtGege/vPvDk7yG5y/hS9XW7BHd5uWJ55eC3CCXYRPBV5K+f4X0Z
         htf58xppr0PTQtQ3USleX16AYcnMl3QK2bqSB728Qq3AUwTp/tiHlWxT6UbvMuhraeiu
         Maq0ZWS3IuPsKIp5UIBufOLcmA1D+T0lV35zGCXeI40av6b2JwgTwEmqE32MNksZRp4C
         yiMXHBJur9YcruodbLa2oXYUUXpmvfWa6DU16zA6Csmss7GhC8FqB6sTSf29fpdaNn27
         Jr/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714153360; x=1714758160;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S4hrJlRgAOCqHQ08bNE8svA7F79OU54ygXfhfZNWWO4=;
        b=Qg4nqhcOIcS+u9Kn6GDAhkZolkeACaHyGFsmDFDoqC5j8lF+EeVQN8lMeo1UesvZN4
         CACkeGB3lGsE5L2GkVSxfyIKPjo9rrgSYkq/ELCIMaKLAiHcAgT0W7tJ6z/PElKuI3u5
         KNdf2THbxby0PYsjLGggmvHozEtyF7Tg2lacDIYpXXDIDC5CSFCxzuj/FiGdjykdtW8J
         BxBt54180QU99uEJ/rOqNQYa+YnJ/mHc6s3Df76tnIzdg7qb0fB18xcyZdxgjFuXSIFh
         tyazzHfdkonJb8DiJ9e1/O9FgtHiTVFe9LHk1aJXGFiGnd+Oqwk38LtyDd0fYDMqBBp4
         EQoQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+Hv59w8UZgXJrZbD7Owc8BFJywq1BJ952Kv0vVgKTqKnAyGJME2iJjS0OOSY8wsprW6qgTIn7IoH8/pI+cPbCvE1aUVULGxS7XVnLs37V4dDG9dHOU//VrdPFZfetIk2Pa9DfE0U/kzjc3QxcDJ9Yk/iEd3DRk8VqGh23wNVUOB3miJSaKOKm2pcSTpLnYLl/rO4cbuDRmMBcux0lq6ar65HuX9huYeXGUlvr2k+sEqw60bQs4+SUSxO/
X-Gm-Message-State: AOJu0YyUTZWkj1jhMgn6Img5Wpn1CgX5GvVuq6b2mhFOGGH1pfd+HM6P
	YsseEyNdCKTjkkcONn2dhyP5XsgdaoeSX7R2RSbuBWHQU7Ageg9v
X-Google-Smtp-Source: AGHT+IHsfwJxs/jTVVMWTyLstuBjqb0rgnC7UKoq55PNUvZUGO1Z4eF0t1rFM8Bvj3zLsHOdMn0dOg==
X-Received: by 2002:a17:902:da88:b0:1e5:556:60e2 with SMTP id j8-20020a170902da8800b001e5055660e2mr3738573plx.5.1714153359794;
        Fri, 26 Apr 2024 10:42:39 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x13-20020a1709027c0d00b001e85d0b6a7dsm15739246pll.293.2024.04.26.10.42.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Apr 2024 10:42:38 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <dec55581-2f50-4125-9254-c6104b0a14cf@roeck-us.net>
Date: Fri, 26 Apr 2024 10:42:37 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] hwmon: pmbus: adm1275: add adm1281 support
To: Conor Dooley <conor@kernel.org>
Cc: Jose Ramon San Buenaventura <jose.sanbuenaventura@analog.com>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
References: <20240425070948.25788-1-jose.sanbuenaventura@analog.com>
 <20240425070948.25788-3-jose.sanbuenaventura@analog.com>
 <1a2e6020-77d8-4299-87b0-e2b16dfb3f86@roeck-us.net>
 <20240426-emoticon-exemplary-a79b0dfad5ce@spud>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240426-emoticon-exemplary-a79b0dfad5ce@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/26/24 10:01, Conor Dooley wrote:
> On Thu, Apr 25, 2024 at 10:52:03AM -0700, Guenter Roeck wrote:
>> On 4/25/24 00:09, Jose Ramon San Buenaventura wrote:
>>> Adding support for adm1281 which is similar to adm1275
>>>
>>> Signed-off-by: Jose Ramon San Buenaventura <jose.sanbuenaventura@analog.com>
>>
>> Patch is fine, but we'll need to wait for Conor's feedback
>> regarding the compatible fallback before I can apply it.
> 
> Oh, I didn't realise you were waiting for me. I had deleted the thread
> from my queue given I had already acked the patch.
> 
> I'm not really a fan of the warn when IDs don't match thing though,
> seems a bit unhelpful, unless you've running into scenarios where the
> firmware tells you there's a device present but actually there's some
> other incompatible one.

That is pretty much what we do, because many of the chips supported by the
driver are not or not fully compatible to each other. Sure, we could add
more information about fully compatible chips, but in my opinion that would
just add complexity to the driver for little if any gain.

Thanks,
Guenter


