Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 152BF7D95AC
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Oct 2023 12:54:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345649AbjJ0Ky4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Oct 2023 06:54:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345686AbjJ0Kyy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Oct 2023 06:54:54 -0400
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F9E61AA
        for <linux-i2c@vger.kernel.org>; Fri, 27 Oct 2023 03:54:51 -0700 (PDT)
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20231027105450epoutp04a72df0680b7c867215a21978139c14a0~R8YV4rLhJ3050830508epoutp042
        for <linux-i2c@vger.kernel.org>; Fri, 27 Oct 2023 10:54:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20231027105450epoutp04a72df0680b7c867215a21978139c14a0~R8YV4rLhJ3050830508epoutp042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1698404090;
        bh=uMe5sm3+UKHQS0MU8rme+qaiPDe3JQTeAoVEUMx67Xk=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=WuVuTwHSuWSEEHEgC1y9YIoile0tE5TN18nFW2cr+v6nlBICXxTpvyOgG8j3G+PSg
         VID91o9noubYDisivL31jWmdXGE3tX+B+8/EhowjFCUs88LE+V5tA09ln/pnevb8oa
         C6jnpnFMhH5wcVPj+mA0daY0A7qGYj+ysK+tDiBQ=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20231027105449epcas2p233656c3370f3425690f5f3ba1a5390c0~R8YU6_dKg1002610026epcas2p2z;
        Fri, 27 Oct 2023 10:54:49 +0000 (GMT)
