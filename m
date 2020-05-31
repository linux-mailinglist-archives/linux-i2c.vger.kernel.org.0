Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02C411E95F0
	for <lists+linux-i2c@lfdr.de>; Sun, 31 May 2020 09:02:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728726AbgEaHCX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 31 May 2020 03:02:23 -0400
Received: from mout.web.de ([212.227.17.12]:53091 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726220AbgEaHCX (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 31 May 2020 03:02:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1590908509;
        bh=Bes+2TEZPDq1oAK0ksVei4tSMgMWJUfoG1iKZGNf9qA=;
        h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
        b=evddwhrSqsePxthyLhy8sqZEDa3wbJXFTvmohzoJzrwzA3ZeErtw4+ip/t0K7wWSP
         hClW1kv9QCuke6GTAi9LzdeMn2iLDWXGLokprBAWRLvgWOoCunbPKqG48Ck8xmCPLd
         GpSjyE4InA94rKVkewfgYJysKXd8nZJNrFGidzIo=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.19.10]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MrOdp-1jAuqI0jnb-00oM1Y; Sun, 31
 May 2020 09:01:49 +0200
To:     Dinghao Liu <dinghao.liu@zju.edu.cn>, kernel@pengutronix.de,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-imx@nxp.com
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>, Kangjie Lu <kjlu@umn.edu>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2] i2c: imx-lpi2c: Fix runtime PM imbalance on error in
 lpi2c_imx_master_enable()
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <845a11a9-51ed-cc7c-350f-b319111f32ee@web.de>
Date:   Sun, 31 May 2020 09:01:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CQuP4VMEn+n2oQVGHRkdj/q7iANDJmKt34SOHxiX7wByub1ixOx
 MHShWkDshDvQoTZmuu7I/0XHZaj7n/fnmM0xKvwgNhZJau1nyuPI9AQE+W1mWnBT5YMq5xW
 PoRKESkk3i/A1j7RxAOZCgGJF9NjIhIGennJcnGJQD1WVIWlnQgUmhzLxugB/YS/2WkH5M+
 lWvE2C5G7l6BtRj7NzmNQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:RCxW8Un7dAc=:RGqo+Cmw81DtNCp8zDrUsY
 YmaKtz4BDBMv4eTFd76tIe+1DunB0wKuZdf3TqnK7jjk1lTDaWS+hjiSe/jRnbmytl4Ii7DMR
 UWsygCwP6J1gzddAgM6uubxrMydJK7QVlYOK9Za75oMCt/RmvEDzq3SBaBAjkft0e92h40UcB
 gwAxE3iY/7KEUWxOhXbGOKLeKJ1INm9PLk3w9s6pmJeGXlacsO3kg7AdSbdlGSaQYHhIOKyti
 5uZ7A31vgSOYtqnSJNUoc0RtudkFqaLnXxwjo0CjeHe17YecTO/fF5LqrI3pJ4ptQ+kVMKcNk
 rkJFG0UxAIjuEbZmushObTg2rXiufob9Rw7Rot8VtTPBg9qx244cF+lGw/HTN+H/sxqY2USYi
 PNvbwEcvvmCiPh5YiYiChV8TtFd3JZj5jrL+di+qCHACn7SGHxgDGDB1q2AKFziC4bOtsddxB
 68u8Yhb4o3M3rh+r8DbwhNN90O5EXc0pyQf93lGH0SNaxRCkOU7nAZOr3iCJHYY4kek9EkyDv
 3+MJUbBVbF5V2QyYX9D+cAy3j5Vkz9Nsb7JMxPOWWTnMAg6DXte+D8p6CudXow8dhAu0rV6HK
 SlTeNJr7Baq7BGzSGE1hqJc5RQWXh3quYcF/Jot20oppW4uuXWsGyVty5c2aoe9KiRfwtnXn0
 NOfjmHeXa1q58DJYkIspWU8pf94IRx+6pYtRG44ty/TpXEKh1kEOqmLeKlHbsUdOGKbkjiIu5
 3Ns9MgN+DYu5eIe1kSH7VhQl8cG/94pNwjlHfTEzUIGuKAGpOTEb+YZGLJFWQzRkHxnUR9nae
 jZjQSTmsXgjZg0oKGlYoH9R1PnqE7vn+UGM7E37c3c8LGiPieOBD+y6zyVlDzwSBxgmfyVaNv
 4F0re5xz3icCooOcoQg9NSyPLTxt+B+dfg/UQluJR43aM/2EvtpGJf8D3n3YmFmBq5xsHkmXq
 +KhweiXORMKMmAGSCQRgSRfRt63eaNctYIojHkbUS9QrMSNhGuZgIsBxqgGrETtH7W/5ldQyQ
 00SN5gdcPxGTqokJ85RPlhA3om6tsZfvqxEJ6EIaVMa2sj5L7TpvpbGegwWk6JNTCnvcDIloS
 bEaCZSHneCfcI7xwxCJNNzpR9bvcQcVdI86i7v2Iuzoesltjkeo9JJtaXB40GAey1/a1tjOnl
 k9mHbdUXetfLFBZ7ZpXQnunfwxMLGO/QR2cx8Tiq03MSpehfYCyGWG8ziMQtep/SXVyXqPA7+
 pnkfiQ6gbDAkuYCaU
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> pm_runtime_get_sync() increments the runtime PM usage counter even
> the call returns an error code. Thus a pairing decrement is needed
> on the error handling path to keep the counter balanced.

* How do you think about to replace the word =E2=80=9Cpairing=E2=80=9D by =
=E2=80=9Ccorresponding=E2=80=9D?

* Will it be helpful to add an imperative wording?
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/submitting-patches.rst?id=3Dffeb595d84811dde16a28b33=
d8a7cf26d51d51b3#n151

* Would you like to add the tag =E2=80=9CFixes=E2=80=9D to the commit mess=
age?

* Are you going to take such possibilities into account for any more patch=
es?

Regards,
Markus
