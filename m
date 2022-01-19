Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5238E494011
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jan 2022 19:39:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356815AbiASSjY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Jan 2022 13:39:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356857AbiASSjP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Jan 2022 13:39:15 -0500
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15EB1C061746;
        Wed, 19 Jan 2022 10:39:15 -0800 (PST)
Received: by mail-oo1-xc2e.google.com with SMTP id s13-20020a4aa38d000000b002e28c5100cbso1012246ool.12;
        Wed, 19 Jan 2022 10:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JwZrhFyXsesNVW0APPBg8u3AGppH28QOmr0Jo7e1xnU=;
        b=D0qv88QdOyLWJ9xkmMNElPXJyrJNGSYG26h6gsP+Eo4MWjvGhpi+2upWiJhJXMM+gu
         2D/7L02b4n9jYPNsBmFUaxwc1u5pkwSw4CojHtVYnNszJAndeXyJL2cTo/fXbDp9ye3K
         BalSwWGgsQm+qFNhocYjm0GsEdUM3RrTalqYkUt0YdbdhhRU3MFtOvjpV4AsGLA+rW+q
         U/tU0sNYxY/UlYisIVzuovqkOBgkvYxfpB44KHKjLsAMAvEd9WuQG5AkaBEe0Jv01aoO
         Zh9CX3txIJLbgiSjR5U7aBP7l4wxQWF3DARxqopgCsrCID4+qc26DlRDQlbZt1e5T2rE
         T28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JwZrhFyXsesNVW0APPBg8u3AGppH28QOmr0Jo7e1xnU=;
        b=eXlv2ZQVmxHYZrjffg4LRK7SRth81BYqS3IaXakM44mMx4awmsyG/Atg26NR/3Ge7L
         ogqX+N6phOw7vPJaDy142t2bj4/h3R+eFpPZAx4VQH2hf3J3LHPFo7zZ0MaKH7yjyOkl
         zPFr8t3Ta8GgIAEkboSoHLECqlkVYS59HMCutukSuhOz0SUSnoRk2aHqd5/9YtTGIT6m
         UsgSV0f2+0Ar5KCT2LGxOK2mxYCn/TrFV3+sa+nPd1lA4DbB78cEe2pGXxTipln88/L8
         eb+hVgD2RxijLITrSzAuZoJQzvdjxBFzRJ1uQJkfDRX08K7fTSKs3oRrGVBmbEWnpmif
         vuAg==
X-Gm-Message-State: AOAM531KYy6CjGXV4LyQiDx1Ws2iWo/yqop71EseGgRLD/c411nLZpPP
        hTvc3mjfnF4zf60cL02jUPM=
X-Google-Smtp-Source: ABdhPJyk87oj50nv+Tg34twrpB9CQenCphokibMHi78uMIFkKgpizwmVvJVEPQRFCIX3Zea5JRK7fQ==
X-Received: by 2002:a4a:e5d7:: with SMTP id r23mr23162915oov.77.1642617554485;
        Wed, 19 Jan 2022 10:39:14 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u12sm256467ote.26.2022.01.19.10.39.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jan 2022 10:39:13 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v3 0/4] Watchdog: sp5100_tco: Replace cd6h/cd7h port I/O
 accesses with MMIO accesses
To:     Wolfram Sang <wsa@kernel.org>, Terry Bowman <Terry.Bowman@amd.com>,
        Jean Delvare <jdelvare@suse.de>,
        linux-watchdog@vger.kernel.org, jdelvare@suse.com,
        linux-i2c@vger.kernel.org, andy.shevchenko@gmail.com,
        rafael.j.wysocki@intel.com, linux-kernel@vger.kernel.org,
        wim@linux-watchdog.org, rrichter@amd.com, thomas.lendacky@amd.com,
        Nehal-bakulchandra.Shah@amd.com, Basavaraj.Natikar@amd.com,
        Shyam-sundar.S-k@amd.com, Mario.Limonciello@amd.com
References: <20220118202234.410555-1-terry.bowman@amd.com>
 <20220119163012.4274665d@endymion>
 <dda39f1f-b683-35ac-d810-d4759c4f8448@amd.com> <YehOmuqA008XuBHI@kunai>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <160d12ca-8493-7536-036c-9dd5af7b4ce0@roeck-us.net>
Date:   Wed, 19 Jan 2022 10:39:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YehOmuqA008XuBHI@kunai>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 1/19/22 9:47 AM, Wolfram Sang wrote:
> 
>> I considered sending the request_muxed_mem_region() patch series first but
>> was concerned the patch might not be accepted without a need or usage. I
>> didn't see an obvious path forward for the order of submissions because of
>> the dependencies.
> 
> My suggestion: make the request_muxed_mem_region() patch the new patch 1
> of the piix4 series. Then, the user will directly come in the following
> patches. From this series, I will create an immutable branch which can
> be pulled in by the watchdog tree. It will then have the dependency for
> your watchdog series. During next merge window, we (the maintainers)
> will make sure that I2C will hit Linus' tree before the watchdog tree.
> 
> This works the other way around as well, if needed. Make
> request_muxed_mem_region() the first patch of the watchdog series and
> let me pull an immutable branch from watchdog into I2C.
> 

Creating an immutable branch from i2c is fine. Also, typically Wim sends
his pull request late in the commit window, so i2c first should be no
problem either.

Also, if the immutable branch only includes the patch introducing
request_muxed_mem_region(), the pull order should not really matter.

Guenter
