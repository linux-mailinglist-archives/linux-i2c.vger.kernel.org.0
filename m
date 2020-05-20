Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED0151DB251
	for <lists+linux-i2c@lfdr.de>; Wed, 20 May 2020 13:52:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726691AbgETLwl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 May 2020 07:52:41 -0400
Received: from mout.web.de ([217.72.192.78]:45529 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726224AbgETLwl (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 20 May 2020 07:52:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1589975555;
        bh=PwIzsgac3fZ2pv36DcN1rKhtcfH6APFMURzNXOaB6XA=;
        h=X-UI-Sender-Class:Cc:Subject:From:To:Date;
        b=CoYWaj4vt9Ik1CXGCsnv8NVH8y7QZYJjO4E4w6laRH07OYJcutgl4RXmp6NkSEJvn
         1ipWUmm+K3RVOofrK1UzomBn/UyFpHj2N6qWfcosVRtedUOWMaVvdGN0I6WGfL10gk
         tC16znk++CUYUz6F1akFN0XfWdJmflwj2eg7rRnQ=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.49.152.26]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LwqJw-1j0C0Q35vk-016RXv; Wed, 20
 May 2020 13:52:34 +0200
Cc:     linux-kernel@vger.kernel.org,
        Michal Simek <michal.simek@xilinx.com>,
        Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH] i2c: cadence: Add error handling for a platform_get_irq()
 call in cdns_i2c_probe()
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
To:     Dejin Zheng <zhengdejin5@gmail.com>, linux-i2c@vger.kernel.org
Message-ID: <b5bf30bd-e630-beb6-e860-44311204c264@web.de>
Date:   Wed, 20 May 2020 13:52:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:t6wxxFBH9WVRYl6tU1pbFQKexowPiufsKmW3wT+BENBwS4S3zW7
 jMsERgiOWAdv9SlgWLaj4rEMnz4UYdJX76VECgRdFK/xhn+8eElgR+BXLNzHRVRsshM+82Z
 arq55KCJ3S8tlhvY24rG4kq3+EPQdYIk61WaKFuZmxMvazm2FFVPm9BnJ4Wrl+BvmuHGxrL
 Nwb0MdxvSK+6v19WhCbhA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:IwGj8gBUWok=:vuUol08s1F47G16/+FPNCk
 pdazKl5SzQagB2KmpoqAo/8SJKPZrNuxrkCXFKvG0Ar/zJq+oV8QNsMxzzc1vNp+RtTgohA3H
 shOdBVOSh/5pXAD71P8OUe9q93vLGIp7FRQjpeSlewS/5ISmA2LgYMz1xaNmdBwJMaagkOaF5
 QyJTv9bZpSo9Lubte28bjO9QkHvD01PSyKm2/V4PPQuFsr9zGysKBvAM18sFTVV7PZ8LEZXpj
 ee7GRIuCK+M0dcIDZAOhP+taxxvGEUZQPSqj2ps6K7EMdaDGO8Hxlqpu3PogCtqbSaGiXk11x
 4g3RYmVUZnEDfeW3TfuhHjfvtuB0GvGsZZQ5Oq5yTPtGP9jbmDacTaQgaUa2mHdTTT3zO6NdG
 QySdxKbKlDfB6czA7JP7Os8sH0xFr7muKDupL+XH3YgX0vy3wB+CfOm7oNdDnPpM53cV8/Y+S
 /6qZTadV0W2BfiKlV2LxPjcVCJ5xn5z/cl051U8yvYjhQMVegT7zOHcenc7Ffzk4WZzbvMU9x
 Khkkik72Q93PzLxQrENqdI+PVovZVLbDoTbl+Rsn8dDEl3+inuCUOkBn3ScrJ5cOcHZjpSLVw
 /PCCF8pUnDkXCxtEumy7EElDfjjPXAqicgX7SAm8oNa2CCMfDgIsQFKSWmOFX9aXG7CjGEOSH
 BtRlt/6QfBAzFrTt8pmuM6VlwJnBUuD2yPU+kwaBDPdN6fHUGUHwzBvukXMffk8ajQR6JSUEH
 z4sPSnGS7Ecn9eLJd5oPyEUuD2Soxw2xdTwubuVdznBFaUCyv/n86TNjPrCuTmpCnNdr4arp6
 9QHAQW0P9qreAIX4yk2qasPmuyomhER5E4htwlv5YOU89x9jbvs8TSUfvIGdtAPAtgvN0wbZ2
 OlRj047cJJYhxbguoSal5KZnKIvZIYsxhTfg38LvI61P7FHvqYAbu8zvXneONxRnvhIzFefOz
 23XN24alJsJMQTelFgACtHiogmg1/Ms2So+/Rtsgdg1YKIMYVMKXIBYO5KMYL+AG3tM4wKf96
 hi1NJtE2mYXotqqXc4+yK8SGnbps2bB5EPiwACu6LRzhmCwg24hlej+FyC1Be8qQhFStW61B+
 uxWSnfdtSM+1fsM2AgEze9g8ZRclr8ci+PST5l3NhYvrs7MwX8NcMvYv3mz93A3ccZPw02vQ2
 J0/cnjbUj/M9Nks1m8eFEm+3hmu+7XNJz+xN5CZHMOs4U/23VATRblVhLFasYCtdzqg9AXpkT
 L93T4BSBKxKesAnS2
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> The driver initialization should be end immediately after found
> the platform_get_irq() function return an error.

I suggest to improve also this change description.
How do you think about a wording variant like the following?

   Return an error code after a call of the function =E2=80=9Cplatform_get=
_irq=E2=80=9D failed.


Would you like to add the tag =E2=80=9CFixes=E2=80=9D to the commit messag=
e?

Regards,
Markus
