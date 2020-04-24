Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EEF51B7C5E
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Apr 2020 19:07:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726920AbgDXRHd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Apr 2020 13:07:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726793AbgDXRHd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Apr 2020 13:07:33 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4B63C09B046;
        Fri, 24 Apr 2020 10:07:32 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id x25so11343356wmc.0;
        Fri, 24 Apr 2020 10:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pNg7ONatcx0tvdnMJvHWn8buU8bELK0ZoEzKLC3RkrU=;
        b=Z4mN1LorXe2GM36jqQm7NtzdCnaRpU0Csh+HAxCuycpzXjsiwupEy003zAW9zlNzoa
         BSUR6yFaScZlsGXZiHvScU7mokPg6cjonkYIKU+ZIiEjk2p5/jhsHI0V2wgPYFhSnO9S
         ORcIVXU5RUAc9mhFXNFqhyoyaayDRvufCJhY2mX1mEduR66TBnM4FPwh+GladDpJGbMo
         7qcrn9+35jo2iACZBEnpZhDY8RJIzJRrArtYlmXjZesr0y/rs9vc9Q7rBGdq02+OYvPm
         P3R/Ki/haSJ/igYDSTxMtaj/PPz4qsBuWi2+t1qJoibNTQfrz5LhmTHeVVGUPqMACYb6
         s0JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pNg7ONatcx0tvdnMJvHWn8buU8bELK0ZoEzKLC3RkrU=;
        b=KbwSrbXDuVxqN76cbv6aIKuHr/lk+tL6/BVufgrNV8Jz6XktMdLrd/EeK8TW+eLo67
         O8UwPx9vtuz1MhKHtucQjXkioyRA95/SUwx3PK3Xsbwq629qSmM7p21GWu0CDJwcGqgP
         PWq/YvBE1LRmaIfyMNCsqK4lrcOy/3QW6+wih11wGrg6M+IDgOaeKcKWx0jHnj3vYoxs
         jaEmCnwr/1NPn1jUZpAJHZ15/cyOFfXCZgsUcL0eXyDbQxMUKY7NhHobOXypdW276c3W
         jsjTPS7bKk+EE8SZsHADSaHyIXPsaJ4BxGM2FFKxqikuZwnk5D+nzagPggkK7k6HyxdA
         XWow==
X-Gm-Message-State: AGi0PuayJZoxCm6SlbpjG6sFY64cBtRbifDSZcBeGG2JtF37tCd4J9O4
        7vC4CLB0/j9EvaE/C4AOMYNBzSzQ
X-Google-Smtp-Source: APiQypLZO4MExFdKMNKjUrrFilmlGS8Q/GGA4PlaU3k8a0ak1a7T/J3DeClcdV59/IjrALJ7MYYFkA==
X-Received: by 2002:a7b:c390:: with SMTP id s16mr10817388wmj.14.1587748049944;
        Fri, 24 Apr 2020 10:07:29 -0700 (PDT)
Received: from [10.230.188.26] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id g69sm3827549wmg.17.2020.04.24.10.07.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2020 10:07:29 -0700 (PDT)
Subject: Re: [PATCH v2 01/91] i2c: brcmstb: Allow to compile it on BCM2835
To:     Wolfram Sang <wsa@the-dreams.de>, Maxime Ripard <maxime@cerno.tech>
Cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Eric Anholt <eric@anholt.net>, dri-devel@lists.freedesktop.org,
        linux-rpi-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Kamal Dasu <kdasu.kdev@gmail.com>, linux-i2c@vger.kernel.org
References: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
 <c8c666eb5c82dcb73621930b3fedf5814792bf1a.1587742492.git-series.maxime@cerno.tech>
 <20200424161353.GA4487@kunai>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <bedfe073-6ff4-69ee-fe39-d5802cc3ecfd@gmail.com>
Date:   Fri, 24 Apr 2020 10:07:25 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200424161353.GA4487@kunai>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 4/24/2020 9:13 AM, Wolfram Sang wrote:
> 
>>  config I2C_BRCMSTB
>>  	tristate "BRCM Settop/DSL I2C controller"
>> -	depends on ARCH_BRCMSTB || BMIPS_GENERIC || ARCH_BCM_63XX || \
>> -		   COMPILE_TEST
>> +	depends on ARCH_BCM2835 || ARCH_BRCMSTB || BMIPS_GENERIC || \
>> +		   ARCH_BCM_63XX || COMPILE_TEST
> 
> Isn't there something like ARCH_BROADCOM which we could use here instead
> of adding each and every SoC?

If you are worried about this list growing bigger, I do not think this
is going to happen beyond this changeset (famous last words).

There is no ARCH_BROADCOM because there is typically very little
commonality between SoC architectures within various Broadcom business
units (left hand is not supposed to talk to the right hand) with the
exception of a few peripherals that have been historically shared (NAND,
SPI, XHCI, Ethernet PHYs/switches, etc. etc. This I2C controller
historically came from the STB business unit, which given the market
space has also engineered its own HDMI core and naturally incorporated
the I2C core it already had into the HDMI core. Up until 2711, that HDMI
core was not used by the 283x family at all.
-- 
Florian
