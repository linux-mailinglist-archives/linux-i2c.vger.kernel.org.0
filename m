Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 557E740D09B
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Sep 2021 02:07:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233070AbhIPAIw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Sep 2021 20:08:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232936AbhIPAIw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Sep 2021 20:08:52 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3CDAC061764;
        Wed, 15 Sep 2021 17:07:32 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id q22so4337671pfu.0;
        Wed, 15 Sep 2021 17:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=RmhWoIkXVeTU2jlzt2l1GdQKwIjiEtSD+LUNRvAfz/s=;
        b=eOwOZWVl2kvi//EaeCLHEILy1Nqsz26lJxrL3HflEeq5aZaZJaKV7RiJ6iC7oyGOVo
         c1yKrBGAu5WL74WHvW8yuNGhyJ4fZL8FmWdlTPI/uHtBZAKJlY7QjodXTOE3z03rM6e0
         fpnkHM5ZQl2xz5QTcGeV9nVWaI1xxRuHPLnrKaY4FnJkJlZdpELPB+bRIq3q5DnPQCbc
         YTe9ygzTKM68jDoZMTzOOHanCkVADqwmRMnzGeVQgsIzBq46uYT+ZK4Sq3KojnOFMGO6
         /y+IDlqm4Jlg1TDuxHEm4jomIb0+OeHl92mVMhQHu3Zm6IHEdJy3cYTIwaq9KDvQxEgU
         Cm9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=RmhWoIkXVeTU2jlzt2l1GdQKwIjiEtSD+LUNRvAfz/s=;
        b=G2bujnwmd9jnFafrLTlPaRFs4IeQsjX9epSerJHcWxoR7ipTVhqU4yVoEsxIL8mu2C
         LJH4DtPm7mcYTYVF5zGNAQiiApNPjMQZQ/YIsU/xXx0YQIWRBMi5l+nXCsFDQSzExGDJ
         AlU0bQ6P38GvxoNt9xeQ//HFwwu1DdzH7rut0sUpbhkALTCe0SMquSs6RGBQGdRHT9UO
         5Ur/RIcoeEW48pkz87qPBPlSFzuEwWnamFGzIPLVpokCXO7lVvSm8HBu/dep5ze33S1v
         JmojD/8GxmkoHVmCBBnK7RB/5XTP7oVIJ3YicO4fUHQgJw2n8JsvmZ/AkWsqOIhtNmqJ
         7E+w==
X-Gm-Message-State: AOAM531RY3Jy/UJKtsZYiwahz4Xi53N7FyNVE/k6AyAbez24q864gink
        OuN6a2tj1oFlWbgE+wWP/bisuVPjuk0=
X-Google-Smtp-Source: ABdhPJyQJ0UOR903QS5lkHOgD75zMUqrRgCBzEXf5IokGvO063np8mnXs4sCbUHFmAD87MPJkGoeUA==
X-Received: by 2002:a63:4b5a:: with SMTP id k26mr2248112pgl.241.1631750852233;
        Wed, 15 Sep 2021 17:07:32 -0700 (PDT)
Received: from [192.168.1.121] (99-44-17-11.lightspeed.irvnca.sbcglobal.net. [99.44.17.11])
        by smtp.gmail.com with ESMTPSA id w2sm660321pjq.5.2021.09.15.17.07.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Sep 2021 17:07:31 -0700 (PDT)
Message-ID: <160205db-a579-8d58-ea90-96d10577f7f2@gmail.com>
Date:   Wed, 15 Sep 2021 17:07:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] i2c: Fix return value of bcm_kona_i2c_probe()
Content-Language: en-US
To:     zhaoxiao <long870912@gmail.com>, f.fainelli@gmail.com,
        rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210906052730.19644-1-long870912@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20210906052730.19644-1-long870912@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 9/5/2021 10:27 PM, zhaoxiao wrote:
> When call function devm_platform_ioremap_resource(), we should use IS_ERR()
> to check the return value and return PTR_ERR() if failed.
> 
> Signed-off-by: zhaoxiao <long870912@gmail.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
