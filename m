Return-Path: <linux-i2c+bounces-8302-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E50EB9E1341
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Dec 2024 07:11:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B80E21648B1
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Dec 2024 06:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A56D018595B;
	Tue,  3 Dec 2024 06:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mM+KE4yx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2D613F43A;
	Tue,  3 Dec 2024 06:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733206270; cv=none; b=mr+RJzlKaS6jntZPNI/V1TUyzj8SMuoMyzTDNBux/DNLZkXz4ChmmlgnU22QAoNf7Nm19J7dzJPD4ptk15wwErJmc4nvEMbjufQkl4XE/rbjnN8m+bLGieQmsSrHI1gHi80Dcb0HC4YSTCZKY/6n/8Wj+NVJf7FVdmne6oya93I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733206270; c=relaxed/simple;
	bh=/FgOw83lPcIOL254tAVHr+zF+3M+oXPUFUmcFh6lqC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z+/C9xq2tPAURFlSoPoGUQBpOVsSEBTufu/dWAuqWX/YN76FJBAZXJ+Q/eZ9H3WYasMK4DhANSIKaoJ2h/NmsnLQHsxJ+/M1Bpp2mEnEKMhyFelufla+FaihssmckedjWWtJ9sm/+E3Cm+VmQydrU1daeP4AVInvIJ+SD95RaGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mM+KE4yx; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3ea53011deaso2277498b6e.1;
        Mon, 02 Dec 2024 22:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733206268; x=1733811068; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k61ug4XDql2tfyDsvp03UG3wRkg9ZVLO9ZMI6rnSJmo=;
        b=mM+KE4yxH4rWQ5ByA+iULW/fs8cGHj7ox4T9vmU3016QueayyKRDbCW1OJ6wonCcRk
         iG70KsJ18m/DcoRr7XBNF6Tr2kEcgl1fsCFdopsyx9gHT8aPKaVFBlBJFXSBsy0SyN+/
         Tc87Ux4q06spEDAQJkaOQttjhlvKP8+kTqNv6/CNmFobHdoN6I+V5jgLrZdHI9DbcRoe
         DICQcsFKlWj5CTCSmhRLeE0V8ccZt5MobrFV0Z+n1k67M6k1m1HkOhkp8/WCpcws5j4c
         Nd2P/FQPs8K3xiAg3D/MJXmncsfqLb+xWDticlEGCtIzfELh6bA7aVXZahglFfETcjI2
         3Jjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733206268; x=1733811068;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k61ug4XDql2tfyDsvp03UG3wRkg9ZVLO9ZMI6rnSJmo=;
        b=EVS7frIORkRWi9cNqcydoXEv0An2bpPtSC4Ruw8Hgy7u7/8YW+gCty4ZIn47GlSNYD
         v/g1p4Fu3Q/+g+5MONATGnZUzpR6FkAZUJ7ymjWIzKNHRIZwtjKUVPswW6c9kzHWeNnP
         G2bMQWB7aTTPxBtnSmZnIkmA0AfkOqn5QZa2G5OLjg3xCn1CKmeQSySooQf+7veUzemD
         jGrH5J5OA9Uk97sofvS5xhL+45UqizWg1D91duO3UPG0/12/e8SNaE9QnKsMR6vFqtk0
         1Iat8XcsLinq+UdkZ7AsUYvjSN0zTixOMRIA5oJfcGcKIZRV+bxpRmORjciX0F7+DU1t
         ShuA==
X-Forwarded-Encrypted: i=1; AJvYcCU2F8+3VWit7ORcuRXaAhyORemm9CgTT0eTAsIDj7cCwMpWMTcVxmUfRIEBV8soH4P3mYxitVQMXrnGmxM=@vger.kernel.org, AJvYcCUNMlT99UrvOfoASkZAYWQa37B+g1d8p9nnqvvs56sdxSW9B9RxiifEcYMEkvgvmPVPVFbYYiCK0Dw=@vger.kernel.org, AJvYcCVKou9XR+t+rrxVSA5Zp7XjrcriEB2DcmreNIc8t9APSbOlCYiIsbXcRAUcicsPWolyrR3igxfbYaXHTOYF@vger.kernel.org, AJvYcCWTSwI6hEf1TSQ00LKZBqvpcguM8tzAbLDQ3tpRnFKXyaZFrMcpFh8MnpwgZgBkIsUhORO3ZobhmqjE@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0TqbdAXKGl2/g2M4CqxPd873fDODwFlKh0COTvdYobdpaFiA1
	JS9Q5KoLUgNtCzp74FewbG6nbGwG1uZOO5i4uLqHuWC6G6titZjO
X-Gm-Gg: ASbGncswmheMg5R7S5mMOACrrE87WlhyNx9jgF3c9B5YLsk8AIMXep0gyTSdB+al/eE
	1EqBOhEDllzG9mbRmYAcTBKK72X6YjmSqnvKz62Rh7G1N2Ws3rrWIm66/Qohl638lLszJ7PTY4a
	MV9XF80eR/vzDk5n54f+Sa+LvWLZW3FJZfZWRhA0KXKl7Zcxe5N7x2NEjpt+JCY9PF3UIxR0qm0
	486cny0Oqdbxf5cJ+nKm5sw0K+k9p0xznRN4Nrin1mVq0M7ZzhV2QgoUoESbCA=
X-Google-Smtp-Source: AGHT+IEUrn1dwPR0GaPVIZ4bHYwRzLNtCp7NgFdjawnPiVJawBQg0ZMW53VqbHt2CX2LDYfP068PLQ==
X-Received: by 2002:a05:6808:1802:b0:3ea:5705:2a2d with SMTP id 5614622812f47-3eae510773bmr972830b6e.41.1733206267864;
        Mon, 02 Dec 2024 22:11:07 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72541761453sm9579036b3a.37.2024.12.02.22.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 22:11:07 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 2 Dec 2024 22:11:06 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	Vaishnav Achath <vaishnav.a@ti.com>
Subject: Re: [PATCH v4 3/3] hwmon: (pmbus/tps25990): add initial support
Message-ID: <7dde579d-a4be-443d-8c02-510fb5556a6f@roeck-us.net>
References: <20241202-tps25990-v4-0-bb50a99e0a03@baylibre.com>
 <20241202-tps25990-v4-3-bb50a99e0a03@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202-tps25990-v4-3-bb50a99e0a03@baylibre.com>

On Mon, Dec 02, 2024 at 11:28:02AM +0100, Jerome Brunet wrote:
> Add initial support for the Texas Instruments TPS25990 eFuse.
> This adds the basic PMBUS telemetry support for the device.
> 
> Tested-by: Vaishnav Achath <vaishnav.a@ti.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Applied, after fixing whitespace error (emty line at end
of driver documentation).

Thanks,
Guenter

