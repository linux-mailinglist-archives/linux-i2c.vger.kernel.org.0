Return-Path: <linux-i2c+bounces-11129-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 44362AC2002
	for <lists+linux-i2c@lfdr.de>; Fri, 23 May 2025 11:44:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 423293BCE53
	for <lists+linux-i2c@lfdr.de>; Fri, 23 May 2025 09:44:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CF1222370F;
	Fri, 23 May 2025 09:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QiBlGgpn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82AFE225788;
	Fri, 23 May 2025 09:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747993463; cv=none; b=FsW1NfVYi4Ob8PMKybRI73tEJFTtLdii8Ea2MzDp3aE8W0gQ3+ZHtAQmdUJE5jtbl6QpUWHKSWrRMOGcLzIP2ZSsjdOFD/+hzGsRXpFkqskypc4Z5391NM3T9Rivi80w62atRazFbXs2Un5tUxdls6PjJnpdEvCzPjuPkDiy6iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747993463; c=relaxed/simple;
	bh=ORiCYXX2+npBuaxXBl6BF2rywetWpqgFK7lleNfKm7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jf5W4Tqz5pX5fJjxtV1gMWTB5TASL0gjoA9Y1mHKZHRlB4TdyXFOfMTtzudXW/0vRpS/yx5C8HbEnmSADL/ocJwp0C36KzWMwZj5hlCaKbl0iG++8dRphdMBzpWqGfxljf+OvEX0SQy6mOYY/TWeSaKd37otKE8XSCmbgAdQg0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QiBlGgpn; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-742c5eb7d1cso7644858b3a.3;
        Fri, 23 May 2025 02:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747993461; x=1748598261; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=g8/vi7y8OuYvTC1jd4K4hOxCAgA29QQePM/SNMh/GDY=;
        b=QiBlGgpnn7tK7GnFr2R1beNfdfhbVOXoZXyzUT9kyTEnAOU6tOUk4DMOKS1S6IA4VO
         gQI5eoDPe+xHfqoQkxKP6MteOyx6ID7ZBZ/+wCFzuH5naDCFlQVVMp6zs5fEhrAVxAEs
         X7NMPuj9OelFXQqBw7HX0YCv3TraYtsEM6zjfWVKyw4UGhH7yTNgI9hxZtXi9nFb1YW8
         sIGRw3QyXygBH+ubxoICm8Ivvx5+PgqNaI+ZKliO6bqwUVe50VtWm8GUeSN5rGXhhxBz
         +FI1/HW5XAhIzApd/Nmhv64lu2VwJMa3XfOIjxu8Jdg3R00D3ZHzsLZloEqxiGdveaCN
         bS4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747993461; x=1748598261;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g8/vi7y8OuYvTC1jd4K4hOxCAgA29QQePM/SNMh/GDY=;
        b=eh2EkqhvFFCucXLY/CEZu5rFtSEU2uQjwJmIU6+i8w/lM0qbcFdNumW8og+9TeKkn2
         +g82uVUPmTmjaHP4ZfM9NySJgdawfsheTjTMxZKk/LItHJBu8FVb2rNIUYs+xFzZCDkw
         LsL9BtbE2QAYpLGqU4hysnQGUeOaxTby3RDe2TaE6J84wtwKsjg556CDennGQJChM7vL
         QcMf6g8y2k2VJnIYvHuFX/qOwRke5yyHEy1PaEanmivfkuiJhvStej61quhVO+97DfwT
         HVu1qDrAtLgRwSekQAbvhVYFL/bCSDmWwntDdLkd4sPNPoaomBFkiWCOjv5Ew8G5V6Pc
         76uA==
X-Forwarded-Encrypted: i=1; AJvYcCUAD+GYLzWIEWlegWeII/OimQUk3nKK/tSwKFixWv6xASvq7eLJAbmJAoPxdwGecatTDkqksCMz/kLh8kwG@vger.kernel.org, AJvYcCUiWkMzGoKtALo+LfhA22PPkeiBSJdpdfyDWLW7cARq8Frnw/j1ESPxYKHOnDLBpo5jcZDY6Hxk9DHM5BoEElo=@vger.kernel.org, AJvYcCUspnRIGqCkCJfUZ+vEUEuCxkBE46zp4S618X+dvRAhsJQskbw7ICguqiWVU03aqru0UXsOwxqo/LmT@vger.kernel.org, AJvYcCUw2J3rGQs+7F1RSdsANRpfqFhYWBwjIiJoxJgC3PdqyXpQ8b9g2Wx/DR+Yp8fJ7cqd7FHxV/QU@vger.kernel.org, AJvYcCUy5eggD/1FFNS7sbMextodwyf4usntF26dTfC26IngdVhGZzAArnPXupKGSKptau+DRjWmtKIZhcEw@vger.kernel.org, AJvYcCV068AdcrqPnuV0y8HrZ2TVNafffapwIdQRyI5AIZKy6t7ZI/5QN8WsDb9MBAhze/eeXrXSUX2GRSfqrg==@vger.kernel.org, AJvYcCVPNsrQZ+nBkFa1rQiG+UeMhL8X3t38ofqewS1jVSmeFKkPQ58kyhssGR/SrqNs3fr9eqWIIai0QbmxYrM=@vger.kernel.org, AJvYcCViuX8L4xRcnqTHwu28sEoIaeFXwIrRhlYOxUF7UNdGW9uchD1njyvK5MMJQHlPTDUbf75iuOK+P6gO@vger.kernel.org, AJvYcCXxR6oeBp9CsPRUV4Er2MQXnjvGxR0NX765en907ShHXyev92GHiINf7GK7brDe5kq4nKR/OUj18/U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlPqqNOyrJ9W0Gvx+XOu47yNHYazv88h8E43hk7zOLF9qaRiEc
	sMv/hb2/DXe6uLKWLkjQ8SCi4saGdgxamBhw/NC6j3wHEevsi+sDcD1x
