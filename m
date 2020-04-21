Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 977121B2AFA
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Apr 2020 17:18:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725987AbgDUPSu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Apr 2020 11:18:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725613AbgDUPSu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Apr 2020 11:18:50 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B93B0C061A10;
        Tue, 21 Apr 2020 08:18:49 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id f8so11410641lfe.12;
        Tue, 21 Apr 2020 08:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZMuHqueuAGGkntprsYha7PMA6DHItqgb/BeZ0El+gH0=;
        b=KFdn9bFSOvnx9Q+kK3mFwREzU7r00XuRav+CVQQCfQF5rwKod52/yFRXXmfBZCcPU7
         0XcQ0dZBhO3TtuNQCIHUFZRIRsfumbAgUxyNgbyYY2GZK1GMJl8L6d1VQZ0dxCFmHZkX
         hvsdvrT1a/orXG+8e7X+uA1SB8LKZi6/ofoY3beqKt/5DePB/+ejR3waPIynPngP8+ue
         kWC/ZSgNw9ktAMNK01wbVx5mYAPpFZWlShSQsDC0QJCgib1WJ6uPwqDC9xzolsms3tm/
         AiXHstvvcxFPMVUxWvoosuwSNHgvqwyrDIYe//YMcnKouvwfx30JzMh+CF3sJOPZHh6T
         WImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZMuHqueuAGGkntprsYha7PMA6DHItqgb/BeZ0El+gH0=;
        b=MBY3g7C2dZhjByszaLO5tP5tR3kDbV+7Nfpjk7gaoOL8uhcsgsjD1JkXecKZlmOUK6
         C4juJ9Z36P4uFUohnNFqV3BWowy1yXXuvzC8U9r8bTzBIlyjYNuT0Be3grJvyu/acMpM
         l3S5i4bpCZt98ax6afMh8Xs879cavq/deRgT56excC/wv3WKPc4vJtQCzgPIQ2puDL/P
         4F3WlWZ5WY6Q7ezbW+YocYkqIdG2aeiIJlkebwPWX8/9tvKK5xGLlT4IVIzZmPPMoSns
         iKjzdwYukOEzlvAA2h1xtNgNXB0E+NByTu6chhcsdlRfTLNmXyt5Zf2+iKmz8CHbzgql
         l/tQ==
X-Gm-Message-State: AGi0PuZyBUvJMZwosbxmY9CA7f4Oj7yun4lee++Cza3kiRrvoCcdmOAx
        5sgpIHHE4wx20/D3GqhjiKHHrJOq
X-Google-Smtp-Source: APiQypJ8imQtXdoStKdTUrA+kpimeOG5UETj7m3+reRwLhmKPPVA7066mL3+e67Bift5WGYwM2iukg==
X-Received: by 2002:a05:6512:6cf:: with SMTP id u15mr13841140lff.98.1587482328020;
        Tue, 21 Apr 2020 08:18:48 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id m193sm2428369lfa.39.2020.04.21.08.18.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2020 08:18:47 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
To:     Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Manikanta Maddireddy <mmaddireddy@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200324191217.1829-1-digetx@gmail.com>
 <20200324191217.1829-2-digetx@gmail.com>
 <1e259e22-c300-663a-e537-18d854e0f478@nvidia.com>
 <f59ba318-8e99-c486-fa4d-1ee28a7b203d@gmail.com>
 <b01cec76-bb39-9fb5-8f6e-4023c075e6b3@gmail.com>
 <8cd085e1-f9fd-6ec0-9f7a-d5463f176a63@nvidia.com>
 <db1132ce-53a8-371c-98e0-cb7cd91d5c7d@gmail.com>
 <fa344989-4cce-0d2c-dc93-4ca546823160@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <93b738f2-ccf2-68ed-3ca5-30945bd40521@gmail.com>
Date:   Tue, 21 Apr 2020 18:18:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <fa344989-4cce-0d2c-dc93-4ca546823160@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

21.04.2020 17:40, Jon Hunter пишет:
> 
> On 21/04/2020 14:25, Dmitry Osipenko wrote:
>> 21.04.2020 12:49, Jon Hunter пишет:
>> ...
>>> I can try the above, but I agree it would be best to avoid messing with
>>> the suspend levels if possible.
>>
>> Will be awesome if you could try it and report back the result.
>>
> 
> I gave it a try but suspend still fails.

Is this regulator error gone with my changes?

[   60.450346] WARNING: CPU: 0 PID: 653 at
/home/jonathanh/workdir/tegra/mlt-linux_next/kernel/drivers/regulator/core.c:2603
_regulator_disable+0xb8/0x1b4
[   60.463959] unbalanced disables for vdd_pexa,vdd_pexb

