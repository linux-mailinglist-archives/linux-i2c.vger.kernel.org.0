Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29FC122FA46
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jul 2020 22:43:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726970AbgG0Unr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Jul 2020 16:43:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726953AbgG0Unr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Jul 2020 16:43:47 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5D19C0619D4
        for <linux-i2c@vger.kernel.org>; Mon, 27 Jul 2020 13:43:46 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id c80so15311006wme.0
        for <linux-i2c@vger.kernel.org>; Mon, 27 Jul 2020 13:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LwHk6aa0qzWcTC/yZuHgrolyluxfSo5KPunX5fqAGbw=;
        b=UTb5moqRzvVRGSeOsC/tlyLbR357acEUdpQNQ2CoohhFjd9JActentaHcrF/mWR85k
         bKxt9YfCyoJI8HKYpGp9j0GJc0giVxFKEZUIozT68pVPTSpkPmVb0pL6MK7jFZgVsF7X
         P4cqwFmeLdEqvq9BZHICVTzuhCcBOITHdEHCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LwHk6aa0qzWcTC/yZuHgrolyluxfSo5KPunX5fqAGbw=;
        b=HS0s4lb9slD8rLkjSBgYrYjni0ucEp6nEWYUYmNYq+BBH2g8PiYDY1AI5URfRBuOJy
         FxHuTie2VYS/5t/boK8PsEr0wvGmYpZak+ODcY76VgjgA5heSn+AlMQCNk+GNPNdzOxg
         TAV4AaZ5rORLmMBF9/2HlM9VAn1ZzADRto4qnsr3FGX+Pkcgs4dh9HtsmxgD19Ha6LXB
         PR/KiRHW5RdLmXbxq072TkzONB3WZtMIIbYNJHxcahiR/aAM6ZYkz3wdCm6txOgMTUbx
         VUuAmdbfLxonPf75uHJQ1WdyRaIm+CB0z1YAzFaltW4lkoLedUMa4UleUCHEF/htw3OX
         iLVQ==
X-Gm-Message-State: AOAM532BPQ6Qj88DiAmeri14zDb+KngBtZyo1yzu7U5kdnQCGYbsEsU1
        9M20qM912HsMSBoikVZzpfFtgg==
X-Google-Smtp-Source: ABdhPJyguFJOfr2iQoqeStNyg7OgwW3ooQlFP/fDjBmTDvsj7sNAi5F2ohgSA2ilzGwsvbfIcx7x9A==
X-Received: by 2002:a7b:c76e:: with SMTP id x14mr863850wmk.176.1595882625429;
        Mon, 27 Jul 2020 13:43:45 -0700 (PDT)
Received: from [10.136.8.246] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id v11sm12099019wrr.10.2020.07.27.13.43.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2020 13:43:44 -0700 (PDT)
Subject: Re: [PATCH] i2c: iproc: fix race between client unreg and isr
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Dhananjay Phadke <dphadke@linux.microsoft.com>,
        Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ray Jui <rjui@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com
References: <1595115599-100054-1-git-send-email-dphadke@linux.microsoft.com>
 <116ac90c-8b49-ca89-90a4-9a28f43a7c50@broadcom.com>
 <20200722104128.GK1030@ninjato>
 <5048cf44-e2c2-ee31-a9fb-b823f16c2c7d@broadcom.com>
 <20200725101815.GA1519@ninjato>
 <4cf12c92-889d-ffbf-f8de-c1e08cfb8ce9@broadcom.com>
 <20200727181346.GA1034@ninjato> <20200727202657.GA18997@ninjato>
From:   Ray Jui <ray.jui@broadcom.com>
Message-ID: <f56b0f2c-f723-a4b6-8c03-4b397aaa375c@broadcom.com>
Date:   Mon, 27 Jul 2020 13:43:40 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200727202657.GA18997@ninjato>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 7/27/2020 1:26 PM, Wolfram Sang wrote:
> On Mon, Jul 27, 2020 at 08:13:46PM +0200, Wolfram Sang wrote:
>>
>>> Can you confirm that even if we have irq pending at the i2c IP core
>>> level, as long as we execute Step 2. below (to disable/mask all slave
>>> interrupts), after 'enable_irq' is called, we still will not receive any
>>> further i2c slave interrupt?
>>
>> This is HW dependant. From my tests with Renesas HW, this is not the
>> case. But the actual error case was impossible to trigger for me, so
>> far. I might try again later. But even in the worst case, I would only
>> get a "spurious interrupt" and not an NULL-ptr OOPS.
> 
> Let me explain how I verified this:
> 
> 0) add a debug print whenever the slave irq part is called
> 
> 1) Put a 2 second delay after disable_irq() and before clearing
> interrupt enable register
> 
> 2) unbind the slave driver in the background, triggering the 2s delay
> 
> 3) during the delay, try to read from the to-be-unbound slave in the
>    foreground
> 
> 4) ensure there is no prinout from the slave irq
> 
> Worked fine for me with the Renesas R-Car I2C IP interface. As mentioned
> before, I couldn't trigger a bad case with my setup. So, I hope this new
> fix will work for Rayagonda's test case, too!
> 

Sure. I suggest Dhananjay gives the sequence you proposed here a try
(with delay added during the testing to widen the window to cover corner
cases). If it works, we can just go with your proposed sequence here.

Thanks!

Ray
