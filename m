Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54F031DE52D
	for <lists+linux-i2c@lfdr.de>; Fri, 22 May 2020 13:15:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728657AbgEVLPg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 May 2020 07:15:36 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:34879 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729382AbgEVLPP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 May 2020 07:15:15 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200522111512euoutp02378e2eb06ceae676682b2695b6615b7b~RVXbtYutQ1674116741euoutp02B
        for <linux-i2c@vger.kernel.org>; Fri, 22 May 2020 11:15:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200522111512euoutp02378e2eb06ceae676682b2695b6615b7b~RVXbtYutQ1674116741euoutp02B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1590146112;
        bh=g7lofStAEXI4rDBNDclmyeYgluSumM2150lwAjjqFGM=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=Un+f+jIUmk8Z5599psC7Yb7eNknrtoyvtxiHz3/YuXympaCqIfxzfyDVLpFI/EzRZ
         QliYDYN+TKL/RN29YC/d9n+Dt0IgE5ZpaNBqDqP3duySJ7VFllF14lzaKwPd2owl87
         1u/5iuV8BzPloamQ+sxGSenMdjLt71hchHTIoNu0=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200522111512eucas1p23793e88546caa1e9bbd836fcfa32eedb~RVXbZe0le1441014410eucas1p2J;
        Fri, 22 May 2020 11:15:12 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id F9.96.60698.044B7CE5; Fri, 22
        May 2020 12:15:12 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200522111512eucas1p17edeeea548dd59170c84c49ec650bd8a~RVXbFw97l0775607756eucas1p1Z;
        Fri, 22 May 2020 11:15:12 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200522111512eusmtrp27b43e87159fec26f306e1ffa4579c921~RVXbFEdvK1476214762eusmtrp2k;
        Fri, 22 May 2020 11:15:12 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-fa-5ec7b440f52a
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 3D.92.07950.F34B7CE5; Fri, 22
        May 2020 12:15:11 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200522111511eusmtip1251a3e0431392af017466d40c4deba33~RVXadmGHQ2677026770eusmtip1W;
        Fri, 22 May 2020 11:15:11 +0000 (GMT)
Subject: Re: [PATCH] i2c: core: fix NULL pointer dereference in
 suspend/resume callbacks
