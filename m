Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 133721D8829
	for <lists+linux-i2c@lfdr.de>; Mon, 18 May 2020 21:25:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728052AbgERTYH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 May 2020 15:24:07 -0400
Received: from mout.web.de ([212.227.15.14]:44749 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727856AbgERTYG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 18 May 2020 15:24:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1589829816;
        bh=4p69O51PNXbOaGofqEGICiYCEctSXqV9dh5c7B6HOXM=;
        h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
        b=JiXE+5asY0MTzWVDisXNQLLcskDxST5m92wm2H4ORk+HTbRy0+2dmBuKATt9dNo2c
         vSnGv0tu+z6dl5d61aDgQzgQlh4IFl/gMv4Ca6SF87+9eR9Esgh+jn8WfiiPyyIHmx
         rpyfv/awSoQ4L+NrPH+KKskjKjQrcTqiVzxXLWa4=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.132.105.123]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0Lylol-1ixm2y46fH-0167qg; Mon, 18
 May 2020 21:23:36 +0200
To:     Dejin Zheng <zhengdejin5@gmail.com>, linux-i2c@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Cc:     Ard Biesheuvel <ardb@kernel.org>, Barry Song <baohua@kernel.org>,
        Baruch Siach <baruch@tkos.co.il>,
        Fabio Estevam <festevam@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
        Kevin Hilman <khilman@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Radu Pirea <radu_nicolae.pirea@upb.ro>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Ray Jui <rjui@broadcom.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Scott Branden <sbranden@broadcom.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sylvain Lemieux <slemieux.tyco@gmail.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Zhou Yanjie <zhouyanjie@wanyeetech.com>,
        linux-kernel@vger.kernel.org, linux-imx@nxp.com
Subject: Re: [PATCH 1/2] drivers: provide devm_platform_request_irq()
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <e679788a-d616-a45d-f12d-20485aad2f43@web.de>
Date:   Mon, 18 May 2020 21:23:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:dtjqk0vd7wSzBubXB3rn+UWKtMvfrfnVBwPt0yEKLNN59noL1nk
 fucEjf6s9fc0jz8bf0GHwg2gGsev68SaTaqobO4SjID/YWvX9p2efb0bsZ5YUBSdfR/juhv
 pNxs7KkFcnoVktsOpzHm5TH3pe9Zfc+dt7m9Zsh0EvDq5hSvE+iGvbB4IzJINTUUf5jJxFk
 bHhjY1KYlEiY8nygVTxuQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1dxI5VD8FLc=:GsTzuLVZBGzNVnNHXhsyE9
 vG5sT/SiA6JZ8cykx0anlo3KT7l3GeYm5qomVy7VaEhqYpa9AMgDNJkv6+6zIaAS33rOyDMxW
 b+PikVLNRWgCqAv/1fEE4PzQ1U9LK4pMzjLC4kYI4oQeHwj7yHSYFXpXHLWhkGDt47sFw4/Yk
 b+khY1ex4ufytIebrnqdXWEyO6X7uDK3w4y9P3FLtrpGXiufB3zGRHz6NojORnoiBhQOYuH5V
 tzhtB2UcmaPDXebvikI17p8CawMzp5wZacYPaDB8UoAGobV49v7B+rBz0UdOPLBIfVSU8a7rA
 KvBgcm0WYUa94OLCyxUCE+NAWKmcmrvo+ZryfB4w5ayfwCN0bOGdbN2/xrTMWqtQJ/Q7kbFQF
 GJdhHfomDJ6doMQnPhw04zbQBl0/rTgnFjzTAo5DNPI9CjdFceipZEeN0v4jr6I+cyr0YCaSR
 bZFC2Ua2xqw+BjjPCUqOoI716y3MrbVwZlcToNdbrJSiG9TRfvpDrgm4jbMl1n1R62lnAvn3U
 OsFxlOUaqxsOGszqaRQXKG6Z39QlbgjL2s2ouLKVSEi3qlykm3BIOJKF1WKpmvKhMRA/4hC38
 LobehJigE+kHJmRvfO0tZ7Ip1mFDMYtCOiuwf4tgVdDJuEZjsDrasPQFDIKRm4ijBIbjXCS9G
 dknf24ug98J9qIAxMvtjXH+BkRAPJGo2/6NS4aCy/36sAS0Fpvlj20+FtckaHHCOy4ily8rhy
 ROoIZ9TQ0+zUEf3VKcj+/EYMC4m9/WIee/Mx9KHf3trS3rwW4A9JxJEc11IvcNayQdWLs11e5
 DnIJxq3kJ7hFk0rDGEHr97vS+ld+fpdCvCNtJjn9S/V6/K+wokBoCqRNdWDltYfGXANaxLCPO
 68s97e1pn28QdI+cAVcDpDdgccth6793+6kdY8l0w6T45MJbgL0eOHFekOoEPcXrNfgxAS8oA
 6SlqlNdMWoGf5OAL3ZrzDwemEFNCOh9VcT3bpezg4m8+ky6A2pVkyFVvdYI6tBji5NW4oAY+W
 /YoeTkr4+8dtwRUvEI6U8T0ueQE3t7b8Z+TCOOHzzUcao/fVsVGshR3gPwDDPtjHx/iyULSeB
 7hm+X5FawrCag4RNwUp789qtDmwbrqoLOOsgDstWlPhlVCgyYZGVeRG0RpjhYtW7Oaf7B64JQ
 VYkFercxnEtx5pcV95LrKhN9c88xd/ld3kLmrtWEHOhZt+3AaApu0DixlDk2Cd+zXzs+O/aWm
 nTUSIzqD0UVH1JVpI
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> It will call devm_request_irq() after platform_get_irq() function
> in many drivers, sometimes, it is not right of the error handling
> for these two functions in some drivers. so provide this function
> to simplify the driver.

I suggest to improve also this change description.
How do you think about a wording variant like the following?

   The function =E2=80=9Cdevm_request_irq=E2=80=9D is called after the
   function =E2=80=9Cplatform_get_irq=E2=80=9D in many drivers.
   The exception handling is incomplete there sometimes.
   Thus add a corresponding wrapper function for the simplification
   of the drivers.


Will a companion script for the semantic patch language (Coccinelle softwa=
re)
become helpful for further support of collateral evolution?

Regards,
Markus
