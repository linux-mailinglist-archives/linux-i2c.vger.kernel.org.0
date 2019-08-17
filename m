Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F50C90DBA
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Aug 2019 09:32:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725965AbfHQHc3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 17 Aug 2019 03:32:29 -0400
Received: from mout.gmx.net ([212.227.17.22]:46163 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725911AbfHQHc3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 17 Aug 2019 03:32:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1566027124;
        bh=79c1Qiwd78Z6gHB2H4pQRBwu61ap1LwxLc8fK5Abisk=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=NZl8Tmdp/ezt6FiEYl2PBlTbYdZKwj9RcFtZjGSJn/7uw667z71uHz7QcequF4+fg
         WGhcZm7hUboTt642tQXdfefE+FcBrxopY0c1NE2qS72VQmFbrZVfwpeRTsV9rUpjGD
         s7/Vb+TAsR2zn9POmYQAJM76E9Fx1u3pRbncRuI8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.1.162] ([37.4.249.106]) by mail.gmx.com (mrgmx102
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0LjdS8-1ia8p221u4-00baXc; Sat, 17
 Aug 2019 09:32:04 +0200
Subject: Re: [PATCH V2 08/13] i2c: bcm2835: Avoid clk stretch quirk for
 BCM2711
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        devicetree@vger.kernel.org
References: <1565713248-4906-1-git-send-email-wahrenst@gmx.net>
 <1565713248-4906-9-git-send-email-wahrenst@gmx.net>
 <20190814193628.GA9756@kunai>
From:   Stefan Wahren <wahrenst@gmx.net>
Message-ID: <bb924d04-b4a9-56c7-c7d5-31f3cc8c1da3@gmx.net>
Date:   Sat, 17 Aug 2019 09:32:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190814193628.GA9756@kunai>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Provags-ID: V03:K1:MYYp/EY0zAmFLDdjas94knWfcnTU3EQgK4637yghfQalxZkOem6
 iQS5oBLTT6i9RCppasf/mYECnDySmMTKWswDhTOYC1fmOtzWdfYinEPNmiJAWbRfbvb6GwH
 8A2Go6sXdtfVoU2Lmva1IJUonQEbpvHKigI31xDLH8u8VlkBf2EuBJ0lLJEWNeFGr49a7fl
 8WVeJB6VIy6hDuz2Dg/qA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:tcerPsRZ5/o=:H7AqX+83ICOeyvNpx0DDvO
 gIXuDAsdC+0xkeAV4O5gU8BPMijJ9NHYuy6AYNKT5R+LPSpLkxV82miwOU2+CCLImFrtkx6I+
 4VagaT3zGtzPb75vik0DbP+bnqFfdmLYa4gj/c4btgF1+KpC5L+7kAGo2t/HBd+zT8G8CjrcQ
 2rQ447Kgyzb4GdIy8ydKK+5sDZTMyXkOBvsFhAoNLY1FIbsD8QS+uU/f+YG3iZf6wqQZlUL+F
 Adi84cufhubHDGv4CW8IaWO7DaVd29C5mtgOc9y3dJpYhY+CWI0kBn7R10B/04ZIQ7D6iS9z6
 RiVYbeJ1WzkGSpqimOuFTlrbKg+QngBNn4qy55N6iN4HC3F+WEEHetuiAP7aKegIvmQL15Ium
 GIR0ynngQXtME5aph1DYH6Lu2kD0IGeWuwp7f/qGWWWqxaQyfnvf1ieDdteaZzYpYjVtx/fYW
 mcZJebB4kSRCrWA5OPWjC5FxVInPN6EOghHEnkQguB14oSwfXZJ/oyIZH8uN4a71hXFW01t53
 41plg9YxbtmdXhboo0Jy64RTH3e/Dy9EOv34vhN0WYQwxnXiTk4h7XScz3ylsD59NO3FLsweM
 D8Rpg4sBGlC4yUsMtCrOWO+g+rsg1xfSZKXw0Q/ARowig6WAFVNrM6das//t3BmnKynshtsqs
 tUrO3kFGIsQxjP5BxjS//1z8uYmmNw21yp4PDRftWULjaMjKDLGYaus5QtORmCoy8krsS9ifS
 nl06pyAEP1t2bn4P1CIuq7OSuFchGVnM9eK7PvcgGJUfmPmrKRmKiQZDFv4qrbmNC2ctti0wP
 Cwiq/APoZ2wKeZZv/lwcISEjeygwzGByPv0d5hdPO9QFpE7FerpI+vtjMc7ADyLq3YX3VZRyn
 PHWYu6ieY7ujJ67EZfLhoqR6wQemZTz2FMJnhpBQzMVw+MKP4FFGf+WsSpfxpkCRRIBVNE0Wf
 zZQK0D2sPYxHIq534H+O1n8uv/RUQwqWmWK5wmgispD1iOs5p66Gy5reaJm0y0eCP0x69YiwQ
 prfA1tVHDXLYQYSbrW63NTc9fB0x92Jes5AsBVGuWjsQVxDk8dUKMf2kZYdfQAHLaKO4O0Bcf
 XrhxJsL4ZWA/L352tM0hjQ26Ojp4wCVA8tMfC0FKjeEfpO8snfYTl5QL6okoZgjiJpvBOrZbo
 a0Yao=
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

Am 14.08.19 um 21:36 schrieb Wolfram Sang:
>>  static const struct of_device_id bcm2835_i2c_of_match[] = {
>> -	{ .compatible = "brcm,bcm2835-i2c" },
>> +	{ .compatible = "brcm,bcm2711-i2c", .data = (void *)NO_STRETCH_BUG },
>> +	{ .compatible = "brcm,bcm2835-i2c", .data = (void *)STRETCH_BUG },
> What about simply putting a pointer to the quirks data (or NULL) as
> match_data? Then the code should be:
>
> adap->quirks = (cast)of_device_get_match_data(&pdev->dev);

quirks = (const struct i2c_adapter_quirks *)of_device_get_match_data(dev);

would hit the line limit. Do you insists on the cast, because it's
actually not required?

