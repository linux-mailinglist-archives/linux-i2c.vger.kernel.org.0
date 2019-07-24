Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D25172BF2
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Jul 2019 12:01:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727156AbfGXKBq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Jul 2019 06:01:46 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:57880 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726556AbfGXKBp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 24 Jul 2019 06:01:45 -0400
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20190724100143epoutp0414f5706d9829e195df592580275983dd~0T5w-FZo61514115141epoutp04b
        for <linux-i2c@vger.kernel.org>; Wed, 24 Jul 2019 10:01:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20190724100143epoutp0414f5706d9829e195df592580275983dd~0T5w-FZo61514115141epoutp04b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1563962503;
        bh=c5ptV5HA49sNH19sxY9DMgig1lliijWYCMj8k/TIqIM=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=G8gdkDUlJGmTWEwPsXs3ZA14lUyjxL7AIdU+3BYrYZMVhO348JB5AukwSIPUpEaJl
         P7yb34SoxnRWA1f1uQ1gBSdY/onc5r6eJkVyzhJCGHf9KAt2zx+ySGs/6jAEEXr2Db
         XR990k2AcbokFSthX1FsZP7hu+Jee4DKNySvAYMA=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTP id
        20190724100142epcas1p3eabb061cc801a35fc86f8af3ae0e2e5b~0T5wriZpM1150511505epcas1p3Q;
        Wed, 24 Jul 2019 10:01:42 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.154]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 45trTv5h9czMqYkk; Wed, 24 Jul
        2019 10:01:39 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
        epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        CE.27.04066.47C283D5; Wed, 24 Jul 2019 19:01:24 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190724100124epcas1p19d46da4028d1867b2fd02d13f4a90ec9~0T5fPdCgd1979719797epcas1p14;
        Wed, 24 Jul 2019 10:01:24 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190724100124epsmtrp2c438f08135858e7f655cffab024b05a1~0T5fO0mVW0318803188epsmtrp2e;
        Wed, 24 Jul 2019 10:01:24 +0000 (GMT)
X-AuditID: b6c32a37-e27ff70000000fe2-4c-5d382c74ebeb
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        97.E1.03706.37C283D5; Wed, 24 Jul 2019 19:01:23 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190724100123epsmtip2b9a9d037afa2bedcb1db49d892d3d299~0T5fHj5Ar2396923969epsmtip2O;
        Wed, 24 Jul 2019 10:01:23 +0000 (GMT)
Subject: Re: [PATCH 1/1] extcon: extcon-max77843: convert to
 i2c_new_dummy_device
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc:     MyungJoo Ham <myungjoo.ham@samsung.com>,
        linux-kernel@vger.kernel.org
