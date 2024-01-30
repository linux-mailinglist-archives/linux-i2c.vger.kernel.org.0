Return-Path: <linux-i2c+bounces-1526-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C37841C58
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jan 2024 08:10:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D7682898C4
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jan 2024 07:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C1BE4595D;
	Tue, 30 Jan 2024 07:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DREWzfrX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C19B4500D
	for <linux-i2c@vger.kernel.org>; Tue, 30 Jan 2024 07:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706598649; cv=none; b=IGRWVdtk/KVoG0n1WlOuLsSuYYSbBKQ0o85LHVxr2NIvn0+KZjgFfpoUTT1K1V1/qoI2COVkRIohhcB30j93zFd8qaxaY1sCxEWJO3ZZic3MybfU/qrpSuVNLkfOdzQD/iN5j6OkkvbJM2gvQvQERQdhzEijarn/wg7hGessAqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706598649; c=relaxed/simple;
	bh=R/Gezdr+EDrLo/1mm3MjONWzCBSpkDYym/cBPv1m6/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uRcvdkgGSWY/1OBYccbfIVMpmwDah/FaTTLXgHNrgHL9j4/nTVuARRntI/GEo3/ZWBJpI5AAQXkGqUWKkWmdpUQ4BdqycKCWDWTX6NI6z5qXx+2Ksbn4zQS72J2cOJ3uNs8yPv7I6jB/+tK8Bsfk1BKPmKrA+6E43+00nZffCnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DREWzfrX; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40ef64d8955so15835765e9.3
        for <linux-i2c@vger.kernel.org>; Mon, 29 Jan 2024 23:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706598645; x=1707203445; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9WG+wH8ifuKzKGW26RFegkYkBxcuV+SssTfgiP5t788=;
        b=DREWzfrXn3XDkTAe8w+BIacelM/oGE/N9CjFtOpkKMmBr26FnJOSCNfQTa/yuY0M7m
         0qenXfA4bCTf/AkM2+8xYyVGcfq9Fy9i8mZPxajF7KMZh8FikGns+YOCl3+Vw13ozq9P
         1BbsTV3brBCl7GSmtCcZ6dEeHMegyZHc3VgoMn/LbRNn9H2nMGmKBwDYJPsFt9FZQiJ9
         smhKtZJIoQe55qOfnOnRuWlGNhDN/CwerIGZqAVL6Uh9RgVvBr8am99jI+vQqzMPGvtH
         m5Bms6jG3yYBkiIMshgl16gTqJ2U3bHh/mr7kGsHkM2iuez4Kz/iNV+QJldZODqroYp8
         ipww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706598645; x=1707203445;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9WG+wH8ifuKzKGW26RFegkYkBxcuV+SssTfgiP5t788=;
        b=EdNYwWbNJBvR05hQlSF0QJewoi66WLwXJMILXAZnhuglcahukNAvYH9SISCj3Bq2a+
         IrbWEDDy6mPu8OBgayT5PeUvsrwntjn1FzaOqpKg+JV7rDZl+iI+qC8aIxKqNlsUB/gS
         IqMbmcs9gh+35A2zi/MW6KXCGCtR9cF8soJpE40qw6HOgCwIRCXpSSP5n/BmZ9F4T3rv
         tB27LNOdAdc9onTuBBM1B9AB/sLzwdcEjjNNPfYBOE+mGZhzdTodQq8du2IrxAt0yisL
         skg0WVeBHN5brrSWM499/USmcYoWkgwfui6uYdLD7obaXnEFXpsIzzpuA2kedThbZEBP
         p13g==
X-Gm-Message-State: AOJu0YxffqfgPL0ZdwN5s9fwz7HemBAxvWN5WNIJKXhLmwXMKCuin7fF
	RUNSBG1J/rQd01k50giSKUuzQLsXnpYMu7Ggf0TyjOgEdJhyOenW
X-Google-Smtp-Source: AGHT+IHX+hosx3HFTYVAD3qjL+viQXn5tIItT0XZJq2Lw4Hq7/Ir+nNcHaFdIzKRE5hI1doc+tp00A==
X-Received: by 2002:a5d:4f12:0:b0:33a:e5e5:5121 with SMTP id c18-20020a5d4f12000000b0033ae5e55121mr4503023wru.18.1706598645124;
        Mon, 29 Jan 2024 23:10:45 -0800 (PST)
Received: from ?IPV6:2a01:c22:7399:9100:513:e902:472a:9202? (dynamic-2a01-0c22-7399-9100-0513-e902-472a-9202.c22.pool.telefonica.de. [2a01:c22:7399:9100:513:e902:472a:9202])
        by smtp.googlemail.com with ESMTPSA id ch19-20020a5d5d13000000b00337b47ae539sm9949225wrb.42.2024.01.29.23.10.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 23:10:44 -0800 (PST)
Message-ID: <5816ddf4-1623-4bbd-9178-342a79eab768@gmail.com>
Date: Tue, 30 Jan 2024 08:10:47 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] i2c: i801: Use i2c core default adapter timeout
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <0d6a1cdb-39a1-4fad-a6e4-48953619f33b@gmail.com>
 <380b592a-cb28-47ef-b110-e2ee6e8550fb@gmail.com>
 <dgctw2imnpwhlef72pkcubaok2zi7s3ej3m3cdvlhmjv6xv3be@sltjtakw24jt>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <dgctw2imnpwhlef72pkcubaok2zi7s3ej3m3cdvlhmjv6xv3be@sltjtakw24jt>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.01.2024 00:46, Andi Shyti wrote:
> Hi Heiner,
> 
> On Fri, Sep 22, 2023 at 09:35:55PM +0200, Heiner Kallweit wrote:
>> I see no need for a driver-specific timeout value, therefore let's go
>> with the i2c core default timeout of 1s set by i2c_register_adapter().
> 
> Why is the timeout value not needed in your opinion? Is the
> datasheet specifying anything here?
> 
I2C core sets a timeout of 1s if driver doesn't set a timeout value.
So for me the question is: Is there an actual need or benefit of
setting a lower timeout value? And that's something I don't see.

> Jean any opinion here?
> 
> Thanks,
> Andi

Heiner

