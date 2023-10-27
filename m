Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE2E87D95B0
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Oct 2023 12:55:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345702AbjJ0KzI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Oct 2023 06:55:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345598AbjJ0KzH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Oct 2023 06:55:07 -0400
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8332F9C
        for <linux-i2c@vger.kernel.org>; Fri, 27 Oct 2023 03:55:04 -0700 (PDT)
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20231027105503epoutp0481fbd340d87eff6d77d37c068efdaa67~R8Yh85Ffw3042230422epoutp04-
        for <linux-i2c@vger.kernel.org>; Fri, 27 Oct 2023 10:55:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20231027105503epoutp0481fbd340d87eff6d77d37c068efdaa67~R8Yh85Ffw3042230422epoutp04-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1698404103;
        bh=H3MVpopGeloxg1/JItrWHT0irmIL8/84ZB4k0J5b018=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=UsVeI/A7bFD5JpnlNNbsIO4oJWfaOuJLbaei7v/2a0jOAp9bjGMJ55AFmSgGtgZ5J
         fWz3N26wITUr+KfXumjDLt0AqDjguQzY8ZTvG4l/dXCMGwqoZyyw3/GDptsTxlA5q+
         GwFFefg+wC19/TgT6YZAUxmErnad7PQGXUCDXwMo=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20231027105502epcas2p16e0d0e3c445467515d0b72a0a2e73c30~R8Yhrmy601401014010epcas2p1a;
        Fri, 27 Oct 2023 10:55:02 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.101]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4SH01L1ML2z4x9Q5; Fri, 27 Oct
        2023 10:55:02 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        CC.70.10006.6079B356; Fri, 27 Oct 2023 19:55:02 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
        20231027105501epcas2p114f30d5f88192e7eb31de722a26e8deb~R8YgZgPYs2923729237epcas2p1F;
        Fri, 27 Oct 2023 10:55:01 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20231027105501epsmtrp298acb09fad92d3e22dcd775e2499d7ef~R8YgY2fZ60498904989epsmtrp2Y;
        Fri, 27 Oct 2023 10:55:01 +0000 (GMT)
X-AuditID: b6c32a45-179ff70000002716-22-653b97050c3b
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
        7A.EC.18939.5079B356; Fri, 27 Oct 2023 19:55:01 +0900 (KST)
