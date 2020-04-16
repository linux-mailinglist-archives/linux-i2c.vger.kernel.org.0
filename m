Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C82B1AD121
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Apr 2020 22:32:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728298AbgDPUbo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Apr 2020 16:31:44 -0400
Received: from mout.web.de ([212.227.15.14]:43115 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725991AbgDPUbm (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 16 Apr 2020 16:31:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1587069068;
        bh=Aa3FGJK/rdzaKIj3HNdlCWyHINXTzL9KQMZmTe+8lCA=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=TZO9NWha+VcDyyjjEG4bQQPeX5j944i1Nuje2A/ColdDf0439E22qMQaVm9DXcngn
         pnMZPc0i/Ow4poVwPrAx1KQMVeN2fP/R+3gmMp7xSPybXktGPljhxCkT8eAQR5B1/p
         2yGabUu9MPnYEJV9SwnG6+j8nlbnA8OnYC95VPWw=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.48.190.93]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MQt6E-1jp0aL41y2-00UJL8; Thu, 16
 Apr 2020 22:31:08 +0200
Subject: Re: [v2] i2c: busses: remove duplicate dev_err()
To:     Joe Perches <joe@perches.com>, Dejin Zheng <zhengdejin5@gmail.com>,
        linux-i2c@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Thor Thayer <thor.thayer@linux.intel.com>,
        Tang Bin <tangbin@cmss.chinamobile.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Patrick Williams <alpawi@amazon.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Barry Song <baohua@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        George Cherian <gcherian@marvell.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Neil Armstrong <narmstrong@baylibre.com>
References: <20200416152345.23077-1-zhengdejin5@gmail.com>
 <6ca3cd57-de73-5327-5773-e08bf12c4a85@web.de>
 <7713a931e4475294de85b74aca298dde8be4242d.camel@perches.com>
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <2e913d6d-fe20-1f0f-620c-ec37dc1a9195@web.de>
Date:   Thu, 16 Apr 2020 22:30:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <7713a931e4475294de85b74aca298dde8be4242d.camel@perches.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+Yhm6+Nwg1OuLNcDM/Czsc3J4E1e/QtWm/2xiZUPzsh0OBgpIF2
 mKI8x3oUyxezc4DWRgIZsmZPb9C2YJnBLRCefS3/3ZEbOa/5coigxWIMT7hf5Ke1YzJyK9Y
 rLC1BbWLsFuCHar7M8StOp7dcK9n09qcmEZq+D1BSnK8LeZKajdAPJDZQI2Z9Zjn7HVguDW
 ZVtZvd9HxPVl9yS4qxGpw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:fzvbrxAwPB0=:QJ1DEVJoGkE8h1y30ZB6X1
 4MuYO+w9Hi1OkA+ughAUc8Q6mzwrmzbYds5DsnDSVIW+JHQWY/Q4jSe2IjK3R9dBCPAJagQ5J
 cb1GZwzMrjZjsPZO6b4fcRZBXZbyA/o9k3vRzYkyWOLvxXX+6MjYZoE2ZU1Q5htYbePaLP4zT
 +/VPirCoxc+IoFDXf0kMnqvLW1vS0+hxEzeNhgG6hFY+UNKmE3CigcWVPW7XG8KKMVuqDUbfW
 vAxkCupD7AjR4v14BKzRE4pswCsfWpPgxRLEWETyvhnBEK9lgHALd437EFRWxbe/5cXOYiM2n
 6BjJCPeawe4GCV6mJHRsb3ZNPIQpqClQKgt0sqzyFqePDlXLrIxxZOZaGuT+qwe+uQQfTwew6
 htJSGw7wpylkHUsKlwoHlU60zK4yoANVj4mq76zqGaSqYV+Wf4A4erR5v8K3haHWrPjPeSezj
 XTTO7xF0Z33bP4qg+xpldsuAPB6jAQk/p9Y3xG41tiujA1wC1iJhGGhVvSEiEcX1ido+ZhcjX
 wApFQWgTMWLwgu+cnGA64cTtrRujCMk0Xkb+gXzQL8B5uoescuurmb4CLVK9jkJzQPC3vGby6
 19O03dyQxs+cC7PUGJPumGmcPZtQZKo2Zu5pjbQcqG5JEWnm3zf/IhMwaJceNNrhbK3r6h8ib
 Fs81UpCsen3tp5IRQeeTrvwVgkycdfbL6gsmfQVSI9VwOU28JZpxMvdZ87AjkUYJ9qjk1q4X2
 3ybktqr9KAOxxHy2Odbjf8kauuTMDBEhXpW4N9qSDoaySlRfJdI8uFspUtTdoOi/BN+PBaBk7
 iv13xkypzF8VQ9Nvj96whpPrNn72fKqHaMGPNrTraLQb0LSNclY1Bfk1aFnnNq7VkXWhAt6ct
 V5+SZsq/OtBae8zN328T5VguO3gItowouC01NG/rTamI+ToTvlYRAsATYKlqMEYDLLQck5nMH
 M4TxAO2M32sGn2kV6S5o5tEwAjaYAQ5hr/E7W1BnUx+8AyqlGLdZQbkFpTZ1PzIMpu0/fxlAc
 7ITZPTpHJPWUV4AtWz6A3bf2j0oQRGYNPft5gwiBgbIGwSNI52indUmOMk6JYa5+0rN/V5AUS
 EeNXP+43iuRJhFdOEf2w8NSHkCGDD4wdk9isr2Od33+giddphvjgzWMMOAdifCImmj6Upa0Q/
 E+938FXIHll4Fi8SXtIi9ndYcn/V2aukXRyy559oFL/on4SovBLI/MSII02FKpFlk4Ju/SUf/
 T12/LXb822wwlB/2I
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

>>> it will print an error message by itself when platform_get_irq()
>>> goes wrong. so don't need dev_err() in here again.
>>
>> I suggest to improve the commit message considerably.
>
> I suggest you ignore Markus' suggestion.
>
> The commit message is OK.

I would appreciate if such a view can be reconsidered.

I got used to looking at information which can be provided there.
Thus I occasionally notice further change possibilities
also at this place.

Examples:
* Should the first word in English sentences start with a capital letter?

* Which value do you give to an imperative wording in the change descripti=
on?

* Will an other word order become helpful here?

* Can it be relevant to refer to questionable error messages
  instead of the mentioned function name?


> The subject _could_ have included "platform_get_irq" something like
>
> Subject: [PATCH v2] i2c: busses: Remove platform_get_irq()'s duplicated =
dev_err()

I find such a suggestion for a patch subject also a bit nicer.


> but I believe it's not important enough to redo.

Will your idea be picked up for the final commit title?

Regards,
Markus
