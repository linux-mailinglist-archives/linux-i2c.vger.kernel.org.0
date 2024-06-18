Return-Path: <linux-i2c+bounces-4096-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3CE90D941
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jun 2024 18:30:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65CDA28523C
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jun 2024 16:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E42AC7F482;
	Tue, 18 Jun 2024 16:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kdxYwlaF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579246F307;
	Tue, 18 Jun 2024 16:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718728177; cv=none; b=MuTPVx+hjaEzs/sIRd8MCMHL6IQo4H2PJWJ+RZn6r8sPm4lbpZwynSqoIPN5doseBht/yKV7qMyFmtT090g3TcFSCeyIYzzUN9e+ZXgzDwSNGbGFBcbyepk7WA/QBKphMY6hKqm9w4Y0Jt3sQ4YNo2R+QgIMBv92iyzEEtCPD2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718728177; c=relaxed/simple;
	bh=UsT5NQh0GVQQVdqROGFcp5V5hRUJAqWTfvcSFefzOjo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I+cYvU29c7PPSYL5utA8SBYgeSTGt9R5q+G26uSMEmEpk23ijnxd7jUK9EtJgA34rmVMAj2CZkGwsK2AB5nFLSfKzELyd5yZW4gBVY2ibexCCR9gLMuGdDJ/ky47zT+jvj4ZJNDPzouCsbMBjH1HEplw1IdGVpcGS1zFn0WPHnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kdxYwlaF; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-705c739b878so4598922b3a.1;
        Tue, 18 Jun 2024 09:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718728175; x=1719332975; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=PTLwF7FJJq28Tj9sU+QeSNnqnZzMZSab2k97XIaOnBQ=;
        b=kdxYwlaFSshURseJE6p1MZ83iUCvyUtIkSGe2dcD4XOD6k5co2BHiem+Wo6Dq/exP8
         5WJ/zpRWg+fAWjxtS/Q0OsWGXZVqfVgKMNuzXTrdXO+9RpHJXGbB5Nu42wGRJCoaK3Zc
         Tet7RO0pFfhi9v8bQJkWg2o1X7ysfb2j8MrmsuQeQsQmhhYQDeYAwq7zu7h1A6+kDkDF
         kGLgbVkgdUZIVApRjOllDMzjzFIcjYL/e6VmfD6mBguqXhczPsXoPHSbc/3KdjfTwgTK
         mT6Y68avSh6XwuZ0yvy2q7lHE+F0GxNEotg40HqKuzVbP0Vdzj3T9Xq0AUxkCSmutLNc
         Uufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718728175; x=1719332975;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PTLwF7FJJq28Tj9sU+QeSNnqnZzMZSab2k97XIaOnBQ=;
        b=qkTznE+XZC6V4XLzowarci5ARdMfIM6TFsghP+TMFJjawSH5l5wJSjTXEG96p2OEpq
         Bz+Inth25y2f3yjC/ixSJmbZJDpUOULOi0oEzpvhNfoxBULVIbsHsK3d4pkxDKqoaFaQ
         mT/0t/+U3Lp0Qvor/h33tAXxIeoB3WyrMn8BZIR0fgQ2i3zWDeu3tjbG/uki49HzJTBW
         atPuTWa5hW/967NNakIN4XPL4eXapHTvUF1ZzA0ULbb3NgNDKcQEjRCqpi99kIxeZbG0
         C+ZjEfBt2YfXUvPkC4RFHribPGtKEU4Fnu0ztzdfMyIHdu2TcNLfrO0AKXw7nNVyPC6A
         r2RQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaUW9xJC4C82It+TWvWqddvT5fmhv3iEiTpTLYlxX5vlyUAmJp1MOpKSXrqxVr8ICJGkhvhHnnSGWNtEd8fQh1Xcu9bfJ9RI+Gh8Vx1AJopGk+d9vESpPD+kM75SaODjIxJyDxwIK0iUbnuWbfAG8icT2GL9jTen3Jfgl2NbCNLSZqVQ==
X-Gm-Message-State: AOJu0YxALvKGu8HuoMN15VzEsviNG3jX3CvAUqEgppcLkIxpQtAeEwLH
	/95F9p+wOS6UlFlClvC05UiS9N2FFvGykVuBJC34ZS58Oh5cZDWA
X-Google-Smtp-Source: AGHT+IFnMIreX7N0zHGAieLQNwRvwy9eIcMc8pU01yWRkzyddP3GNSiHFCx8yMdXsrHRTJUi2+xZJQ==
X-Received: by 2002:a05:6a20:2905:b0:1bc:bb05:e0db with SMTP id adf61e73a8af0-1bcbb05e107mr95545637.23.1718728175394;
        Tue, 18 Jun 2024 09:29:35 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705ccb3d1ccsm9130707b3a.125.2024.06.18.09.29.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 09:29:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <fdeea79f-4568-4e70-9b49-0c02abc91170@roeck-us.net>
Date: Tue, 18 Jun 2024 09:29:32 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/9] Add Mule MFD support
To: Farouk Bouabid <farouk.bouabid@cherry.de>,
 Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Quentin Schulz <quentin.schulz@cherry.de>, Peter Rosin <peda@axentia.se>,
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20240618-dev-mule-i2c-mux-v4-0-5462d28354c8@cherry.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240618-dev-mule-i2c-mux-v4-0-5462d28354c8@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/18/24 09:06, Farouk Bouabid wrote:
> Mule is an MCU that emulates a set of I2C devices which are reachable
> through an I2C-mux.
> 
> The mux and amc6821 combined make the Mule multi-function device (@0x18)
> 

I don't think that is appropriate. Those devices should all have separate
devicetree entries and be modeled as individual i2c devices.

Guenter


