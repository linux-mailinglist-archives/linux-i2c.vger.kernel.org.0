Return-Path: <linux-i2c+bounces-9231-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAA0A2217E
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Jan 2025 17:14:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D65311884FEC
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Jan 2025 16:14:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EE0E1DED62;
	Wed, 29 Jan 2025 16:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bk4gPP7a"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F381919D886;
	Wed, 29 Jan 2025 16:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738167278; cv=none; b=NtLnqJ9wMCXbA7UF4QHNXQqdc7kUCx2dpPvL2ZyMjOGJneFYiSTzceYfLQsxMOXn9a/8c76IOjnd9zVGITdJpoIbpGePN9OrlsCQUmJCmnwU+3dR7rf54Wor7Jm9jfi9LzJWCyYj2ycj4JlFINiCwd1Ny6QjvKY4pbdeLyhlvV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738167278; c=relaxed/simple;
	bh=yH8/1/VyLpnoh/8/NXEvS/uZk3CGyvo3HCAH8cWmBx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fDIgcRhVTfRBZ4hesiOYfoOqkK+YhZOtI6Ii2mgo9+DyanlxDUXPP2XrfX8A4U+1r9ydFglzVPoP3/6cf1qDKYlGxy/O8EUnz8EftVhHdrCTQ9zmS36CA6zxGoJK1JR+5bs8doM4slGVm9J7gdIkSEf19PIa4nKRTLkfqlaCVnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bk4gPP7a; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2f441904a42so12299945a91.1;
        Wed, 29 Jan 2025 08:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738167276; x=1738772076; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lCO8aE567LSth5svOFLBgPLsSGc0IzLX/TWZR+kNrJI=;
        b=Bk4gPP7a3JWlMv9WH73gF7k7x+v99+4N0JuN4jzPadPkmEycL2QJSRpQ3JzrrnUOT3
         LaJbA3GhgRT9oiIaaIONIPUt6oznbRTpt1ayXj8+whGXa5Om6bXA2Zvk+hyzA9V2nisz
         GzY82aNRpeqBIjswx4UlmW/N5lhk9N4vBSQygpY+S83tYSqLUCqEzql1nFHiH8G+rMU8
         RZ/l0n7LZG8VdRUYwnthjKdx8V3RFH4pmO4M/XcTTibE6YACJfSz8Y3+oz1QSEGS6ip9
         E5K1yGIZyU7wQdc/Y85eHgt4gcFqBMh5AU3A2FhpCGJADVCw8L6A2vwiKyonZjorVaWa
         xhgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738167276; x=1738772076;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lCO8aE567LSth5svOFLBgPLsSGc0IzLX/TWZR+kNrJI=;
        b=nyCaofG+G8WqZ/lekDZGNJuM/mnpH/Y8J56Rj6KZ+ScpywQbHoxAkXLT3AXopM73Um
         CtZtWg35hJhgfVNaw900WAHvXknA6k3F1NFbAH3av8xHQf6YKu4ryS9Um14uzbhAUcaq
         IZt27F6vuFcbRpJfEGvYr282Pb7ZEMc2yFI0Pbc3TtUQouAGhu7LosZGcDiFSPwu+RrL
         DGfD8kJkTsUa6bFlhU+vEhrO7jZat76XYZohdO1889yKcMNf4dOjouQrDvdh/3lMEZlC
         BLhqbHnCp1hZYm5Y6C+tVnERBiqevLC/+0d1Y2YjltoXS5ViDcg0yC7GkVb+hevnxt1w
         npxw==
X-Forwarded-Encrypted: i=1; AJvYcCU3iKAReE+U5eXAakYZ6HAtPIoWMLDEH7C9girlp0nqN6I/H389dVIfmmiznzC1I5t8Yt+BsJCHNsNEOG2V@vger.kernel.org, AJvYcCWI3iZJgjs9os9BYwYU6Ik0yBXvV3bcauniXc0BIEtRp1SZASlaNW8mWWt1L6yvpOVWouR7XD8zJQxE@vger.kernel.org, AJvYcCWWuak/aQr2rs6UZ0OPf/KnpvIYw5kVAvXGwF714xiM+kP2i7pIbrkcQaE1cnNiJgP/bCn+g53nAdS+jLo=@vger.kernel.org, AJvYcCXL4yvlQMN94M7cgH+YFKYYEa54no/PeXHWhjr3jFmWpRGT/YuGDzTEHK1/hV+mfBgDt9TydMhesRC6@vger.kernel.org, AJvYcCXO3ij8NU0/IsjKVc8xQXB1lQe6FRVq5i3Zc4NS9u+JztbUS0ghWrrIUTCx42TD+j6j6izePxFRFTjv@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7EE7MpMHWYhTlE+o37fPWsut6AQDPHSST7cjgT7hZqWDMYgCg
	CsLi3yh2/bTuv3s7E6VJxZCTKLYFo3pvOEA1DZ0kvhp6bqqacvb2
X-Gm-Gg: ASbGncttFMBIxarPjBEuUCrJYbtEMXfy6ENt6Taw1AO+MyYTSCEnFeZwOtGyepB065v
	MpgfMzrJ/ZmjZ6pm2BEYhhs9XzrYh/+5RlQ1D7W9PFNvPsoYRVhkFdYHuRHRH9wBZjKGttwxVMg
	nr51gy/aZ9jhNlOj6upC38Lcjy2d5JGAjrcsC6a0YTaNO2yp8bj9H1L+FjPtMlAKjDIsMCYat2p
	943b2Jj4j33DEzDfoH/Y5y+DoildaRq2q2vKYJf7S59AJ5L4iAFckjQUo7RNKhTg06+cupYtH6t
	F0R3a0CNfhLtszVGyzeZrXU5tzhE
X-Google-Smtp-Source: AGHT+IEI3R2Sc5Gya7upL1qjKq8Eo3BPPi2Y7YUGqVHhupC9J/9oSREkMWWhdyfdKlAf01mWvCxdRQ==
X-Received: by 2002:a17:90b:2702:b0:2f4:4003:f3ea with SMTP id 98e67ed59e1d1-2f83ac84706mr6162628a91.33.1738167276156;
        Wed, 29 Jan 2025 08:14:36 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bd0cf6dsm2078654a91.29.2025.01.29.08.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 08:14:35 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 29 Jan 2025 08:14:34 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (pmbus/lt3074): add support for lt3074
Message-ID: <893b4574-ac3a-422f-a46a-f995c551ad86@roeck-us.net>
References: <20250124-upstream-lt3074-v1-0-7603f346433e@analog.com>
 <20250124-upstream-lt3074-v1-2-7603f346433e@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250124-upstream-lt3074-v1-2-7603f346433e@analog.com>

On Fri, Jan 24, 2025 at 11:39:07PM +0800, Cedric Encarnacion wrote:
> Add hardware monitoring and regulator support for LT3074. The LT3074 is an
> ultrafast, ultralow noise 3A, 5.5V dropout linear regulator. The PMBus
> serial interface allows telemetry for input/output voltage, bias voltage,
> output current, and die temperature.
> 
> Signed-off-by: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>

Just in case it is not obvious: I do not apply or for the most part not
even review patches if the kernel test robot reported a problem.
This applies to all patches, not just this one.

Thanks,
Guenter

