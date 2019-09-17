Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A87CB51B0
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2019 17:40:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727923AbfIQPkV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Sep 2019 11:40:21 -0400
Received: from mout.web.de ([212.227.15.4]:34575 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726038AbfIQPkV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 17 Sep 2019 11:40:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1568734815;
        bh=Z9bctWDpIcLF5jbzZ5SjGhI21IDVR1k5oXtZh1NOdNs=;
        h=X-UI-Sender-Class:Cc:References:Subject:To:From:Date:In-Reply-To;
        b=k65KTPRRxthTWsoZUn3AK5ISS4SCl7IKnsMHrXYn/046Wj3HL/cPAa1LVKjukwEza
         /LnGjrFbNcYPoP4ZKHHs8x3T/xWsVHnZ2saXjeXpaV39+MW/oig+nsHJlRehWN3fo1
         Z5fQ5VdXh8YbtA0Dyu8OLoPiDNlfCunNZie9RukU=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.244.93.51]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LhhVB-1hoL6c36mH-00mtmE; Tue, 17
 Sep 2019 17:40:15 +0200
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20190916190254.GA14207@SD>
Subject: Re: [3/3] i2c: qup: Use devm_platform_ioremap_resource helper
To:     Saiyam Doshi <saiyamdoshi.in@gmail.com>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <c24065f1-2692-9529-d505-ae639ce5d271@web.de>
Date:   Tue, 17 Sep 2019 17:40:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190916190254.GA14207@SD>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Gn6QLV8IyYo5OKOfLJia/XY5aC5iB9OCV413m5JqvDAIrTOfPC6
 Icn1nI7tVhw4A/mYqFZTO4BslXNuK6/M4H56/Jouc+r9ej51e+8gnDFrzPIuHcx2+PXspxk
 olfWARZBVZ1adnEDfDLhcykLriZ91uc/EujaFdQR6QTmAjESmaH5XqJ2HQhABrrV9z9Lodf
 JTb32xVqz602I1LCryqmA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1RPp9Hf0kBI=:wXZjz1fekG/GT9XA0UTJme
 LWrQvDUBVNQ1XYyAolOTBh61Y0shZjn+69NGjFm3fuKSXHVjKiABl+t8/J6Wg0pAI8V1SUMf4
 WtpU/86Q3tA0YUIQqdgznTPa/Hkfb1Quy/5PeMLtX25AUlNieHSHOg/ylDm5mzmLKTqRZjDh1
 lX2mHe78w2vTuaXLiElvfGz8yxQhWItg0V81Wb1AMYC/FN9nNkRJhQFEiEcQgZ3xtFKd5XK1N
 fryujCzDyYQ9MgFEq7DDhu91qCkrMmXgwhrsWbv+9zAS39MKVu2zd6+nLpjn8xXFPjozxB26J
 sR/PT8PpugHUS5/gBBuVtwb8nmyJV48TRdK7DlFjiazTIFyfJrlPryDGLozkoaRHDzuPN7Ht3
 1/13V/qgamAitST9ADjeCSjek5p4Cu94040gcb1JYDmDBh+aY4rNCZ3tXAjKIdIvNS9tmy5K8
 XEr/QddckpuLqaEsE3PoIqZYzAJ+hnOdu71wvW47D/KuCv2t0Z5I6452AzPqv0JHwDfswqXzC
 sAwQMc38SgX2AgpCOdT/ajIfOU/wA4lqxDIs7ii9QhYwfnTpS1vkS/e9glk/CgaF7K6STMupT
 h/oR8XZkhd9eeVcy7xQhnAiYFgJYEm/Z3KQetPnefvRH6QIQvO1BrscWjSXZzAZTw4c4MIFxA
 tiSiNeooMpDi4NarG091RWQBe4GA1NvcPVNrLTBBRcSE9iL/wnzFwOnwXA8hykxeGoZ6LMou8
 +lBYw9SUjtOQy08OEwsIxdHDVN3gCezqzxiq7Dqjeay+gieSFcf6OYLgIhDszS1Rwfs1cnIew
 DoYd+bRQ7htUTiZU0Lg8FA6PrJWte46cpuGeFZtenPVPgHKzp1h5pW/EyVu3zDT2wwOl705rd
 yspkt78zIlZ6d/qf470O50frESlyFnAm26R100gFZy0XIBBcvpP7VtFlBZTF7I25l7NBoHiPr
 I+hHcPVVKI70TXM8vXI4X3CD3bNbkDmJ9Pwz4k5KigSqrsEUnfl68zhNkATSYr+A6fDtNiOzw
 r+YqUWEEGZVYtEiYqWjxJXnPVb+FHTr2h944mxUfxku1EWKVR8jAB2yJ5Ww7I3VVrN7usnVQh
 i+Ebic7P8wtnCHSSgyGjrBqpzTmRBJx0dDupyQP6qMRJE8Fp0qi35SHOJya9XNeqpS601G6Fm
 D+qViRccuNptE5f+gRkWvulqoM8zGRo+I5SBP9M4GXyi/70FB2SdHT/ZRQsdSGoknxnC4DKoK
 nZz8YcRbs1J1fb+pQy3t9oTv82DgzgmRSpUwlITEdkMyBhaY6Sg4UDaGSGYQ=
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> Use devm_platform_ioremap_resource helper which wraps
> platform_get_resource() and devm_ioremap_resource() together.

Can a wording like =E2=80=9CSimplify this function implementation by using
a known wrapper function.=E2=80=9D be nicer for this change description?


> The semantic patch that makes this report is available
> in scripts/coccinelle/api/devm_platform_ioremap_resource.cocci.
>
> Found using - http://coccinelle.lip6.fr/

Can a tag like =E2=80=9CGenerated by: scripts/coccinelle/api/devm_platform=
_ioremap_resource.cocci=E2=80=9D
be more helpful than the other description variant?

Regards,
Markus
