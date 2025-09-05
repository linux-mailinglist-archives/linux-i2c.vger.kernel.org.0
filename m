Return-Path: <linux-i2c+bounces-12679-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 97955B45430
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Sep 2025 12:12:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 786CFA43220
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Sep 2025 10:12:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6A332C11F1;
	Fri,  5 Sep 2025 10:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WloOaD9v"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA79C2C08D1;
	Fri,  5 Sep 2025 10:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757067148; cv=none; b=aeefe5Wqwi8X6YNj8L+Wh7QJhtQ+bux0xL4x7HVwe68yyPGMRijufv7YmbBpDJjMkj0Vr1q2PCF+04CCw3U3nudqPeBe71gAFHhq5FYbnR+Ra9G6o2zamOsHAAJF2MS4Ef/WKErnJR1WeqvfZXNfHBt4HIf+1b9go5DUr+WrOtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757067148; c=relaxed/simple;
	bh=514/S8NtgN7VIZATln+91Vi3RBJJexkN+LT4bNCs5TE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YQLTs2OmHawcDe+GFd2LhCDezQYPWnfGMUJ+NTOdeL8G99/qnlgNvFBMO9WD4Oy4Fd2juJxcuKiGq+UIcpGZsbGbzNdEjqIabjPdRJ3coNn31GvxWR4qDvcgm50mrHtZHS/TNr5359pjxDpms/aEzt7byyn0DnuRnI2YwGbAwgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WloOaD9v; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6188b5ad4f0so3334731a12.0;
        Fri, 05 Sep 2025 03:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757067145; x=1757671945; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=514/S8NtgN7VIZATln+91Vi3RBJJexkN+LT4bNCs5TE=;
        b=WloOaD9vphiFCOG6q3mv39z6QGagsTnWzBpTc9eD1v20fL0hSD1dbRiz35NIG79uqv
         2PTajJ3mJm4SFu3KacjxHdXxEpejDswBUgtHvYrmTXIkGbTICniYkaXuKivmEH2MgPUo
         JtlmeJqpZaXTz9kSoxUlE9OBU7bIJEO4iI/p3ToXOuTSdjDcGEWKRCoVPzA0LoscnTbF
         yZQDSfaL4cPCj7yav5zmHLCkL2FBPIoqfHEQ3HNQuzYbwSQ7If6FnORutOxVTeLNlRqf
         PcB7zEBp+jc9oCKO4mNbpMS2RxpNK2j8Xd8B1Sb90Q5DPVGkG/uRV7UAZRUFsYh6boki
         6Agw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757067145; x=1757671945;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=514/S8NtgN7VIZATln+91Vi3RBJJexkN+LT4bNCs5TE=;
        b=S5xAohPxa6AoaxJTm2G/UVJIKuXm9vMsBEFS79QLiccOkdKC3ZRA+VygBMDVUk2gpk
         FtRsRnIaDXgP/dBWpVLfwlhNcToDOD33O3sfpw9vmRcUhXpdgEYfne35fPPe9cEhLRnL
         81FfDNImL5S9MgN9H1jYy4FU5AZysodWC4AYuBKV6zv0KcJvZEAyEdqjFf88AGkvVJVR
         WPVBZo2RiPCdbr/gjGd/ZoFE4kLLxJFFXHnKMdC5h/WpmZbDKlX0/PNii6EUBYenyW6p
         ZIBYTCmNsnC6vNCJhbnkUvy+45M7F1jk8UssOiQ6IthXMDikZKnvoqNqxSMrHtTKpobu
         h8Sw==
X-Forwarded-Encrypted: i=1; AJvYcCU6wkwdVuJrAYprbQGV3Uf7Tv5P13BiZJ71trsAIculaYTZ/WXBGrdrev7z3lOjs4X8S8BgBPBNgn2w@vger.kernel.org, AJvYcCUhGnHPKRbHTfNG22w5sc5QGAIBL4mmgX/OlEDs6Yed5et7PEKdHshL3MehCAKFICHofJ5F8tm5L/O3@vger.kernel.org, AJvYcCVt+v4ED3+DZZNjdrI1DQY+Ya4i1chKpbkq62/SROe+AR7+X4Fr5AgUtPsSDkIGuiQSiLLb5SVHo9pchLwr@vger.kernel.org
X-Gm-Message-State: AOJu0YzxWldnF6eJafYozK/wxcPSx/yt+C8/jiDzf2YmaUki3PoYk7bj
	nbf9TbiRlo/Din+vPDeHfzGFtikCyz8eJPlfqUBfOUsrVaQbRSefDIzc