X-Gm-Gg: ASbGnct/o9YeXC39vXQzsf0CDVjVHuWkgGgnSp7PnRnDeC8lFppzzSkRi85lcNDxkaD
	juiJ1yNV58GJexMvLB7gnmpXqFBgvdvjEmSSn6qCmPVowZnvaZm984nByUZv5MSuYmCEwYF/xrG
	fh12Pp9ra06LOKar3xbllRphr428wLwgnYQ1R0XN/HNIWvnycR4sCPVFmzYeHCuCQ31T9vRxuDs
	j0FYW+xNPXiUQ5Qtj54r6npTKsKDQl8SuiQCwYy3WaXnqG2kHfSuzJ47AV6NSQsS1BuisoI/hir
	7yoK5WTjk93KVEaxKAOqlIeI4VTZ96TVHkhZ2nEhQaneJ96bBknrYM72/xoOEy20xv223YKYabr
	zWnwqqzsdEI4YsDI34Lrv+wmy
X-Google-Smtp-Source: AGHT+IE/sQH3ZW0UkNSF+9aZjlAJCbKRFBYOtpRaA2RS69otWpX7DsNz/DLWL0QdW+j2Nm/PHm34NA==
X-Received: by 2002:a05:6a00:894:b0:740:a921:f6de with SMTP id d2e1a72fcca58-742a98e9c0cmr38825737b3a.23.1747993460624;
        Fri, 23 May 2025 02:44:20 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970ba0csm12919783b3a.54.2025.05.23.02.44.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 02:44:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <0838e48b-c995-42f8-8803-18ed593a89ef@roeck-us.net>
Date: Fri, 23 May 2025 02:44:17 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 6/7] hwmon: Add Nuvoton NCT6694 HWMON support
To: Lee Jones <lee@kernel.org>, kernel test robot <lkp@intel.com>
Cc: a0282524688@gmail.com, linus.walleij@linaro.org, brgl@bgdev.pl,
 andi.shyti@kernel.org, mkl@pengutronix.de, mailhol.vincent@wanadoo.fr,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, wim@linux-watchdog.org,
 jdelvare@suse.com, alexandre.belloni@bootlin.com,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-can@vger.kernel.org, netdev@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org,
 Ming Yu <tmyu0@nuvoton.com>
References: <20250520020355.3885597-7-tmyu0@nuvoton.com>
 <202505210555.mud6jZoi-lkp@intel.com> <20250523090004.GC1378991@google.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20250523090004.GC1378991@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/23/25 02:00, Lee Jones wrote:
> On Wed, 21 May 2025, kernel test robot wrote:
> 
>> Hi,
>>
>> kernel test robot noticed the following build errors:
>>
>> [auto build test ERROR on andi-shyti/i2c/i2c-host]
>> [also build test ERROR on mkl-can-next/testing groeck-staging/hwmon-next abelloni/rtc-next linus/master lee-mfd/for-mfd-fixes v6.15-rc7]
>> [cannot apply to lee-mfd/for-mfd-next brgl/gpio/for-next next-20250516]
>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>
>> url:    https://github.com/intel-lab-lkp/linux/commits/a0282524688-gmail-com/mfd-Add-core-driver-for-Nuvoton-NCT6694/20250520-100732
>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
>> patch link:    https://lore.kernel.org/r/20250520020355.3885597-7-tmyu0%40nuvoton.com
>> patch subject: [PATCH v11 6/7] hwmon: Add Nuvoton NCT6694 HWMON support
>> config: i386-randconfig-013-20250521 (https://download.01.org/0day-ci/archive/20250521/202505210555.mud6jZoi-lkp@intel.com/config)
>> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505210555.mud6jZoi-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202505210555.mud6jZoi-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
>>
>>>> drivers/hwmon/nct6694-hwmon.c:12:10: fatal error: linux<mfd/core.h: No such file or directory
>>        12 | #include <linux<mfd/core.h>
> 
> This suggests that the set wasn't even build (let alone run) tested!
> 

Apparently. Guess that slipped in when they updated the copyright in the driver.
There is no other change since v9.

Otherwise the code looks good, though. With that fixed:

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


