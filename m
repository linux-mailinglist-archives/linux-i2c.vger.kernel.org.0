Return-Path: <linux-i2c+bounces-13197-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 694F7BA2E12
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Sep 2025 10:04:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A519621F6A
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Sep 2025 08:04:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9D4F28BABA;
	Fri, 26 Sep 2025 08:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eHTDu9rd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077B5288C3F
	for <linux-i2c@vger.kernel.org>; Fri, 26 Sep 2025 08:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758873852; cv=none; b=HSQuKZoA/hulEH34/wcsEVnAM0TJFTL3ZRjvVURCWuwnWMyKl3Pp9+KDf2ibb84/ZEs7i0mo6nY2vTQukbN3SJ2mX9afetYc6zyebMO6zcH/c303H3ikGN6H/M9Uu3aClVd5vN5MyhsK54NUFmFvqUaDUznRjqcMpRIjiDHa7dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758873852; c=relaxed/simple;
	bh=/Bl70CgmBOAdxyWkp49vKu2K+F1QKj49S9DK9MWb7Qg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Idq03N6jD2AloKMsVDfYDXzBHS/khESWfcbyegUa6Zk2lLCUzsLoYLjAQKZSe+Hdm/9aUYDDX/+Fsptm/8UH7Zbs6YWyzFx38b+fAiuzjt2NEQU1myREqtzO1fI8/iRJCBcrUukOh55xdqRpFll0ASYkS0Aaf08tb05jelZ9Y+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eHTDu9rd; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-46e425de753so380225e9.1
        for <linux-i2c@vger.kernel.org>; Fri, 26 Sep 2025 01:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758873849; x=1759478649; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yuazOEgt2Y5Lw3j6961/s8ojGZBpXNaBcMyFvvp90F4=;
        b=eHTDu9rdCCEG5pSTRXXWyMxtl439GyAekiVV9DRxQJq30nCJUzqnrVBfdRhmyWtT/P
         27c82H7sk/UYLBUnSmR5mJbazxR26Ocvc3Lhw7mDinKh3FtRzHydCJ5NHHXUKMY3YrjX
         z30nebk6JgEjForphOXbjXqsKu8Ehq4T6+ZtuoUnRBHKJX3IW95zg+saWj+lWCePeJrN
         V13Tk5MU1ieKr1c+dTLHknKgtZ5cAjBu6J9j9kGZcOxKQye7F5TfaftfEWT8V2IC6zAu
         V/rCAcK0/rl977lwrV/gd/kiEAcXKBoL2i3OGBVYfvPi+tmHWkNLGi4ZDREk9TDOP87m
         vZaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758873849; x=1759478649;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yuazOEgt2Y5Lw3j6961/s8ojGZBpXNaBcMyFvvp90F4=;
        b=rsPcJdHQp0zu8Vcb8XNR0SEMlp3VNvkYiE7TtTuJ28E7kkol/+3bXeDeokJJgW+8pw
         WpvvGkkCrzYlTnP6BBFNN49g5Zaym063Ped5cocgZP/tPKAhkgInliovmWKLMz6fLDu7
         rZ/qhcw+Eg7PsGDD0Q/CrpAi8ENDEkeYzh7StHSkvodGgdmiZ/DUIh/5rL7Qe8U+ZD5P
         KDHwyLUpi3WBfayWjbZoFmFpgDyLqhvUudRxRczpD0RTkQl2oUr1h521GQPgASHd99lg
         YzhrLJ+aU1L9Y85aOK+SGA2tZ+c2YIy5XXWKglQZK5nIAl7095N4O//CyX70PZG9+jxR
         4Y2w==
X-Forwarded-Encrypted: i=1; AJvYcCXuAbrUXwlVwQTJOa3dF/fnIzmAH/3Tlkwfn4CcbkLGM8v91wbd01d10r1oBP/q00+9TzvDHO+ZPcU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0mg95tGMQWec5FOMI7LuE0DB8cLaXbfp8Iy1ciYeMkHI/+tzu
	qLpp0LhQ2T/+ilbPqmMROgxKIKgeEWq5nwOQjttYNZ7hWCDi4jWzHO24
