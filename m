Return-Path: <linux-i2c+bounces-4306-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B447914EE1
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2024 15:38:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18B051F21351
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2024 13:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 413A81422B7;
	Mon, 24 Jun 2024 13:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kYulIR3C"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFB413DDB9;
	Mon, 24 Jun 2024 13:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719236165; cv=none; b=gjrez31YtW4RNWqwGFNOjMsUSFHX+yc4PZor3aW8MuJaDU4SYyT+fmvI+ECMZpriV/Yg8cEPZJJlB6XjcYtJpVA4xYNCVzE7cBZRK4/ECXKpOYWgV4wxCFtwZTj4FebD6Z63TIHsgpS6zJEaYmdk0JGmV7K9D+4I2ojFKKJxIwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719236165; c=relaxed/simple;
	bh=VS5Dgx2c+JMCrFpzvT9D2DHqmYUf4GDiRSkPL1PFeWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ePLp0atv6sBjLjcJvIEMmFVfTiHHuXwDVhwAznQBay5Su5NBqklmRrEL/NoHd2TGkJPIYBcRj7RBCkXCYJU2rTxs0XZ2wAVs+lpckoMCqR0V8Z+1d/2THqOEBjh4+PXXnDIRvmh+kXVx4u+6ghRtCtHmQ3XRkh/7rgNdLHIKq1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kYulIR3C; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1f99fe4dc5aso32421605ad.0;
        Mon, 24 Jun 2024 06:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719236162; x=1719840962; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=vjsdlMbxyBtAfILJDgu7GW8Pfa7ZeXuMvswQHEkWaxA=;
        b=kYulIR3CMV2BTvTp94Dn/3JM3/cfekm0hQYevIJH3LY23Yoj9BF+/g2ecwHPjZEFxG
         IWGnFEkSrEnpkKk5OVW5izS/X/LBmjppyBKFEtITgZ7TZ8UTc1lhugryaZIvtklsKzx4
         R7sbVM9N3QqyC8zu8bvLt0J39lTUPYq536x+3yZ6fb5dasQJTuP7O3QBiplwLm5Hp/rK
         5SWkPY4CsCXN8KzgUW2QOnFBHg0DueWcx0peBN1+4TB5Mip74sBVPY7lfzaTOGK0ZYMD
         o6GRPPW8EzBXoRSN4NQyCXhy6Mo09mYLQxiBap5/u5yFNYvlSURC9bW99QDnw262s00p
         m/yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719236162; x=1719840962;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vjsdlMbxyBtAfILJDgu7GW8Pfa7ZeXuMvswQHEkWaxA=;
        b=I9/3361Iz4YqrOaAz6EXyWeyHEwZSlxAqAdImOBhkOsVgxGFBvNp2/PUBIiSqRRnfj
         ziDJCakkWZLpi9BuQiYjJuhzn6yeftr2NdGV1iAe3EZRyS6MWXFkUg5u7A1tW6TuPcN3
         Xk8sJcT4k6DP5w/UJP1nHRO/xMENTGS88tx41Qick9KhaQsA2MbxydRI9X/cPYKHTeCF
         STIhC4fCtA8hQxImFc68KCX62TsU+ZN36eBMTPUYKgjU8DERXw7jQjKgBlQHHvDGQlQP
         oGDPItyz1iFH+BSP3zq69KlB2UYq0hz8H+4Q4rELf+EJjo0zpSN1HocAzDnvvW/mjy8Z
         ftVA==
X-Forwarded-Encrypted: i=1; AJvYcCVZh5qZNVPBsp0IbU+iU/iGX2lse6v9cFdo079pqmvJw12WSsU/WxhZBQ0V7z0UhQXTn5P++59LZ+XMEAXlMlF9Au2ljYb7lrD2Aia5IyvvOKKid3eUlMiG2/zc+vyYMA3a7O+rgDZxzsHkPcM6qzCS8nTJsEpn1qKVStgahtKWNJzO8ggo0/qTq3esacA7cPeMzj1m+qUP7dOqzVA=
X-Gm-Message-State: AOJu0Yw0h2/4z2BdZPK+XVnjlUcJl/KVJFLidpEal9Ww2clcmIId1z7J
	SMZYETac4oFKvythN8S31iibhsDZp29APUUWYnaQBYarzUqMTiFo
X-Google-Smtp-Source: AGHT+IHELwqN0fmYpr2TNOIVJNKOgAmBFiPFeYets29ZC2Um1SsjtiDeCAu0HCiSCAVcqPraRv7lsA==
X-Received: by 2002:a17:902:daca:b0:1f9:e0e5:cda0 with SMTP id d9443c01a7336-1fa24084525mr49373805ad.55.1719236162361;
        Mon, 24 Jun 2024 06:36:02 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb3d5e63sm62292735ad.187.2024.06.24.06.36.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 06:36:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <709463b2-edac-416b-a6c2-c6428b61cbb8@roeck-us.net>
Date: Mon, 24 Jun 2024 06:35:59 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression caused by "eeprom: at24: Probe for DDR3 thermal sensor
 in the SPD case" - "sysfs: cannot create duplicate filename"
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Krzysztof_Ol=C4=99dzki?= <ole@ans.pl>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, stable@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <a57e9a39-13ce-4e4d-a7a1-c591f6b4ac65@ans.pl>
 <2024062438-patriarch-spendable-96b9@gregkh>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <2024062438-patriarch-spendable-96b9@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/23/24 22:43, Greg Kroah-Hartman wrote:
> On Sun, Jun 23, 2024 at 11:47:39AM -0700, Krzysztof Olędzki wrote:
>> Hi,
>>
>> After upgrading kernel to Linux 6.6.34 on one of my systems, I noticed "sysfs: cannot create duplicate filename" and i2c registration errors in dmesg, please see below.
>>
>> This seems to be related to https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-6.6.y&id=4d5ace787273cb159bfdcf1c523df957938b3e42 - reverting the change fixes the problem.
> 
> So is this also an issue in 6.9?
> 

I didn't verify, but I am quite sure that it is seen there as well.

Guenter


