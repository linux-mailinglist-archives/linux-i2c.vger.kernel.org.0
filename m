Return-Path: <linux-i2c+bounces-7732-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7579B99A1
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 21:45:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BE515B20D3F
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 20:45:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B1A21E0DEB;
	Fri,  1 Nov 2024 20:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="clXnaahe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90208154BFC;
	Fri,  1 Nov 2024 20:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730493944; cv=none; b=VQvx+zuUC+nCP4iAWTNtsJnDPkQcCFG3IoS/vzLZwUPUab+fyTFj6Y1atcslIRFkGIA9TljBckn967EH1ZPGYwsX2PyEqD71utlsYbWHYcXSsowVx6WF3uq3fXF6RrXjF5wWKj2tXVjdIOHhX/FWrhRa0Fny5ogVaBwz/8BBHf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730493944; c=relaxed/simple;
	bh=wT24nbG0GO8bOR+84NgRVa4ssOhiPhE4+9WlbsvMobw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=m/n3LvLmdCfNGXOoFnimNssauiaTDrj950RX5siSkOxuvlXwbGWLHZ2Qa5E0BZRyBnluGcyj2FM8my8cGV02x6eAPAd3HaKgNMlHJG1iW/owgOxPcbR10RM7cqn/7w3vocuNQIYA9NOfoCoUDT3CEXTtj12PqGSR6GK+A5JpXXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=clXnaahe; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a9932aa108cso357966266b.2;
        Fri, 01 Nov 2024 13:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730493941; x=1731098741; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HV4NEthirWHBpiRUvuZaZMuQyatoWU1sxWg/Z5zBy5c=;
        b=clXnaahex0760aKaVVRnAHfgNBt1aHq9ClyrPPdVVXV9sxciBmlx/nc9iyTTByGG9m
         DlWyDwrFqlSkhflHcFoPyQuABCztRWUgbPPsGORCvASQbkbfq7MiGs2U9U6LCPZjW0uI
         RNsOvORFscCp0jLcNyYXRXiO+7wnCSOyvvtbV8h6NqQl990EUl7EjGTsxIl5Vek6SoUw
         ZwA4dwiBUrKSNrU0Q9d81O3pX7cuP60Pnu2YNDdQShU7tER2Kk1BD7bZxseABovNgNfA
         0f+aZxi9Gx5eKkq64EQoAK/jm+qEOBDV3LufUT4GPJzY6+3PoQBwSTCNHokVN6GTTdLo
         i1RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730493941; x=1731098741;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HV4NEthirWHBpiRUvuZaZMuQyatoWU1sxWg/Z5zBy5c=;
        b=PCmOLi2p4x/G4BxaG+ex5q4O2GDvC5mj9jeOzP4y79+uvVCop/9SOjSeiO6tBAZ7XY
         xtSaB1rQ/euIlrq2uj9R4W9PmCCSsbPMxTWG7linWNFSM04H/ZhFapjzXK0xVs7A2Dc/
         LI1dKGB4iwcnivQlAby5ieLCOvZ87rQpAY5isOUtDF+8BUXryFLz6NSq0vfm/8pwbv3R
         z1GQwNrszMHokEBwr6wio8p72itfSsGpazjtyvMoDk0KUElUN51pCNUkL66TVCO3M3rV
         f7CcPSaIWU12C2RamGxIoOWlHrUPdRPM6ubcAKD3SDVB+Y5/maLOo5PnFTaHpQikWMS8
         PrJA==
X-Forwarded-Encrypted: i=1; AJvYcCWZnZ6PEaA+ZlOYA+RgwlV5uHXvyAVBSyAvq+POS+2gisRNz1YCKvKUEaGF/JIN4OYbFiUVeei9eno=@vger.kernel.org, AJvYcCXQYDlOOlNGDqXDgw3sJaO64lEvh0ApbF9cQ6wY251n4TXFxY49CulBI+uhLzBHWp/wXmvy2FA6iiL9Ab8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoW6ZyDL6o3ctkmKxT37rFrWtHcxd3z+nkhB90FVz9fR7fZBFv
	aA3T3WN7EtoJdYUuLX3jFV8IhNtCPsJgasAbviKmvMS1bevaBPO9
X-Google-Smtp-Source: AGHT+IG4+svR7nj7biWVvQrIiRtMkiMjXGhHc4Gu8BN8zDiwhPzx9jI1Y02iaJjtu2L8YXoRSAhtMA==
X-Received: by 2002:a17:907:9812:b0:a9a:49a8:f1fa with SMTP id a640c23a62f3a-a9e508e9870mr677932966b.23.1730493940526;
        Fri, 01 Nov 2024 13:45:40 -0700 (PDT)
Received: from ?IPV6:2a02:3100:9dbc:bd00:c5db:e5ed:512d:1904? (dynamic-2a02-3100-9dbc-bd00-c5db-e5ed-512d-1904.310.pool.telefonica.de. [2a02:3100:9dbc:bd00:c5db:e5ed:512d:1904])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a9e56698e06sm226278066b.225.2024.11.01.13.45.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Nov 2024 13:45:39 -0700 (PDT)
Message-ID: <228c7822-92bf-4939-abda-a2a21c74c18e@gmail.com>
Date: Fri, 1 Nov 2024 21:45:38 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] i2c: Replace list-based mechanism for handling
 auto-detected clients
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Wolfram Sang <wsa@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 linux-sound@vger.kernel.org
References: <3982b2a6-975e-40d2-bf02-2155e5c36c14@gmail.com>
 <d52c2722-5f2e-4224-a8b3-7c9d0cb431d0@gmail.com> <ZySE7OqlvRRvtyLc@shikoro>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <ZySE7OqlvRRvtyLc@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.11.2024 08:36, Wolfram Sang wrote:
> Hi Heiner,
> 
> sorry for the slow response. I am on the road for two weeks now which
> doesn't leave a lot of review time.
> 
> The good (or bad?) news is that I finally found why I had the feeling of
> "something still missing" from this very interesting approach.
> 
>> -	/* Tell drivers about this removal */
>> -	mutex_lock(&core_lock);
>> -	bus_for_each_drv(&i2c_bus_type, NULL, adap,
>> -			       __process_removed_adapter);
>> -	mutex_unlock(&core_lock);
> 
> You remove using the lock here...
> 
>> -	i2c_for_each_dev(driver, __process_removed_driver);
>> +	/* Satisfy __must_check, function can't fail */
>> +	if (driver_for_each_device(&driver->driver, NULL, NULL,
> 
> ... and here, because i2c_for_each_dev() utilizes the lock as well. This
> is, you open a race window for deleting clients via removing the driver
> and removing the adapter at the "same" time.
> 
I think this is right. However we may have the same issue already,
w/o my patches. In i2c_del_adapter() the following isn't protected:
device_for_each_child(&adap->dev, NULL, __unregister_client);
So it may race with a parallel driver removal.

> The obvious solution is to use the lock also when removing clients in
> i2c_del_adapter(). But this needs careful thinking about potential side
> effects.
> 
I think this is needed, however I have to spend a few more thoughts on
whether it's sufficient.

> Makes sense so far?
> 
IMO, yes.

> All the best,
> 
>    Wolfram
> 
Heiner

