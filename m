Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76C89D2143
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Oct 2019 09:01:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727296AbfJJHBh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Oct 2019 03:01:37 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:38134 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726864AbfJJHBh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Oct 2019 03:01:37 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20191010070134euoutp01169dac6adce041542f5db06e02b38c83~MNwwQaFkf3191131911euoutp01T
        for <linux-i2c@vger.kernel.org>; Thu, 10 Oct 2019 07:01:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20191010070134euoutp01169dac6adce041542f5db06e02b38c83~MNwwQaFkf3191131911euoutp01T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1570690895;
        bh=9Qb+HXoM3YSdNp11C3zR48b48VxCNTQVc82NaoKIpeM=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=ssT0DKap7RhJWuDbhwIuXjSv+TlyC23cS6Q78WjmPplrBQD/PHCQmTkYC8uPw6nTS
         cZt8SycnfSmI42wTAFvQHhPgvqIbG+EIcmO+KCqvqov+yzq1XFKfYS70Tq1omCAAeo
         /uTPC3co/Il3iR0lgnCxwKLODujiMX5duJUjc6eg=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20191010070134eucas1p2af696c60adf770326146e56b386b805b~MNwwBIelY0356003560eucas1p2i;
        Thu, 10 Oct 2019 07:01:34 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 9A.36.04374.E47DE9D5; Thu, 10
        Oct 2019 08:01:34 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20191010070134eucas1p1a5a9a64e9eb496fac919e77c68864367~MNwvrCUIb1596515965eucas1p1H;
        Thu, 10 Oct 2019 07:01:34 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20191010070134eusmtrp24d534bf82ee054ba29762009c4844c49~MNwvqSa7r0121201212eusmtrp2i;
        Thu, 10 Oct 2019 07:01:34 +0000 (GMT)
X-AuditID: cbfec7f5-4f7ff70000001116-23-5d9ed74ea7f7
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id A8.B0.04117.E47DE9D5; Thu, 10
        Oct 2019 08:01:34 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20191010070133eusmtip10aba0388d0be7fe5d8fda6ce38dd381e~MNwvHoUj01290012900eusmtip1d;
        Thu, 10 Oct 2019 07:01:33 +0000 (GMT)
Subject: Re: [PATCH RESEND] gpu: drm: bridge: sii9234: convert to
 devm_i2c_new_dummy_device
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
Message-ID: <4887a9f6-8f37-d56b-322b-c04a38b7361e@samsung.com>
Date:   Thu, 10 Oct 2019 09:01:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191008203322.3238-1-wsa+renesas@sang-engineering.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01SaUhUYRT1m/dm5s3UyOe4XVwKBw2S0iKJB4oYJL1flRUtLtSYD3edZlzr
        R6JZ44pLFI7mmCiZKKPmTkWM5CiapTWpSS5hgdIguZXhkjNPyX/n3nPPved8fBQhHeA7UdEJ
        SawyQR4nE4jJ9t6190fPjlaGHcv660kXDPXz6K32YoL+tLIgoI2/5wi6/6eRpHOKa4S0emMZ
        0R+7KwS0vjCELhw6EyBmFsayhcyr1SqSKVeX8Zm+ohEe07E6zWem8gw85sdTHcm8KSglmaWW
        A+dFwWK/CDYuOoVVevvfEEctf2smFI0Oab/qB4gMpJPmIhEF2AcmjS1kLhJTUlyHoKCsjWcm
        pHgZQUY2yxFLCP7MlpG7ioyt/B3FMwTa4oeIK0wIyjvqheYpWxwGUzkFyIzt8GXoza6xKAjc
        xIP6B/OEmRDgw7DxYlxgxhLsDxWF3ZY+iT1gNK/Tgu3xVVic7uFzMzbQXzZrsSHCgVCrrrNg
        Ah+EDlMFwWFH+DKr5ZmPAZ4TQkNmw7aY2i5OQ++qCxfBFuYNrUIOu8BWl5bH4bswVXeP4LRq
        BG1NXQRH+EKPYdiyh9g2rev25tqnYKJ1nODWW8OYyYazYA0l7Y932hJQ3995ajeYete2s9AR
        aj+sCIqQTLMnmGZPGM2eMJr/d6sQWY8c2WRVfCSrOpHApnqp5PGq5IRIr5uJ8S1o+4sNbBpW
        OtHr9XA9whSS7ZdE9T8Jk/LlKar0eD0CipDZSao1FWFSSYQ8/TarTLyuTI5jVXrkTJEyR8kd
        q+kQKY6UJ7GxLKtglbssjxI5ZaAkhcJbv/lVqnGNeDvzOeZSABl8xeeCacaYGYLJa761EUUl
        rh7hg2u42quxtDDxuUJhNxhqf46JDeqyEhhcRZsnA0eOrDknGy+mhOb7xcRNut+ixN9lqQqr
        wD6REPnqOh8tV3sNL66/1OqyDvm7I4cqvtZnn1tQV+WEa3OaSUaqouTHPQmlSv4Pdi93YV4D
        AAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPIsWRmVeSWpSXmKPExsVy+t/xu7p+1+fFGqxbLWDRe+4kk8X/bROZ
        La58fc9mcfX7S2aLk2+uslh0TlzCbtHx9wujxeVdc9gsDvVFW/Sdc3fg8nh/o5XdY++3BSwe
        sztmsnqcmHCJyWP7twesHve7jzN5PFu4nsXjQO9kFo/Pm+QCOKP0bIryS0tSFTLyi0tslaIN
        LYz0DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0Mr482shcsFas4uOq08wNjOuFuhg5
        OSQETCQa/vewdDFycQgJLGWUOPT4ABNEQlxi9/y3zBC2sMSfa11sEEWvGSUWHJrJCJIQFoiV
        uN/ZC2aLCIRJXJ0zhx2kiFlgA5PE/+6vrCAJIYEZjBKXlseC2GwCmhJ/N99kA7F5Bewk5vTt
        AtvAIqAqcb17B5gtKhAhcXjHLEaIGkGJkzOfsIDYnAKuEks7VoDZzALqEn/mXWKGsOUltr+d
        A2WLS9x6Mp9pAqPQLCTts5C0zELSMgtJywJGllWMIqmlxbnpucVGesWJucWleel6yfm5mxiB
        kbvt2M8tOxi73gUfYhTgYFTi4T1wem6sEGtiWXFl7iFGCQ5mJRHeRbPmxArxpiRWVqUW5ccX
        leakFh9iNAV6biKzlGhyPjCp5JXEG5oamltYGpobmxubWSiJ83YIHIwREkhPLEnNTk0tSC2C
        6WPi4JRqYFTX3xHeOcc0+cqWkiK+6322lqJ7jrY5LNn8k9FNVC5CcBmba8VB954U/VIXMf9v
        aYcTay1KVvU13HtW+jtztXJMttu9j6EPvpaHWi1t1Vpw3bG68tCs+4cmCWV9N3qj5nFnQtCi
        Qzu3vZh+2SrzyppPn2wmCpdce5zLdeHU/YObNZv1RbdveaXEUpyRaKjFXFScCACNG0To8gIA
        AA==
