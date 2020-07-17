Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 039FB2242CD
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Jul 2020 20:03:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728154AbgGQSDT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Jul 2020 14:03:19 -0400
Received: from mout.web.de ([212.227.15.4]:60709 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727940AbgGQSDT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 17 Jul 2020 14:03:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1595008971;
        bh=BSNq8aZA31B3vbhvCL+iwPYhc8QkoYGsdWQiQLN0cFU=;
        h=X-UI-Sender-Class:Cc:Subject:From:To:Date;
        b=qXMhP/CXE41bEi9+qN1grpHlGUS4ZPec+zQq0TT5K19QIbz/66INL9EB+ty5VDhOZ
         C63zWquT4BhGfBfHzn1PiwIgddqxRs1e5RnjtI6H6LxPaL42wNOuDxOBJjk0pJl2jJ
         dfJdqNyqkF8uiX9kSZos6OvImS8dmTBEF6kYYPiY=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.15.38]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MTOlk-1kQ5qB1aiy-00TlIO; Fri, 17
 Jul 2020 20:02:51 +0200
Cc:     linux-kernel@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michal Simek <michal.simek@xilinx.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v4 1/2] drivers: provide devm_platform_request_irq()
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
To:     Dejin Zheng <zhengdejin5@gmail.com>,
        kernel-janitors@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org
Message-ID: <8c7fd5c5-e877-3cb3-8802-34d1b1eda395@web.de>
Date:   Fri, 17 Jul 2020 20:02:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
X-Provags-ID: V03:K1:361MQuNF1pOheSjx8PwrSlhrJ+6HrxbJFQrtvBUOxumS+Gr5MMk
 L4vpDjoiUy8yNDbHUFcJaC6OsgBABByFBlfuJ7ZtpRrDS28KHhX9/TddLWEfcrMXTIq4sZV
 Rpx/sTV7kiSgcHYRCca1ZyilyYyieCePZcjzxtfilo/WkCz8y/LWu8cMg5xAEjL1MkpDSQH
 lv0b0XFBHDyaCjh0xDeug==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4naAcjvt9v8=:tmo3Cg2J9kmuJ9M0+RjwTj
 N5OIH+RqUm1UDFq31dOqVHZ99fQ5pEFc2zrvg7sLpoqO8jScg3RpBDGkPJT36VkEznQIbKkcV
 2qroUGux3FKSm3gaKIv4klh08ajkSEIHObLdwZYMQ73IiMhBLXS43tBUNJgmbqdraUOpt8nTj
 QMdAafcUO93LGVRbko87pz6OpuwzSqppRUBMn3IUqbHlA5u8KXm63JUaBEQlJup+Go0I0eccV
 FO532BueaYKGr/sIbvKP/e/PZM/5av9dAdDC5xp7i1yklzej1s8fiJMiO1dGPd0UKGPNXqPQh
 uEdFlUssKYuIrv593ZKFtUo9YWmzeV2mz5O9FE/UMEGpFD8eFxfpWPBUcY8AYTVCg0LPBCTSb
 19NtVpAzfc8xU+qRWuz2CqKGuM18TPEmXMeOX0t9NR7IeD7sf4fCyAggtNlBWs5N+uttbXOIm
 78Zj3ezZslpL1udF3eUGGj/qbu3WjPF3ONaVY2qLKVJFu4MGTUWb3dKQl971+4yQYIJF2Anfu
 bAAQem9KMWTSrmBlYNXSKq+EiVOJZF+EhIa1iPl8/13J6UKsfrQ5FiK6P+4xReIlnNmduPsPE
 1HqwoPKCvts5okXDDYDkq8PC1ekH0LyakDG6Idhk8amwSg5aDgDbWMfEyCGP8rJcwU+IR/1/l
 qbwC9O7gRQPlHyiEmAe5BVCn7VGjHe+sBFSsR8WKIzQOx+hqmQwZGDItC81wLIsiCV03UKCxb
 iIpa75G6uF4tpQmFH981PSrXObEM/Vf6PkL5BrAM3IOejoar3A35tyH5OOX8pt1IIuBS4O8zJ
 bDat2FNYbh6YOseY9sXhapFbVqOjlCkhS2gdFTbQ3Y8PCioyewX21SagbEoS/h3DPDUapNahX
 XWPZfYd8jznJVW5+bgWo6748XHpPZUMlm4FQEDRIveic6UKghwxO/dA00D74hxJV8Xi0AUIVJ
 MnxSOwWVUgCwLuzlBig7s00/91KRHThjZidMXxkct0JBuvbIPTKSLIWxJEN6LCPMhlpK6bOcX
 p49FanGjLqdNQl0m8zvy8YnGtKort87G846mRADAwzl58+2870re7SJFPuSzQXjCkSHSosxzB
 LB0QgBTZvbn2hAOAxq/Mmhc89IxXiFjt/fhOfuyFwLw946y+Wk7C+fcVOfR/NUQkFhHXfe/F8
 O9hUTTy+nZgTZNi2QMis2WHSwEIx9MyJ+ZViAdJCs6NrLwnAVmObdh5oWppMw3L5tiEpKHEqC
 dH9zxKOwK0hLiJdqBNe98Nil0Wlzsf/EBQqTesw==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> v3 -> v4:
> 	- The patch v3 sent on May 27 may be lost somewhere in the
> 	  world, so resend it.

Can previous patch review aspects get any more attention?

https://lore.kernel.org/cocci/5dad9b19-ceb5-1606-9f62-7626e5677971@web.de/
https://lkml.org/lkml/2020/5/27/1326

Regards,
Markus
