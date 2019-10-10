Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2075D214C
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Oct 2019 09:04:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732671AbfJJHEy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Oct 2019 03:04:54 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:47041 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727130AbfJJHEy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Oct 2019 03:04:54 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20191010070452euoutp02f6f22007cf8a45d6c7603c65434df514~MNzoS7pui0319703197euoutp02e
        for <linux-i2c@vger.kernel.org>; Thu, 10 Oct 2019 07:04:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20191010070452euoutp02f6f22007cf8a45d6c7603c65434df514~MNzoS7pui0319703197euoutp02e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1570691092;
        bh=IcYxKHi2Xesm/jrMZDTKLhWj1oXp7N/IpwBAwGTZE3I=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=l3hTUmRw7+YtnUgTw8WBf3k5wL80B4GPq0OZNEP1q1O1NqjWmqLyFrm0Tm+gUhDul
         Tsj6brbJr9Ty0HVownVILTMZcN83SeDmNUpDS82Toz9thMqMWGwWgpywPNO33Zuybz
         5YbM/NGv5a/EWEsplhY/SKh59Cu1eYx1d3dSrDW0=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20191010070452eucas1p2536e7967a31f117344e66eeb02092173~MNzn4iXeq0392803928eucas1p2C;
        Thu, 10 Oct 2019 07:04:52 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 86.B6.04374.418DE9D5; Thu, 10
        Oct 2019 08:04:52 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20191010070451eucas1p1c05d72ce4c3709a82de805e38a087813~MNznRCSDS2845628456eucas1p1E;
        Thu, 10 Oct 2019 07:04:51 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20191010070451eusmtrp100dc99bc5b07635c96c8270177c2b855~MNznQVugT2943929439eusmtrp1V;
        Thu, 10 Oct 2019 07:04:51 +0000 (GMT)
X-AuditID: cbfec7f5-4f7ff70000001116-67-5d9ed8148456
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 59.11.04117.318DE9D5; Thu, 10
        Oct 2019 08:04:51 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20191010070450eusmtip29f024496be5d307d3780b94a00b1b2f2~MNzmyPmvx1878018780eusmtip2c;
        Thu, 10 Oct 2019 07:04:50 +0000 (GMT)
