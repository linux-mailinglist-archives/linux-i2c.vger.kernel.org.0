Return-Path: <linux-i2c+bounces-8301-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9EF9E1330
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Dec 2024 07:07:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 730CC282E04
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Dec 2024 06:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 807F2183CD9;
	Tue,  3 Dec 2024 06:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FngUIJvX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8B017B500;
	Tue,  3 Dec 2024 06:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733206023; cv=none; b=Q1O07KaI00atc53Zf5W0CCq66bC0u+gCwwAvOULVVvmnc3NRxsHSfc28/b0Y3th1gz/ParCNdSC6GHg5SV+mz5cbQi6KTKgztdAkjfCXW5e+56/kcea0qz8Y+AP35lIbhVmF8/bh4PIe/AJO9YEw9rOq4vShPd6a6bZdvtoA+9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733206023; c=relaxed/simple;
	bh=PoHUD7y1qPp8CzQF/hVlmd6utu50X/Pwe0FuzwXE9Ng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J51FKFp+5TKT6BMY1leuI02bsxzmUclYeEqQenakq7r9xpH4P2fy+CZmPDg7PlW5xkk7S/yemvzfaxXQpEsToYPOuCk/89FHIaHbcVpEKFKXbgQz3eiKnq93r9tj9X79rPudohXRHMhgSwLo2r6wpHGX06SIQ7UgMAVAVIWZIMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FngUIJvX; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3ea3cc9a5ddso2557147b6e.3;
        Mon, 02 Dec 2024 22:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733206021; x=1733810821; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+osxNDHpPbZyTKZ+3jhVGNqwtsQkVrWbCvykdezfUg8=;
        b=FngUIJvXzbX48sMiJmHQxGgflvRsw+fEKfJ3c5q6QfbQjUmSlz+t6vi58y6sfEMMYS
         BdjfM5yFGXjRp4HdcKjhI3BlH4dsyQCGlVafq2ReEw+//sP+EU4uKcprrZFKgBVISeAH
         +seW8PLMJBlTSKrXDl4ZboEvH7qexojJRac50l+WSCaDYkL9vxl0K2VhaiYaU/dGF5+5
         hSJMdslNHUn0i1ja1orA2ze/5gT3xi71KUFXPEbl9ow5xE7X14zeNH5sHtOBLtQR0osH
         AEo5+YG0Igmuq3v0GNxbcdHbuvDHkVMSmdOxjgfbEbF6dDJaUMCTS4M66gNGUUfLqaC1
         /3oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733206021; x=1733810821;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+osxNDHpPbZyTKZ+3jhVGNqwtsQkVrWbCvykdezfUg8=;
        b=Tp7hytSXnuQHB2BD20JKSMaVvgcY5XoVTGKyoI4W1i2GKEjEJJ6Y02cZ3/rECJolsa
         vODt8arZHqooXA96uwQG7hbe8W8I2O48E19s2tw2VXs5BzCZQv1mnjE7QDOjpyQW/oqc
         QpLpwOVanitl78wcAE7/Q/qgt/dECMrIfwbcYurYui1G7ZIoehYl2b1kYOVlav9gV6Kf
         /scrVu6zqYbDVK0/P1d8H1V9NuPeYFZyPg5xNOCJB9tOjxpEuuP4d8UKxWzbsC/uiIVo
         H8MxTvOpzGKYSEZv7UKC0iQH09QEnrD2heKlUMGWd03/pJfD6gZmIN61ODZgHo4jqyac
         VCCA==
X-Forwarded-Encrypted: i=1; AJvYcCU+4qe5xGfYSVZdyXmGXFP+LUo8AUE/nYO/UuEQC8yCgRScbNvAK/MshPZcZ9uMdMe8Q88D6PNCYjk=@vger.kernel.org, AJvYcCUVsJRtmNkmWebYsz2/3bRu2XoK64+YbkiNRyjn+CaQbypMe/ML+3st56d+yKkVaobiz7LxjsAjxsdOS8d3@vger.kernel.org, AJvYcCWh9ly/bUdeh0K7TfAW7ldflGkZHGHEsOILYoaGeHxZ4TxtrudE3lkCv95YO5GF9gBynGHNELhtIYY+@vger.kernel.org, AJvYcCXFwRHLIBEFxWPUETkfe5kBd3pfYMKqZWeRHOBUkHThBtYKtPKDfg5jeKMwGxc4sDKvpJJC6bmxpnpPPCk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoqAM/ZXJ8Iyhob95r3dRSM4BfiTMxjwlGxNy0hZQBUZVBf1mY
	xmnlsJ2RbdvpacoHMJrh7BHEfff1hLK8eclrjkSssAQErpBh2Xa30CcQ2A==
X-Gm-Gg: ASbGnctY2624oANsQs5Dc8IAs0GUAytFxl7FLMSO3kqM8x+NvSKi5yRa6+apusLULXP
	M2GivkQ1yd1TD4E94V1Pn+j2U/Cy01DukePA9bgvpw2bLT54ZyRP3juTpcN+0Pp7H/d9cMWyA55
	LsN2cqBXyGKGzCh8yvpMG4CIfBPXaeNJjSbIX+SiNk+JAWWj4uLKoO72JOD/bXBBQStel0OY+o2
	4XyUQXJXkl5jPe7yAImHhU26gN/Fe1TUx+yAF3zdjeCnwTntlqj3uhW25ao74I=
X-Google-Smtp-Source: AGHT+IELjHJSibgngCh+eDXtbAcBbMXvDCcAeygcyJG2vmJyjS1vpJPH8nLXNrIscY1ZNviVuu8QVQ==
X-Received: by 2002:a05:6808:4495:b0:3e5:fd33:36a6 with SMTP id 5614622812f47-3eae50ba130mr1032570b6e.35.1733206020830;
        Mon, 02 Dec 2024 22:07:00 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72541761227sm9914889b3a.28.2024.12.02.22.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 22:07:00 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 2 Dec 2024 22:06:59 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v4 2/3] hwmon: (pmbus/core) add wp module param
Message-ID: <ddd889cf-b9b7-424d-82be-6b4495b1a162@roeck-us.net>
References: <20241202-tps25990-v4-0-bb50a99e0a03@baylibre.com>
 <20241202-tps25990-v4-2-bb50a99e0a03@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202-tps25990-v4-2-bb50a99e0a03@baylibre.com>

On Mon, Dec 02, 2024 at 11:28:01AM +0100, Jerome Brunet wrote:
> Add a module parameter to force the write protection mode of pmbus chips.
> 
> 4 protections modes are provided to start with:
> * 0: Remove the write protection
> * 1: Disable all writes except to the WRITE_PROTECT, OPERATION,
>      PAGE, ON_OFF_CONFIG and VOUT_COMMAND commands
> * 2: Disable all writes except to the WRITE_PROTECT, OPERATION and
>      PAGE commands
> * 3: Disable all writes except to the WRITE_PROTECT command
> 
> Of course, if the parameter is not provided, the default write protection
> status of the pmbus chips is left untouched.
> 
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Applied.

Thanks,
Guenter

