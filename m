Return-Path: <linux-i2c+bounces-12270-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4FAB24C7F
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Aug 2025 16:53:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA7DF3A5D11
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Aug 2025 14:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FE092ECD2D;
	Wed, 13 Aug 2025 14:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m9ykqqQe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48038DF71;
	Wed, 13 Aug 2025 14:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755096719; cv=none; b=NuFjrGoCilXg/kueCvqMXd6jbH6BWk0vm8+48zC3BUeT4h4Th2cUAHUfzDv8qIC1wVra04GAIL4iTQe+0E/7X5ZGGxqdDQfenNOwZPAL5wKe60PvbaFCO/ItFG+MRfm3r0tDLV/BykXG4gijEqhhIdtVwqCppWXNkSHN/uLbfa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755096719; c=relaxed/simple;
	bh=DJcg95ss9n/mQpRT9R2r8te0XfPqJcL87xANT9eMG3A=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=dDCDRzJ71ZRRKyWTV/hTRQTlqRG8O9RwZmBg5peV39IkzjcfuVsqJsBzNzCyrbLZ/PezJ2cCiTAuDlXekjtin7A5TBo0qsjEhcW6UfFy1CrwXG/u2CqcUhVaSxx14sE5C7sTKEs0Kc4R9bg1th2qggX/E2bok7Cr63oFcg9cHyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m9ykqqQe; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-459d62184c9so40489135e9.1;
        Wed, 13 Aug 2025 07:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755096716; x=1755701516; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4K/mII+Iva6huIidVn3Xdjuo+WpE2kC/uVpvS1ParDs=;
        b=m9ykqqQe8B/tHacJYhR9V5zkFZYD1TGCyAx9qQ/2w3f5SKqtG72J7pxzfvgffeADuy
         3mklalD1dHD6rOufPDPOJj8/gtqplUe9f/iF8JgP5gb8iqdTBHFSup+uJCxNQ9HKmB/B
         Fk8CT65ou5pBwONe4tomKzy8pM3DoyrwkZCMlr7433+MQvDcCEWdcHfO9gedMAF0iYUO
         RGmtXU4rgUgBj9FkyyPKkDUDpjiTK8GeHm6Ga78AmjOnwu05810R5qbsINb7720vItO8
         0uW5drKvt1QAZQcWKcFNouxccDFlcMienEapE9AXf2PH47RX/ahnrHCO2Y1oTYLXRWv/
         gRbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755096716; x=1755701516;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4K/mII+Iva6huIidVn3Xdjuo+WpE2kC/uVpvS1ParDs=;
        b=njdnYQgNGU4Snw+2B8O92TOeBKADXM1PhsCbdTa4pCCIx889VDXENVybw7K/4Dn96q
         CxU0Qs1xxr/s2y0+z2N+G2z8cwuhZSuvY8ZhG4iQPu7hQRaBrvAucVy9GGBMzvYkTw0y
         5aqkkK4neGm5Lsi+NO4l+3tr8dftm9+Of8fGewuN80ymFN0ucA/IgvoMeJ3vxn74HFGL
         iRStKo4RTg9igEJgjeB1kfdZLJnZS80ZBGMKv6m1xK4XkD1uFZ9OYSOwhK07WnxJpPkq
         M8OEj6p48zTlk676tGqDHKct7IEKmp+J6f76CLouuurIbi7gtIrtk+bhCF3yg1Zs5Mad
         e2Vw==
X-Forwarded-Encrypted: i=1; AJvYcCVV860Lg3NGPidmg3ndZqjwpTPqvZsuKZDWbujthfUl6wJGLPYf1WSSQ6x0BGOKn6uAhbdif58O@vger.kernel.org, AJvYcCVoUuF2xj271ttNSTwxVojsaRdD7U0xb631kll+WVKamkfenbUhiDNPiKlJ5/3TUAaTVfB7Uotc5GNZB6GF@vger.kernel.org, AJvYcCVys88BPeuLjxRZPi0dfgTC0REOnDkN/fqUS9YQJGRn+LpayfE9cKv62QGXjItWYW4lVw2JwqhvvMU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaHvozBGWzdWoseKikKB6uaUVdwoZ/YWJw47adUzmSyZeHl8r6
	XLzuK2DAhG64BteFNaVq0xCpHYsvUbxA5g7PFH5voCAaTV5fPo13xsZl
