Return-Path: <linux-i2c+bounces-11367-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EC4AD699B
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jun 2025 09:53:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73D983AD9C4
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jun 2025 07:52:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA49621D3F8;
	Thu, 12 Jun 2025 07:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="RLCBQkHZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1DF21B18B
	for <linux-i2c@vger.kernel.org>; Thu, 12 Jun 2025 07:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749714773; cv=none; b=qPW3ToGzKt59oQQgQRslBytdTzP5CZmbdHW9KvMhvqXtPu92sL9VQSKDEBeJ+Is4GBuldAUuwyqxYXkFFAQ403ma9DuQ0aG5Zx/IJLqc/dbLzxS7pb86sp0Oqu/58F2ZsUa4bUY0ljm/4oxsV0o+OJvyAmRRxpA7X3k6rPAWanc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749714773; c=relaxed/simple;
	bh=yvHjrzaORTg7HRp2cirzIboSTrREVTHWqhVe9uNJ0K8=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=FP+LA2GHVogDJvlpFpqPzYMcEvWkoa2prdZjBTwvkjbzdS0FxAzI2QLaEM3h+jHe6PpToyiEHs2xKSjCkiliYoltdmlNTxd7NnPNjyabGyM2lQ/Zy+BKOYbMifHQvcvEhq15Ofw8E4027Q9ByP9j7lWhf0naZ/36c9PFXpzrBmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=RLCBQkHZ; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2363616a1a6so5611025ad.3
        for <linux-i2c@vger.kernel.org>; Thu, 12 Jun 2025 00:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1749714771; x=1750319571; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pazdt4UO8fSmAZ8X2Dzo6ZIiUJV5NstAi6JvpdaZT9Y=;
        b=RLCBQkHZ8jP6HvGGhegFGnGD6by24ZM1+EnYt0SuYuHMCkZI3EuB1sMwcNgdaot22V
         Hbz5sqFg44fuByeyE92k8gzzVa72IUP91Jr00FCK9B4Oi024nkPtvDeMuqRY5cH3P60E
         q5eNouixjCDEvRUwGOIEvPy5dHPi8NpUM5ZTn3OEOXYb3INJeDyxOFx++LBWijhazTQ0
         eo9lXLzU8bFfTEwgu4EDXTEex7/US3L2dk/Yc1JD4F9Zq9Z5XcKPG1ycSWpEkDR4RWx6
         awFXekjauMl6Trhe3TGNEwOY7nDS9BtM0NNw8tnOayuQk1L2nd38CFcpS6zsk4iBFr7D
         7y/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749714771; x=1750319571;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pazdt4UO8fSmAZ8X2Dzo6ZIiUJV5NstAi6JvpdaZT9Y=;
        b=ZxswJUuV9z+U91koCx+NQUmyulMXiJZLrD73zBjZhZ93A+mrVBFjXp5Fhw3HtU+O3y
         S1SI/3pikyUmhzmYtmdF5TXIJeCR6RaiqU08E8UhyQ1pVTN/zyV3R7gw2gLvk2nwQWM/
         E3UkmKmjhQtQqhthFRNnC8JNoo1rQHoXDx3oisMqxXjL21ivgsLLGxoaHHtCbWhpBV+h
         l12vdLb3cIhspMfSoECWQ9qglSXEZFcn/VUNH39+dMIRfSmEEJEg+I108B3mBCd9KqZA
         MuVYsjtR6pfRPfvZaMfei3Z4Df1h3CEK779yGKix9qmFrlM58VB2BxYZ3F0wwtfwjqpB
         LBoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTf/RO4KAMh13jHXCKUEqGM12mm7r15B74uy1uyUcAt0MrmUjhPPgxFngjejxQs8GABFAFNLmcfH4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSJ64+Pq4SErGcmMi7qFrg6xn+2C39uTcKBq/1fLHGe4PNzoIK
	45vjyO2Re3L2zoY/ojPauGqXfJ41DxlKTQIZSErfEqK6cXF93s+qbk0/A2XDQTcrZQ==
X-Gm-Gg: ASbGncvWndoGlCsBn/bSkZbEzESnSRVG/8bgHxp3ayO7Cvd8X4VFs3IxaEjuYl92FOd
	hrxJXHDppVq7yAwsZObw69zWHimnXl71cSaE9NgdjlVfrPoDfWbxwleX2A6f0rkkqAdOdUn6AyD
	6msc2s3X0ZDenBmS8uF/HxDvGoBCJYBCblYPP3Gtx25Gyq0NpApnbFpyRj2Xf7C+qWEBsWltEFu
	6fXEp4PylC40HV6JGJLxzCeOCAt6zzx3vE2OrpzhZ120CA4r9f4WvVbZJUDOIlYWzZkOfuKQYhl
	ozTQRTtnYprlk2rikVuGnWlnmX76cRUJeXIl6AQbzYao7aV5YKMh3g59rpHq8/BiFL6R/DSvVhA
	pNvXnZw8Y8MO0z6+uxgFUSzB6tv70igrkJ5LZ
X-Google-Smtp-Source: AGHT+IH+iM21neRDkS3iLHmw85CSGogpx1dZt1CBDEgP7B9uVu0yQx7SMX5oOR3fyeuigU6VN7u09A==
X-Received: by 2002:a17:902:d552:b0:234:b41e:37a4 with SMTP id d9443c01a7336-2364d62da2emr25581555ad.6.1749714771066;
        Thu, 12 Jun 2025 00:52:51 -0700 (PDT)
Received: from ?IPV6:2401:4900:1c80:1e2f:fba8:7ac:6a76:1eca? ([2401:4900:1c80:1e2f:fba8:7ac:6a76:1eca])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2364e719958sm7780205ad.226.2025.06.12.00.52.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 00:52:50 -0700 (PDT)
Message-ID: <525877c8-6c64-45b3-b4aa-a52768e59b86@beagleboard.org>
Date: Thu, 12 Jun 2025 13:22:45 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: herve.codina@bootlin.com
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 luca.ceresoli@bootlin.com, robh@kernel.org, thomas.petazzoni@bootlin.com,
 wsa+renesas@sang-engineering.com
References: <20250205173918.600037-1-herve.codina@bootlin.com>
Subject: Re: [RFC PATCH 0/3] i2c: Introduce i2c bus extensions
Content-Language: en-US
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <20250205173918.600037-1-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I have tested this patch series for use with pocketbeagle 2 connector 
driver [0]. To get a better idea how it looks in real devicetree, see 
the base tree [1] and the overlay [2]. Since it also used gpio and pwm 
nexus nodes, along with providing pinmux for pins, it can provide a 
better picture of how the different pieces (export-symbols, nexus nodes, 
etc) look when combined.


I also have a question for Herve. Do you already have any working 
patches for similar extension for SPI and UART in some private tree?


[0]: https://github.com/Ayush1325/linux/tree/beagle-cape-v1

[1]: 
https://github.com/Ayush1325/BeagleBoard-DeviceTrees/commit/bf9d981ebf5f1a5704df1e7deba2188c70eb5d6f

[2]: 
https://github.com/Ayush1325/linux/commit/4ebc8467c98b5df3c30935e1d3736f9a64c1b08d


Tested-by: Ayush Singh <ayush@beagleboard.org>


