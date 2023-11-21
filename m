Return-Path: <linux-i2c+bounces-358-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0057F2383
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Nov 2023 03:04:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA1B828288C
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Nov 2023 02:04:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9357D1172D;
	Tue, 21 Nov 2023 02:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mP6N7qPX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F31D6CF;
	Mon, 20 Nov 2023 18:03:59 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1cc0d0a0355so34665495ad.3;
        Mon, 20 Nov 2023 18:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700532239; x=1701137039; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O4sr9/62gWmEYm/ccinaAHJ5lbhW2RgXqZ/bi3FIYrA=;
        b=mP6N7qPXZNTTfEASL/OY5oB+04GAgY1iI3t9v6p50gbYMcfk3X/rVO30n85EJhyTn7
         Q5yxc7xqVLLnasBpjpZN7Z3y7gV79NDkjbCT7pUojHWZp3RsucJLcQ2YmE+Y2yJ12P+6
         Fg8OLetaReJ6KBsxj7UV7d38l6z7l30ON99dhBwf0jdGHR6uA4CxIcdAOw2C2z9gneCE
         4sHh4So4BtrvwGRFC8uczy5XF+umS8eRHjPAMSQqoNIuTN0Fp9kvmk/5D7eLVgQkcjE8
         +lOGg/XQyh6bGpah3qY2CAEWyDPzHKEWK0bAlqhtuBRqX91GAl/HtpJ1q/eDjbQ5cZLR
         YQGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700532239; x=1701137039;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O4sr9/62gWmEYm/ccinaAHJ5lbhW2RgXqZ/bi3FIYrA=;
        b=XQkxHla7imos/vpEONy7DzrDN/nmJZZPINmYtJBF87ccrzLzaZMZLZoZJbqm/WdikD
         wLgcIw4ISjDct+OxLoP3CsUn1rB5TBpBDYR9wj3T+MRP2zRGLDRtg/JSxDBQjuW9RK6V
         f0WnDlmxkwH1VSxdm2vLumaVb5I7HjIH2SIHh5tpaf+c/mchCWA6IG0jVIZ6qkAKtvyt
         Q8Htp5wW+3N4s7gwbBrEofOo9nn54php0py6fQuBOeDM2iKidnS1W0NRw+4+d2JkcMXO
         M2LS1tnkUiw+S+wIaxg75LfdIIyuInoUudOtL7lc+cgwYz1L8qup+1/BeBBLCARX4rwJ
         skgQ==
X-Gm-Message-State: AOJu0YwGUmijZXltiZdhI7cPMueGgNCFVz/WuOQPcYEx1gidkJOiVcNE
	TajzIvT7Ce0XaYLyJUynhmKfPEn0UE9K/w==
X-Google-Smtp-Source: AGHT+IHPKZ8iUSOte8cAvHUFAE5dCaHLZy81Vne/pWV0givJV/eD9a5jbwIpi52kTkZjPnGULERLPQ==
X-Received: by 2002:a17:902:e746:b0:1cc:644a:211b with SMTP id p6-20020a170902e74600b001cc644a211bmr7490131plf.47.1700532239042;
        Mon, 20 Nov 2023 18:03:59 -0800 (PST)
Received: from [192.168.0.106] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id l12-20020a170903120c00b001cc50f67fbasm6694662plh.281.2023.11.20.18.03.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 18:03:57 -0800 (PST)
Message-ID: <ac04e6da-2fc8-493a-9a51-69cc729da1fd@gmail.com>
Date: Tue, 21 Nov 2023 09:03:52 +0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux I2C <linux-i2c@vger.kernel.org>,
 Linux Power Management <linux-pm@vger.kernel.org>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Kieran Levin <ktl@frame.work>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: [Framework Laptop] High power consumption when i2c hid touchpad
 is in use
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I notice an interesting bug report on Bugzilla [1]. Quoting from it:

> On our 11th to 13th gen Framework Laptops, we see high power usage when the i2c-hid connected touchpad is in use. We suspect this bug also will impact other Intel systems using these type of touchpads.
> 
> We would like to see if the kernel could group interrupts that service touchpads so that both the ACPI GPIO interrupt and designware i2c interrupt are bound to the same core to avoid waking two separate cores whenever the touchpad is in use to reduce power consumption. Or kernel maintainers may have a better idea to improve this.
> 
> Background: 
> We have found that when the touchpad is in use, the touchpad interaction with the CPU will follow the following sequence: 1. the touchpad will generate a GPIO interrupt to the CPU. The CPU will then perform a series of i2c reads using the i2c controller in master mode to retrieve an in report from the touchpad.
> 
> The touchpad will generate GPIO interrupts at a rate of around 140 interrupts/second.
> The intel designware-i2c driver will generate interrupts at a rate of around 1000 interrupts / second.
> 
> Intel premier support agents asked us to open a bug here to track this issue.
> 
> Reproduction steps: 
> 1. Boot to a gui environment and let the system idle, such as fedora desktop with no applications running.
> 2. Run a program like s-tui as root to measure the CPU / Psys power consumption. 
> Observe the power consumption of the system for several seconds without touching the touchpad.
> 3. Touch the touchpad and move your finger around, note the system package power consumption will increase by about 2W. We measured the touchpad, and the touchpad will not cause a measurable increase in system power consumption. Additionally the s-tui results show the additional power consumption is coming from the CPU.
> 
> I looked at this using Fedora, and it seems the gpio interrupt is pinned to one core, and the i2c interrupts are pinned to a separate core. This means every time the touchpad fires an interrupt, both a high performance and efficiency core cluster have to wake up to service the touchpad. And these are probably not even in the same cluster, so lots of cache evictions etc might be happening as both core clusters power on and off and caches are cleared and filled.
> 
> What core type are TP interrupts handled by?
> 
> The second thing was to find out what cores the interrupts were handled by:
> 
> cat /proc/interrupts
> 
> watch -n 1 "cat /proc/interrupts | grep designware"  
> watch -n 1 "cat /proc/interrupts | grep PIXA"
> 
>             CPU0       CPU1       CPU2       CPU3       CPU4       CPU5       CPU6       CPU7       CPU8       CPU9       CPU10      CPU11      CPU12      CPU13      CPU14      CPU15      CPU16      CPU17      CPU18      CPU19      
>   43:          0          0          0          0          0          0          0          0          0          0          0          0          0          0          0   43694516          0          0          0          0  IR-IO-APIC   43-fasteoi   i2c_designware.2, idma64.2
>  135:          0          0    1711105          0          0          0          0          0          0          0          0          0          0          0          0          0          0          0          0          0  intel-gpio    3  PIXA3854:00
> 
> And move the touchpad, you will see which core the touchpad interrupts are increasing on both.
> However the PIXA ACPI GPIO interrupt is pinned to a high performance core, but the i2c-designware interrupt is pinned to an efficiency core.
> 
> Lets pin them both to the same core CPU2:
> 
> # echo 00004 > /proc/irq/43/smp_affinity
> # echo 00004 > /proc/irq/135/smp_affinity # DOESNT WORK, IO error?
> 
> Power consumption when using the touchpad seems to drop from about 7W to 5W! (Baseline is 4W)
> 
> 
> Background is here: https://community.frame.work/t/tracking-touchpad-interrupts-battery-usage-issues-idma64-2/13630/35

See Bugzilla for the full thread.

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=218169

-- 
An old man doll... just what I always wanted! - Clara

