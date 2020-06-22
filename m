Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AD57203EE4
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jun 2020 20:15:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730099AbgFVSPk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Jun 2020 14:15:40 -0400
Received: from mout.web.de ([212.227.15.3]:38985 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729873AbgFVSPk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 22 Jun 2020 14:15:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1592849717;
        bh=hUD5B0OXQqFhcHukPwK74TlGNcrPDU2XpmqaEPVtFXw=;
        h=X-UI-Sender-Class:Cc:Subject:To:From:Date;
        b=WWPjMETmfzcnfnDcoI+7cXZ8WT+XDlup9EllYccxCtb3BhYwmbILp6iNn7hQ9816j
         q12AVUARcGRZA32aKT2oWws0PCcnuSi6jRWbyVYMdtJtbhdphqgDFIeShscBC8L+kb
         vtrdCiSpA3hglzaIqCBDdW8g1qXGFWF0AtyHJj2c=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.49.69.81]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MapFS-1jYWkw3fa6-00KTQV; Mon, 22
 Jun 2020 20:15:17 +0200
Cc:     Aditya Pakki <pakki001@umn.edu>,
        Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>,
        Qiushi Wu <wu000273@umn.edu>, linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Dejin Zheng <zhengdejin5@gmail.com>,
        Scott Branden <scott.branden@broadcom.com>,
        Patrice Chotard <patrice.chotard@st.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH] i2c: sprd: Fix runtime PM imbalance on error
To:     Dinghao Liu <dinghao.liu@zju.edu.cn>, linux-i2c@vger.kernel.org
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <92122fb7-8362-4835-0860-41d423665e19@web.de>
Date:   Mon, 22 Jun 2020 20:15:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SaN+nnZRu87UIcyA6hDAf87YGrjZQNxpgf0ecU0IgHZ+coat02e
 /n4yGN8Cux/66wy1NCzoKUToBxbrS59Loq+NDWDjHlGgXSWbsGiC4nRdK6dbi0iYIVxVz8d
 VTwhEa+y+4h3mz9c2W0wM5yJGAPhfU04GzMwjmp+9ioCOPCRC3632axsb1Dazs9wU1JsPpI
 vGE3f6Wv8peCrKRbPUm9A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:bXNQlLzINcc=:FCHMH9z2gBrHz8tzv3TS3m
 Wx+PJj2k5oaoOocPV+ZuZgNjkhrP0n4vFKoaTtjp4SNzKZBnbX89Nq5q1rVIPu/7EoeDODGyI
 MZbdc3gEgcCNlGAYUrlQEqefJyaF4c6doRswY1jSj5yZKNURFW2pz3mAQw1WyG8GRSnEmnoKC
 T5WEjB0fH+LHqUs/MN9hQ7Jpj0jiCHJs+GI5awGC2MfWDIla92wAr5hhrZe66zndmAYMdHhmt
 MABIYKjQs7yraraLwuZBtIIMzlLed1+7VbLsjJ1XBdfzIKPbLKnuXghyEq3H/dKn88iBWoFrH
 YdNQiKCf0k25eA//2ucG9Km+Cpsv2fySNRVE2goOWzoTggJeWwHEHdCsKFgx3VQydJZ8gB6o5
 VsAnome95KXhBbk9cr/HT73H2i8C4+J/O5cVvuTyKkWXLi0jGp8L8HuQCL/unTqTcfVtCUlKm
 j0QpL1IIEF/xzbZKVZMhWBdj2BYq6r7LX/4zLpQ3f29m+oc/vi/uzLK0vxCoUgznLWBMtAzm7
 ROFbIwn2kVewcX6VurReDXLp/KBXQ7Di2ZCBarLXcMeLBVTy2x/RyNmGws9PNrPdxjrj0g4b7
 6GZGt7vJFuJUGU7eSdhjf9/1xM+INvuxv6XB5ooY2UDLXNs6kW6RzRkU/7kUukOTPUUD7o2Cc
 ToqjfY/w8GPEI3QFjmR0/BLNwo6KRBm0DXRV739d3u4WhR/5QL+sBAEs+MMZw8sP/dLxqt3IK
 B3rbPwNKFs5k/LWUguuAZ3kLqhbbF+z02dTuwVRmRqkQCnauU1zCuLd0GN5ac/BviP9JRfr2G
 wvnPCPBz4xOmXn/cgay8cjlqxGiqPSDGTRbznUOhJbwk8e3FsqaxLYGhqwtU9Ts4D/KZHGa9a
 t1W51xBoXXY/sqbtHhN6DLNSHHXV2sezxPlng7NQP10bk19AXYXD1y8yiRgDuqBgcKtfW70Qr
 MjW3Xv3GyQvYUFC/L9NSpRWlIhrgwvXqs794wjWkAI0VEZLVPBWNUaB5MpK4GMrfp0UtPw1+Q
 lMmbg5GMyVb8RRtk++5T/uboWsa2YbnKmgqNaOl9u05jUOn+M7ARugrF4sL8EgcgKS6xRW3W/
 mqjrImGOx67Gdvx5LxjcfI2+5bg7FzTw+GDn2qsAyWeaTP9NKwEoLDOUdt8PBCacLAfLSapko
 9kuxawb2UjWbNQb0iTshFbBd0LmlfpN8mSNmXpVcGOfmAD2BFrE23tlZlCHcRi4d5H5c5fMjW
 h1VF3koUq3QH4R4OG
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> Fix this by =E2=80=A6

Please replace the beginning of this sentence with the tag =E2=80=9CFixes=
=E2=80=9D.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?id=3D625d3449788f85569096780592=
549d0340e9c0c7#n183

Regards,
Markus
