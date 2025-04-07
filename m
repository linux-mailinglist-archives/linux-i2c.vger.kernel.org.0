Return-Path: <linux-i2c+bounces-10150-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F55A7E082
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 16:07:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C0E316BF5A
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 14:02:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C13721B424E;
	Mon,  7 Apr 2025 14:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B3B4J7D7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1642250F8;
	Mon,  7 Apr 2025 14:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744034497; cv=none; b=arzCu1kUUwMyJNx3ZATkoh1SHEXo22dqdXaRKPSjGnJncopOA/RDgr0Le9+trBTwMTtZ3kmViUlKHrJkMxxFgQdkkjZOaA2vCCaHzQD8tUtC+MLGglzTJR9zBOpCAAZl8fKhENnVjG77Rqbh59A7BBLTSCOb+Vh8SJBUYOHxQCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744034497; c=relaxed/simple;
	bh=KrmX26c5j89Hs8RNMmxBHG1cekbCoc9SLSxCSm+AoTM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=SuDrxRDA8jH2I02qqnP8l2VzhSMLq797B9hA5NYlbidKBAFmq+d62rY4pklPRa/d8CJUyd7Az+ewlfJcVoJ0dVAMLZhov+3/LSnvFpj9W02GoABhBJw+L8GuWAspM/S878le3nH0ubaI7cljqkbDkWhu+oqC0MlB68VYtA/N+vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B3B4J7D7; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-736a72220edso4470113b3a.3;
        Mon, 07 Apr 2025 07:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744034495; x=1744639295; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=O/vMkisTqfMiUinV5XazO6wX8tdmGyyjUQSv62FzgKs=;
        b=B3B4J7D74hembU3cUd02DoDO3t4nPk/irTp6gZqm5hyUSgpgEeZOwBouWRg2XiZ6nq
         TO/gpopamO8VMdQaSDuFhjwjf4Y6ySMWAWl0YoW5XORtCBvNiFej1rEcUGzjNIuhOvmy
         Xc4BEN0NQ30gF/gVz/k/mxEWQm9rUBt4LqDoka6ieRm+C/UdrcHiWt/Frsrjr1RVMkHl
         aktLhMe4oSGmOGhiwehAjU1KQzSWsnR1BWBTyd82ApxlP44YGK6zGlnv+7/i5ONKfgDU
         w8yDZmbER7cmDgvVqtBJlXopvX9bHIBDRQ5HY5JEQ5fxxqo0bo1/yWKLYya7cjPk//1X
         qaRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744034495; x=1744639295;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O/vMkisTqfMiUinV5XazO6wX8tdmGyyjUQSv62FzgKs=;
        b=pXbKZnb7LdvcnWLzPEcaKMdx1b11AOpmZo/GVk6tHdfj0D/D5l+kIcz3MloTr0OXQ9
         DKRyY/4nqqFQpwOZ9F6B5INlyQzTlEpphl+Vzvax8MzrVomKTwuCjirty+WrOVu/3LiN
         x2BG4HuEoKl1PgBJ2MKn2TScaFpVAn9gOv9kJSr84RoxiktIpL0yOGRzc+1e7juit4QW
         n/cZfJNIJiiZbuJW29ieyqPHgLMYzHgGbdG+bMIB6OszQMweW1NcUg66roNxvUj42yWI
         LrcEZyggZf0kLnSpt539flINq/FLDUiefBZcWHTtQLvYeMyhvxnZODZ/SlY4IGyu5WOx
         00AQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlGks/EY35S8luqH4UvubhaIStTszMRG9m7pltVLTF2NVHfzh/Z/QpfoghlaCze0D0DEq9hGHfEAn5@vger.kernel.org, AJvYcCVtKJcUm9TMjhXPIabW5iU7CNEEVj4F21JRYhBE0Oc46Q+qoXCprZkzAcIRqPgfc9jdssAaIIjqo1Oh@vger.kernel.org, AJvYcCXU8CNVVP+ng6nlfZmjlGgLnBTzLlCaqKo8Qc17S752aeFuikAZGHGrym5JfvU43rhqxWeBMLtJz9LL858=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMwkSTrln7cDo0J/62+3S1OOFzAMt1E4PL3XcuaZuQO/mg6yJU
	5n9WbUsvXzkIxCCy+Fvz/btVqdJ+U0IJOUbzy+pJAGagniVOPqgA
X-Gm-Gg: ASbGncuJ5UMAh3FFyFGTOTwMZr9aSoHdGP6OLrRUHvixBP1zdFysmJZS8zGh4gJYiWV
	fk6qal+nY60P7LHrs+LAHXJcjzszhPuHM2Z/h2lzxbD/I/pabuuO/GxRczbncaD2Fw2QsXLA+FD
	8nUCYZEpotf9svXUN/eIaB4Q5GST5tnWu29xV69jcZYTnb+lTG1pulJGWgsCld8DYrIhjO5Y+13
	KJzqtmJ/6VOf/LKoO3reZG48oqfyK0osS0EJ2CwpipwFYOmq3zAdgSAsPji4RGDdPqY9FExa+Io
	3yuInx93bNCqyxwO6jaKzcq3tCBZWykup+kgv5v0z9JMF4vhfSDErG3k7pDy6i46PaNqLv6gVcf
	ggt8bBqtuWkVa4qmdFw==
X-Google-Smtp-Source: AGHT+IG4FPnzWMnfwhBSy/XEKTBuomXiqMFUfrXEdFCqYN92mFldCImWMO/rlJkgpSw5ClyQZjrt7Q==
X-Received: by 2002:a05:6a00:1941:b0:736:4e02:c543 with SMTP id d2e1a72fcca58-73b6aa3d952mr10545666b3a.9.1744034494945;
        Mon, 07 Apr 2025 07:01:34 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97ee71esm8785639b3a.56.2025.04.07.07.01.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 07:01:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <69c8cf7c-b334-4f13-ba36-a2248686b419@roeck-us.net>
Date: Mon, 7 Apr 2025 07:01:32 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Update driver xdpe152c4.c
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Shirley.Lin@infineon.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, jdelvare@suse.com, corbet@lwn.net,
 patrick.rudolph@9elements.com, bhelgaas@google.com, ninad@linux.ibm.com,
 festevam@denx.de, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-i2c@vger.kernel.org, Mills.Liu@infineon.com,
 Ashish.Yadav@infineon.com, Ian.Fang@infineon.com
References: <3f7d0644a1f844b8b3ee9b3139b85339@infineon.com>
 <Z_NteUAIeuDdDPls@shikoro>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <Z_NteUAIeuDdDPls@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/6/25 23:15, Wolfram Sang wrote:
> 
>> Please help to review the attached Linux Kernel patch for xdpe152xx driver.
> 
> To shorten things, you could return -EAGAIN as an error code, then the
> I2C core will retry the message for you. Within the configured limits
> for the controller.
> 

The patch neglects to state the _reason_ for the change.

I'd like to know what causes the problem before applying a change like this.
I suspect that the chip needs either a delay between accesses or a delay
after a write. Both are supported by the PMBus core.

Guenter