Received: from KORCO082417 (unknown [75.12.40.192]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20231027105501epsmtip2fe0bd10a0018d1efa215fdd2a93aea7b~R8YgJQzFa2206422064epsmtip2g;
        Fri, 27 Oct 2023 10:55:01 +0000 (GMT)
From:   "Chanho Park" <chanho61.park@samsung.com>
To:     "'Marek Szyprowski'" <m.szyprowski@samsung.com>,
        <linux-samsung-soc@vger.kernel.org>, <linux-i2c@vger.kernel.org>
Cc:     "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>,
        "'Alim Akhtar'" <alim.akhtar@samsung.com>,
        "'Andi Shyti'" <andi.shyti@kernel.org>,
        "'Wolfram Sang'" <wsa@kernel.org>
In-Reply-To: <20231025121725.46028-3-m.szyprowski@samsung.com>
Subject: RE: [PATCH v2 2/3] i2c: s3c24xx: fix transferring more than one
 message in polling mode
Date:   Fri, 27 Oct 2023 19:55:01 +0900
Message-ID: <000801da08c4$08990830$19cb1890$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQFAtDqCAoG6rpZP+2s4rZk6TTwtCAHco7QQAjgAFhOxb3pz4A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprEJsWRmVeSWpSXmKPExsWy7bCmuS7bdOtUgzU3mC0ezNvGZnH/awej
        xd7XW9ktOv5+YbSYcX4fk8XaI3fZLe7un8vowO6xaVUnm8eda3vYPPq2rGL0+LxJLoAlKtsm
        IzUxJbVIITUvOT8lMy/dVsk7ON453tTMwFDX0NLCXEkhLzE31VbJxSdA1y0zB+gCJYWyxJxS
        oFBAYnGxkr6dTVF+aUmqQkZ+cYmtUmpBSk6BeYFecWJucWleul5eaomVoYGBkSlQYUJ2xotz
        u9gK9ktW3L7xl7mB8ZxIFyMnh4SAicT59X/YQGwhgR2MEr/m+3UxcgHZnxgl1p/6ywTnzP8+
        mx2m49WRG2wQiZ2MEicu32CBcF4wSjzbepMFpIpNQF/iZcc2VhBbRKBc4uGxPWAdzALbGCXe
        nn8AVsQpYCdx5fFBsOXCAkkSXZsegjWwCKhKnJ18kRnE5hWwlFjVv5ENwhaUODnzCVgvs4C8
        xPa3c5ghTlKQ+Pl0GStEXFzi5dEj7BCLnSRm7l4A9oOEwFwOiUmHr0A1uEhM3XaCDcIWlnh1
        fAvUb1ISn9/tBYpzANnlEjuWJUH0tjBKNLftgeq1l/hxcworSA2zgKbE+l36EOXKEkduQZ3G
        J9Fx+C87RJhXoqNNCKJRXeLA9uksELasRPecz6wTGJVmIXlsFpLHZiF5ZhbCrgWMLKsYxVIL
        inPTU4uNCgzhkZ2cn7uJEZw4tVx3ME5++0HvECMTB+MhRgkOZiUR3kgfi1Qh3pTEyqrUovz4
        otKc1OJDjKbAoJ7ILCWanA9M3Xkl8YYmlgYmZmaG5kamBuZK4rz3WuemCAmkJ5akZqemFqQW
        wfQxcXBKNTAxR+dERBRGG3hMPDVRt8FMWm1TWqD/p629fQf+6OowxSgwd8W/N3goVBtw6OP2
        N0zRnP3PFJTMFH2nBFQaTzy+a19X2+1Ou7BwA5a9Eckhr+4ZFcUvmt7DeXur0mzTsqXnN9Rs
        Vpa8xf/pleK1Bbnb4m6VNugv32tsJHGzIetycsr1oMpdszZMunBY8uLuzPsXUm8lP3a57P/2
        4c+9FsvuHLJx6zoclZbl2Pm3k0VOU+Zq5oXid8tXfMycpWtn5H8lxG1ydeSnzd9X2B+YnLUv
        z+DQ43yxLRn9L38Y/1E/sum9lVPe67M+uxTXeccunSRX6fj0O+vR7+8yxK6v4fbtrNOIE13X
        8CZgigTvLW4lluKMREMt5qLiRADztp6/JQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMIsWRmVeSWpSXmKPExsWy7bCSvC7rdOtUg19vuC0ezNvGZnH/awej
        xd7XW9ktOv5+YbSYcX4fk8XaI3fZLe7un8vowO6xaVUnm8eda3vYPPq2rGL0+LxJLoAlissm
        JTUnsyy1SN8ugSvjxbldbAX7JStu3/jL3MB4TqSLkZNDQsBE4tWRG2xdjFwcQgLbGSVm/N/H
        CpGQlXj2bgc7hC0scb/lCCtE0TNGic9T37KBJNgE9CVedmwDSnBwiAhUSnRvkgCpYRbYwSjx
        8tcMRoiGg0DOmXdMIA2cAnYSVx4fBGsWFkiQmDyrBWwDi4CqxNnJF5lBbF4BS4lV/RvZIGxB
        iZMzn7CA2MwC2hK9D1sZIWx5ie1v5zBDXKcg8fPpMrir/xydywZRIy7x8ugRsPkiAk4SM3cv
        YIL55u6Dl+wTGEVnIVkxC8mKWUhWzEIyagEjyypG0dSC4tz03OQCQ73ixNzi0rx0veT83E2M
        4HjTCtrBuGz9X71DjEwcjIcYJTiYlUR4I30sUoV4UxIrq1KL8uOLSnNSiw8xSnOwKInzKud0
        pggJpCeWpGanphakFsFkmTg4pRqYMr8/sFg5WWtzcIz+h6z4zSlMKdWX7ssrih6c8sCVW01o
        d2Gdo9x+7u38vBmKpbM+1ib8OH/UYhWLUtKfJ+/1ZExqXwvXLqh2nchy5658cfvTTTYmiysu
        zZrEOfW7V+8UNXexVVoy7cfsDbTdt7JmXvROfH36lsH8hVGCX5yXn36eNt3mjsu06805KoYu
        E74fmG4ee6bpoMea+xMEGL9uPxk4i1OckeuMkmHg7oOFmQolJZ6PkvIVr/0+v5Vb99r/N+3B
        q/VT1z+7qCLAkj9zivebt4E/+JQ73LcebzjccTz3tv9vS8+FB7hWdFtI/mxMy9na+vjvf+Pw
        9XOXXXglqcl4rcBtSvCZ7X2RXnKrlFiKMxINtZiLihMB4doe3CYDAAA=
X-CMS-MailID: 20231027105501epcas2p114f30d5f88192e7eb31de722a26e8deb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231025121739eucas1p26ce7f34cb63076626d40e08962497a0b
References: <20231025121725.46028-1-m.szyprowski@samsung.com>
        <CGME20231025121739eucas1p26ce7f34cb63076626d40e08962497a0b@eucas1p2.samsung.com>
        <20231025121725.46028-3-m.szyprowski@samsung.com>
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
> Subject: [PATCH v2 2/3] i2c: s3c24xx: fix transferring more than one
> message in polling mode
> 
> To properly handle ACK on the bus when transferring more than one
> message in polling mode, move the polling handling loop from
> s3c24xx_i2c_message_start() to s3c24xx_i2c_doxfer(). This way
> i2c_s3c_irq_nextbyte() is always executed till the end, properly
> acknowledging the IRQ bits and no recursive calls to
> i2c_s3c_irq_nextbyte() are made.
> 
> While touching this, also fix finishing transfers in polling mode by
> using common code path and always waiting for the bus to become idle
> and disabled.
> 
> Fixes: 117053f77a5a ("i2c: s3c2410: Add polling mode support")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Reviewed-by: Chanho Park <chanho61.park@samsung.com>

> ---
>  drivers/i2c/busses/i2c-s3c2410.c | 25 ++++++++++---------------
>  1 file changed, 10 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-
> s3c2410.c
> index f9dcb1112a61..8da85cb42980 100644
> --- a/drivers/i2c/busses/i2c-s3c2410.c
> +++ b/drivers/i2c/busses/i2c-s3c2410.c
> @@ -275,16 +275,6 @@ static void s3c24xx_i2c_message_start(struct
> s3c24xx_i2c *i2c,
> 
>  	stat |= S3C2410_IICSTAT_START;
>  	writel(stat, i2c->regs + S3C2410_IICSTAT);
> -
> -	if (i2c->quirks & QUIRK_POLL) {
> -		while ((i2c->msg_num != 0) && is_ack(i2c)) {
> -			i2c_s3c_irq_nextbyte(i2c, stat);
> -			stat = readl(i2c->regs + S3C2410_IICSTAT);
> -
> -			if (stat & S3C2410_IICSTAT_ARBITR)
> -				dev_err(i2c->dev, "deal with arbitration
> loss\n");
> -		}
> -	}
>  }
> 
>  static inline void s3c24xx_i2c_stop(struct s3c24xx_i2c *i2c, int ret)
> @@ -691,7 +681,7 @@ static void s3c24xx_i2c_wait_idle(struct s3c24xx_i2c
> *i2c)
>  static int s3c24xx_i2c_doxfer(struct s3c24xx_i2c *i2c,
>  			      struct i2c_msg *msgs, int num)
>  {
> -	unsigned long timeout;
> +	unsigned long timeout = 0;
>  	int ret;
> 
>  	ret = s3c24xx_i2c_set_master(i2c);
> @@ -711,16 +701,21 @@ static int s3c24xx_i2c_doxfer(struct s3c24xx_i2c
> *i2c,
>  	s3c24xx_i2c_message_start(i2c, msgs);
> 
>  	if (i2c->quirks & QUIRK_POLL) {
> -		ret = i2c->msg_idx;
> +		while ((i2c->msg_num != 0) && is_ack(i2c)) {
> +			unsigned long stat = readl(i2c->regs +
> S3C2410_IICSTAT);
> 
> -		if (ret != num)
> -			dev_dbg(i2c->dev, "incomplete xfer (%d)\n", ret);
> +			i2c_s3c_irq_nextbyte(i2c, stat);
> 
> -		goto out;
> +			stat = readl(i2c->regs + S3C2410_IICSTAT);
> +			if (stat & S3C2410_IICSTAT_ARBITR)
> +				dev_err(i2c->dev, "deal with arbitration
> loss\n");
> +		}
> +		goto skip_waiting;
>  	}
> 
>  	timeout = wait_event_timeout(i2c->wait, i2c->msg_num == 0, HZ * 5);
> 
> + skip_waiting:
>  	ret = i2c->msg_idx;
> 
>  	/*
> --
> 2.34.1