X-Gm-Gg: ASbGncvv/Q/2Svf3yqumsqa5/QUDnXa3DL3nq8RkKXKWYITqVCWO4Rd/xPHyjz4vnQO
	vZWl5xlzkMpIyr2oGGzvW57MtoZttzgPTWEWEOQZDBPpjEUAQz8rcIQJSRDVRSzbT1X8hCMQ5EL
	30XdToW/Cuk6L0mWxvzTxAUd9QhMyqflNVuwxRqTWI3YV2gGmdPP7zc0fsG5mwnvEpRKYx5EWwM
	xtjRnlnkLDaJw1cQcwHuUgit5o0XgI4l1idnmuFZsf/L3ouCAlE5tP6tufdtUSr7H42M6udD3AO
	05633gT4VWw65NWb0rFNTtAb9fPX9Ob03v6q0eXlIiqDRgnG9I6oIO6SvVJUw1k1zW0BDIGKkZu
	NqxqyppU+sce016yb7Lf47Glqsd5x5hp9qIeGddCwRZRW2pDSy/j0OY+IP7f7Zb8=
X-Google-Smtp-Source: AGHT+IEjoDtnyyh4fH5hQpdDtWpzMPxBhJMdaagZ9/x77ISBqY672v9W0Vb05nUX9QTJej9R8M3lzg==
X-Received: by 2002:a05:600c:3b23:b0:456:eab:6344 with SMTP id 5b1f17b1804b1-45a165c4f74mr32756735e9.15.1755096716213;
        Wed, 13 Aug 2025 07:51:56 -0700 (PDT)
Received: from [192.168.20.170] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1a58f543sm5250965e9.20.2025.08.13.07.51.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 07:51:55 -0700 (PDT)
Message-ID: <cae39491-fac1-4725-923a-904534326d20@gmail.com>
Date: Wed, 13 Aug 2025 16:51:56 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Gabor Juhos <j4g8y7@gmail.com>
Subject: Re: [PATCH v2 1/3] i2c: add init_recovery() callback
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Wolfram Sang <wsa@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andi Shyti <andi.shyti@kernel.org>, Russell King
 <rmk+kernel@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
 Hanna Hawa <hhhawa@amazon.com>, Robert Marko <robert.marko@sartura.hr>,
 Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Imre Kaloz <kaloz@openwrt.org>, stable@vger.kernel.org
References: <20250811-i2c-pxa-fix-i2c-communication-v2-0-ca42ea818dc9@gmail.com>
 <20250811-i2c-pxa-fix-i2c-communication-v2-1-ca42ea818dc9@gmail.com>
 <aJpP5eABTYnQRV82@smile.fi.intel.com>
 <27cc9ae5-1c13-4ec9-ab10-ae95d6339116@gmail.com>
 <aJyN1uX60BJQYDHj@smile.fi.intel.com>
Content-Language: hu
In-Reply-To: <aJyN1uX60BJQYDHj@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

2025. 08. 13. 15:06 keltezéssel, Andy Shevchenko írta:
> On Wed, Aug 13, 2025 at 12:24:22PM +0200, Gabor Juhos wrote:
>> 2025. 08. 11. 22:17 keltezéssel, Andy Shevchenko írta:
>>> On Mon, Aug 11, 2025 at 09:49:55PM +0200, Gabor Juhos wrote:
> 
> ...
> 
>>>> This is needed for the 'i2c-pxa' driver in order to be able to fix
>>>> a long standing bug for which the fix will be implemented in a
> 
> The above left for some context for the below discussion.
> 
> ...
> 
>>> The first traditional question is why the generic recovery is not working.
>>
>> The details are in the driver specific patches. Should I write it all down here too?
> 
> Instead of the above paragraph, give a summary of your use case to answer 'why'
> it can not be done differently.

Ok.

> 
> ...
> 

...

>>
>> Originally, I have used the following solution:
>>
>>     if (bri->init_recovery)
>>         ret = bri->init_recovery(adap);
>>     else
>>         ret = i2c_gpio_init_recovery(adap);
> 
>>
> 
> Without this blank line...
> 
>>     if (ret)
>>         return ret;
> 
> ...this looks like the best compromise among proposed implementations.

Ok, I will use this in the next version.

Regards,
Gabor

