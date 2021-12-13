Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D3E4471EE6
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Dec 2021 01:01:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230218AbhLMABN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 12 Dec 2021 19:01:13 -0500
Received: from mailout2.samsung.com ([203.254.224.25]:15502 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230203AbhLMABM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 12 Dec 2021 19:01:12 -0500
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20211213000109epoutp02959fe67ff206ec6933c0e01d84bf1f74~AJ3oHB8R42203122031epoutp02v
        for <linux-i2c@vger.kernel.org>; Mon, 13 Dec 2021 00:01:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20211213000109epoutp02959fe67ff206ec6933c0e01d84bf1f74~AJ3oHB8R42203122031epoutp02v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1639353669;
        bh=03z7ia0SGezw5IA9IA1j01YS3syE2MIzcKfFIeXfvaU=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=KPUOcMAS/1kKaxhgreJy1Ql1bQmwK9QpYQ1sYpa27rPGQS9Rru8kJNP47Fl1jRSC+
         13D/O5eG97Iaximl4Yj2mKS6h2ulh66h/am1rym8gOZPPM+sAE4YM1W3zvCj/mbD+1
         YY0Mw9Neh3Al+H5QKqzg7HOqYa6hxPyeQFJN70G8=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20211213000108epcas2p413abffa6c75087cbecb27885e40778e8~AJ3nrura01657716577epcas2p4H;
        Mon, 13 Dec 2021 00:01:08 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.88]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4JC1qw2g50z4x9Pq; Mon, 13 Dec
        2021 00:01:00 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        FB.2F.10018.03D86B16; Mon, 13 Dec 2021 09:00:48 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20211213000048epcas2p3b9090bd3c33df59dd12c41710d8d5204~AJ3UaAqNi0436304363epcas2p3K;
        Mon, 13 Dec 2021 00:00:48 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211213000048epsmtrp1b4c4553e67c664329e77f25d13ec6103~AJ3UZBHYQ1064210642epsmtrp1K;
        Mon, 13 Dec 2021 00:00:48 +0000 (GMT)