X-Gm-Gg: ASbGnct36kSzQtiRcCjBSeJHnELxIR0EKyyZsMzFmBGhrI5tZ+Qqzw4pLGAlp2F2mIu
	hVqs7ILrptJp+ujSiXlSmMHvrMEe5Ouk2GSMMvl084+5bI+DwX0PAT92+hxy5RI0vUmea/xPOYA
	H4WIHBZ+JD3c/0aWKDetnH+IdOf2Gz6cQhJ9IHXgY+ZGeyQg7VPlxBlxrIsdjaFZXb3icD1GUY8
	ilnm+VpNnmXhZZZdasl5RulZuyrRgtZrWCKOWiJx11JI9/UvDluBHEcKsZvxCfYrF6d/W16oNvy
	uQj7apflttdZ+RVcO7OUdw0mI1PrDK41V90lgLcMmJLzOKq4d8CDk5GXDiYQi9a5r+1ZZQn4yi6
	xfuNg8Xjn4wJy4t0+Jhj4wx93qDc0440UCsUa3OD2dP53aS8jgAibYwfDrsmaAZTFgoZvP0DFWA
	yflbunTfNT16SUxiL7igY1OQiXVG8=
X-Google-Smtp-Source: AGHT+IFQFy40TldMYxWc1KLvo1JSVvPLQtczmXlHskEtz+9Wz5c9Lpok3O5e8O6f7WwNuansyMR/+Q==
X-Received: by 2002:a05:6402:35d6:b0:61e:d34c:d1d3 with SMTP id 4fb4d7f45d1cf-61ed34cd400mr9926192a12.19.1757067144758;
        Fri, 05 Sep 2025 03:12:24 -0700 (PDT)
Received: from ?IPV6:2001:9e8:f10e:bc32:3042:6aaa:9b8:52f? ([2001:9e8:f10e:bc32:3042:6aaa:9b8:52f])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc4bbca5sm16132348a12.31.2025.09.05.03.12.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 03:12:24 -0700 (PDT)
Message-ID: <56c6c0fa-e2a7-4493-99ef-128b8974dd0b@gmail.com>
Date: Fri, 5 Sep 2025 12:12:23 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/12] i2c: rtl9300: remove broken SMBus Quick
 operation support
Content-Language: en-US
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-i2c@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Markus Stockhausen <markus.stockhausen@gmx.de>,
 Sven Eckelmann <sven@narfation.org>, Harshal Gohel <hg@simonwunderlich.de>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20250831100457.3114-1-jelonek.jonas@gmail.com>
 <20250831100457.3114-4-jelonek.jonas@gmail.com>
 <cfdleondrrpfyfts423cwdcsb5mmqovej5hwke7ndghzlnwci7@d6i7ltgoxbee>
From: Jonas Jelonek <jelonek.jonas@gmail.com>
In-Reply-To: <cfdleondrrpfyfts423cwdcsb5mmqovej5hwke7ndghzlnwci7@d6i7ltgoxbee>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andi,

On 04.09.25 00:59, Andi Shyti wrote:
> In the sense that I don't have this change in the fixes path, but
> I have it in the non-fixes. For now, until Wolfram pulls the
> fixes, I removed the patch and I will add it back next week to
> avoid conflicts in the -next branch.
>
> Next week I will apply the rest of the patches in the series, as
> well.

Thanks for taking care of this. 

I just got a new testing device with RTL9313 on my desk with which I could test
the two-master functionality. Thanks to this, I noticed a bug in the last patch of
my series before it is merged completely.

Due to a misunderstanding of how 'device_property_read_u8' works and that it
does not read '1' out of 'realtek,scl = <1>;' in the device tree, the second
master didn't work.

How is the usual way to proceed on this? Should I just resubmit my patchset,
except the first 3 patches you already merged in your tree, to have that fix?

> Thanks,
> Andi
>
>

Best,
Jonas Jelonek

