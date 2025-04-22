Return-Path: <linux-i2c+bounces-10521-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EE207A96CB8
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Apr 2025 15:29:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B2B13BF7AC
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Apr 2025 13:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 549F728EA78;
	Tue, 22 Apr 2025 13:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DOC4FzDV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E09228D85C;
	Tue, 22 Apr 2025 13:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745328307; cv=none; b=dcJn5kUXg+vpfBQvqBNQdvVjOXJB/V0HrYD4i269RT0/yemDHVUfcEeQMB+9ySINPEvd7OknSKtByMDXUOkA56yy6YI+E2uEQUNq3srsuaTmANWl8sxRTc5ZfD4TxJJMSnH5jwpgZdPosodXvqJW2dRxtudGPMlCqwL8LCQo3Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745328307; c=relaxed/simple;
	bh=ga8X5MpO90NXnqVjZrc/v7Kv/s4aTzdKG3Py9IZtumk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UPGY3VIaXHmm5FkQ9PyAAG1oLY+eBufUuGao3HOGpT+e6GIZVS50ps3E1OaIVthv5NQe1pMvIIFbIq3CbAQ6psqsewRI/gqaRhbjKlF4/UgLc6t1qjXsJHnV1+jQMXrjLBM7sNCwBeNtyBd4HDCsk5NmudsZxLKHDNzDfsHJ8Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DOC4FzDV; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3035858c687so3715131a91.2;
        Tue, 22 Apr 2025 06:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745328304; x=1745933104; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SkZ4rO5WVQ0vh3cTgpi71ZrF/ZuXKtOK6zU8kW9B0HQ=;
        b=DOC4FzDVxxbMi6nd4r4PP5WAxWB5TDTLxfnobBSfg+U/OVrJFxp7fFTH45M/RQZAQX
         zjjeti5hsa7H6rqVVW7mUkrBoi/Xpujjh1CU57IYZ2iRxihEudYW53TyPwoWJv9tj9vA
         73NImX/dgskTXAXg3gPA6EkBKlVJt20/gNXseok0WJNK1K/Pq+w5Z0fwhbj8aTQaUQLd
         V3hdnZqCLderWOvjM/ana0ukeL7FV/U6n4RY/Xj1dvSIpBdoj1HJZ5jMcfg/1oUDHF2s
         Sy4Uy4S0MRdXVPWdOA4UEl+aDNv0pAt/Ytk8++LprOT+a7wY5Kz7/qQrKewVkqWjjZec
         P/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745328304; x=1745933104;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SkZ4rO5WVQ0vh3cTgpi71ZrF/ZuXKtOK6zU8kW9B0HQ=;
        b=oMaACGoavn9k/frrvITfgQNS3rapUF22DY+qwgWsnuLvnrlA1HhPulMZvBNvYiy094
         6PqbQEN4TJD0eezMl2XHJJ/jTCqbteMuZu1ednjjMkJOPYvbEnzSYTsGMMCR9JAZknwb
         Cj1McrU8q1cEY83qDapWRGW31fHfZD++09LWNxdscjwB4yIPOkRR8Ifr/z1nTyIjsm2y
         szH5tPmc5tYo3kCem5xZtlaDIUxt1B0rWd5at0Wo295wtT/+O0ud+p4GJD1Y2gtR/9um
         Hlf+/UAWBXk0VfaTcxOs98cXumJHh0cBRuFgdihEgE5ao9wjhzC35QXeUAABdMZKTdZg
         uPcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNJkeEooBT/s8gZ6k6qumNl9ibp7pr6N0ioFi71DYllttY5uiaCO0BMqBfh52jbb0BHDa77+1jd1pZ@vger.kernel.org, AJvYcCUW25jzrq4TLr1JH8jjxlOgavKVqHpQNp2Ypsztxvt2UqYeKvkWKZCC92o6bcwst+IkcGat80LumJhrAtSi@vger.kernel.org, AJvYcCVmBZ8eAKif4g2aERPADKiZsAumUMAPyLllC2DsiaeXInkKx6ZK49j51Bdj/J+yXtaMcUGc28A+t4mQO7E=@vger.kernel.org, AJvYcCX9gtTRdyopJ+qyP3g5O/AYmarW1eJF5Bvo+GUMa/vqOailJwGGq9VgxaHLRtV9A9h+76EIeGUKI0wC@vger.kernel.org, AJvYcCXnWRVcHQnRPBz1FJ3R/8ZMS8/fcxh+mhEu92NfkOLsaPoXpZlk9kVaS0fBS2BhrZmEA0bEb9TpUeRs@vger.kernel.org
X-Gm-Message-State: AOJu0YwfY7izmwqrI5jwK8Yx6hkYGAiWIzbRV9NG5yhkIKOLNkvk4OgY
	5qnZsp8MJZXYB2uPy6WPhcGr2c8888hr98AfMzZpOlsujbE7zTT+
X-Gm-Gg: ASbGncsiLFFDgUevkIk264gmhTTSambe1GtYFPH0fGrgWYwZaHnGgeIhPXWKhhqwzfz
	+aev/IzvI+lmogbjONytmBSYLDqDKqWjSle75IgEkyvMA7mlcQnueW2dEDToYwfWGBKs/4NAyt8
	cRJn95/fi5EWEZ45R8ssdfQcB1JPZRKgVnrPZqftq1YKe/2pLwlX31YXohHgmhBVkkL2fYUru4O
	bC6Ed0ItZBwz6MQ+u6g1O2cBeQP6q35Lgq2PqK3/L48pI5txVZddr0sM2mP0rt7Iw1zxby8RiRR
	CLQDibTpwsQv4ru2UI1zig08kpJ1TyG3xzzO6zgiyuexsqVy8auHvQ==
X-Google-Smtp-Source: AGHT+IHl9x3YDvC9BAgkQoInW+kirFFJHYTa2Lq+KqUMV9d2addKDpazyS2yMd1fkHCYsTlQY7AGVQ==
X-Received: by 2002:a17:90b:5830:b0:2ee:7c65:ae8e with SMTP id 98e67ed59e1d1-3087bb49201mr23751437a91.11.1745328304379;
        Tue, 22 Apr 2025 06:25:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3087dee8997sm8604754a91.9.2025.04.22.06.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 06:25:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 22 Apr 2025 06:25:02 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: pmbus: add lt3074
Message-ID: <2cfb4edd-6468-47e5-96c7-4c66b33b4fe2@roeck-us.net>
References: <20250421-upstream-lt3074-v3-0-71636322f9fe@analog.com>
 <20250421-upstream-lt3074-v3-1-71636322f9fe@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421-upstream-lt3074-v3-1-71636322f9fe@analog.com>

On Mon, Apr 21, 2025 at 08:18:18PM +0800, Cedric Encarnacion wrote:
> Add Analog Devices LT3074 Ultralow Noise, High PSRR Dropout Linear
> Regulator.
> 
> Signed-off-by: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied.

Thanks,
Guenter

