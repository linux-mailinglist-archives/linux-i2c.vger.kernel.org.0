Return-Path: <linux-i2c+bounces-4319-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9D49157FA
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2024 22:30:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A15131F21E2F
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2024 20:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78F504F615;
	Mon, 24 Jun 2024 20:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m6JrK6OC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC9E2233B;
	Mon, 24 Jun 2024 20:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719261038; cv=none; b=gGUVoqI8/GaV5KssTOZBcL2DgcfeKSc8dUHMuGWcTzS5KCxrNxIPWP30NkpLEIPWJf/q6vM/7Y+DDosVulkWREqJQ9fMpouWWxkYGYHSC2HdJytuGykwJ7nuNVYvEuqkCE4ubqgY9v200A5j7/wuekPqikyHv19AjIZpYA/7ong=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719261038; c=relaxed/simple;
	bh=GTiYb6GrzxzcwObveaXj3I+TryD7LP1+DQrFJTDzePw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=k79hVY96JWnbBaYXyBv8e+DeOvvX6dGHyDVJ2NBKkzfYc6ZOcZ+R3WkxTQ+BEJgaA9pNR+QaHcJU/o466fcAF/Bpm82L2cUHXEz+AENOFBBApNz9Wn3fpoKX5pGV2eS5oYTPqjpeVRJLAblHUULW6hPk7gOQI2FDDitXagV9UgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m6JrK6OC; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-718354c17e4so1944384a12.1;
        Mon, 24 Jun 2024 13:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719261036; x=1719865836; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=0JCjzHa62U2GIxuqtrX2ey45JnspojXIKFnfDyNZmBY=;
        b=m6JrK6OCtrk75nGW9cQjQZAeSMUP6mrHGPKLOapmOBNLvzlrNq9kKGQ9e3iG5FTONr
         uOcD7bYxlyzKRuPGDRM6/Y/gbGgsM0BL/xHz9xTSHc0EqbB7BH2WR1WEzyyuwjKtGdnw
         Z/HtDPEmb9Sc1/0V9js2y8CcwihJNwXRSHpILGzngzR1MxqIAbA/7PsnfcNychZa5QBx
         k+ewt129q0MW7ZzRLK/E/umk+l42i7UoQ6SiLSxBgQJEpOpyUy8Q2WAyox/t6pVLDZtb
         kmcR5CV8B82/5gZenb8WNalBq7lQ9G6p1uAoC3/QpLX4v0VAK3TWLUe2PjNWnYvoEz+1
         YUOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719261036; x=1719865836;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0JCjzHa62U2GIxuqtrX2ey45JnspojXIKFnfDyNZmBY=;
        b=tbG+titwF+LEEN3TnoQjTJzfrwQIL1WeOwwuGJEogBQM6xicSJkIU47gXLqgZnCmVU
         Yg3lHQO1pJWYLK4dFGt3yWMn+hwSxpC3PTxYPPL7qX4APQM2Zq3lvNbtihevNzI/vN7L
         Ide447ca6+XsbQd8c13kFOQ4/wFClRxaMaD9NSaP0w9Ks4tzEasJawJ4k1ZZxZgoXCT0
         j+u01hk3bQREn1N/GdotSlvtzMd/0n7qvlqoPeKp1HVH+hHW4YWP+YhCvGpiXgHIs3GR
         Iy24xjnoW/3/x6/AVS7m1ue4hLkreS1+U+hjbod0a2aLOaqCo2VcPIMKgE4e3tlP+JBh
         7Tzw==
X-Forwarded-Encrypted: i=1; AJvYcCVp35hpBltPUij9G8+V7O/FK6wSSEC2X3Zxw+Pl2uIjrhBbtnn2Oyl9qDhvVT4FEGi4MNFBIe8imdTmekkN7dyEO3VS5BL2/yGj8UuZxM4ty/J3C5nxphK1U1mxIu3lffodGENGpZxbAu+K/26svbBUHq3t0PF9buneje0iD6c1KPOv5JBj9hMPFzsg78RcJP6MXTm6G9UhUplN7UAUqvqj
X-Gm-Message-State: AOJu0YyL2UPjTu6Xs1t2rpHesHZFb7a16WqKHThdmb27URlTlzXYZJod
	7I/17qL85dRqbOWNinaBrRw2zqeWhybhxRraccDtJ6I+UeSoH1L0+LrH6A==
X-Google-Smtp-Source: AGHT+IE09v6jXfWM0B1dycTkIqlEwMVFtW6S6SQX/ldL1jJ32tdAE6dln6AaBljV17NP0tY1DsNYVQ==
X-Received: by 2002:a17:90a:d084:b0:2c7:35f6:87e5 with SMTP id 98e67ed59e1d1-2c8612c6c27mr4625811a91.5.1719261035979;
        Mon, 24 Jun 2024 13:30:35 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c819db94ddsm7185675a91.43.2024.06.24.13.30.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 13:30:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b361066a-d36c-42c6-9e54-5cde8c40c6b7@roeck-us.net>
Date: Mon, 24 Jun 2024 13:30:33 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] i2c: smbus: Support DDR5 SPD EEPROMs
To: Heiner Kallweit <hkallweit1@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, Armin Wolf
 <W_Armin@gmx.de>, linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, =?UTF-8?Q?Ren=C3=A9_Rebe?=
 <rene@exactcode.de>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?=
 <linux@weissschuh.net>, Stephen Horvath <s.horvath@outlook.com.au>
References: <20240604040237.1064024-1-linux@roeck-us.net>
 <20240604040237.1064024-6-linux@roeck-us.net>
 <c939b0c7-2c8c-4cf1-8d5c-9309ce0b371a@gmx.de>
 <txliuvufu6muqucno2uex2q6xvnveozpjzahx7zryqlvvvzrs7@flv2zztine6r>
 <a7e38754-ff1a-4e15-99b2-4785827efc83@roeck-us.net>
 <ib6p4ivqdn56l3jzzarsoeijjhwak33bmqvj2qiddbhxdqzchk@txl4gdslx4gq>
 <79f406ae-cfc9-48bb-9c80-20f998c40b69@roeck-us.net>
 <veggn7y6qeeqx2dsmjykktudpwifnt5xzxcx5ulfglkgtq574p@f5dzhj4otjgl>
 <9183dfda-d3f3-4fa1-9a4b-c6edeb30482d@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <9183dfda-d3f3-4fa1-9a4b-c6edeb30482d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/24/24 13:06, Heiner Kallweit wrote:
[ ... ]
> It seems Intel systems never have more than one i801 SMBUS adapter,
> therefore systems with more than 8 memory slots have to use muxing.
> The current code was developed for the Intel use case, and therefore
> doesn't consider that a system may have dedicated SMBUS controllers
> per 8 memory slots. So support for this scenario has to be added.
> 

I absolutely agree, hopefully by someone with such a system.

Thanks,
Guenter




