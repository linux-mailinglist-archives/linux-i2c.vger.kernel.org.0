Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B33585E0B
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2019 11:18:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731755AbfHHJSa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Aug 2019 05:18:30 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:47895 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731038AbfHHJSa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Aug 2019 05:18:30 -0400
Received: from [192.168.1.110] ([77.4.95.67]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MNtny-1hgC4p2pVQ-00ODOZ; Thu, 08 Aug 2019 11:17:55 +0200
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Re: [PATCH v5 0/3] Enable ACPI-defined peripherals on i2c-piix4 SMBus
To:     Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-kernel@vger.kernel.org,
        Andrew Cooks <acooks@rationali.st>, linux-acpi@vger.kernel.org,
        platypus-sw@opengear.com, "Tobin C . Harding" <me@tobin.cc>,
        Guenter Roeck <linux@roeck-us.net>,
        Will Wagner <willw@carallon.com>
References: <20190802145109.38dd4045@endymion>
Organization: metux IT consult
Message-ID: <b013c33b-da11-ce5e-08d4-0b24a8575109@metux.net>
Date:   Thu, 8 Aug 2019 11:17:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190802145109.38dd4045@endymion>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:fDJyaJZtVxYv99ekvBH+6b0TBe7TOwbHfnLSolHa2Jg3X6OYlah
 Us+9njVqv4Npt6CbAvSUMzJKv6321IqRYHUJ0p6VKGQ7omN23XDrkZF9fIv2VQE1Fr4qVcb
 Hcl2XMTfAdOD8VjItWugPh3tMpNy14L1M3AjJCFHmJU0GEMAtjpoM0XZ5idlNtiYhnbLYKD
 IvBjYYirMJ6V3ABaSkipw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:rzdJUnUhmGE=:dR0Vz8X/m0DWewyWZSxygA
 +oDC7DzsJ2NdrDS+ChQ8U5ZZFiVbCVaHqe7aWYqqG8rZr/0tUgbv/QwBQXxvjHzjqW8g5bvdQ
 +N/7phO9Yus8GCdN+5pNPU0IhNyew2uqR2LkKG1Tuby6n/2Ixj6j4kVkjWsw8ecy1aCcAc5/S
 eSqD9TyLcUk4M+GLnVfJxNBvhX/gLIUu4lRICqgDA1bXxs+IQzl97LUwJKhs3r0vqhoOPNEtl
 sD4zQnxjw5kQRtd32ivoS7A0OdpWzw85Cv8n3ipV/3OIYiJVz/PoTmDFDEzcEMHbOereHbm46
 LnUfYMAYAl+Ahi5q76r2kuy+67goi0kncXnOlrxIgkjwaGMbdISx/5lZbb7fM7UKFMWBmsPmO
 g3DYc7Etev5D4Ix+HE/gI69ZqWXMObqYrS6zCEbgVEIZScUAJsfOnEolX2F+JyB9CcF1o4hbN
 HdRY6sPJyrbz2FHUiPs9ohArmEkW+g1TW5qCx7TowTuwQQsGo0eUEWyYEzYjs5/QqDVDQcv2r
 bPtZDHHJI0NAzzlNVTOmLlulZdFZnrF1pu7OT6vhYMOoddUc6Hdfxob59Lraoa4Jo9glmqPxT
 qXl65kwtlR0gI8E6F3cSWVnoU1QSUVpPhW/sJIvK0d51EFlw/v5bMzDCkSKV5ys5mHyFrzAoY
 h4o967Ty/ipFP/MM6Hwy49J41CFqJAyOWy3Op5VZQmnEwFQZAgJmtEz8SRxgmDmFpoNoDS4Qp
 LuvL03KLpDOA5u/zl+F1wUud9vj9WLGGeqxlU1q9ft4CRkGnF1Fw2zK69uM=
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 02.08.19 14:51, Jean Delvare wrote:

Hi,

> These patches fix a couple of issues with the i2c-piix4 driver on
> AMD Family 16h Model 30h SoCs and add ACPI-based enumeration to the
> i2c-piix4 driver.

Can you tell a little bit more about what devices are behind the smbus ?
I recall the G-412 SoCs (such as on apu2+ boards) have an Hudson inside
and fall into this category. (I'll have to check when back in office),
so (as the apu2 platform driver maintainer) I'm very interested in this.

Does the probing need some special BIOS support (or do the necessary
table entries already come from aegesa) ?

I have to admit, I'm still confused by the AMD documentation - haven't
found a clear documentation on what peripherals exactly are in the
G-412 SoC, just puzzled together that the FCH seems to be an Hudson,
probably v2. There also seems to be some relation between smbus and
gpio, but the gpio's are directly memory-mapped - no idea whether they
just share the same base address register or the gpios are really behind
smbus and some hw logic directy maps them into mmio space ...
Do you happen to have some more information on that ?

By the way: I'm considering collecting some hw documentation in the
kernel tree (maybe Documentation/hardware/...) - do you folks think
that's a good idea ?

--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
