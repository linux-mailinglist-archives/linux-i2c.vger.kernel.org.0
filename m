Return-Path: <linux-i2c+bounces-2569-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE40C887909
	for <lists+linux-i2c@lfdr.de>; Sat, 23 Mar 2024 15:20:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1BE3D1C20DCC
	for <lists+linux-i2c@lfdr.de>; Sat, 23 Mar 2024 14:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D7E73FB85;
	Sat, 23 Mar 2024 14:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T928AADj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83CD3EA95;
	Sat, 23 Mar 2024 14:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711203604; cv=none; b=ESc+NXW4xj1g3sS1iRjr9M0htT1BVHBa2t+pxAtxREStZug7kCVlp0TElwp0KP19UqX0yNR6LVTsiAYpge9LWatrJZSBq2AvZOFoJMW86w869zgiW/f7k4T7vYROJSeKZaJG/KDf5eJ437GLpfqzIjnyz+z8HVoj2DPHUJFxmfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711203604; c=relaxed/simple;
	bh=Odel/QiBIaTQFUVDy02JJed2eXeOkq8KerMxV/ifmLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rutJNwZLXArErufNsgT0UE/3wYyRQX/B7qB+etJXW3+n7vn6LmoLP53RC9NYXD7ausx1CrQUG+Bo0BlglsfHEqriiLqk9Olb2wmM4adPy/C4Htj9HwadVou2a68kEHyUc3xUm0pFditwimC6KDkoJVFqCEfQLuePFPQohr8yV3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T928AADj; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6e6c0098328so2131438b3a.3;
        Sat, 23 Mar 2024 07:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711203602; x=1711808402; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FBgidFTZUdGcNuWAj9zpgPNJm0S7mU0UHzL1FgVlCM0=;
        b=T928AADjPGXvKN6TXxcVABWmOeMh9CwsPTaxaRVklNqEqNjizobmilJT6CVNL03JsT
         IYQRa2s+N1rNwM7N7Ab5zneTHuQDZWLIJvtCXeWBwt3ZEMaZrakhWGn1W4/3Zp0WuVug
         YEtvtFBT8vJCTIEzUGd5oNDU8vtL3N7M30tWJa2knkimezZ/oAIFA2nTnEQQNKiVp8dy
         Q1LK1zphpA9ec3uRJLVBN/l6yHrKO0ch+P/4YZ/+788sS2Hc+38dzbINxX1uY5ZgqyXz
         usCq+loS+59OlDAP5iyObcu1G+OjkH6UwWC4jrRo6W4uWcRNL+3U04chSIfD87frfST9
         Nb8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711203602; x=1711808402;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FBgidFTZUdGcNuWAj9zpgPNJm0S7mU0UHzL1FgVlCM0=;
        b=vluvuiCTHZJjLBnOZBMAqGBN+z7kAXZmZ+qpoBaus1JoWTCftsiG2vrnRlVBPCXoxP
         J993TOcYeQ8fhPTY7i/IABvG9ZHPYWYs2B380sJYlsACKToCwmujyzSi+5FCq1Fkrh2q
         1rNSftsDPa5MQCx5cukUCqU3NwLlMSNERvNU+Jdo/EJqCtQWRiFiMxPINORVm2er+hoq
         ix9mJTAmLS9NAkt2MTmHed2hXjcy1CItGEwcKdtxhn2/jvl/K7jw1oY9SugIDaF3GvoY
         AarCPO3OpuJBzuqDKghtBMzNHXNTVQD3xQorSLYdUjce1ZLRGHBLmkMk6D4Ys4D8Xb0d
         V4Eg==
X-Forwarded-Encrypted: i=1; AJvYcCWg8dEYd5aT2Nu+k4wni6QiY3kE6yovLkf+uYjHqKnAiw0piH8fdruVwyf83DDj3nQPXkbfABxXxG24Qo7hWG95I9odECeDrBFXvb+lfKDM4FaJowbca5HY1oWqDtcFKdnw21lYkAFDXCyIKGB8yLBNW+UqTWFhCMhg+82tAqnmoCUx3aULZfgMehEL7kT4RyJGds22usBNbepZzwhcXo0h/uAonf+0FOwtPBvEdbspg0Re1yrIrQEcvd9D
X-Gm-Message-State: AOJu0Yybu+HD/MDZGMOKLMXKbKAtHjWBTIv0cALm1gDCiE53YLNx0Wrn
	6Ob+8oNpF1IIv1/W38v40DBu3RA4XyeJ+oJHPIbheGsO29uJuRcr
X-Google-Smtp-Source: AGHT+IFE4g4pSxlSN6LvnEn2z8HNI/vPhm+7+3/q+6Kl17LuocSiq18gMq4AaLc1Hqw8I998qpbc6Q==
X-Received: by 2002:a05:6a00:b46:b0:6e6:b778:fb4f with SMTP id p6-20020a056a000b4600b006e6b778fb4fmr2901193pfo.26.1711203602171;
        Sat, 23 Mar 2024 07:20:02 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z3-20020aa79903000000b006e6b4613de1sm1418943pff.104.2024.03.23.07.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Mar 2024 07:20:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 23 Mar 2024 07:20:00 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Radu Sabau <radu.sabau@analog.com>
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: pmbus: adp1050: add bindings
Message-ID: <01bfd466-4828-476d-8e7e-45f656392ec0@roeck-us.net>
References: <20240321142201.10330-1-radu.sabau@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240321142201.10330-1-radu.sabau@analog.com>

On Thu, Mar 21, 2024 at 04:21:42PM +0200, Radu Sabau wrote:
> Add dt-bindings for adp1050 digital controller for isolated power supply
> with pmbus interface voltage, current and temperature monitor.
> 
> Signed-off-by: Radu Sabau <radu.sabau@analog.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to hwmon-next.

Please note that the branch will be pushed after the commit window closed.

Thanks,
Guenter