X-Gm-Gg: ASbGnctrbsshKn6L6Ij0Mh6F1m2Do5uTEE763FtBkH8L0hRCNbOH9F67PNKDAHqFTkm
	7njTZ0199JoIUoJs5eF0Ha0co8ARWuK9UD9J+T4EThdNd6oml1A8X/Mz0iOac9fc0Z5GX6HI2nW
	5L0V94EFO0esPOw4rh+o54WoVizaWwChmXxlSRdEk/5ujf7F4HSfURhgxTc9y5RooWgmPsZ2L6p
	7WjIG9hfg4qYRwnwENsbjL/JkO3BfVJDEBDStNcWLc6lKPBWr1p6rKwvVOF7xwgtDMcNEm/iIl9
	/RW02ElfkeE5S3+PdqHwNpGI3e0ZPg5wsNkoa+hnx4mACGasmI1o3bwwO+4YCU4d/0IUTBwa2+S
	wIjAhi8qIi3NhTed3db7YWN8hVTb6cHb7XUJqQFO6sBxLb/cy3FjRaRsfgnUbcd124dUdijPXos
	w6IRmat12uZ6DQCW50ABI7SQ==
X-Google-Smtp-Source: AGHT+IFQbQS0Jba3nRJx97ScwpjwJl9RPDAKrZkVAMN1+NN00bhaQYO92/89pMPem7VVC1u9wTZkiA==
X-Received: by 2002:a5d:5d0a:0:b0:3f4:c39d:d392 with SMTP id ffacd0b85a97d-40e47ee0543mr6114141f8f.40.1758873849052;
        Fri, 26 Sep 2025 01:04:09 -0700 (PDT)
Received: from ?IPV6:2001:9e8:f114:1d01:3846:761a:dc0b:dbb9? ([2001:9e8:f114:1d01:3846:761a:dc0b:dbb9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e34074983sm62237635e9.10.2025.09.26.01.04.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 01:04:08 -0700 (PDT)
Message-ID: <29683d52-8e5a-4217-a32b-c2248319f69a@gmail.com>
Date: Fri, 26 Sep 2025 10:04:07 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/12] i2c: rtl9300: use regmap fields and API for
 registers
Content-Language: en-US
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-i2c@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Markus Stockhausen
 <markus.stockhausen@gmx.de>, Sven Eckelmann <sven@narfation.org>,
 Harshal Gohel <hg@simonwunderlich.de>
References: <20250831100457.3114-1-jelonek.jonas@gmail.com>
 <20250831100457.3114-5-jelonek.jonas@gmail.com> <aNW0jiJQHcS-FKwr@shikoro>
 <476cd546-1bde-4ff0-a785-2e6fa21b79d4@gmail.com> <aNY3Ar8bernz4kCI@shikoro>
From: Jonas Jelonek <jelonek.jonas@gmail.com>
In-Reply-To: <aNY3Ar8bernz4kCI@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.09.25 08:47, Wolfram Sang wrote:
> Hi Jonas,
>
>> I just noticed that it seems like an already applied patch got lost [1].
>> This was supposed to be merged to Andi's i2c/i2c-host [2] and actually was
>> there until the first three patches of this series got merged.
>>
>> Since I had already issue a few days ago trying to rebase the remaining
>> patches, this might be the cause it also fails for you?
> True. This patch somehow got lost and doesn't apply cleanly anymore
> because of patch 3 of this series.
>
> Are open to resend this series, rebased and with the lost patch added?

Sure, I'll send out an updated series later this day.

The lost patch doesn't apply cleanly anymore because my patch 3 was altered
in a wrong way while Andi resolved a conflict, which occured because the
now-lost patch wasn't in the fixes path. To be accurate, this probably needs
another patch also for the stable path.

> Thanks for the pointer,
>
>    Wolfram
>

Best,
Jonas Jelonek

