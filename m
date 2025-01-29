Return-Path: <linux-i2c+bounces-9229-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38420A2215C
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Jan 2025 17:11:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78F4C1884EDC
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Jan 2025 16:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 653DB1E131B;
	Wed, 29 Jan 2025 16:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lfiFcInF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7F71DE3CF;
	Wed, 29 Jan 2025 16:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738167004; cv=none; b=Zey1J+wi5WeX63wkSMxFJVVt3syjelMcCyHx61hSrwpNMa9y2DeTLFps3bwCexryxK5+A63Dfo4xmw8oy1DByZkcApdU9MuiF1HrAox7v8lgxp8jWDhcwvJcD+9QsmRTcMlWHIohtUJ/ptl/WpkE91+3V2F/r3fBil6i1O6pboQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738167004; c=relaxed/simple;
	bh=GRUP9Czg5ZC0JLPGF3rpH7PTSJ9YHTmouAsRiWAo75w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZUB6U7xA+3anmHL/JbpNYhMuHlBFIGiu796c+1IOQh5H3BBfKTX6hTkQXdwn+Ng0PUMRfAsZi9VXAj76QiwgYA8ylwTqx+FQMRe8zD6N3EBgXGKIG743sZtnioYz7oOIW1cjkBHCHTaWV69Pn9Zr9YIAX2I+kAdeoi0sC+RhEJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lfiFcInF; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21636268e43so10093295ad.2;
        Wed, 29 Jan 2025 08:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738167002; x=1738771802; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ymDSOEQ6GAWCTuGktRgzk09hgWGDW46vwLaYswetRgo=;
        b=lfiFcInFMWcIWCS3RgzarE3jMsMXDzfK3cNwUaMpPFDzqbYD2HqL6jBta/VP+4guTT
         //AGrIEJKnVAhD6+u1gDCR93+KFoB0HZ5LBqja4CzVy5bKMUta2FMm7akfyDIhpe3iUU
         ZZZaNCi0Zk0LZTCqxik2xo7SttEBtQU/qYqRa7kqZEf60iVazMxwr5PTEfk21Ef318ck
         OxhwPHyzsSclXFQ4iYJAzWlNA5MPE00GcDcJArLI7xKlFM2PzY/A1s+znUMXOwQpmVWo
         paoxwB8pr7NV8hU6lgo7DAU2gdQVZ8i7n4EMAprIDcouCASducYd9EthvNLTPd9Tu7PY
         yNyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738167002; x=1738771802;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ymDSOEQ6GAWCTuGktRgzk09hgWGDW46vwLaYswetRgo=;
        b=wrJgqAbZ7GXfstEkZEH4VbjIZInvxY/asHEZWUFVytqUrD9FzoEjjZCkUmxjdKoWAh
         p3ZCFKydN6zaJynr5B8cMMADnSlokYv9JJB4zIxa2rS2g6iTFclVD+c0w54nLcPPRhii
         Ga1whxYmxHOKB2fwFRhx95yy4F2wrr142YW5fTCHV4En+lXbL9FuOUKYiXLbOIaMFs5X
         olr/icmIi6Jy2Rid26B9D55gxI8IrKBXmPUoAwpXGhcuE0d7K6lOxhi55IcPG0l3j6La
         IV6QiWpETEzdyjsYxwc5iJ+ltmcs27ylveIzqDODRXcQGLkskUa7Az9E85iaOuMupljD
         yzgA==
X-Forwarded-Encrypted: i=1; AJvYcCWCSWkM9TcgS7s3Fzn0qdoR3AZWT+SizjNJqnHHwCIsAQ7NyGyBOdLQWybbfuYs7yBnczMqXv0fQ/IX@vger.kernel.org, AJvYcCWJKMwoAnhCJAZj/NoS0ZX3f9JgVA1dtStGMXX0YGFKz2x72aJphXXbwGfP854YoSnXjkr3qIohcFNM@vger.kernel.org, AJvYcCWXl2LfyXuP5h0nZYcsSqu8H1cfch+A05bkEscx/U8igQ6KUR6sySvowWxN99LQAnWEuq/PojcOp3nlRFA=@vger.kernel.org, AJvYcCXbny7prp0o33oblv9x8iN3x9m8W5692EU+f6hK5IN6R+K+ZoIHPea1/KjmR5A5TurhgtiFsFMfRITGK2GM@vger.kernel.org, AJvYcCXqjAOMylq9vi1QmeX6B33KFvNHVJxfeyLnUxqu2oUlntFEvkNiVYYBOKbQCs0m/Xjby2rQuN4LZ7Ll@vger.kernel.org
X-Gm-Message-State: AOJu0YwrzIU97Oe9NbE4XhXzhL1bqljKdBQ6LlxnR0UBQl4bpFVcCO+Z
	0f7/jwSgeunvqjA1Hd5vNRmLxAqNgEFARzxg++lGa7rFBhqrS1Kr
X-Gm-Gg: ASbGncswvF3AYS6MaXMVVLzuL1CJI7Maz4LwSLEAcot5g1vAyfoGr1nX7lotvWlG6fk
	YtaAEt/cI2xbbg9uUxgavAFJ3i1rwoIyzQ6D7La0JWjsqIy0CNXbTRIqaulAPv6xIJbOO/KS49q
	w8rLn34P5J05wiKZsF5aboTuaDu5n4DM19fiSybgY3T9DPIdvdiBFGNrHGOqtW4z0MFpZmqULKl
	IJ+qpMMO/QCfSJo4BtfyjYc5pIPxPBqrL3f490g2vOwiBDNaT0xJO2NDzlPCm1qvBko5qm09tyx
	ZHv2Wzk5QYrD0PJJg0KnRoWnnLlI
X-Google-Smtp-Source: AGHT+IEMzBy5A9c7aWN66LJLLpZu/t5jLTsQYXT/hCtX+4kKdRCfg3Q4oeCXElu7sq8bEWhcdZuznQ==
X-Received: by 2002:a05:6a21:9985:b0:1e0:ca95:3cb2 with SMTP id adf61e73a8af0-1ed7a5c462bmr5580176637.8.1738167001747;
        Wed, 29 Jan 2025 08:10:01 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ac48ea371dasm10435446a12.12.2025.01.29.08.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 08:10:01 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 29 Jan 2025 08:10:00 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: ltc2978: add support for ltm4673
Message-ID: <45df9520-1727-4ac7-8e7f-8d15ed153684@roeck-us.net>
References: <20250124-ltm4673-v1-0-a2c6aa37c903@analog.com>
 <20250124-ltm4673-v1-1-a2c6aa37c903@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250124-ltm4673-v1-1-a2c6aa37c903@analog.com>

On Fri, Jan 24, 2025 at 11:23:05PM +0800, Cedric Encarnacion wrote:
> Add LTM4673 to supported devices of LTC2978. Unlike other LTM46xx
> devices, LTM4673 is a μModule regulator that outputs four channels.
> 
> Signed-off-by: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied to hwmon-next.

Note that the branch will only be pushed to linux-next after the commit
window closed.

Thanks,
Guenter

