Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DE4025FE38
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Sep 2020 18:10:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730119AbgIGQKI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Sep 2020 12:10:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729933AbgIGOds (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Sep 2020 10:33:48 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 679C5C061574;
        Mon,  7 Sep 2020 07:33:47 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id c2so16329933ljj.12;
        Mon, 07 Sep 2020 07:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vD2eRvoRvLhwCLuKclwGo2hvr3g6d0CXFP/7GqbWwow=;
        b=t2B6+jHg/WOVS90/IOammi9x92wHD56CkijDzqOo9nVLtikZMA6MBmt6e8bCcVrIOs
         D3IpsoTiomhob+2gOYADqMDTt6E7pSBDlJ3dVH7SDd8iKLmILlZQ+cWnI5p1gw4kexck
         O8iWGT2hJ7IDvjwzWWKsKJsRaOqnEHQpfxyXcljwJGmrnJIJH1fy5nVppHbGYi+5R/wd
         7tS+MYhRMBtw1U2PjAF70N3rBhARc6eEm9Ur1CkG+Y82EnWScNRnTCvSuj7l12OuFZu3
         +NysJdJCF1hiPaYkUeZuwTjWYSUKCph7C11LAdAR+AKcVMtXLLSDJph876VRejh+Trgj
         m+wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vD2eRvoRvLhwCLuKclwGo2hvr3g6d0CXFP/7GqbWwow=;
        b=rGgzk2Nc8I9U+ly+FS/RUTqC6QAF7PK8Ro+sor4HwNhJ0HaQLFLRhwo7sF2a0ltFyM
         a9NRSZZos0+/cJLJO/1asPqdUM83a2/Lywc6sg0ltVlVLiD7LsMNDptEjTXSX7zx0VUI
         oBxpcdGNluZqrah2TQ3jl8AOEyXQyx+qQcQGKnLbPG6ZXTZgbWfgNrOv7xKXIMsmfL3r
         VGhJDOP4kA8Pk2eWPOumnWkXiLmdyhivu/FT2zV6Qs4LInJwWMoyXNPJVmH880+71q7j
         IZafp6VIkRufuG952HPm7DPLWl6joxuhrtsynJKalv8Z7COD7lTTOEqOgCkEq5hRG25P
         NXUg==
X-Gm-Message-State: AOAM531CkI6GTfdGKoTzyQ91blcnVBDjPd+X4RovLgqTMeoQqxnlMhPg
        lQnub9t5i20PB5/EHDTvCuRFvjJk5cM=
X-Google-Smtp-Source: ABdhPJzoioEeNQ+7wHWfTov34CnHHT9//gsdhJUXMN79J9NNDlZJ1G94HqUXXdGOIo1EVhtniwk/8Q==
X-Received: by 2002:a05:651c:327:: with SMTP id b7mr10296432ljp.140.1599489224130;
        Mon, 07 Sep 2020 07:33:44 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id e23sm7556891lfj.80.2020.09.07.07.33.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2020 07:33:43 -0700 (PDT)
Subject: Re: [PATCH v5 11/36] i2c: tegra: Use clk-bulk helpers
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200906185039.22700-1-digetx@gmail.com>
 <20200906185039.22700-12-digetx@gmail.com>
 <CAHp75Vfo1L4yi9icV=_NEDVcTqxNbCe0uVPSZUhwKJNj9SYjYg@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <4d612ebb-45a0-9e0f-f5f3-5c242f47a1a4@gmail.com>
Date:   Mon, 7 Sep 2020 17:33:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Vfo1L4yi9icV=_NEDVcTqxNbCe0uVPSZUhwKJNj9SYjYg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

07.09.2020 11:21, Andy Shevchenko пишет:
> On Sun, Sep 6, 2020 at 9:51 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> Use clk-bulk helpers and factor out clocks initialization into separate
>> function in order to make code cleaner.
> 
> Suggested-by? (If you consider it appropriate)

Sure! It turned out to be a very nice improvement for the code, thank you!
