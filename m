Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68C167C5266
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Oct 2023 13:47:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234745AbjJKLrP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Oct 2023 07:47:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231601AbjJKLrN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Oct 2023 07:47:13 -0400
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D202A93
        for <linux-i2c@vger.kernel.org>; Wed, 11 Oct 2023 04:47:11 -0700 (PDT)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20231011114707euoutp0128591310f53b403ba7ba2c1e3fb89861~NCxb-kksP0935209352euoutp01e
        for <linux-i2c@vger.kernel.org>; Wed, 11 Oct 2023 11:47:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20231011114707euoutp0128591310f53b403ba7ba2c1e3fb89861~NCxb-kksP0935209352euoutp01e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1697024828;
        bh=XGuOkaqyAecoK0JJacf8f1olgpmSUik25eSknsMpW+I=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=TQdKa5NAgRFeVOEj/prepUazxBY7i95K1WujW7gJl0T+777ZEMfnpUMMAYMxy1exj
         PXQlt3lT3q8bvqk3qx+tSMyb9yOIFJRaVOF+8T1DeEtYvimY+fYp/rtXp392sOCBUm
         jZXGKMBB1m8ibwf++gamwdRXmcVB6uyPO9cyxlVg=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20231011114707eucas1p28ac4c13408ce7d01727b2d2c3b48817b~NCxbrv-JR0503505035eucas1p2C;
        Wed, 11 Oct 2023 11:47:07 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 2F.FB.37758.B3B86256; Wed, 11
        Oct 2023 12:47:07 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20231011114706eucas1p256d0ce177e0c1f73ab3a052294518341~NCxbB1HbP3267632676eucas1p2W;
        Wed, 11 Oct 2023 11:47:06 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20231011114706eusmtrp1f68c013e058293ea46288de941dd8338~NCxbBSXpC0630706307eusmtrp1X;
        Wed, 11 Oct 2023 11:47:06 +0000 (GMT)
X-AuditID: cbfec7f5-815ff7000002937e-4c-65268b3b9e8b
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 98.5A.10549.A3B86256; Wed, 11
        Oct 2023 12:47:06 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20231011114705eusmtip26e62b69454e4db95963929ad7466f8df~NCxZxqzN71468314683eusmtip2T;
        Wed, 11 Oct 2023 11:47:05 +0000 (GMT)
Message-ID: <b4b91fb3-07b0-41c2-a97c-d1a045924fdc@samsung.com>
Date:   Wed, 11 Oct 2023 13:47:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: brcmstb: Add support for atomic transfers
Content-Language: en-US
To:     Gregor Riepl <onitake@gmail.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Kamal Dasu <kamal.dasu@broadcom.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Wolfram Sang <wsa@kernel.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <ba3c0972-2ba2-4df7-826e-a7634027b967@gmail.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGKsWRmVeSWpSXmKPExsWy7djP87rW3WqpBkumqlrc/9rBaLG29yiL
        xbpt95gtdm84zGSx6fE1VouOv18YLS7vmsNm0du9n83i7v65jA6cHrPun2Xz2DnrLrvHplWd
        bB6bl9R7fN4kF8AaxWWTkpqTWZZapG+XwJVx520bc0GfQMXv2edYGxhbeLsYOTkkBEwkVv+6
        wtTFyMUhJLCCUWLCwW9sIAkhgS+MEhcWqUEkPjNKtN5fzNrFyAHWMXV9FER8OaPE1APXGCGc
        j4wSi6fPZwbp5hWwk5j9dwMbSAOLgKrEpMVGEGFBiZMzn7CA2KIC8hL3b81gB7GFBZwlPjdf
        YASxmQXEJW49mQ92kYhAK6PE9833WUEcZpAFM7aeB6tiEzCU6HrbBXYqp4CtxK3T7awQ3fIS
        zVtnM0P89oFDYs+ZXAjbReJR6z9GCFtY4tXxLewQtozE6ck9LCALJATaGSUW/L7PBOFMYJRo
        eH4LqsNa4s65X2DvMAtoSqzfpQ8RdpT4c/8SGyRY+CRuvBWEuIFPYtK26cwQYV6JjjYhiGo1
        iVnH18GtPXjhEvMERqVZSOEyC8n/s5B8Mwth7wJGllWM4qmlxbnpqcXGeanlesWJucWleel6
        yfm5mxiBSen0v+NfdzCuePVR7xAjEwfjIUYJDmYlEd5HmSqpQrwpiZVVqUX58UWlOanFhxil
        OViUxHlVU+RThQTSE0tSs1NTC1KLYLJMHJxSDUyVCZZHVTI/qS6Xq1BO9D9TyXVuzfQ4yX1c
        LmunByW8TxMRjuFYk3drivV18cXq837duXXnk9WkvC9rROaE7H517Z9hd6L0o6LlyxINdr0x
        4+ALPXj+muq6z6xfyxZ8SZ72u2Ka5fSgp3VSR7/WHz0zxenLpM3sRlvC+CbOLbDIClw5M0H6
        zX0t8bKesoIDEV5ygjsMzY7eaD39f7KHT3S7oIL1baktj+PletYJT63tn/RcLuvQp3ivI69X
        L59+f+cszrdFlo5Hyxdr+Z2fouZj2Rz08JrC6+yzpUlPmVPOn/yyiFO9ptuWv6dZd2PJPM/K
        5z/dlpw7sfFNTF2MTNFzxSXSE+fWKHPc+aWxXuO9EktxRqKhFnNRcSIAdIpzZLkDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRmVeSWpSXmKPExsVy+t/xe7pW3WqpBkffGFrc/9rBaLG29yiL
        xbpt95gtdm84zGSx6fE1VouOv18YLS7vmsNm0du9n83i7v65jA6cHrPun2Xz2DnrLrvHplWd
        bB6bl9R7fN4kF8AapWdTlF9akqqQkV9cYqsUbWhhpGdoaaFnZGKpZ2hsHmtlZKqkb2eTkpqT
        WZZapG+XoJdx520bc0GfQMXv2edYGxhbeLsYOTgkBEwkpq6P6mLk4hASWMooMf3VTeYuRk6g
        uIzEyWkNrBC2sMSfa11sEEXvGSX+be4BS/AK2EnM/ruBDWQQi4CqxKTFRhBhQYmTM5+wgNii
        AvIS92/NYAexhQWcJT43X2AEsZkFxCVuPZnPBDJTRKCVUeJIy2ywBcwCnxklHvacZ4TYdoxR
        4v3Hu2Cj2AQMJbregpzBycEpYCtx63Q7K8QoM4murV1QY+UlmrfOZp7AKDQLySWzkGychaRl
        FpKWBYwsqxhFUkuLc9Nziw31ihNzi0vz0vWS83M3MQIjcduxn5t3MM579VHvECMTB+MhRgkO
        ZiUR3keZKqlCvCmJlVWpRfnxRaU5qcWHGE2BoTGRWUo0OR+YCvJK4g3NDEwNTcwsDUwtzYyV
        xHk9CzoShQTSE0tSs1NTC1KLYPqYODilGpgEP902MqudGFPL+6xieusMubV78/eG3NlUvOOT
        S/1ytWv+n7p5qg39HNIrru0V3u38NTiIXYdx/crnJ8vkZ56K8J3AscE6ecXEeWXzqtNyOIUT
        2Gof8f4v7uB28EveZl98YvubhLz8tFtsdZnXXzYwlpQ0iD1sKt+QlvB5+uMElijOZsmCJcfn
        N998waX/Nn+T+c9uTu1jzX2P9XldxCrmZEq4pP1InL7hstZWD8/giXenLb6y4lcKRwl3I0OK
        yNvby+evK5WQ2XmpRlR16v6QOQFvW2t0jqXEp/9fYBh6ZWbhi81xay3seVJmq4Ts0e6ZPVmt
        qXZ3m8qMixMnvsz8GGegKmll9vfVpWNnDyixFGckGmoxFxUnAgAes9omTQMAAA==
