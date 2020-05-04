Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 067961C3960
	for <lists+linux-i2c@lfdr.de>; Mon,  4 May 2020 14:30:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728219AbgEDMaz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 May 2020 08:30:55 -0400
Received: from mout.web.de ([212.227.17.12]:51955 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726915AbgEDMay (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 4 May 2020 08:30:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1588595426;
        bh=4vtckfEA/Gm+6t8z2cMn4aydD8EVKVyz7dijkkXOO7E=;
        h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
        b=J+lp2Lu8oTLdScCp4N1xYAmsWaAeBEaNynd68ALXT3T3rVQNhDGqH8WmD00/LTl0j
         RDwxa1obRgZzw+ff9MZtW1PHNUgLeeXXOsy/igbzr4TRHMEaQPJkyo7D2Krx0pDh4U
         DyZiXxqmf/AuVAmIUu/556c+FdzFq7KofIQiRlsw=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.133.152.69]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MKa2F-1jXVmY43L5-0022S7; Mon, 04
 May 2020 14:30:26 +0200
To:     Aishwarya Ramakrishnan <aishwaryarj100@gmail.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Baruch Siach <baruch@tkos.co.il>,
        Dejin Zheng <zhengdejin5@gmail.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Pierre-Yves Mordret <pierre-yves.mordret@st.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Thor Thayer <thor.thayer@linux.intel.com>,
        Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [PATCH] i2c: drivers: Remove superfluous error messages
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <9ecae921-be46-dec0-f62a-f388740b03ea@web.de>
Date:   Mon, 4 May 2020 14:30:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:82XsyLyiADQjPETTZUXqQDyUj51NmnSRLUZ/CUItTRuhWhb0zPt
 tCFeaYfqeXeStYyR7mzvhuhBHFDlIeaMH7jVwDEl1YkzZlnTktLZV7lLAodSZlkdjRG9zyV
 4gV5ldHjw92kyo+M68xJZXhPZdozkZ4DIEz7aehAamR5HusyBx+JdJ70YwYeT43w/kwe11o
 Xzm5NDnrqrtrpNe1Jcv8w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:qBm+VNjh1RM=:uZCCvUWfpo5r2gu8R0umae
 zzOKBSV80kv8XocS1a7mE0yugGxjJLDKsOAd7RQHlZMK06IIwayXMc+g/CyyBZMWK0MFxX1NW
 PMDGv0tQgjt8eigYOZVWOsHvphWpOvQZJ6GsiDE5crXoMuXEPfz+fybMXfW2rGAuDHion5Xm9
 uun9WzVh5e8SuhsWv1W+J+m6W2dCoajZn+GgqmtopSSGk5F2M/77sGIMb6bkcMT4hO77Of40B
 1yYNs9zMP3KLetQzvEbbf41X0KDvhECMQ3IJbRfOK8Erk0Me7SR4NO2UDmLBSycqj8jVGSfPv
 WZbPMCsBGSIJl0uhGhRzWNGbjTpm7Mw3Glx/QYGDiUz95uzA6QEVyIbymET71BbJo30ARiZ2y
 00Xn6gNQiJgTS7GBWEbhLQFtBV6TtBst3ebY/y9Xz+sJw2ZnGIyV1Lr29oCgFjyCDCWDxTYlZ
 HPHEnR9a4N6wEerSgaWHJMx07B463MrG5UOCAS7SyUeU9oiEobXDf7GhfbG838w9rgEIqbTw4
 zdV4u089d97l+Y0ZQqv3Cait3eHrmGUhTV43N7qohvt++dEb0Wf60tCdEp6eJtZ3/RohYYOZ6
 szaxS5lI7qTaKTKWuNEJvxxZvXJUCJfrIRzb8DHbtYHh6fXsswMUOveYGVC/0A6bEOS1wsWcw
 iesJnA6FhjGMzUAcSCuwJ4qbLXbBGp6wOKvZape/R9xukkwQ7bLb63OCxYpaEpru7N8/tJlyd
 ZF0gTUKOfGPtsISZpSMX1oanAU4UxsjrVLVlRsLbzw9pTsFDpHIVg9G1/DO02IifDEkRlju1N
 GXYXyzzKPQ9vFEBQTikBzCb/3DYXnLuTxahGMqk7o/Ent25POL0UIHYY7vgj4I8AiO6Ha6QEt
 trbHiWgCESyolIO8ZUDb380AfAycJX9hXI2puar7t2V4Xdrcb8/FcU3O4Qeosb1rYGMVxZ0Zo
 A1SH9e6L1FyeecXB5vnTSap8sVmcKxKDbZ3owQNHcHczcAFrhHxcnvXBs6OaW51FL3wfNw0Xu
 BzIyDWBBVarj9x64uLI8VEZ8B/uiG/1pJo9zoYMu+41XZR74dGKZR5CJlOGcP/sONqVm4eTHU
 lk6cD5aF3VzbRkc2d2/eqDApYdIcpzV3apLGTUjSYz+jtp3iPuMwzpe20WQkdaePw67hWhMfP
 4RwE1SPR7M+j6VPZ8ks2W1NPNvYiZNAQGpcWnqF/wdEvFIeJEzSqoHF2z1WC9g4U5tUBP3E38
 t9q/42j45WRUzIhbG
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> The function platform_get_irq can log an error by itself.
> This omit a redundant message for exception handling in the
> calling function.

I propose to avoid a typo in a word of this change description.


> Suggested by Coccinelle.

Can an information like the following be more helpful?

Generated by: scripts/coccinelle/api/platform_get_irq.cocci


I observe that a command like =E2=80=9Cmake COCCI=3D=E2=80=A6 M=3Ddrivers/=
i2c/busses/ coccicheck=E2=80=9D
points only three source files out for further considerations
according to such a known transformation pattern in the software =E2=80=9C=
Linux next-20200504=E2=80=9D.

Regards,
Markus