Received: from epsmgec2p1.samsung.com (unknown [182.195.36.70]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4SH0143ZPbz4x9Q2; Fri, 27 Oct
        2023 10:54:48 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmgec2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        02.F8.08648.8F69B356; Fri, 27 Oct 2023 19:54:48 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
        20231027105448epcas2p188014a39a10c1ef28910e4431abb1c80~R8YT-cjHW2923729237epcas2p1y;
        Fri, 27 Oct 2023 10:54:48 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20231027105448epsmtrp18e31d17ba59d49658d7cf97dee82ad51~R8YT_wIT41635116351epsmtrp1f;
        Fri, 27 Oct 2023 10:54:48 +0000 (GMT)
X-AuditID: b6c32a43-4b3ff700000021c8-1c-653b96f8d0b1
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        AD.81.08755.7F69B356; Fri, 27 Oct 2023 19:54:47 +0900 (KST)
Received: from KORCO082417 (unknown [75.12.40.192]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20231027105447epsmtip2f5fe799c96333e22ddd5b55634558e1b~R8YTwZkLO0497504975epsmtip2g;
        Fri, 27 Oct 2023 10:54:47 +0000 (GMT)
From:   "Chanho Park" <chanho61.park@samsung.com>
To:     "'Marek Szyprowski'" <m.szyprowski@samsung.com>,
        <linux-samsung-soc@vger.kernel.org>, <linux-i2c@vger.kernel.org>
Cc:     "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>,
        "'Alim Akhtar'" <alim.akhtar@samsung.com>,
        "'Andi Shyti'" <andi.shyti@kernel.org>,
        "'Wolfram Sang'" <wsa@kernel.org>
In-Reply-To: <20231025121725.46028-4-m.szyprowski@samsung.com>
Subject: RE: [PATCH v2 3/3] i2c: s3c24xx: add support for atomic transfers
Date:   Fri, 27 Oct 2023 19:54:47 +0900
Message-ID: <000701da08c4$00aa1650$01fe42f0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQFAtDqCAoG6rpZP+2s4rZk6TTwtCAJ93w/9Ae8mjv6xbLdMoA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprAJsWRmVeSWpSXmKPExsWy7bCmhe6PadapBgu2SFs8mLeNzeL+1w5G
        i72vt7JbdPz9wmgx4/w+Jou1R+6yW9zdP5fRgd1j06pONo871/awefRtWcXo8XmTXABLVLZN
        RmpiSmqRQmpecn5KZl66rZJ3cLxzvKmZgaGuoaWFuZJCXmJuqq2Si0+ArltmDtAFSgpliTml
        QKGAxOJiJX07m6L80pJUhYz84hJbpdSClJwC8wK94sTc4tK8dL281BIrQwMDI1OgwoTsjDcT
        HAqWSlS0dvWwNTA+Fe5i5OSQEDCR2PDsKnsXIxeHkMAORomX958yQjifGCVOP2yFynxjlHjQ
        /ocFpuXT/LlgtpDAXkaJ1gVKEEUvGCX2TFnNCpJgE9CXeNmxDcwWESiXeHhsDxtIEbPANkaJ
        t+cfgHVzCthJ3NmwFMjm4BAW8JJYv1ELJMwioCoxccstNhCbV8BS4vH6I6wQtqDEyZlPwFqZ
        BeQltr+dwwxxkILEz6fLWCHi4hIvjx5hh9jrJNH2YxUzyF4JgaUcEvMenodqcJHYcewoI4Qt
        LPHq+BZ2CFtK4mV/GzvIPRJAR+9YlgTR28Io0dy2B6rXXuLHzSmsIDXMApoS63fpQ5QrSxy5
        BXUan0TH4b9QU3glOtqEIBrVJQ5snw4NQlmJ7jmfWScwKs1C8tgsJI/NQvLMLIRdCxhZVjGK
        pRYU56anJhsVGMKjOjk/dxMjOGlqOe9gvDL/n94hRiYOxkOMEhzMSiK8kT4WqUK8KYmVValF
        +fFFpTmpxYcYTYFBPZFZSjQ5H5i280riDU0sDUzMzAzNjUwNzJXEee+1zk0REkhPLEnNTk0t
        SC2C6WPi4JRqYJJwaNx5sZ+5ds2fL/LxGzYKXXnsteXKy4BNG56UNLA5/9geVB5aJ7m9fYP0
        U35Z6wUTtKf/qgqaLfg3XKLis/3EPF4Ju8PF5j4fT/c/f5i+zI/Xfz/3f/uaO8YW/XLHEw6y
        iR4/xRs3M7h+S4uAq+3eQB/1jBJBr0vpGx0XSJ4TOsiUZug3T5HH8LeD2q+qlZ+Ed09Kup6i
        xbbokc7U15FrnkRcjxeRF/DlqH/5a7WIUsDdLpe3F1YXqkj/1tyxOmzHm8XbGhsWdywqk30o
        FiDmVnKawclWqSHyhrXSbZumVRvml/y7EDjxxqU/eq8ZLk6/6rhnXofE4YJPSzgc/AXP/9A9
        fKtw4ZqiGfvcbyuxFGckGmoxFxUnAgCGztHGIwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKIsWRmVeSWpSXmKPExsWy7bCSvO73adapBpd2m1k8mLeNzeL+1w5G
        i72vt7JbdPz9wmgx4/w+Jou1R+6yW9zdP5fRgd1j06pONo871/awefRtWcXo8XmTXABLFJdN
        SmpOZllqkb5dAlfGmwkOBUslKlq7etgaGJ8KdzFyckgImEh8mj+XpYuRi0NIYDejxOKpE9gh
        ErISz97tgLKFJe63HGGFKHrGKLHjxmdGkASbgL7Ey45tQAkODhGBSonuTRIgNcwCOxglXv6a
        wQjRcJBR4uvd9WANnAJ2Enc2LGUBaRAW8JJYv1ELJMwioCoxccstNhCbV8BS4vF6kGUgtqDE
        yZlPWEBsZgFtid6HrYwQtrzE9rdzmCGOU5D4+XQZK8zRf47OZYOoEZd4efQI2AMiAk4SbT9W
        McM8c/fBS/YJjKKzkKyYhWTFLCQrZiEZtYCRZRWjZGpBcW56brFhgWFearlecWJucWleul5y
        fu4mRnDMaWnuYNy+6oPeIUYmDsZDjBIczEoivJE+FqlCvCmJlVWpRfnxRaU5qcWHGKU5WJTE
        ecVf9KYICaQnlqRmp6YWpBbBZJk4OKUamE7uP+5wjLFp/sZSYZbOgrZ4/UMVPbP2C/Eel6rY
        XKZStqTgacj1qrM9H3au9xTkzpz2kT+Qobb77PeMzVxvvq9QnsQe3qjYyRwfyheTzHGkaW1b
        qGl3xb1reTdniX/Yu9HFlaHI97/s/Ut/lga/Npknv6uGQa72X9+jE/ZffszSXPJs1kqmT/Mc
        vp5yU/50RkLJe0L73u2pCg9jbrwuc7+ce+V7Qb1QynSGlDp+VWt1WUZn+/b3X5fwLbDfwPbg
        x6czrPM9vdae01sW+rht+801hZt/+8cEWK2WFv6YNu+risR6W+sD75+EPhBcL50Y1+I3RWr+
        TnG7ZwvCNi0Jv35QMEb31v4yoV7zB5E/vyqxFGckGmoxFxUnAgAKdSIdKAMAAA==
X-CMS-MailID: 20231027105448epcas2p188014a39a10c1ef28910e4431abb1c80
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231025121740eucas1p2db798a12d80580af321c75edf5d59663
References: <20231025121725.46028-1-m.szyprowski@samsung.com>
        <CGME20231025121740eucas1p2db798a12d80580af321c75edf5d59663@eucas1p2.samsung.com>
        <20231025121725.46028-4-m.szyprowski@samsung.com>
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

> -----Original Message-----
> From: Marek Szyprowski <m.szyprowski@samsung.com>
> Sent: Wednesday, October 25, 2023 9:17 PM
> To: linux-samsung-soc@vger.kernel.org; linux-i2c@vger.kernel.org
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>; Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org>; Alim Akhtar <alim.akhtar@samsung.com>;
> Andi Shyti <andi.shyti@kernel.org>; Wolfram Sang <wsa@kernel.org>
> Subject: [PATCH v2 3/3] i2c: s3c24xx: add support for atomic transfers
> 
> 
> Add support for atomic transfers using polling mode with interrupts
> intentionally disabled to get rid of the warning introduced by commit
> 63b96983a5dd ("i2c: core: introduce callbacks for atomic transfers")
> during system reboot and power-off.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Reviewed-by: Chanho Park <chanho61.park@samsung.com>

> ---
>  drivers/i2c/busses/i2c-s3c2410.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-
> s3c2410.c
> index 8da85cb42980..586b82b30bdf 100644
> --- a/drivers/i2c/busses/i2c-s3c2410.c
> +++ b/drivers/i2c/busses/i2c-s3c2410.c
> @@ -76,6 +76,7 @@
>  #define QUIRK_HDMIPHY		(1 << 1)
>  #define QUIRK_NO_GPIO		(1 << 2)
>  #define QUIRK_POLL		(1 << 3)
> +#define QUIRK_ATOMIC		(1 << 4)
> 
>  /* Max time to wait for bus to become idle after a xfer (in us) */
>  #define S3C2410_IDLE_TIMEOUT	5000
> @@ -174,7 +175,7 @@ static inline void s3c24xx_i2c_master_complete(struct
> s3c24xx_i2c *i2c, int ret)
>  	if (ret)
>  		i2c->msg_idx = ret;
> 
> -	if (!(i2c->quirks & QUIRK_POLL))
> +	if (!(i2c->quirks & (QUIRK_POLL | QUIRK_ATOMIC)))
>  		wake_up(&i2c->wait);
>  }
> 
> @@ -700,7 +701,7 @@ static int s3c24xx_i2c_doxfer(struct s3c24xx_i2c *i2c,
>  	s3c24xx_i2c_enable_irq(i2c);
>  	s3c24xx_i2c_message_start(i2c, msgs);
> 
> -	if (i2c->quirks & QUIRK_POLL) {
> +	if (i2c->quirks & (QUIRK_POLL | QUIRK_ATOMIC)) {
>  		while ((i2c->msg_num != 0) && is_ack(i2c)) {
>  			unsigned long stat = readl(i2c->regs +
> S3C2410_IICSTAT);
> 
> @@ -774,6 +775,21 @@ static int s3c24xx_i2c_xfer(struct i2c_adapter *adap,
>  	return -EREMOTEIO;
>  }
> 
> +static int s3c24xx_i2c_xfer_atomic(struct i2c_adapter *adap,
> +				   struct i2c_msg *msgs, int num)
> +{
> +	struct s3c24xx_i2c *i2c = (struct s3c24xx_i2c *)adap->algo_data;
> +	int ret;
> +
> +	disable_irq(i2c->irq);
> +	i2c->quirks |= QUIRK_ATOMIC;
> +	ret = s3c24xx_i2c_xfer(adap, msgs, num);
> +	i2c->quirks &= ~QUIRK_ATOMIC;
> +	enable_irq(i2c->irq);
> +
> +	return ret;
> +}
> +
>  /* declare our i2c functionality */
>  static u32 s3c24xx_i2c_func(struct i2c_adapter *adap)
>  {
> @@ -784,6 +800,7 @@ static u32 s3c24xx_i2c_func(struct i2c_adapter *adap)
>  /* i2c bus registration info */
>  static const struct i2c_algorithm s3c24xx_i2c_algorithm = {
>  	.master_xfer		= s3c24xx_i2c_xfer,
> +	.master_xfer_atomic     = s3c24xx_i2c_xfer_atomic,
>  	.functionality		= s3c24xx_i2c_func,
>  };
> 
> --
> 2.34.1


