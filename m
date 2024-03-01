Return-Path: <linux-i2c+bounces-2106-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB5486E969
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Mar 2024 20:22:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BC691C229D9
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Mar 2024 19:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B99A3A1DA;
	Fri,  1 Mar 2024 19:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D1Y65ek7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E57818646;
	Fri,  1 Mar 2024 19:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709320924; cv=none; b=CnRXnqARIKCwynWfz8AuGsyCwXdH50+oiMOT4RQW/YSuZrf/G2Ltves3RhzV33JtF01GinfnzktkiktRVnQ48/nbB3ZhWqa6094CMvWO81GT/wLx2pw5RFXNtLfhVQFNWZplIhasdQQxN53yTvnG9FV1A2ovzJ2jzqCOMSjOIMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709320924; c=relaxed/simple;
	bh=9DL8X7SDQWDpgxAebkOMuEWmb2yJCbAdGd28mrufEMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mIcjM/oIxEXatD8LTrVBZCa345a2Gi64a0miYRDu0ez0G42BAnELukUYAb9fLPG9XxgK+S/sP/w8OTTDeO/NB8tOp2X09Y4lr7WfeTVRJMAW1DWuZsNFnzoDpvhpi1ncH7WjmBEWka257qabMNAfg0A0/UDi2AOF15aGlDy/HdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D1Y65ek7; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-7c7894b39edso105525339f.3;
        Fri, 01 Mar 2024 11:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709320922; x=1709925722; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EQX16KGPfGhwPlywSR3eM19+bX4OPs2RwdDNGqOQ0N4=;
        b=D1Y65ek70R96fB2T6LgBb1Q9tKwhiy8b/hXyQmTpRH34idmT3MGycGUnTWcU3AKt/k
         fOEHll0pcFoYyH+e4+1sfLJY1wZGggx7+oyRVefBc9hmt3x2gQCTmX4UH3Niaw7hjfYo
         GOw9eQagu0fP/0z0ZS5jOVobIEzL4EW0fGWKG+eZI9eaFTGiCnoEWv/YQulUZt6Xiouu
         DYp1baYdV0CHFb3v4+MGLyZwtAZ/uos1OZ//OoOyH7H1PWuuhhbyhyCtNQG/0xH6Gw0q
         8fqKcfUgjWAGYmWJ9qct/xE5SqKmuGU+NQVsXa41RIshBRlAIAd/5b0OPd49lo7ZVJbf
         Nf4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709320922; x=1709925722;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EQX16KGPfGhwPlywSR3eM19+bX4OPs2RwdDNGqOQ0N4=;
        b=hgUcEm9jJRN6cBC6SlT4IHAW6OGqHaBbHV4YRMpttblgRkHIdnv3a1zFO/XpUUDcll
         UpXbTgV6eE9+b0dYWgNyEay6rx6zIL2VyqqR03Mz25rR62mQ9LiAB/ObiOVNMGZe+36V
         AQthXjYelVCPD+mFEN0A2biAnp2PoWwJi+Yiah89loj9UybpcULL65YfiSkI407AKD81
         AZLmc/GZUyu0HxqqS7GrK6I05qqHHHeWLKB+mEUvgvsvz6ciHgBWS31SF023jt8+bnZV
         D1RwKPl8yYWz8/nfB74aB315WzpKrUqllQwJ+rQLnlOaP2hjrXGj+eoyQ5OCz9Qa2B2g
         jFcw==
X-Forwarded-Encrypted: i=1; AJvYcCVJ7sDUAOAPuOta/6r4M/v997FkjSpIIbg7QRfKnuuIa44uotepUI4VHiBLq4UlABW4TdNerhi2MLh4wyPWji/+pbo9vFdl7BXw5G7HPx2zxwJpeXTXTnb068DJ/9DDfR2cZF8SHWtfN1MjougsA4chbwlwsA+6zsi4+/SePqpjqSGNRmFK8AhRK+2vpzRtC8XEaE4UnQiHOGbGWpFBCmXv1DOCiDLRSm/zxRYmWtqiDW09+0N5dohlmcvtaA==
X-Gm-Message-State: AOJu0YyTjaVWlmoxwwNg61wKSiyld8kF9l4vjxS+O/19l6z71gq0+7Op
	p63qlxy/IWAggzRvOSU4zyO//1hW+DYFFZsUONK9guTQ2kegLtk/
X-Google-Smtp-Source: AGHT+IFmOtK8L3kEWqNK9FFRWLRwrFMKl+pRQUludHj1Ip0bHkcNfXR9ByhlEMUQpzX1BqYd3Q9vCw==
X-Received: by 2002:a6b:c301:0:b0:7c8:289b:d52b with SMTP id t1-20020a6bc301000000b007c8289bd52bmr1830254iof.8.1709320921516;
        Fri, 01 Mar 2024 11:22:01 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w25-20020a029699000000b004745460576esm959613jai.19.2024.03.01.11.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 11:22:00 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 1 Mar 2024 11:21:59 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Gregory Clement <gregory.clement@bootlin.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 02/11] dt-bindings: hwmon: lm75: use common hwmon
 schema
Message-ID: <feebaddb-fc6f-407d-8430-71531da4ed0f@roeck-us.net>
References: <20240229-mbly-i2c-v2-0-b32ed18c098c@bootlin.com>
 <20240229-mbly-i2c-v2-2-b32ed18c098c@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240229-mbly-i2c-v2-2-b32ed18c098c@bootlin.com>

On Thu, Feb 29, 2024 at 07:10:50PM +0100, Théo Lebrun wrote:
> Reference common hwmon schema which has the generic "label" property,
> parsed by Linux hwmon subsystem.
> 
> To: Jean Delvare <jdelvare@suse.com>
> To: Guenter Roeck <linux@roeck-us.net>
> Cc: linux-hwmon@vger.kernel.org
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied to hwmon-next.

Thanks,
Guenter

