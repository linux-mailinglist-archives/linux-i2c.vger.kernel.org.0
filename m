Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7865A1B89AA
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Apr 2020 23:51:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726284AbgDYVvW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 25 Apr 2020 17:51:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726015AbgDYVvW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 25 Apr 2020 17:51:22 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E03A9C09B04D
        for <linux-i2c@vger.kernel.org>; Sat, 25 Apr 2020 14:51:21 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id g12so15939289wmh.3
        for <linux-i2c@vger.kernel.org>; Sat, 25 Apr 2020 14:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AskPgFkIBwRqziKKPyHXk16uuLnLGE9FmAeIfGuoiyw=;
        b=UGszXKQbPAdmLpuCZg0R1vbfRgsePhh46gn1WsNfQIH+oLLSDdmV0kkylj8C8Yj6sQ
         dLLZVY4AIYOwFOh1Rz3i1nC1q9m3qMTbwPzP6byY8P/MpoaY3V/wDFF8A2T0+FkmuIyo
         VAjdiOSMdgB3pZrcNBjaVIOMsIcZCfKzM45nqQK4yNJ7DCFh0BXoSb1urr8uUKh9eZ2N
         VQjgfc21wASxMGmaY03Ig/oKkrJrPTkhnip7o1NizbOyMxDnCsx8atROpxZVD8j1z4Qh
         QXY2uHYHzkv8C5jzeQXB+Z6gG+mv0CTVJ7RoKym+gtKz78QrPKuIy4kvs4c0U72UvXel
         4WUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AskPgFkIBwRqziKKPyHXk16uuLnLGE9FmAeIfGuoiyw=;
        b=UW1wTWdR4LCHop92tq6VvCh6QKmTf8wqtd3A3is81xaiufFPw2VwwPHcxyg50dpiN6
         4KoulfEY9cUyanSh660Jkm6q1bffH4w7KC2GT6yUkv7Cqk9aIfVaFEjMPYWWbMUbFMv9
         BoPKCyCsKtpBfXGv68+sthutFSDPg/BCaYZ+FLBEYQ4jdXYq+6mMzuDD2Qss+VotPEAh
         KDYCE+clZ1vkp0Px3hdfgmj2+R4sA7xUSV4fTIkfIL0eGmC9pLlxTFeX9Ri1BSS3BoPq
         6P11U9vVxq8VaA+XD8gauzSLUTfQquHLq622ZI27yxIraBjdDmOnrBS2SSTSeb7SC4PN
         tYYw==
X-Gm-Message-State: AGi0PuaXnlkWEF3TDGPbWAf+2a0HjXLKgDa4+Nt3AjbPBbwQVSpcFICd
        U7qknA/oHtkCitVpOW6ZXgA=
X-Google-Smtp-Source: APiQypLNwEvTJnhvyxZdRTEbB+4wyhwXcIi96k1gQg68+T2YjnXYMn0SdtvSyPLwcFVta17U2zM15Q==
X-Received: by 2002:a1c:ba09:: with SMTP id k9mr17475473wmf.176.1587851480651;
        Sat, 25 Apr 2020 14:51:20 -0700 (PDT)
Received: from [10.230.188.26] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a20sm15100102wra.26.2020.04.25.14.51.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Apr 2020 14:51:19 -0700 (PDT)
Subject: Re: [PATCH] i2c: brcmstb: Fix handling of optional interrupt
To:     Stefan Wahren <stefan.wahren@i2se.com>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        bcm-kernel-feedback-list@broadcom.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <1587850687-23675-1-git-send-email-stefan.wahren@i2se.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <3f3d4430-3c3c-d838-bd35-d35712ed4039@gmail.com>
Date:   Sat, 25 Apr 2020 14:51:16 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1587850687-23675-1-git-send-email-stefan.wahren@i2se.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 4/25/2020 2:38 PM, Stefan Wahren wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> If there is no interrupt defined then an error is logged due
> to the use of platform_get_irq. The driver handles not having
> the interrupt by falling back to polling, therefore make
> the appropriate call when claiming it.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
