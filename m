Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C15E230E4E
	for <lists+linux-i2c@lfdr.de>; Fri, 31 May 2019 14:46:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbfEaMqQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 31 May 2019 08:46:16 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:39339 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726403AbfEaMqQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 31 May 2019 08:46:16 -0400
Received: by mail-lj1-f193.google.com with SMTP id a10so6264954ljf.6;
        Fri, 31 May 2019 05:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7U/vllzeRGoDUSqNH2O6vtCvwbIbsyISBbyc9R5lGXI=;
        b=Zv/Zj9UWstKjDWB/X3qKfz4kr5pyDkK9IzR5eo/kkqqHuoFoTMGTBsrnQoI5gB7mXm
         X83RIBzfPQFr2ygu5IDJIHg9l7t9+ankLHbczoJ16RHB/J5HBrdrihDkicBX+o/q4ReQ
         BDULxbzzaiu1Q1Vvo24NfWZqlA/pi4eMjJ2cC2TiyeL0+eQWM4CE1UXdAvFDr6NRBF+Q
         kxE8XYrkqtbhGrOMmBx3X6Jg1C4MWo90pL1Zw3gkJ0VAVd8kUASyOhIci+DeueSZOnNe
         5KchYf3uo5Ms8BFRUI2/6IMtDCSkK5ZQapRQhMoUuEyqUvnv543DA33owZ39+zXcayj6
         UNRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7U/vllzeRGoDUSqNH2O6vtCvwbIbsyISBbyc9R5lGXI=;
        b=RWwUn7gx4txZZH/RnPNMs+L2TbNq+4LpnuO/BwPbvXkuaMM49ah3zv53oxpT8fx/d4
         Jpti90x6mjcijcdLr5xtCHYZ43uq19kIKqCnOwZTcLv3rS5VGj+40Wf2MyYeAARljl0E
         TurYVdt4tnr5Ue/0c/xsB9okAMR45KCr0DUijGbde8C/kaDQqqfEryaPS1FoymYJUook
         LLxDeEqPLGQho5r2IB47AZp/B9NdIfWwUd1jfpu7C+YM2tjGNFlZrcq0ma4GwhVSnoJH
         OzBwhVH+RIElI9qMyzoMqqSVm3yLQ3530unOA+JneBVkOKgUtqo4xukPq53sPCVKyAzV
         E7CA==
X-Gm-Message-State: APjAAAUU8tGzTYd/2Wg5Az6iNfXSKrC1ZjZSBNCown+nSenjxOu8Twxa
        uDAQP2LtcwHqcZU2tJEgwrMGnCmo
X-Google-Smtp-Source: APXvYqz1JzGq7x9Q+0+jYp9r4eBCRmz5OsVKb9/7kw292QmWKtEySx3VGA7zk5mW/9KqkICOIKZUng==
X-Received: by 2002:a2e:249:: with SMTP id 70mr5320344ljc.178.1559306774051;
        Fri, 31 May 2019 05:46:14 -0700 (PDT)
Received: from [192.168.2.145] ([94.29.35.141])
        by smtp.googlemail.com with ESMTPSA id i21sm407469ljh.12.2019.05.31.05.46.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 May 2019 05:46:13 -0700 (PDT)
Subject: Re: [PATCH V2] drivers: i2c: tegra: fix checkpatch defects
To:     Bitan Biswas <bbiswas@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>
References: <1559196850-7007-1-git-send-email-bbiswas@nvidia.com>
 <e9e3d8b0-a76a-81a9-1110-2d07ba1c787f@gmail.com>
 <911e52ed-8f3c-583a-7610-e38723219eca@gmail.com>
 <b86b9104-1754-531f-70b9-3c1a5d347b9b@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <2d83ad21-b012-1b3e-fc9a-741972ee3ba9@gmail.com>
Date:   Fri, 31 May 2019 15:45:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <b86b9104-1754-531f-70b9-3c1a5d347b9b@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

31.05.2019 12:04, Bitan Biswas пишет:
> 
> 
> On 5/30/19 4:43 AM, Dmitry Osipenko wrote:
>> 30.05.2019 14:36, Dmitry Osipenko пишет:
>>> 30.05.2019 9:14, Bitan Biswas пишет:
>>>> Fix checkpatch.pl warning(s)/error(s)/check(s) in i2c-tegra.c
>>>> except for BUG/BUG_ON checks
>>>
>>> Please turn the BUG_ON's into WARN_ON's. The machine won't go on fire,
>>> hence there is absolutely no good reason in making system unusable on a
>>> software bug. BUG_ON may be more useful for development, but not for a
>>> casual daily usage.
> I shall update the patch to remove the BUG/BUG_ON calls.

Please replace them with WARN_ON_ONCE.
