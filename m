Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E62161A83C2
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Apr 2020 17:49:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440931AbgDNPt1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Apr 2020 11:49:27 -0400
Received: from mout.web.de ([212.227.17.12]:54693 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2440880AbgDNPtY (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 14 Apr 2020 11:49:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1586879325;
        bh=SQZY0RPnPe5CbQEgQEEmBX3pzpsWV/QXUhaUX2ehmNI=;
        h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
        b=LtmmVheeZBUO0bsCwkOttlGVIy2x1i9/tf2VTyCZu3PcF8lIYUt6ZI8iOk3b9cAQF
         9ottUj0hYhD2cxMZmMU994Q7fTZte+NLnAR2RIEulUbeY7BN+Gr3sFoejJSwKk27+p
         F8I2n05alpOnHXJ9p9aUtwLpi1iiduVv6D+sxX9g=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([78.49.66.171]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LkhFg-1inx7Y3xVk-00aY59; Tue, 14
 Apr 2020 17:48:45 +0200
To:     Dejin Zheng <zhengdejin5@gmail.com>, linux-i2c@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Allison Randal <allison@lohutok.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Patrice Chotard <patrice.chotard@st.com>,
        Shah Nehal-Bakulchandra <Nehal-bakulchandra.Shah@amd.com>,
        Tang Bin <tangbin@cmss.chinamobile.com>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v1] i2c: img-scb: remove duplicate dev_err()
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <08564c03-3bbd-5518-1a9d-a40b8ca09f48@web.de>
Date:   Tue, 14 Apr 2020 17:48:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Provags-ID: V03:K1:1HkJO6oelrEhfJ6zX2tNSkEduJ0frmrGVYQhdB+2UpgSeHClYwW
 +9Cisu3Z3T8l5u4hiafA+NlFcVO+LS9pjQ6uB/CyoplqDK36wf1ASUVYSKkK7OaStV//z77
 gzneeyoZ8rCCnNslHJZx+j1xh1uNhqf7dRKjTdYJF3z53F3nyAu5/Xi4gWd8NI0yM2yJVfk
 aJhrrVwedjhlnY37BsDXQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:3w7br+hJ7PI=:KH83DEtz5x7kubxyTNtp10
 57sX52Dp8eIfsDOBi6C5rctKN7SQ8e5J6BiG+gTFgjOOSs4qviMHnOpqs2X1AVOGWQZOq/Vwq
 KLMg6LVE0xSWusBYiQssPoVPF+Dq1TyGcy0B0RGQyEstvJmX6w/DqAmeeVVKXzoa2YOek/Up8
 jEZl4kXIB1oZY8Wfke36fQjKxsDJdtBRL0ygwvRK+fJ/O7TOQDrTtJ1fBJaARK9QezSJ7YBA3
 n6m3w7OwrXYbL8hISScWAPCZj618rEBItWRIjUku3MLIAOZqgil0/Qietz1VPzIqSh2SI7kMT
 dSIQQNUOPUpiYbNqkP0lUiMGNpR6/hwt4EviOx9GpelGaQkZrZzoQsvZgO2cO//uTKJ2U52pH
 cKqXy55YrbOQb9RpacY6nKN8E19BgkYNcQm8o4UgCds3qFt6tck7a5eYe9e0Eu0GEj8ttbC25
 OqPHyaPFZl+SrmbPF/FTVqxB3GCHEkE9zH7+tFBzu17P5UWJJiQSxAee95yWwgX3ArCJofrjw
 u+2XJx5sqTN6dGspGTnWHlHe1r7seCdz36G/owUKUC6uTQRWyN2ns77l7BM/N/2peAUHbu+9D
 2y70R4dlhoTsPnfGLkLhexTqOxzCk48rxou/0AASnlk8knC/8yaT/+0XZ7yUE7mJLHzEa95yr
 xWDe02wlSYrXU3djo6Zl07FLSUl2HZP5ZKDeNvx3RrKFM1AwwwVQIRMK4deB0+a4981RFrN0L
 vUq2DCsGKZ8DBNkoxxt9o5PgzSRqjoXSrivGVRArzM4UTSDV+6zu4q/HAjuLiVo1Zg6O6JclG
 OdFxgygj8r/dEsANVfbjOgtaBUTNFMmKCKy8IRKnUma6cVT4/fWqK/zbRlAKT0dny7D4UyIbk
 zguOtos09JExEbUyBQlq+I71XpvfjTEKRMomvXQUtZLJveh8KmOuw+kOk4nJa0qEtjNqbdJAf
 uU3R1q5DZ0C9nleiaAxoq5M49dNnMILmkdMpTKqEP9Oe/gTDkcIT/+owCMgAFTSEIuto2bRL+
 QWqRoJV0ebOgZYm3B4PAsAK/I2tQ4HyEYX0iI16UUfR2vPalKU8mlZs/H3pxJubeO4j2hRUZG
 nh0L4eOm3tvu3CrmoO/QgoJvVnIRtn8P8cPNrSL4ykIrYH5b1bJhnescwGamPUSX+aUSJgc7h
 vkDs7cfNoCwu+KfXkhwqSLTwywhXUxGY/qmrRs0RuVE3pWiC4tdBk/gtBgjCZJJyDESwH505m
 3zfHkwdbJxqtAEutC
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> it will print an error message by itself when platform_get_irq()
> goes wrong. so don't need dev_err() in here again.

I suggest to improve the change description.
Can you get any further inspiration by previous patches from
other contributors according to the presented transformation pattern?

Would you like to adjust any more source files in the mentioned
software area?

Regards,
Markus