From:   Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <6bff5707-c460-c7e8-d913-bbc4d8fd5447@samsung.com>
Date:   Wed, 24 Jul 2019 19:04:27 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190722172601.3506-2-wsa+renesas@sang-engineering.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmk+LIzCtJLcpLzFFi42LZdlhTV7dExyLWYMEHdYuOv18YLS7vmsNm
        cbtxBZtF3zl3BxaPvi2rGD2eLVzP4vF5k1wAc1S2TUZqYkpqkUJqXnJ+SmZeuq2Sd3C8c7yp
        mYGhrqGlhbmSQl5ibqqtkotPgK5bZg7QMiWFssScUqBQQGJxsZK+nU1RfmlJqkJGfnGJrVJq
        QUpOgWWBXnFibnFpXrpecn6ulaGBgZEpUGFCdsbcI7wF3VwVy/uusDYwLufoYuTkkBAwkZgy
        ZTNzFyMXh5DADkaJppmv2SGcT0BO32s2COcbo8SqG/2MMC3LFt9ggkjsZZS4fu8cC4TznlFi
        1re3TCBVwgLBEv8/tLCB2CICARIT/i9kBbGZBTwl+ma0g8XZBLQk9r+4AWbzCyhKXP3xGGwD
        r4CdxOv5t8DmsAioSjR8mgrWKyoQIfHpwWFWiBpBiZMzn7CA2JwCrhKXtm6Gmi8ucevJfCYI
        W16ieetssOckBA6wSfw//4Qd4gUXia3zfkPZwhKvjm+BsqUkPr/bywZhV0usPHmEDaK5g1Fi
        y/4LrBAJY4n9SycDbeAA2qApsX6XPkRYUWLn77mMEIv5JN597WEFKZEQ4JXoaBOCKFGWuPzg
        LhOELSmxuL2TbQKj0iwk78xC8sIsJC/MQli2gJFlFaNYakFxbnpqsWGBMXJsb2IEJ0Qt8x2M
        G875HGIU4GBU4uFVYDCPFWJNLCuuzD3EKMHBrCTCG9hgFivEm5JYWZValB9fVJqTWnyI0RQY
        2hOZpUST84HJOq8k3tDUyNjY2MLE0MzU0FBJnHfeH81YIYH0xJLU7NTUgtQimD4mDk6pBsbc
        NWcvCtUb73iU2cP7ZnGlqQsn3x2HTxr3c40eZUt9nLE68e6J52snNSkemnn/e/KJxtzjuQ9v
        BwZMCTMTeOv+dK9fA3v11Fq56PP9Gz8ITC40UPELcG8/x/LYcfKSh1OXe6mdjeE+FCD9JL+D
        i/9+K3d9xpPtxg8Ldy1ddWtdzr1j057JisgosRRnJBpqMRcVJwIAtwqq154DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrKLMWRmVeSWpSXmKPExsWy7bCSvG6xjkWswYT/NhYdf78wWlzeNYfN
        4nbjCjaLvnPuDiwefVtWMXo8W7iexePzJrkA5igum5TUnMyy1CJ9uwSujLlHeAu6uSqW911h
        bWBcztHFyMkhIWAisWzxDaYuRi4OIYHdjBJNO88zQyQkJaZdPApkcwDZwhKHDxdD1LxllOg/
        fZkRpEZYIFji/4cWNhBbRMBP4tCyd2C9zAKeEn0z2tkgGi4zSsxdMJcVJMEmoCWx/8UNsAZ+
        AUWJqz8egw3iFbCTeD3/FhOIzSKgKtHwaSpYvahAhMThHbOgagQlTs58wgJicwq4SlzaupkV
        Ypm6xJ95l6AWi0vcejKfCcKWl2jeOpt5AqPwLCTts5C0zELSMgtJywJGllWMkqkFxbnpucWG
        BYZ5qeV6xYm5xaV56XrJ+bmbGMGRoaW5g/HykvhDjAIcjEo8vAoM5rFCrIllxZW5hxglOJiV
        RHgDG8xihXhTEiurUovy44tKc1KLDzFKc7AoifM+zTsWKSSQnliSmp2aWpBaBJNl4uCUamDs
        /HtskUV0Vm5LfeleT60NE0xmfTlYcGjBfM3KheHNU9946S9TDfinWZ4mf/1u0U1lL6WAqO4v
        jFVPvK5nF3dskua86JTNXtPBHifqP3dH/KL4fzzyN95eZpp7wM1B8qXF7dg3Av/ywtWD2OVa
        uOUMv1o86TZ5lnNqy0Zf0URhtRztaVM0HJVYijMSDbWYi4oTAfscDPqIAgAA
X-CMS-MailID: 20190724100124epcas1p19d46da4028d1867b2fd02d13f4a90ec9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20190722172604epcas5p4ce41ff3eda1b28ae07eef332808780ac
References: <20190722172601.3506-1-wsa+renesas@sang-engineering.com>
        <CGME20190722172604epcas5p4ce41ff3eda1b28ae07eef332808780ac@epcas5p4.samsung.com>
        <20190722172601.3506-2-wsa+renesas@sang-engineering.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 19. 7. 23. 오전 2:26, Wolfram Sang wrote:
> Move from i2c_new_dummy() to i2c_new_dummy_device(), so we now get an
> ERRPTR which we use in error handling.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Generated with coccinelle. Build tested by me and buildbot. Not tested on HW.
> 
>  drivers/extcon/extcon-max77843.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/extcon/extcon-max77843.c b/drivers/extcon/extcon-max77843.c
> index a343a6ef3506..e6b50ca83008 100644
> --- a/drivers/extcon/extcon-max77843.c
> +++ b/drivers/extcon/extcon-max77843.c
> @@ -774,12 +774,12 @@ static int max77843_init_muic_regmap(struct max77693_dev *max77843)
>  {
>  	int ret;
>  
> -	max77843->i2c_muic = i2c_new_dummy(max77843->i2c->adapter,
> +	max77843->i2c_muic = i2c_new_dummy_device(max77843->i2c->adapter,
>  			I2C_ADDR_MUIC);
> -	if (!max77843->i2c_muic) {
> +	if (IS_ERR(max77843->i2c_muic)) {
>  		dev_err(&max77843->i2c->dev,
>  				"Cannot allocate I2C device for MUIC\n");
> -		return -ENOMEM;
> +		return PTR_ERR(max77843->i2c_muic);
>  	}
>  
>  	i2c_set_clientdata(max77843->i2c_muic, max77843);
> 

Applied it. Thanks.

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
