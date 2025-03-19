Return-Path: <linux-i2c+bounces-9915-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E99A68D1C
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Mar 2025 13:43:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45B21422C13
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Mar 2025 12:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 531582561C2;
	Wed, 19 Mar 2025 12:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="xgTuQ17q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC4E25524C
	for <linux-i2c@vger.kernel.org>; Wed, 19 Mar 2025 12:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742388174; cv=none; b=Cc9wOcRpIz6LQAfc2kRDJinnJjYh4+8cXn2Aotif922sJkWdh/erJATMK0QGwck6ORiegoJzDalisEUirf4ofpvudNNVa+ztkoZ3Cm5LMoRtqQIxnn/BDN+3fvgAymVUW3VJpA0uPz7q/4EayEvyWbjCXHowx4t//GO/ccSWNlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742388174; c=relaxed/simple;
	bh=fZ4N8rOOZtziflSX/PfQXG9Biqs1R/I42srqwO5HUfc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i+A6JnLGtAbkl50wBOVp5R5/Itul3Qvn52V/Op21YrS1740aX1pT0TxtF+TOzathYX783TjKyifLP2WJEtyFVIBqoJtiWz+GX+km4N+LREgFis92I2lO9+Y3dDcP1YfnL67h3OxfRsXuJogbudTuxvMgx62cZTM9EurdSPwe72Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=xgTuQ17q; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-85da5a3667bso233393339f.1
        for <linux-i2c@vger.kernel.org>; Wed, 19 Mar 2025 05:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742388171; x=1742992971; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kyeWtEw8zSEmdt2B2rWBlorZy53Vw89+CNeJItSMOLA=;
        b=xgTuQ17q1KtG+lF1gOtB3V6eu2L3aisyk5JioY2J9ZOSXjsfK+zA9M1q9/aRht1CSH
         SNPE7WhB5aZdLzfuRJYw/od6WXmSA41L7xSwWOWVbcBURI4ains2mzZ8UaJssGGKkGLo
         5HN9rFGi7kVqSg2sdaJ99RmMCOn2aLrrNlgufq+0GnJfRURvfr2WgFsPYxTnn9FQyiqn
         TKgON9AB1/rxtKznsaKOJbNbTypHRrQfMaFSCMZU1lFRBt0aXbax2TxaAmhIREuXj5jE
         lZD92Xl0aNZJISmtortRs5nhypmHlWyulTmlltOgy2QHAWeL8MC0LTrs8IWL5nW6+z19
         4qBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742388171; x=1742992971;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kyeWtEw8zSEmdt2B2rWBlorZy53Vw89+CNeJItSMOLA=;
        b=PFpU7K3T9kjGRqihQpORqXlbJIXSKgQmQVc4ytXmVSWgLtlBOH7aZ86NRaoI1asl4m
         kt9dqL7btFW9bL/Q0fxPt7ZPdBSRwGPkXw/AoAYguJRztOTlxQtZr3kE7QSmkrBvQd3T
         +k3WCRpNHAXzGH439VO2o1FDH8AD8bdxs8/xCiX3VjXzxzFYz/gOLQ+p998UnZMI4SUD
         0QsXWRRKUOhFBPDb0eIuxhymVdSh44/glzND5AjQ4z9DD9O82a+ImXRr4B9MIaq814uW
         Kwt2sR02AolwBWESGcfJry4rFEyNBomN1ckKZ1tvGfXR3mjvNwCakLsmAXw9mms2F5Nc
         PlUg==
X-Forwarded-Encrypted: i=1; AJvYcCVjaVHgEnV2qkIIsmRukDYak5JwOUvka5cxhE12Sb0yNNlBs+jplRC5m2y0CRqpWRwQ/sirCgSSLIM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4OjbxYm29cO5yfCiqWRBv4e8oFcAgtZIUxk9FMQcPOOE7o0FQ
	/hcapmUZsTNg4Tw2MveEqjJfA8gP+lZ0vppSyGoIjE8a1tc4yqibI9mzuaf++cs=
X-Gm-Gg: ASbGncvMqC47KGFuut9SsJ5qNCh4lP9Orri4kJhmA3gRUbP1R5+GvK1I6+5aOPh90Sa
	t7cnbJkWKdd7jzeZAXwC3mpLAnxjyZDaDrycE9rqcsVm96JjGNI1dhFmnTyC1sjxgM+UyKe0Zbv
	WsZ8/9JPwjX8Z43/cxe+EnNxJe447Jj75V8LKqerRIRYZzZRLRtZvxkd/H4bGlsUUREBt9NZeyN
	m7k8t4K4DtU0gpL8ZtuUBt66jEEb90PQKhQorbRf6iDh1n5t8Vw196TY+plliV2UwJnGGU0qxa+
	ObKaCNp3h0PxWvJ3WYI4BcvJX7tKXU6Io4/2aYYYw/POMRdP7KUUlcxMl6FprJOFktE462CzLeZ
	caee6tprGkdq7o+AL9A==
X-Google-Smtp-Source: AGHT+IH7sjljQM+QmrKBokA3matC2RiNwzx/l2tsu1F5XWLbsNSdMzt3SBx/tCoCiYaMZ1SyjlQ1fg==
X-Received: by 2002:a05:6602:388a:b0:855:5e3a:e56b with SMTP id ca18e2360f4ac-85e13870076mr284771939f.12.1742388170792;
        Wed, 19 Mar 2025 05:42:50 -0700 (PDT)
Received: from [10.211.55.5] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f2637fb184sm3185854173.92.2025.03.19.05.42.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 05:42:50 -0700 (PDT)
Message-ID: <967f135b-9592-4f85-86f9-5c3e31123c3f@riscstar.com>
Date: Wed, 19 Mar 2025 07:42:49 -0500
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] i2c: spacemit: add support for SpacemiT K1 SoC
To: Troy Mitchell <troymitchell988@gmail.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev
References: <20250319-k1-i2c-master-v8-0-013e2df2b78d@gmail.com>
 <20250319-k1-i2c-master-v8-2-013e2df2b78d@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250319-k1-i2c-master-v8-2-013e2df2b78d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/19/25 4:29 AM, Troy Mitchell wrote:
> This patch introduces basic I2C support for the SpacemiT K1 SoC,
> utilizing interrupts for transfers.
> 
> The driver has been tested using i2c-tools on a Bananapi-F3 board,
> and basic I2C read/write operations have been confirmed to work.

So you removed support for the clock-frequency property, which
addresses both of the things I commented on in the last version.
This is great; I hope Andi is satisfied what anything else you
did and will merge this.

Nice work Troy.

					-Alex

> 
> Reviewed-by: Alex Elder <elder@riscstar.com>
> Link: https://lore.kernel.org/all/20250128-k1-maintainer-1-v1-1-e5dec4f379eb@gentoo.org [1]
> Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
> ---

. . .