X-CMS-MailID: 20231011114706eucas1p256d0ce177e0c1f73ab3a052294518341
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20231006144123eucas1p111cbbdbd70927ffbd697f7edf6b7ae1c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20231006144123eucas1p111cbbdbd70927ffbd697f7edf6b7ae1c
References: <CGME20231006144123eucas1p111cbbdbd70927ffbd697f7edf6b7ae1c@eucas1p1.samsung.com>
        <20231006144117.4079796-1-m.szyprowski@samsung.com>
        <ba3c0972-2ba2-4df7-826e-a7634027b967@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 11.10.2023 12:23, Gregor Riepl wrote:
> I admit that I don't understand the I²C subsystem very well, but 
> doesn't this introduce a potential race condition?
>
> > ...
> > @@ -240,7 +241,7 @@ static int 
> brcmstb_i2c_wait_for_completion(struct brcmstb_i2c_dev *dev)
> > ...
>> -    if (dev->irq >= 0) {
>> +    if (dev->irq >= 0 && !dev->atomic) {
> > ...
> > @@ -287,7 +288,7 @@ static int brcmstb_send_i2c_cmd(struct 
> brcmstb_i2c_dev *dev,
> > ...
>> -    if (dev->irq >= 0)
>> +    if (dev->irq >= 0 && !dev->atomic)
> > ...
> > +static int brcmstb_i2c_xfer_atomic(struct i2c_adapter *adapter,
> > +                   struct i2c_msg msgs[], int num)
> > ...
>> +    dev->atomic = true;
>> +    ret = brcmstb_i2c_xfer(adapter, msgs, num);
>> +    dev->atomic = false;
>> ...
>
> What happens when one of the if() branches is taken in one thread 
> while another thread is just executing the assignment of the atomic 
> flag? My expectation would be that the first tread still sees the old 
> flag value and happily executes the branch, while 
> brcmstb_i2c_xfer_atomic() sets the flag just after and initiates a 
> transfer.
>
> I'd expect that access to the flag must be atomic as well, so maybe 
> something like 
> https://www.kernel.org/doc/html/latest/core-api/wrappers/atomic_t.html 
> is needed, or some other synchronization mechanism.
>
> Or is it guaranteed that brcmstb_i2c_wait_for_completion() and 
> brcmstb_send_i2c_cmd() can only be called from the same thread as 
> brcmstb_i2c_xfer_atomic() ?

Atomic i2c transfers are some kind of a special case.

I guess that i2c core takes care of NOT multiplexing atomic and standard 
i2c transfers. No special locking/protection is needed in the bus 
drivers. This is at least what I see from commits like 08960b022fb6 
("i2c: tegra-bpmp: convert to use new atomic callbacks") or 3d11a12ece85 
("i2c: ocores: enable atomic xfers").

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

