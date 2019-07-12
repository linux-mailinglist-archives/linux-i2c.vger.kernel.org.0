Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5494266ADC
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jul 2019 12:27:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726140AbfGLK1v (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 Jul 2019 06:27:51 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:51423 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726091AbfGLK1u (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 12 Jul 2019 06:27:50 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190712102748euoutp02a282faef929eb94c42307d7082f12db5~wohHnKneh1156011560euoutp02H
        for <linux-i2c@vger.kernel.org>; Fri, 12 Jul 2019 10:27:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190712102748euoutp02a282faef929eb94c42307d7082f12db5~wohHnKneh1156011560euoutp02H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1562927268;
        bh=lakT5IvZPewFHKpfWnaitlRRseevezRjb/QpbnwhAUc=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=dvbQz8jWPKxRtA4MXKNK1AzzAoj8AkcYyDLBXaYSbDWLsqKedshMx8YKLOz1Wws9R
         p37XuvUIolIKVV9QAW86F3blj+TipgaN4VkHOFkfUhQlyqfxljvUvyYYAoV8EDW33J
         YVI0YzEqgXfRuNmAcNkvJJMJs2QINFC42IzaH+sQ=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190712102748eucas1p2bdeba0118252ef40fcce73154d5f9b57~wohHRqixq2376623766eucas1p2v;
        Fri, 12 Jul 2019 10:27:48 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id B1.95.04298.3A0682D5; Fri, 12
        Jul 2019 11:27:47 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190712102747eucas1p25e29b56e7b4fd11b403a3bb8fc9a0263~wohGmNJUK1562615626eucas1p2i;
        Fri, 12 Jul 2019 10:27:47 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190712102747eusmtrp1431636753e0ec0443454243e7aa5b0bc~wohGYIv5-1664416644eusmtrp1-;
        Fri, 12 Jul 2019 10:27:47 +0000 (GMT)
X-AuditID: cbfec7f2-f2dff700000010ca-d2-5d2860a37247
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id B1.AB.04146.2A0682D5; Fri, 12
        Jul 2019 11:27:47 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190712102746eusmtip2dedd242a5f8feec072425ccd54395f32~wohF7uOuv0703007030eusmtip27;
        Fri, 12 Jul 2019 10:27:46 +0000 (GMT)
Subject: Re: [PATCH 4/6] media: i2c: s5c73m3: Convert to new i2c device
 probe()
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-i2c@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        open list <linux-kernel@vger.kernel.org>
From:   Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <4c343c7b-5c43-7234-fae4-4f384c6d09ed@samsung.com>
Date:   Fri, 12 Jul 2019 12:27:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
        Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20190710215149.9208-5-kieran.bingham+renesas@ideasonboard.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPKsWRmVeSWpSXmKPExsWy7djPc7qLEzRiDeY9Mrb4dK2b0eJs0xt2
        i46/XxgtLu+aw2bRs2Erq8XWl++YLJZt+sNksfLELGYHDo/ZHTNZPTat6mTz6NuyitHj5Kkn
        LB6fN8kFsEZx2aSk5mSWpRbp2yVwZXx5to+14C9zxc1HX1gaGBcxdzFyckgImEicfTaVrYuR
        i0NIYAWjxP75c1khnC+MEjNv9rOBVAkJfGaUWPcqFKbj2OoZTBBFyxklLjZfZYEoessosWau
        NogtLBAo8WLxG0aQIhGB2YwScw9PBtvBLLCSUeLtkmtMIFVsApoSfzffBEpwcPAK2Ek8PWAL
        EmYRUJXourkArERUIEzi54JOsCt4BQQlTs58AraMU8BHYu+uHrA4s4C8RPPW2cwQtrjErSfz
        wa6TENjFLtHx8j87xNkuEktWP2GEsIUlXh3fAhWXkTg9uYcFwq6XuL+ihRmiuYNRYuuGndBQ
        spY4fPwiK8ihzEBHr9+lDxF2lOhbvIARJCwhwCdx460gxA18EpO2TWeGCPNKdLQJQVQrStw/
        uxVqoLjE0gtf2SYwKs1C8tksJN/MQvLNLIS9CxhZVjGKp5YW56anFhvmpZbrFSfmFpfmpesl
        5+duYgQmo9P/jn/awfj1UtIhRgEORiUe3huW6rFCrIllxZW5hxglOJiVRHhX/QcK8aYkVlal
        FuXHF5XmpBYfYpTmYFES561meBAtJJCeWJKanZpakFoEk2Xi4JRqYNTStgkLubftsfCnvBRn
        cSu1ubrnmZr0PI57GUca/qk8sPGxj37emW1sb+bPTuad9HCtpRmL1JmNtozbrR8urajxPbrQ
        yPOxr7hH01Vfq8835T5wztSeJ1GX6fErIHjNZyF7RxP9LYq/zgm2edlP3iU5K3UDb/Wq+M6v
        f1Z3numewFa48tgTbyWW4oxEQy3mouJEAKf9MIhCAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIIsWRmVeSWpSXmKPExsVy+t/xe7qLEzRiDZasYrL4dK2b0eJs0xt2
        i46/XxgtLu+aw2bRs2Erq8XWl++YLJZt+sNksfLELGYHDo/ZHTNZPTat6mTz6NuyitHj5Kkn
        LB6fN8kFsEbp2RTll5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb2aSk5mSWpRbp
        2yXoZXx5to+14C9zxc1HX1gaGBcxdzFyckgImEgcWz2DqYuRi0NIYCmjxMP9P6AS4hK757+F
        soUl/lzrYgOxhQReM0rMWZQKYgsLBEq8WPyGEaRZRGA2o8TOU6vAipgFVjNKHDoSADH1IaPE
        0X37WEASbAKaEn833wQq4uDgFbCTeHrAFiTMIqAq0XVzARNIWFQgTOLoiTyQMK+AoMTJmU/A
        OjkFfCT27uqBGq8u8WfeJWYIW16ieetsKFtc4taT+UwTGIVmIWmfhaRlFpKWWUhaFjCyrGIU
        SS0tzk3PLTbUK07MLS7NS9dLzs/dxAiMvm3Hfm7ewXhpY/AhRgEORiUe3huW6rFCrIllxZW5
        hxglOJiVRHhX/QcK8aYkVlalFuXHF5XmpBYfYjQF+m0is5Rocj4wMeSVxBuaGppbWBqaG5sb
        m1koifN2CByMERJITyxJzU5NLUgtgulj4uCUamDsMp1W8lzr/SqLC7xBN0Ue7fv9P89qw4Jl
        EhyzGLevNF1kuD27W4TLfdK6+exr9tqe/pCvP/Ebw/fLa/R6nrsGlJ2L4zz6x3z3v4wdnVFi
        s9oLL8/oWy1/MU6P/ciL7MsdP1u+NHkKRX03/cRXEZp6NWJGbW675k7fi0cuisy+rm3Qfub8
        7EOcSizFGYmGWsxFxYkAEE9P49QCAAA=
X-CMS-MailID: 20190712102747eucas1p25e29b56e7b4fd11b403a3bb8fc9a0263
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190710215208epcas2p4a00565b70691c0afb0c3a04f9c43f6cd
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190710215208epcas2p4a00565b70691c0afb0c3a04f9c43f6cd
References: <20190710215149.9208-1-kieran.bingham+renesas@ideasonboard.com>
        <CGME20190710215208epcas2p4a00565b70691c0afb0c3a04f9c43f6cd@epcas2p4.samsung.com>
        <20190710215149.9208-5-kieran.bingham+renesas@ideasonboard.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 10.07.2019 23:51, Kieran Bingham wrote:
> The I2C core framework provides a simplified probe framework from commit
> b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new() call-back type").
>
> This driver does not utilise the i2c_device_id table in the probe, so we can
> easily convert it to utilise the simplfied i2c driver registration.
>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


Acked-by: Andrzej Hajda <a.hajda@samsung.com>


 --
Regards
Andrzej