X-AuditID: b6c32a46-a25ff70000002722-2f-61b68d30641e
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        1E.06.29871.03D86B16; Mon, 13 Dec 2021 09:00:48 +0900 (KST)
Received: from KORCO082417 (unknown [10.229.8.121]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20211213000048epsmtip21d327fecccbf5caf40b8266a32d0f3f5~AJ3ULd7E90839708397epsmtip2X;
        Mon, 13 Dec 2021 00:00:48 +0000 (GMT)
From:   "Chanho Park" <chanho61.park@samsung.com>
To:     "'Sam Protsenko'" <semen.protsenko@linaro.org>,
        "'Wolfram Sang'" <wsa@kernel.org>,
        "'Krzysztof Kozlowski'" <krzysztof.kozlowski@canonical.com>
Cc:     "'Jaewon Kim'" <jaewon02.kim@samsung.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20211212181057.20210-1-semen.protsenko@linaro.org>
Subject: RE: [PATCH] i2c: exynos5: Fix getting the optional clock
Date:   Mon, 13 Dec 2021 09:00:48 +0900
Message-ID: <000001d7efb4$7c608110$75218330$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQK4K353fFNOeF7AtoqnQ2/nmI3enQH8YxdZql8unEA=
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAJsWRmVeSWpSXmKPExsWy7bCmua5B77ZEg91bJCx2NBxhtdj49geT
        xabH11gtOv5+YbS4vGsOm8WM8/uYLJ73AYm7++cyOnB4zGroZfPYtKqTzePOtT1sHpuX1Hv0
        bVnF6PF5k1wAW1S2TUZqYkpqkUJqXnJ+SmZeuq2Sd3C8c7ypmYGhrqGlhbmSQl5ibqqtkotP
        gK5bZg7QPUoKZYk5pUChgMTiYiV9O5ui/NKSVIWM/OISW6XUgpScAvMCveLE3OLSvHS9vNQS
        K0MDAyNToMKE7Iw966ULfrBUrP+2jbGBsY+li5GDQ0LAROLyBOYuRi4OIYEdjBL3PkxhgnA+
        MUrs3/WAFcL5xijxeFEDexcjJ1jHpom3oBJ7GSW+Ht7GDuG8YJRo/P2ABaSKTUBf4mXHNrAq
        EYFpjBK3j3wCa2cW2M0ocfRwOYjNKeAgsXPWekYQW1jAUeL7+jdsIDaLgKrEwYYPYHFeAUuJ
        De8vskDYghInZz5hgZgjL7H97RxmiJMUJH4+XcYKYosIWEk0Xt8MVSMiMbuzDew7CYGFHBJ7
        Zh2C+sFF4sHyG2wQtrDEq+NboOJSEi/729ghGroZJSa9vAuVmMEo8e5mDoRtLDHrWTsjKPiY
        BTQl1u/Sh4SkssSRW1B7+SQ6Dv9lhwjzSnS0CUE0qksc2D6dBcKWleie85l1AqPSLCSfzULy
        2SwkH8xC2LWAkWUVo1hqQXFuemqxUYERPLKT83M3MYKTqpbbDsYpbz/oHWJk4mA8xCjBwawk
        wvvSemuiEG9KYmVValF+fFFpTmrxIUZTYFhPZJYSTc4HpvW8knhDE0sDEzMzQ3MjUwNzJXFe
        r5QNiUIC6YklqdmpqQWpRTB9TBycUg1M4Vz2xonZKj1OW89OXy/AzZS/n7dXpECHeV2emrKo
        U4Ps3y17WY+bPjhhOul33pl+vjDXX0rvDO7ZvZJVaQq+razWmp38+67y5xPrTTYJBDmnvv+5
        5Z3DjPR3L6pCq27zV9cEro2a9vP3hq4pZ8LFBI48ffq8Td6nsstSZa/kKQZxmwcHLol/PjvN
        Jtn/xLP/n5VOWN3+dGDhJ8eCLX/ZXZMkeW+msmkutzt+eeP1+YfVWxrUZiY5LQyQlu3zunf5
        7I1PGzu8CmVCn98K2Sj7bVP0zgdm+vt3HYp5oJwbXCj9rmSjooHg1kKt11M38D9z/r5Etdus
        1P/lIa81CcszXoQsmVhWF/z50FKth3P+KrEUZyQaajEXFScCAIUGpvEzBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeLIzCtJLcpLzFFi42LZdlhJXtegd1uiQednVosdDUdYLTa+/cFk
        senxNVaLjr9fGC0u75rDZjHj/D4mi+d9QOLu/rmMDhwesxp62Tw2repk87hzbQ+bx+Yl9R59
        W1YxenzeJBfAFsVlk5Kak1mWWqRvl8CVsWe9dMEPlor137YxNjD2sXQxcnJICJhIbJp4i7WL
        kYtDSGA3o0Tbvl9MEAlZiWfvdrBD2MIS91uOQBU9Y5SYuf01WBGbgL7Ey45tYAkRgWmMEvee
        LWQDcZgF9jNKvOmezQbRMpFRYve/I2AtnAIOEjtnrWcEsYUFHCW+r3/DBmKzCKhKHGz4ABbn
        FbCU2PD+IguELShxcuYTIJsDaKqeRNtGsBJmAXmJ7W/nMEOcpyDx8+kyVhBbRMBKovH6ZhaI
        GhGJ2Z1tzBMYhWchmTQLYdIsJJNmIelYwMiyilEytaA4Nz232LDAMC+1XK84Mbe4NC9dLzk/
        dxMjOMK0NHcwbl/1Qe8QIxMH4yFGCQ5mJRHel9ZbE4V4UxIrq1KL8uOLSnNSiw8xSnOwKInz
        Xug6GS8kkJ5YkpqdmlqQWgSTZeLglGpgysjzKN4vnL9xz49EzjjOiqme7mFx0r3Fkc/ffw8U
        Pi0TrbB/W/JBll2e71cWder1iYScT/i9uk4spS/rVmRNV4XsdjMLF9GVyjqn2K+UOOqaxx+R
        mTVj1dGPIe8LExLYenYaPSqZUef3zOeEy+WTmi6d+30mSIsdOsVfrbjurJd1bISbcoPfStm3
        dsUHPv9S0fi65VVjUZJAzqEDzYHCNyqWFbTrz+kouBB5eYHBTFn/b/r5gme2vTmwauIj7uVX
        E/ZdDal9duZe/qxUn4ftNgqb+Xi90yfYldk2tHJu62HjnffI+HiTvdkuw/ezLM8/v3f3wHxX
        Dr3PCQ5ZKuYX+Gqr10RxmExNEi2cmqHEUpyRaKjFXFScCAAYghTVHwMAAA==
X-CMS-MailID: 20211213000048epcas2p3b9090bd3c33df59dd12c41710d8d5204
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211212181103epcas2p2f366435198200c3f4bac0fdf8ad1d0a3
References: <CGME20211212181103epcas2p2f366435198200c3f4bac0fdf8ad1d0a3@epcas2p2.samsung.com>
        <20211212181057.20210-1-semen.protsenko@linaro.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> "hsi2c_pclk" clock is optional and may not be present for some SoCs
> supported by this driver. Nevertheless, in case the clock is provided but
> some error happens during its getting, that error should be handled
> properly. Use devm_clk_get_optional() API for that. Also report possible
> errors using dev_err_probe() to handle properly -EPROBE_DEFER error (if
> clock provider is not ready by the time I2C probe function is executed).
> 
> Fixes: c93ac09df2a8 ("i2c: exynos5: Add bus clock support")
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>

Reviewed-by: Chanho Park <chanho61.park@samsung.com>

