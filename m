Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 774B4610CF
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2019 15:30:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbfGFNax (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 6 Jul 2019 09:30:53 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:40489 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726177AbfGFNax (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 6 Jul 2019 09:30:53 -0400
Received: by mail-qk1-f195.google.com with SMTP id s145so6347492qke.7;
        Sat, 06 Jul 2019 06:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=r1uur5w8ObwX1oCfpGwmNTVaZPh0PgRbq8JXumqABIA=;
        b=BdpSxSFrdgrvmM7V7mHLns3FuMPQ4wxpqiNkYavWuqjuRbQ5A85kd7XIhoUgNIA7uC
         JxSimCaW/w6IHkmNGEv7dhIERvfCS5NWIAYl72YmM8axdb05+eYzHiz1UmE91GPd0BdA
         FdAvqXtQJ6vuxF2LVXX+J/Cu0XCC0H1k1qUXmgpb6tCGY9bjrOugzF55MK+okUhV/EoS
         JlRYB6KMsYCZk+ir9eYKEqMFtHvIdpkNo4GJNTsOsCknC1dE8ROlu5dgYiiIPd0BAgw8
         G93rsO4WO8d8ZPTAVapFdVzYUVAP+TnWbEADTqZ3ImAGgS2Ah6l2raUOKhKDYokTspJz
         RNcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=r1uur5w8ObwX1oCfpGwmNTVaZPh0PgRbq8JXumqABIA=;
        b=E9jqnoNAf5xrpOH2ohbT+/f4vXADl1Be7C2AaAbT5LkbROZ4l5uL6ctCuecMb5jTvl
         YHFanae8Zc5eYLkN3CCpxc8SPA2MVS5hJgND9DH+vnoIeJhdRj5pKTbSDSgtBiqI8xO6
         0781GWbLQkDqrYtaczGYpq++OCLtBACZU8f8lXxrfmVvHyXhlEIJ8i0TK2oHzUePC8EE
         lw7s0TsMlaz+3YnC6p9yl5Ptgo8VXqGST/NS6kecDcqIDmg4JTdQE7Ekx9jhG9nRmN21
         L0J15A3GNTzLzvai8mmQf5394r5dpZvf6+aiweRphRjruiWmi1wsT53ly9JQCDIIOQVl
         qIWQ==
X-Gm-Message-State: APjAAAUAj2jl3P9LTxvXNrpNT3Cx4jd6cHF5zpR2jHsk8cVc5QC4ylos
        wT3yuu4amyfVUGQusco1B2ydw457
X-Google-Smtp-Source: APXvYqzu72Moh6z2h2prDLF1TrU/k5WIvsqclD1GfTBorrJZnlUpcRdBBGxRPZEC3RiGmrupCtabQQ==
X-Received: by 2002:a37:83c4:: with SMTP id f187mr6955579qkd.380.1562419852257;
        Sat, 06 Jul 2019 06:30:52 -0700 (PDT)
Received: from [192.168.2.145] (ppp79-139-233-208.pppoe.spdop.ru. [79.139.233.208])
        by smtp.googlemail.com with ESMTPSA id x1sm4671884qkj.22.2019.07.06.06.30.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 06 Jul 2019 06:30:51 -0700 (PDT)
Subject: Re: [PATCH] i2c: tegra: Add Dmitry as a reviewer
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190623174655.25445-1-digetx@gmail.com>
 <20190705184947.GJ4717@kunai>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <0090fe86-4851-8289-0b8f-843b25590ea2@gmail.com>
Date:   Sat, 6 Jul 2019 16:30:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190705184947.GJ4717@kunai>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

05.07.2019 21:49, Wolfram Sang пишет:
> On Sun, Jun 23, 2019 at 08:46:55PM +0300, Dmitry Osipenko wrote:
>> I'm contributing to Tegra's upstream development in general and happened
>> to review the Tegra's I2C patches for awhile because I'm actively using
>> upstream kernel on all of my Tegra-powered devices and initially some of
>> the submitted patches were getting my attention since they were causing
>> problems. Recently Wolfram Sang asked whether I'm interested in becoming
>> a reviewer for the driver and I don't mind at all.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> 
> Applied to for-current with a comment that Thierry acked this in the
> mail thread prior this patch. Thanks!
> 

Awesome, thank you very much!
