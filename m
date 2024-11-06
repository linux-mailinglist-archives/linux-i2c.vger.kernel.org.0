Return-Path: <linux-i2c+bounces-7851-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF24D9BF352
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 17:35:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60A931F22C94
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 16:35:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6776F203706;
	Wed,  6 Nov 2024 16:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kxZDZc2H"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9353213C67C;
	Wed,  6 Nov 2024 16:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730910938; cv=none; b=aa3q/JPfWJcavQSKiBXNg+sCbIeJmOhoLzFsljfw+CXj8IDwBn5UBXDm1EzGmPmmGgD8bp1faVWEMh1Frf+GDzPYF+tqASDVDSofGA1uuG5XwOVMukPhRn0KrM8tSA+KoGYNcm+N+E523EzZGMABterg4j8ZoCC3a4DfDZPtjpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730910938; c=relaxed/simple;
	bh=+226borHsYkLvmzDZ3/K0biYVEW55zEhJxTZdfLCUwo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n36ysqZpnlXSnDty2P+JU5XlxbOX/yMpo0opGgdz3SJhZofUGF3PzJ6mt27wZILt6dWf4FhXpYxvzNe9lHnVzcGFwjWTi57jwa0Qoli3wfi5Iz3CIiy5r3ouh+8tv8y4j8LO7921lsCVKdYYpEKDunMQ/i2GSyTmW74U7Oy6qwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kxZDZc2H; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-71e7086c231so6058421b3a.0;
        Wed, 06 Nov 2024 08:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730910936; x=1731515736; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=EpMoaV2UEgpT1cQjTdLpUsE/ib9jltFkw/ONf3N7WVQ=;
        b=kxZDZc2Hd8XGQeotrZb9qKUVKtSFob8q+vzBXDZ4the16JZ07awimudpJek4zRk4TK
         YVb/QDqoHxqGVBP+aefkAqd5+pjTa1Nlw50/mPIKj6r0xoX8dgVxOHclX4k6TiCDJpHf
         VD9SE7du4ah9ZxLlMdo4XC1RnajnKImqKC8ACxr1DtlRtYP9mGouq8SAadnZRWcPNuiM
         qH+clwNNoylm1GHXy4AkuX2m0bBei49HwjGyxp8J076YUO0k++VV+qDR6TYQHQyRsrjH
         dzRWtiaM0OtJmKIauJ8ws+AFlGhKj85FHku1fewz7inuZNy5GLVjlBW8x8FU2WbrPmR4
         WOdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730910936; x=1731515736;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EpMoaV2UEgpT1cQjTdLpUsE/ib9jltFkw/ONf3N7WVQ=;
        b=hZ0C1qsXl4bTQCh0J93rviXcpW684hW5hH0WpDSnVQ+GvDplrl5z7VqaVukVHwZot6
         op1OygfnWIQItQXJlqjnkSbfaFdMru1H8M8l2xAJPwrf9Ecds/s7th1rvp10PvyYOBmc
         NvB0Zh8YJIGtDGgu0zNahJnUnxO7c69coUycPw17031mscVbkxHa0TbgnrIDqOHYzWvh
         zMCfsIkUNQa9EjQ9oVOxzlayrP4JBYlXQnk6WScYj92ky8AD+CQQohLoaWO+YAbm2KWF
         ArvG8Up2HH6XYrv7emcJ6OV+8wbBiYwgLKxqmO+nqtCQoqu95BP7tcRr3ONbYItGWwWV
         jtYw==
X-Forwarded-Encrypted: i=1; AJvYcCUnotacLAtAomSb1q7kf5gp+dkMVJdfqEJqlc/YLVhjoZ2ZXJFsK4Ti2wdzepJDV6vihV/2HMSmk5iu7FK4@vger.kernel.org, AJvYcCVbvfvZj0HqV8T5cLE4pRhk3A/Ukt/rKl3eHxC//XaQcrls+aH/zRWookGxhwNsiPtSIsDtruZzcs2xWJI=@vger.kernel.org, AJvYcCVmpvD7kL8mXf4gvJhoEyFmZn/EHuKOyfbqdD2AcSRun5zAjQZwflnLR6G8ZMbJ1IYDqvfIq7NQ7gJZ@vger.kernel.org, AJvYcCWbOVCBz8CblrUalgoX0oApQXwZJt7067f9MSOGZdGkojhSeN1N6H6SxZdjsI3QEZsZRwtsNsU/z+ir@vger.kernel.org, AJvYcCXHYqycBOsaIx6nbXUic4K1d2v1LQD+pQgoWNxRH6hxcxLww7w1EgsZydoOjOV5UgYo6Cb62X2/v+5v@vger.kernel.org
X-Gm-Message-State: AOJu0YxgR6aRM3nsJTAtcfEy2pF90qdV9c1vyW6nXA6U18f9h62wyZY9
	2QHlfTiU/O0NQ7IGx8WOIyrsEVIafmqylCLsLtk30n1aUMhuDAJ8
X-Google-Smtp-Source: AGHT+IHHKKge5OSKBhzIpKxm9NbgpPVXnRxIjk7i0bxop8MU5QW8qV55w57AqcIhgjFxkNVVq1iuGg==
X-Received: by 2002:a05:6a00:23ca:b0:71e:6122:5919 with SMTP id d2e1a72fcca58-7206306ed56mr53099644b3a.20.1730910935859;
        Wed, 06 Nov 2024 08:35:35 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1ba244sm12237398b3a.19.2024.11.06.08.35.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2024 08:35:35 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2bdc5b60-2442-4291-a2f2-2e3802b7e982@roeck-us.net>
Date: Wed, 6 Nov 2024 08:35:33 -0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: trivial-devices: add ltp8800
To: Conor Dooley <conor@kernel.org>
Cc: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Yin <peteryin.openbmc@gmail.com>,
 Noah Wang <noahwang.wang@outlook.com>, Marek Vasut <marex@denx.de>,
 Lukas Wunner <lukas@wunner.de>
References: <20241106030918.24849-1-cedricjustine.encarnacion@analog.com>
 <20241106030918.24849-2-cedricjustine.encarnacion@analog.com>
 <8e4dc080-d779-4b06-8fd1-74784e06323a@roeck-us.net>
 <20241106-gatherer-glancing-495dbf9d86c7@spud>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241106-gatherer-glancing-495dbf9d86c7@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/6/24 08:06, Conor Dooley wrote:
> On Tue, Nov 05, 2024 at 08:34:01PM -0800, Guenter Roeck wrote:
>> On 11/5/24 19:09, Cedric Encarnacion wrote:
>>> Add Analog Devices LTP8800-1A, LTP8800-2, and LTP8800-4A DC/DC μModule
>>> regulator.
> 
> A single compatible for 3 devices is highly suspect. What is
> different between these devices?
> 

The maximum supported current is different.

-2:  135A
-1A: 150A
-4A: 200A

Programming is exactly the same, which is why I had asked the submitter to use
a single compatible property. Sorry for that if it is inappropriate.

Is there some guidance explaining when to use a single vs. multiple compatible
properties for different chip variants ?

Note that there are also LTP8803-1A which supports 160A, and LTP8802A-1B
which supports 140A. Maybe there are more, but those are the ones I can find in
public. I don't know if there is a difference from programming perspective compared
to the LTP8800 chip variants; the datasheets are too vague to be sure. It would be
useful to know if those chips should get separate compatible entries if programming
is the same.

Thanks,
Guenter