Subject: Re: [PATCH RESEND] gpu: drm: bridge: analogix-anx78xx: convert to
 i2c_new_dummy_device
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        dri-devel@lists.freedesktop.org
Cc:     linux-i2c@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org
From:   Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <97111f38-0820-edf5-8316-58fef6b065cf@samsung.com>
Date:   Thu, 10 Oct 2019 09:04:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191008203145.3159-1-wsa+renesas@sang-engineering.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01SaUgUYRju25mdnV1dGVfFN5WihSIlj9QfQ4dmdMyPfgRBSJvYpINr6aq7
        alqUkprmhavQ4qampWlKeZ9gh4K6mEe5phke1BYqiZBnkZrrKPnveZ/neY8HXhKTvRc6kKGq
        aE6tYsPkhARv6vo94Go7WhTgsVGH01n9BgG90aTFaOPSPEEPr8xgtOHnME4/1JaK6LS1RUQP
        tRUQdEe2gs7uP39KwsyPpoiY9uVinHmcli9kenI+Cpjm5SkhM5nRLWB+lFTjzNusPJxZqNt3
        UXxFciKYCwuN5dTuPtckynZdLxHZaBGnzcjBE9FzcToSk0B5w5uFT0Q6kpAyqgJB7YsqEV8s
        Ilgt78P5YgHB1LBJtNOyvJaJeKEcQdKYcbuYQ6DNStx0kaQNxUKD3svcYEtdhq6U0q1JGFUj
        gMrUWcwsEJQzrNV/JsxYSvlAf+v4Fo9TB2HgS/IWb0f5w6+pTiHvsQZDvgk3YzF1FrTGR1se
        jNoPzXMFGI/tYcz0RGBeBtSMCJbaSrbPPgODrbUCHtvAbHfDNu8EvXmZOI8TYLIiGeOb0xA0
        1rRivHAcOrs/CM3JsM2rq9vcedoPhqbbCTMNlBWMzlnzN1hBbpMO42kppD2Q8e4DMNnXuD3Q
        HsoGl4gcJNfvSqbflUa/K43+/95ihFciey5GEx7CabxU3C03DRuuiVGFuAVFhNehzR/rXe9e
        akGv/17vQBSJ5JZSpaEwQCZkYzXx4R0ISExuK32qLwiQSYPZ+NucOiJQHRPGaTqQI4nL7aV3
        9kwpZFQIG83d5LhITr2jCkixQyJSKFJtZRdspvNXXo3b+Rf0OB/72mWhRWUeUYKklD9xjnEr
        I+r4EafvE13uurvWFsrMrD6lb1VQW6pnXeXpl+cuuZxMaJ+tz74q9PaMKjvcYCg0VjVNBPrl
        HnFdfPJs/Ibu/mq1ad5zZsKg+3aIbrnX6GtpeNdgXFfNhbJFe2MmFXJco2SPumBqDfsPKKmD
        dl8DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPIsWRmVeSWpSXmKPExsVy+t/xe7rCN+bFGpz4L2HRe+4kk8X/bROZ
        La58fc9mcfX7S2aLk2+uslh0TlzCbtHx9wujxeVdc9gsDvVFW/Sdc3fg8nh/o5XdY++3BSwe
        sztmsnqcmHCJyWP7twesHve7jzN5PFu4nsXjQO9kFo/Pm+QCOKP0bIryS0tSFTLyi0tslaIN
        LYz0DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0MvZOP81WsJW7YmL3BJYGxmWcXYyc
        HBICJhLf/vYwdjFycQgJLGWUuLNuJzNEQlxi9/y3ULawxJ9rXWwQRa8ZJf4caWXpYuTgEBZI
        lNgyyxikRkQgTOLqnDnsIDXMAhuYJP53f2WFaJjBKHHmSzsbSBWbgKbE3803wWxeATuJczvv
        gm1gEVCVOH+7BSwuKhAhcXjHLEaIGkGJkzOfsIDYnAKuEhOvTAOrYRZQl/gz7xIzhC0vsf3t
        HChbXOLWk/lMExiFZiFpn4WkZRaSlllIWhYwsqxiFEktLc5Nzy020itOzC0uzUvXS87P3cQI
        jNxtx35u2cHY9S74EKMAB6MSD++B03NjhVgTy4orcw8xSnAwK4nwLpo1J1aINyWxsiq1KD++
        qDQntfgQoynQcxOZpUST84FJJa8k3tDU0NzC0tDc2NzYzEJJnLdD4GCMkEB6YklqdmpqQWoR
        TB8TB6dUA2PF37CefzeluSfXhyYtjU//36igdVX3ZL1o2af3vj2vRK+uztZVK10pXb/j9DuR
        ZcsY6ndc+X5zj9IhRRsz8/olKpb3bz5UYFzD9ThKK9fll7Zp/K8tHw3l2+7fm83pI7rdbcJX
        7gXTzKSnXn9YsGblqoY7mz8LVjF3L/nekXD0pD27z63529uVWIozEg21mIuKEwGJ8XFX8gIA
        AA==
X-CMS-MailID: 20191010070451eucas1p1c05d72ce4c3709a82de805e38a087813
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20191008203222epcas4p4a9ab2b8dd10759e61ce9b1ec4547d13f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191008203222epcas4p4a9ab2b8dd10759e61ce9b1ec4547d13f
References: <CGME20191008203222epcas4p4a9ab2b8dd10759e61ce9b1ec4547d13f@epcas4p4.samsung.com>
        <20191008203145.3159-1-wsa+renesas@sang-engineering.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 08.10.2019 22:31, Wolfram Sang wrote:
> Move from the deprecated i2c_new_dummy() to i2c_new_dummy_device(). We
> now get an ERRPTR which we use in error handling.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


Brian's patch is already applied.


Regards

Andrzej


> ---
>
> Rebased to v5.4-rc2 since last time. One of the last two users of the
> old API, so please apply soon, so I can remove the old interface. Only
> build tested.
>
>  drivers/gpu/drm/bridge/analogix-anx78xx.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix-anx78xx.c
> index 3c7cc5af735c..be7756280e41 100644
> --- a/drivers/gpu/drm/bridge/analogix-anx78xx.c
> +++ b/drivers/gpu/drm/bridge/analogix-anx78xx.c
> @@ -1350,10 +1350,10 @@ static int anx78xx_i2c_probe(struct i2c_client *client,
>  
>  	/* Map slave addresses of ANX7814 */
>  	for (i = 0; i < I2C_NUM_ADDRESSES; i++) {
> -		anx78xx->i2c_dummy[i] = i2c_new_dummy(client->adapter,
> +		anx78xx->i2c_dummy[i] = i2c_new_dummy_device(client->adapter,
>  						anx78xx_i2c_addresses[i] >> 1);
> -		if (!anx78xx->i2c_dummy[i]) {
> -			err = -ENOMEM;
> +		if (IS_ERR(anx78xx->i2c_dummy[i])) {
> +			err = PTR_ERR(anx78xx->i2c_dummy[i]);
>  			DRM_ERROR("Failed to reserve I2C bus %02x\n",
>  				  anx78xx_i2c_addresses[i]);
>  			goto err_unregister_i2c;


