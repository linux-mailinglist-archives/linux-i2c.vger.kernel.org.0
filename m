Return-Path: <linux-i2c+bounces-9868-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11769A654F4
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Mar 2025 16:05:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 046AB3AB9EA
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Mar 2025 15:05:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2A5124886E;
	Mon, 17 Mar 2025 15:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G9Ro9bUZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0682475CE;
	Mon, 17 Mar 2025 15:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742223891; cv=none; b=M71UOsL/pPowirpAfO6AmQhpAGzV/qoTU6NbujwlKytgYJsJC7X7Yxs2QVikRrJyxbv9GoLL2RAm63xLuhqHzmr+EwW7Q44asov2az424jVfhrOurMQ3iyYdjZKyK0RDCM2DWyOrUQmp2GwJBmCKgilJiYx/tWtZo1RxizeUBeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742223891; c=relaxed/simple;
	bh=9MD9so6Z8faXWYaIlw81tHAgFelhzE08AGLAxn+LdDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NQJud9yu8rLuQ0oPGhIQioSQi+uSFg5UVr8YXyOLWWTvbIQAblTKgZlkTwCpuu7UL6V/GRxiaSOehTOFcAsM/ivdFTOPID+avvjH0Jz/IyeqcuHBmV5Pq3kK+Gz1SpKFchMfQS8SxZpeDpyoXcrxzFT3a3JzkqmxczcyeATABJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G9Ro9bUZ; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-223594b3c6dso91081685ad.2;
        Mon, 17 Mar 2025 08:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742223889; x=1742828689; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZFDFtvPMucST8cLNpJSyGw+n+YEV7mkaWNYljj+T+9o=;
        b=G9Ro9bUZHGqzWfNTSAxY3+j5pRW/OyP+5mTsOO6Y7VAmwmkMM3t6u1ohgslPWNsN0M
         wpGhVNjeAKk35WmrGXrxvUDflpyq1qwU46g+3jZcKzzdyOMTUyFoY3QLoeZDnmrl/VCJ
         gW3UaxzbbfzVW67x/KHcu8FYeYX9OxDUbHuPIJJWM55BLU86jBnaE3N6jjBE6VV8Wxcn
         Ry1w4yfUvMY5rzQlTZ2xshq63HXSo0FlInV+IYoCXjiMw5abtHJczwTNyh8YLM8Dzrix
         RivhDsadpgM1sjWuaYAD/SP3nri8H41AZHklSTPuEwuijQxNRuQFGXi6lT+F5QOsX8vp
         fDLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742223889; x=1742828689;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZFDFtvPMucST8cLNpJSyGw+n+YEV7mkaWNYljj+T+9o=;
        b=sTPH87lEB2b10L5jra/X7Fc6fj8NDS/oKlg3uuCKD5mq/Dgf2nhaM4s8Cx04Gc7/Gr
         t/r9WhYvXnTeiuakLAnRjTSn/gO/6EL1DsMMpYCaikXvR50l4JvHCkAkQ8ihPPzREN64
         MHwernazTUToe0RgrIOX6Q05BCoW0G+S2iiXm0enqS0MbmqDyXWMOZaMtzmPgjeqwJ71
         +inGlmydA/PmGFKTe76txCPo9GP6KWps0+oC6wghDHTsZzS8/msOdh9b2K3XDPrLf1eW
         ebimAJVZB7fokgENSnkm76ZrMdu466etOjVDWzxab6y7a8kjQxXwoJOlt/KerZ0NXPJf
         MNJQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5XtZsLM6Skw0xMe1zPQZuu7cY0UdMJsXK1/4QJze6pfodfwZBFZrkU7dTPYLmT41OhRgzRzxzxlfxojM=@vger.kernel.org, AJvYcCU6/D66qTVktJELl7V2gqZ9QY8w3Xlxt3p1vCaI3oSOzbvqSFo/wYYE6olTbvYNAABA0Pka+EXo7ctN@vger.kernel.org, AJvYcCWuRqi0Hzbg8jOwDNZ5IgzYyFzV+Qt/eW3LMwLXzay1GA28+YwBLSpC2yJz5+0yeyLiGia1rfZzqAiuea+8@vger.kernel.org, AJvYcCXc8UqXV5xqhUUFOHGqURYyyLtd0vGT9n2+zj+h0SOe/e3G9VE2pBVztlIBrGF40HH4NkACx/qLSoRc@vger.kernel.org, AJvYcCXnnKUsTepDwf1wHD4lZ5wzZtXXeeDWxVhXQSBGJVKSLafB/OoYe2o7ZM0qk+gQUKRuhAMiSXO6J+AJ@vger.kernel.org
X-Gm-Message-State: AOJu0YziuTldj2+kFH6OkKeYJ60Vl3i5JDZ55O/F2JZqG9qDeuVyqWtC
	JK54TMc5oI0XIt5I9HUKdoYN3n9HjjHM0y2IDEe4qyRyiHw8S/8g
X-Gm-Gg: ASbGnctmYTjeLrU+9nSoVMAB+1KaoC6LzmsfdlKBvIVM7DihrOqfBL4C1TX/mC3wrvg
	dKEYF5SWK7QlEVGpMm4ze+ww8hQVEmkrmgMJco58XOYoPy8hzGA5u147tUCKFRUVKpGFMKFUlLp
	zJ3l/JBRpz2qZyW60Br9QO+R/DVUfrTaIb6MbyYD0fg+paKwJcCYr9pN5W5xBOSg9RzdyfaYQ94
	ry3oirCQk4Zo3qPSU+OITl+3C1MJ4LrL9SGoeJeVpShyuxlnYTPiVi6/HvqSG1fgSzkQd6WDKlr
	Xv/5VC4aZnqUfab8+P0ZP4BMEflS/fBiz2SXRKUPYEwH2OaQJPOIoLurLA==
X-Google-Smtp-Source: AGHT+IFEPUfvrDp0l3aItf2NS+6U8CgQ9woLHEKxzZKI7ELISh0TS+luo6U+BRiOGF3Vib7uEIyQ2g==
X-Received: by 2002:a17:903:fa6:b0:224:194c:694c with SMTP id d9443c01a7336-225e0a8f166mr156291955ad.28.1742223889332;
        Mon, 17 Mar 2025 08:04:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-737116b102fsm7677834b3a.166.2025.03.17.08.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 08:04:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 17 Mar 2025 08:04:47 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Kim Seer Paller <kimseer.paller@analog.com>
Cc: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Cherrence Sarip <cherrence.sarip@analog.com>
Subject: Re: [PATCH 2/3] dt-bindings: hwmon: ltc2978: add support for LT717x
Message-ID: <8b44144a-568c-4a16-8a63-622d1148f64e@roeck-us.net>
References: <20250317-hwmon-next-v1-0-da0218c38197@analog.com>
 <20250317-hwmon-next-v1-2-da0218c38197@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317-hwmon-next-v1-2-da0218c38197@analog.com>

On Mon, Mar 17, 2025 at 01:02:26PM +0800, Kim Seer Paller wrote:
> Add LTC7170 and LT7171 to supported devices of LTC2978. It has similar
> set of registers to LTC3887, differing only in number of channels and
> some PMBUS status and functionalities.
> 
> Co-developed-by: Cherrence Sarip <cherrence.sarip@analog.com>
> Signed-off-by: Cherrence Sarip <cherrence.sarip@analog.com>
> Signed-off-by: Kim Seer Paller <kimseer.paller@analog.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied.

Thanks,
Guenter

