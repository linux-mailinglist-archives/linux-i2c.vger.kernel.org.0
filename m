Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BCCC1ACF8C
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Apr 2020 20:24:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729376AbgDPSXV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Apr 2020 14:23:21 -0400
Received: from mout.web.de ([212.227.15.14]:44243 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728301AbgDPSXT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 16 Apr 2020 14:23:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1587061363;
        bh=7hgZ/Tf3+q5j/rvQvaLpWoBIha15dZOTdu5wTOrBESk=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=MSBC+aCiIih9UlYgmHR63ihAr8EO2F7DoUP/8P+PTpKD+c/0JpWoMwXlJp5YuTU52
         1lhKHf+GQiblqKMziAbrABtMtZQBHLCPvpbQkhXB82S+8yah5OXZDn9V3fKhFl5oeq
         cJq8qA9M0Nx60zHQwStaoEullsSrgmGRi+36Jm+s=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.48.190.93]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0Lhedd-1iuTEB3MED-00mr8o; Thu, 16
 Apr 2020 20:22:43 +0200
Subject: Re: [PATCH v2] i2c: busses: remove duplicate dev_err()
To:     Dejin Zheng <zhengdejin5@gmail.com>, linux-i2c@vger.kernel.org
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
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <6ca3cd57-de73-5327-5773-e08bf12c4a85@web.de>
Date:   Thu, 16 Apr 2020 20:22:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200416152345.23077-1-zhengdejin5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2sqLQetzPfhYfcf7Med1YU2CozR+YlwZLVkoGIyBLL/3QG6rF2O
 42Y8c2Sgs/4H18nGXuwdltKVJpiMcv7FlEzZnUFW7+cbRViUVk8p7VGl73uhdXzH13HSaw/
 8E7wSDJshwxzlHtIfQAXZPD3tcAj93HVvq4YrgvtqSYGjqK0rracFVnPqB9RbdUDl/iGM7H
 Dk1qRwqjQ8MRtT5nAs8ZA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:r/OR/KTEss0=:DMYhKuxJE6WsoCdM7q1YEr
 GUsxi3i3HFmZZ3sCs/22HW34/xYcnR4vPY9jw0O1uTm+QJbxJJaGpT27oc3YZR6M6bROwjvF1
 uTAFF6OLwffam1Wmjo9T2mJ8Kh3yKuKC44+L5rbkwWOGY8tBr5/LuyT28nTlOLunXgWfK4p+b
 t0DZOPN8kcQnco75ljUk2dms2ZVnv8EKdkgOwO1PK7mi+OyRe94oSsUuVuZ4exm2MSlkfZNve
 St8I5VVascjbyACWNU1cxygufz/pQiYTy44qPxCTQvOSU1dC2Kt100yAmOcjhw3y+Bm+GKUnr
 E+Oe2DTN6KCjJHxOq4K0eC4+KvKek8sbnUu99GvbRz14lR9KYHUlSzXyBs64KqdDzfjv0Fx80
 2HhhcR1g+sdgKrn/Yevzdq3qWCzsn9n3AQSIuSHCS2eMp2EuouAdmzVI08npoqjga7HP401aW
 gC6EwUF19HwhhcpnabrihNc5R/QOzV4o1OerGW12mQbFqLszg0dPzKG8rPb4MTgo2sIgXAF0G
 HntMyb0FWY6gHTP3a7ZVAFpnI4n0Q9H9z0J3liLT2M/F5c1GgNbhFpsYf5dzosY1dd73h0H7K
 /IX+CepMajsM3hribSt3ZFR78V9AD2wSStvuULzn4OFEIlhIn6f9cMrPx+FW/PisENovC3jH7
 o9vcM80OoRGNx9sDxDE+EgMBjjVS6E7MPGwlll4thu4ASTx6WJy6MlgR2YRFfuVtOJgPLm+97
 oXgqN5HSU1WWMKNV+CSRoHJF0+YP7Bi1Biauh1jKHPB+gAw35WWTLZojdX5IQ+GwdqaUgNFWB
 ZFvIbPlYZK4GDTS11kR0j3vHUCV3uW0WlmdRHLLZZOztGizaf6iTm86P62IJuau6aTmKKsMUq
 RWFd75J4fj4+/oCplSYVbtoy2BuoOLotqUiUhHmlndKP/yfCnfsBr8vM+or/LHCdPwl0mIlqg
 rzWK5p7vXcs6tsXFukT37wskpMruRb+xOgRdTzDaeWLLGdm1EC1upJ+ArGBcso+VppJOcpvh+
 zGbXISemPA7SnDWGqgg5u9QI37EUfvAZs5B2Cj6nrmI5mtkHB6lK6qeWC3qP2bzhUi0GIXxdX
 P7LoHQRQbH7OpYLk9zsRd0m2XNBHL47vubKJsEWm25qjwNjJO5AjgDRj0gsi4k0FFyxoZOwXj
 uCrAsc1mPSOA33sHPmWiNkyZE5rsFQ/CBm+3/1QccqzWVPrfMOizYDjSWL0NvhFy/9WLCe8Zn
 fED/TfYGoH5hSYCub
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> it will print an error message by itself when platform_get_irq()
> goes wrong. so don't need dev_err() in here again.

I suggest to improve the commit message considerably.

Would you like to integrate any information from a response
on the topic =E2=80=9Cdrm/meson: Delete an error message in meson_dw_hdmi_=
bind()=E2=80=9D by
a contributor like Neil Armstrong?
https://lore.kernel.org/dri-devel/54e0b6e4-4a39-c567-7355-2b2330a95294@bay=
libre.com/
https://lore.kernel.org/patchwork/comment/1418937/
https://lkml.org/lkml/2020/4/15/186


> v1 -> v2:

Will a version identification be sufficient without the arrow?


> 	- add 19 similar changes by Markus's suggestion.

* With which search tool did you find the presented update candidates?

* Will a link to the commit =E2=80=9Cdriver core: platform: Add an error m=
essage
  to platform_get_irq*()=E2=80=9D (by Stephen Boyd from 2019-07-29) become=
 helpful
  as background information for such collateral evolution?
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commi=
t/drivers/base/platform.c?id=3D7723f4c5ecdb8d832f049f8483beb0d1081cedf6

Regards,
Markus