X-CMS-MailID: 20191010070134eucas1p1a5a9a64e9eb496fac919e77c68864367
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20191008203330epcas2p31dc15af8587d35eba5a03f71418587bd
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191008203330epcas2p31dc15af8587d35eba5a03f71418587bd
References: <CGME20191008203330epcas2p31dc15af8587d35eba5a03f71418587bd@epcas2p3.samsung.com>
        <20191008203322.3238-1-wsa+renesas@sang-engineering.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 08.10.2019 22:33, Wolfram Sang wrote:
> Move from the deprecated i2c_new_dummy() to devm_i2c_new_dummy_device().
> We now get an ERRPTR which we use in error handling and we can skip
> removal of the created devices.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---


Applied, thx.


Rergards

Andrzej


>
> Rebased to v5.4-rc2 since last time. One of the last two users of the
> old API, so please apply soon, so I can remove the old interface. Only
> build tested.
>
>  drivers/gpu/drm/bridge/sii9234.c | 36 +++++++++++---------------------
>  1 file changed, 12 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/sii9234.c
> index 25d4ad8c7ad6..8a6c85693a88 100644
> --- a/drivers/gpu/drm/bridge/sii9234.c
> +++ b/drivers/gpu/drm/bridge/sii9234.c
> @@ -841,39 +841,28 @@ static int sii9234_init_resources(struct sii9234 *ctx,
>  
>  	ctx->client[I2C_MHL] = client;
>  
> -	ctx->client[I2C_TPI] = i2c_new_dummy(adapter, I2C_TPI_ADDR);
> -	if (!ctx->client[I2C_TPI]) {
> +	ctx->client[I2C_TPI] = devm_i2c_new_dummy_device(&client->dev, adapter,
> +							 I2C_TPI_ADDR);
> +	if (IS_ERR(ctx->client[I2C_TPI])) {
>  		dev_err(ctx->dev, "failed to create TPI client\n");
> -		return -ENODEV;
> +		return PTR_ERR(ctx->client[I2C_TPI]);
>  	}
>  
> -	ctx->client[I2C_HDMI] = i2c_new_dummy(adapter, I2C_HDMI_ADDR);
> -	if (!ctx->client[I2C_HDMI]) {
> +	ctx->client[I2C_HDMI] = devm_i2c_new_dummy_device(&client->dev, adapter,
> +							  I2C_HDMI_ADDR);
> +	if (IS_ERR(ctx->client[I2C_HDMI])) {
>  		dev_err(ctx->dev, "failed to create HDMI RX client\n");
> -		goto fail_tpi;
> +		return PTR_ERR(ctx->client[I2C_HDMI]);
>  	}
>  
> -	ctx->client[I2C_CBUS] = i2c_new_dummy(adapter, I2C_CBUS_ADDR);
> -	if (!ctx->client[I2C_CBUS]) {
> +	ctx->client[I2C_CBUS] = devm_i2c_new_dummy_device(&client->dev, adapter,
> +							  I2C_CBUS_ADDR);
> +	if (IS_ERR(ctx->client[I2C_CBUS])) {
>  		dev_err(ctx->dev, "failed to create CBUS client\n");
> -		goto fail_hdmi;
> +		return PTR_ERR(ctx->client[I2C_CBUS]);
>  	}
>  
>  	return 0;
> -
> -fail_hdmi:
> -	i2c_unregister_device(ctx->client[I2C_HDMI]);
> -fail_tpi:
> -	i2c_unregister_device(ctx->client[I2C_TPI]);
> -
> -	return -ENODEV;
> -}
> -
> -static void sii9234_deinit_resources(struct sii9234 *ctx)
> -{
> -	i2c_unregister_device(ctx->client[I2C_CBUS]);
> -	i2c_unregister_device(ctx->client[I2C_HDMI]);
> -	i2c_unregister_device(ctx->client[I2C_TPI]);
>  }
>  
>  static inline struct sii9234 *bridge_to_sii9234(struct drm_bridge *bridge)
> @@ -950,7 +939,6 @@ static int sii9234_remove(struct i2c_client *client)
>  
>  	sii9234_cable_out(ctx);
>  	drm_bridge_remove(&ctx->bridge);
> -	sii9234_deinit_resources(ctx);
>  
>  	return 0;
>  }