To:     linux-pm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Bibby Hsieh <bibby.hsieh@mediatek.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        srv_heupstream@mediatek.com,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-samsung-soc@vger.kernel.org
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <34736047-3fc8-385b-cdea-79b061deb7b4@samsung.com>
Date:   Fri, 22 May 2020 13:15:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200522101327.13456-1-m.szyprowski@samsung.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUhTYRjl3b3eXYfT16n5tKJolGGQJhpe+xCVgkERkVEh6Fp5U8tN29Rl
        IfmdrGw1DHVqZVGm5WdDS0JzTZdKfmaIWiBZoGRim0EfWs6r5b/znHOe9zkHXpoQvXAQ03HK
        JFallMdLKAHZ2PGjZ3uI0RK1w/jBg6kvqnVgbGVdJFNcV0QyefM2xAw2l1KMNd+MmKLeFh5T
        +F7EWHMWKKbytYEIEUhnhnP40pL0flKa3dlKSq8bq5C0s2uClFobNhymIgR7otn4uBRW5Rt8
        UhCbYSkkE4eoC7daX5HpqMFBixxpwAEw0p9BapGAFuFHCD625iMtohcHGwIDj+OtCPJ6p4iV
        BZO2nc8JFQjq+mwEN8wgeDM3SNm33XAEmGed7Qvu+DjYhkcpu4fAZTxoG5hBdoHCfqCd1lJ2
        LMTB0P9Jx7NjEm+Br7pc0o49cCR033+KOI8rdBZPLPGOi/5fZQVLiQi8EZqmS5exJ4xM3FmK
        DbiDDzfND3j2QID3QXY/cA3cYMpi5HN4Pfx5vuLPQjDeU83nhmsIBjOLEOfaDWM9P5eaEdgb
        apt9OToUGubfEtz7zjA87cplcAZ9Y+EyLYS8XBHn9gKDpebf2ba+AeIGkhhWNTOsamNY1cbw
        /+5dRFYhTzZZrYhh1f5KVuOjlivUycoYn9MJiga0+Ke6Fyxzz1DL71MmhGkkcRIyZzqiRA7y
        FHWqwoSAJiTuwnKX9iiRMFqeepFVJchUyfGs2oTW0aTEU+h/bzJShGPkSew5lk1kVSsqj3YU
        p6MCL75VH47FYfsfBycqdDUxcsUh2execU181eiVte/Kn5wN/7z5YGCKo/hy7CDrplwTMJ4G
        wqA0vyZ+tm6niyyMNzk/9vBIp/Kq3mJgv/DaS445nTdfkh3VDAVpd5V/q7+t1M8cqJ5zzjyx
        KQBrFgr0FZrvgcGhlS+js7yJrRkSUh0r99tGqNTyv1/9JB1PAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRmVeSWpSXmKPExsVy+t/xu7r2W47HGRyYaWmxccZ6Vosvc0+x
        WMzcMIPFouPvF0aLy7vmsFl87j3CaDHj/D4mi+l3hSw+t/5js1h5YhazA5fH+xut7B6zGy6y
        eLSc3M/i0bdlFaPHyVNPWDw+b5ILYIvSsynKLy1JVcjILy6xVYo2tDDSM7S00DMysdQzNDaP
        tTIyVdK3s0lJzcksSy3St0vQy2g8Pp2l4CpbxdT9h1kaGDexdjFyckgImEgc6jrK3sXIxSEk
        sJRRYuGJC2wQCRmJk9MaoIqEJf5c6wKLCwm8ZZQ4sDEWxBYWiJKYfuAAO4gtIhAucfXca0YQ
        m1lgPpNEx99siKETGSWmTP0PVsQmYCjR9RZiEK+AncTFp/1MIDaLgKrEu/42FhBbVCBWYvW1
        VkaIGkGJkzOfgMU5gep/z53CDLHATGLe5odQtrzE9rdzoGxxiVtP5jNNYBSahaR9FpKWWUha
        ZiFpWcDIsopRJLW0ODc9t9hIrzgxt7g0L10vOT93EyMwNrcd+7llB2PXu+BDjAIcjEo8vA+S
        j8UJsSaWFVfmHmKU4GBWEuFdyH80Tog3JbGyKrUoP76oNCe1+BCjKdBzE5mlRJPzgWkjryTe
        0NTQ3MLS0NzY3NjMQkmct0PgYIyQQHpiSWp2ampBahFMHxMHp1QD4z7jKDvFz/Fl6xUeO6lM
        fvF169ll68SezjhTPue/XPD2Pa8XLpg4yeR6VauY35THxUpmMoV1nW+/nFttZ+QQe5xHsO2V
        b6rQwZX3XmjGsrNnrjkxfYYgZ2GkY7Nos9VzX89zH4Xllou9iCt5+kw2admLpU1OpjybSyQz
        OnJzTaov9e8q7mT3UmIpzkg01GIuKk4EAIlRpMnjAgAA
X-CMS-MailID: 20200522111512eucas1p17edeeea548dd59170c84c49ec650bd8a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200522101524eucas1p1aeef4a054a80b5d822ed3dc4b16139d7
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200522101524eucas1p1aeef4a054a80b5d822ed3dc4b16139d7
References: <CGME20200522101524eucas1p1aeef4a054a80b5d822ed3dc4b16139d7@eucas1p1.samsung.com>
        <20200522101327.13456-1-m.szyprowski@samsung.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi All,

On 22.05.2020 12:13, Marek Szyprowski wrote:
> Commit 6fe12cdbcfe3 ("i2c: core: support bus regulator controlling in
> adapter") added generic suspend and resume functions for i2c devices.
> Those functions unconditionally access an i2c_client structure assigned
> to the given i2c device. However, there exist i2c devices in the system
> without a valid i2c_client. Add the needed check before accessing the
> i2c_client.

Just one more comment. The devices without i2c_client structure are the 
i2c 'devices' associated with the respective i2c bus. They are visible 
in /sys:

ls -l /sys/bus/i2c/devices/i2c-*

I wonder if this patch has been ever tested with system suspend/resume, 
as those devices are always available in the system...

> ...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

