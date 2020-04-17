Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 671B21AE6D8
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Apr 2020 22:37:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730451AbgDQUhG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Apr 2020 16:37:06 -0400
Received: from mout.web.de ([212.227.17.11]:59309 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730259AbgDQUhF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 17 Apr 2020 16:37:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1587155798;
        bh=YTSd3ujqpHXpkK8wWYxvfna2jgjzJ6SxwO6aJT7M5nY=;
        h=X-UI-Sender-Class:Cc:Subject:From:To:Date;
        b=kO+d+DE0M0KsxQN7J9vFtbvB+2DanmiApTbfSEatTyW7AXiMJywoszK0kpSORfG08
         OAxdoPJYDU5DFcPLMjdgsdGJV6tgIbWXEUtVhe7lAnLMD2DpXGFqLOlJ6oP3gz9N7B
         bjxBsN+1WBxKHzmwf2VqOVZqWLFnvnHqFVzicAAc=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.243.97.227]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LrarZ-1jGAgt2141-013KFV; Fri, 17
 Apr 2020 22:36:38 +0200
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Thor Thayer <thor.thayer@linux.intel.com>,
        Patrick Williams <alpawi@amazon.com>,
        Alain Volmat <alain.volmat@st.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Pierre-Yves Mordret <pierre-yves.mordret@st.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Barry Song <baohua@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        George Cherian <gcherian@marvell.com>
Subject: Re: [PATCH v1] i2c: busses: convert to
 devm_platform_get_and_ioremap_resource
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
To:     Dejin Zheng <zhengdejin5@gmail.com>, linux-i2c@vger.kernel.org
Message-ID: <a64c4e68-afbd-f7d7-05b7-a62776896ac5@web.de>
Date:   Fri, 17 Apr 2020 22:36:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lZoxjdB+9vA/WdlsnG1lyvBsA6hFNh5Z8J7KuaaXLW042JCBoKw
 BSttRxbUNX8MOzR9RXB0MxATRFt0BffT9SJflBn81OJabjWvWslcPhiSykIquLZcoL4Fk4D
 LvkjDiQNsY8McnAwc1ZAK/JNhUFJa609aLyBkhG56Ic2loZt2t2hMXnHwpCENUZ6NfHPq2a
 aBwIXyAjkd6dlCllqBt+A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:cBvMnQPAyU4=:9nzJQ/nHq15r0wmem/Fb15
 uNzvKIg+qh/5TRbSQGXObhu/fGsWTCz+u+LPLCm531YVAQrgBgoJqsL83OoBKzQXdojRG7v5k
 Gm79xlYavk7SqPw9mC2lIFR8tZDrlcZ9oSPtwCyt1OnBKmxLICunKjSZXu7VmR1T1xlZy5LKQ
 DzYSDSaLsXbc9GtA+d24iFhC8gFbOr7mXWY21KB21yYpjlsv6lDwI2SBJ2GR3gER2lpV8kos4
 goYz+4C29tgUS3AB/Jl8wiHxmPrVgYsp8U1grpkIZbL/4Q6JarkjutHcXcqi27M3kKOFgtxV/
 jjwPk8Ud33bKor5y0SraXX0nsfNI017QrfmhJASHuKTc63/lgeTQAnaWmL7yHo/iJA3RrOJI4
 O982UC3rlD/oRDJOwqolduSoRlDKdsiT04wXlyHZrBuyxcoluiY8//zU4OGZ7ZwklL+MWOZLX
 lvuF6OEZCl7RjOnAkXAIwwKtxLHAyL3p6ec34UaKy2Tr8f6jz896OJHqsvg2Puinw6Y2SIAUv
 joDJHeOpn2EC+YfyZBLH8TmkHz5FH4unAlJ7vvfsm/pTAp6aBj0whg4ZUJ69u++HOEdVYugFe
 0l429kMxYsede/kpDcekALZvzIf0kSBOsZewcMtmKlcwuEIjJ+cMGLMGxK/XmqS6gsxAYv94A
 s0CkKsW7dFJ7IH9w7sm020D3Dna2UGnP8gHpYIxbX018vyrsDbFlcWjazlIK0r6KP1wDnpBAJ
 yGYM5mGvsYWtw9kyMbn20AtA+S7YAtnIpAnh7K0/qTN0E1lENP50uRvWXKc4dtmHyI0Yq6WqT
 12ueMME8lWHThfpG6eD908bk5acEAXdAzTm2B75OnBQq7ikDWDF53e5NyNCoG3jZWBe4JISQd
 MVX1e6Qi+fi4yjghtKyG+u7wpFnyQCzcSHs4DOdV6by0iPUqiNcpDBUcGYYkqFBD2dLR4B0ib
 IYGYTVDiS8Viht4yQE2RKEzsscijcKneoYQ512DBXbsX9aWMXtrhx4jPNcNoVmQPb1KpCkxrM
 xqVe1qFpoOQv4zv89kTCw0/3F3xiX8JDk3Juj2cIhSbyZ3uWNhzVZU0TTVYaxhCBt2opjjyKF
 Fezah6KhyjP9Dmr1iFhE4jb4g3kFT0OrFv3d0JM6Hp7yNUv7FVkkOUshJgmBwqvqDTgyuLXlN
 WNZ9uFkIg04Ulgk702uLWtV5OPP7zpvdsjh1kmQS1VnpcBNq1jINYz7z3ufEPCLSl3jFZcPP2
 NfxGr0vA/krLvOuag
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> use devm_platform_get_and_ioremap_resource() to simplify code, which
> contains platform_get_resource() and devm_ioremap_resource(), it also
> get the resource for use by the following code.

I suggest to improve also this change description.

I have tried another script variant out for the semantic patch language.
This source code analysis approach would propose to transform
15 source files (for example in the directory =E2=80=9Cdrivers/i2c=E2=80=
=9D
of the software =E2=80=9CLinux next-20200417=E2=80=9D).
Would you like to take another look at corresponding change possibilities?

Regards,
Markus
