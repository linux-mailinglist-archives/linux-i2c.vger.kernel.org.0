Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C01C351BD5
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Apr 2021 20:12:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236324AbhDASLU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Apr 2021 14:11:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237859AbhDASEn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 1 Apr 2021 14:04:43 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0AF7C02FE82
        for <linux-i2c@vger.kernel.org>; Thu,  1 Apr 2021 08:56:30 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id x26so1810092pfn.0
        for <linux-i2c@vger.kernel.org>; Thu, 01 Apr 2021 08:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6ySoa5+Xb3eBjoT8tOVrfmR1P0l9TqoPHNpKMH+oLf8=;
        b=qhSPnwOklXCDjC8td/rdLvOqJYjJp8BhDvWrcFWc6+rfu0O85iJHf6Lz0NuKOavziT
         o609NQCWh+WhhcErxSILC3a+Oxsqp0pmPAJ31Rm5xqcJYcilIHGmoLnOm1rqKamHmhow
         0VexppA33Fpvs0EEJq6a79qZMmJ53mmyeVPmIplcg1KYb0tWGBcEVrrsaNOEH5GxoGI7
         wBf037g8xp3/0XZbjQAjCNI2ARGKxWzvUoWZl8/6a47dopqajzPdN/88llKVtfzeVyTd
         8ZvQMmW1X7Q8OEBFx78C3LIPi4MPNbe1eAqviksUGoOPA+a8Foi+sFff2gCucg7ss50O
         Z98w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6ySoa5+Xb3eBjoT8tOVrfmR1P0l9TqoPHNpKMH+oLf8=;
        b=KJkhr2WUK5GtmVFGx8Tm66pbCMcwJjCY7L68q17qXgHLRT7Nqh6KWz/983zudUpgu6
         ZFXEVtAZAbyfrDnrOOpXsMgFHRUkC9oLLi8pWZWBbVqOcSET+nVSRNGjxZQR0xpPlgIE
         zpDqgvRbzWDLntSaKlrEqA4AF2A+gKd8n8plKOPs17WS5yQQ6/tgd7I6fc/iP78+z+jm
         oifGGsSBU2ocweQ9KzV1RRhp9z3yFUQq15kOPPsGGac5ZM6XpPRUkIESuwc0suK/upEc
         P5+L6xmvu2kMtmYef5E2rpoC0fsZk1OT2m5z7h378ckMYqfv8zDbok4mvtQzhd2VejT8
         Bzqw==
X-Gm-Message-State: AOAM531JxrKyJwvlv96TFtpSH1emmYQXpQ4W41f2Ba10xu5zQot0Npg6
        K6FsUGBRwBtE3c4d28xnWeMK1xSm63o=
X-Google-Smtp-Source: ABdhPJywHQBRx//QbrNf5EeQowWjU8JKeMN3mCWW5EjrkXaFnaJerRhUrOFY7RGMAV5Qgnh70Bc2OQ==
X-Received: by 2002:aa7:88cb:0:b029:215:6f93:d220 with SMTP id k11-20020aa788cb0000b02902156f93d220mr7916289pff.36.1617292589679;
        Thu, 01 Apr 2021 08:56:29 -0700 (PDT)
Received: from [10.67.49.104] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id u2sm5858184pjy.14.2021.04.01.08.56.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Apr 2021 08:56:29 -0700 (PDT)
Subject: Re: [PATCH] i2c: brcmstb: remove unused including <linux/version.h>
To:     Tian Tao <tiantao6@hisilicon.com>,
        bcm-kernel-feedback-list@broadcom.com
Cc:     linux-i2c@vger.kernel.org
References: <1617284267-27743-1-git-send-email-tiantao6@hisilicon.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <e8347292-a0c4-bf90-b4e8-6190c7cb7602@gmail.com>
Date:   Thu, 1 Apr 2021 08:56:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1617284267-27743-1-git-send-email-tiantao6@hisilicon.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 4/1/21 6:37 AM, Tian Tao wrote:
> Remove including <linux/version.h> that don't need it.
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> Signed-off-by: Zhiqi Song <songzhiqi1@huawei.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
