Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F3681DFD80
	for <lists+linux-i2c@lfdr.de>; Sun, 24 May 2020 09:01:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728826AbgEXHA6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 24 May 2020 03:00:58 -0400
Received: from mout.web.de ([212.227.17.12]:34365 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726331AbgEXHA6 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 24 May 2020 03:00:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1590303631;
        bh=Dwiv4seL8ee3C/JloOJp8AqoZ3iVO2A78wPGNVrFh6Q=;
        h=X-UI-Sender-Class:Cc:Subject:From:To:Date;
        b=L0J2hS910OaEKV1Wwqcx1IIuKd45X3S8K6SQ2IipLa3MKLacznvq0WYCnPwVGE/Qp
         VR4yaZyMREH4XJwpyzMs6ClZgtWQ8ilizEruW+7mK0suXGGUv8vGq/Am+QS7W0b9wg
         1sOyprr8fLxMEzyBFFMotLyNWvTNGoG6WwfVzQU4=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.132.187.46]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MidDR-1j8tmi2aXP-00faTt; Sun, 24
 May 2020 09:00:31 +0200
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
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-kernel@vger.kernel.org,
        Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [PATCH v2 1/2] drivers: provide devm_platform_request_irq()
From:   Markus Elfring <Markus.Elfring@web.de>
To:     Dejin Zheng <zhengdejin5@gmail.com>, linux-i2c@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <b0a8e1be-359a-17bf-0eb8-dcf175042811@web.de>
Date:   Sun, 24 May 2020 09:00:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ULSRbIDGYv0TpbBixJ0D35hpO5y9lMrzoQ2VCe5oADr7pOzYlV5
 vwXwranJ0xdJ+1UGm3v5J0PW8LdhVU/gX8aQVwVKik5oVYHoE/YniUQ0rHSdmvgjgngcrj1
 CC8BHzn2RcfdRr+KzOlq6o737rK3+rl86V5nHvA8Csc/PDWvWha4M1Nyy4h7EOnPmn4vJaK
 imDbCJHjNWhbsDgmIYI4A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:GnBOMT+WNFM=:/XNU8XdCn3fwkt7SaukubD
 3XYFxWwoxuHR4sY/EFqR1ujGl0OooAeaGZzA8EO4J7luXRPKxlvBJtvKlUBRVLqLEyYR2hUSo
 OtKThrk8eQxGbvJWcNMxlXCh9faiHn+LicD7cdhyEiIfhf9xu9IBxPUR7mvqHViIBkUEjRYnj
 Lwc4/LP4iMpsrvhCfRjPhGWvrUH2qZPsQXNzp2OfFH/KBAUij0lPljmMQYcBRPRMMcT7TBN5L
 zbYRwdAzQFktYJlfvsPHLKBt9g2KnSQyosG80o+/opZBFOkLqTXWE8khIf+Cav1p/J2PFfeYy
 KbDfmZGaIoeIukwjtKMT2EVGL8UlapEbPQsvN7+PZfKIWhlKESSSm6ezhFMp2GOgE4SgqNsis
 kdBUa4KwPV0ayD+paJiBQzJifK7HswaI28jKJWvz6GNLKPMClM0ZYs2+tUQ4R5OZggRu5pi6U
 VVEbLBcmvhF4ck2el5EYCqMSc68sOOM4SW5VAYVvme1TdG51KmaSZeIRB3GEHqVJtfbNAtQlZ
 wcA/+v3uuaSEt3w3/TZM0sLbYAM58xDKv2SyCGmJC8YMGVr6T9+SUSxsJiwKZZSsPQmoB6f7d
 2CCSb0p8R/29b2c/Jrf0IRS6PYP/R+Hpt9v5IpCUf5pxnZfybnn8neBQIWx8CUvyc1AQOlvqJ
 hkdmZuPwV17oawhEziBGjH5TbgX78UDuwmnkdUY73nlON6Pet1UVxEeIXdeYOfwEB1kR19Bhi
 ZIJzZ9Hm30aFB+RbJ3nCJaiFIKn/Lod3UwQfA2xjk2zFGDhQpzxVV4JTPcD+tG5kHkvbRFueI
 PvSFldOnRB23hqhLL2f/gLAVPVnu9SPjv14yfgtGZudiveipYU+w+MkkFRaWXty6+sOvlAZs0
 D4IJkzLSBQL8T90yJD4xZoWOjCAxevjRIeK0MKJZgNRU1iMDcPHtlKGVRNnt1JLwDmQo/Q87t
 wMwUGTmn9TH3I5+A1AMSVoMAw+9BiRV0SZkvaAYaZen/gZREko8B3oDS3pqc3PBqVUfVfVBhX
 hAsC8tNZFC2nZkn5q1IxpA+nbL3KswMWfFq46T1EUwbzJUZ7SiBk+jbqsdm8ifVtvye6lzJ8M
 0XIxc+71U03OtQ9OZNq0iy1JSL8bHY0vSg4uFZr9wkKbq0W+TrG0wpMugW7zsCeVmQscseUN8
 6F9THKiaWhWWsMUuEYqovSvfBe7izY1bk5SBIVeoDQ5y5Csulnhuh7hG/ffq0yKcsNXA0mqvh
 g1kjNvbuO7aQHGEpY
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> It will call devm_request_irq() after platform_get_irq() function
> in many drivers, sometimes, it is not right for the error handling
> of these two functions in some drivers. so provide this function
> to simplify the driver.

I recommend to improve also this change description.
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
