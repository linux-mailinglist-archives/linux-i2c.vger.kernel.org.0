Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 168D266AE0
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jul 2019 12:29:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726266AbfGLK3H (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 Jul 2019 06:29:07 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:32908 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726057AbfGLK3G (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 12 Jul 2019 06:29:06 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190712102904euoutp01c8497a3b9d60c2d532eca98269dabc46~woiOSVC_n1918119181euoutp01V;
        Fri, 12 Jul 2019 10:29:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190712102904euoutp01c8497a3b9d60c2d532eca98269dabc46~woiOSVC_n1918119181euoutp01V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1562927344;
        bh=VEpLWiW6/QiT7z2s1cB8cIpHRz911sMU9UVfC83G/U0=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=I23ylN2cz6CtS4SRs9otlsnCcnaVaIewQopwjXQUCZP+1ZfWPfgCFjyzvxPzZzmty
         ft9PZmUejt6qOf9m0xwbS0S45IQmfk/A3p58KA5xEtBCeLF5Le9dI2QjOFajtL4bgs
         u1UNtlINCz8SpRkYRoTUfGqRwN8fgW3rUK1PV3qI=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190712102903eucas1p156f80bd2dd99c10f2172e97f04dd04e9~woiNs-S7s3262832628eucas1p1N;
        Fri, 12 Jul 2019 10:29:03 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id BD.91.04325.FE0682D5; Fri, 12
        Jul 2019 11:29:03 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190712102902eucas1p232180d90fd3da30bf5b5b1b9616ce2b8~woiM1N7jD2832928329eucas1p2K;
        Fri, 12 Jul 2019 10:29:02 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190712102902eusmtrp2f1ec7f171aa61f6300b793afb5d811da~woiMmufg61211412114eusmtrp2H;
        Fri, 12 Jul 2019 10:29:02 +0000 (GMT)
X-AuditID: cbfec7f5-b75ff700000010e5-53-5d2860eff3c2
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id BB.BB.04146.EE0682D5; Fri, 12
        Jul 2019 11:29:02 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190712102901eusmtip1f5312a92b645712d67f0e4501bfdddb0~woiLObi5K1170711707eusmtip16;
        Fri, 12 Jul 2019 10:29:01 +0000 (GMT)
Subject: Re: [PATCH 6/6] media: i2c: Convert to new i2c device probe()
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-i2c@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Leon Luo <leonl@leopardimaging.com>,
        Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Luis Oliveira <lolivei@synopsys.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Wenyou Yang <wenyou.yang@microchip.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Akinobu Mita <akinobu.mita@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Mats Randgaard <matrandg@cisco.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Michael Grzeschik <m.grzeschik@pengutronix.de>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
        Simon Horman <horms+renesas@verge.net.au>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        Richard Fontana <rfontana@redhat.com>,
        Todor Tomov <todor.tomov@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Julia Lawall <Julia.Lawall@lip6.fr>,
        Alexey Khoroshilov <khoroshilov@ispras.ru>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        open list <linux-kernel@vger.kernel.org>
From:   Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <d46b2db8-e374-ecb6-3bb8-942068a152b9@samsung.com>
Date:   Fri, 12 Jul 2019 12:29:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
        Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20190710215149.9208-7-kieran.bingham+renesas@ideasonboard.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01TbUxTVxj23Ht7721j3bWovLplk4Zlc8l0y/xxjIvZItsOm4n7iMvGNNDN
        m+pWqukV/Fi2OVAoDIdfDLiFjTBktWiBQhE6mQQUZA7CVBSVrmSSCKxUQFwkQFnbWzP+Pef5
        OO/z/nh5WhdgV/A7zXtEi9lg0rMapqF9qvvF+ynPb3spO2M5HmmxInz6cpDBze09DM78uZrF
        FVMeCveMjrHYe+8QwpUDVxBudDZxeOLGdwjnlWQg3JXh53DOsQoOF+dvwtbZSYSveUpYnFfj
        VmH3cIDCt+REPObppXF91nUKF/opXOmaobD3r8sMHvbZaXypcI7G5+9W01j2x+A2f7YKT9T/
        S2FPVQKucxWEtGN3Oewdyufw991vhTrK9Gvx5PSQjSMnp2tVJN/5QEWaZC9HbNZiFSkKFiAy
        1/c3TVyOHJZcO9zPkP4b51kS6O7myI+d75ELpWc40lz/ORn3D3Kk/9Ep9O7yJM2r20XTznTR
        smZDimZHha+X2n3hMNoX+KOSOogaTblIzYOwFibOlFC5SMPrBDuC2q4gFxZ0wiSCKufTivAA
        gWvMo3qcOBesjSZ+QeA4Z2eVxyiCS4EfmLArRngT3DO5KCwsEWwISttORFy0MKuBezezI0NY
        YRXM1t1iw1grbACrPSOSZoRnofNkfsSzVPgQpspyop7F0Fk8GPGohU3Q2tAWwbTwDGS6bbSC
        Y+H24E+RfiD8roabF0eixRNgOrMuimNgpKOeU/BTMNcUDoTxN+CzH6KVsBWBu6aJVoT10Nbx
        ZyjMhyasgmrPGoV+HQJ131JhGoRF0De6WOmwCI43FNIKrQVrlk5xx4Gvyx39MBZO9TxkjyK9
        PG8zed428rxt5P/nliHGgWLFNCnVKEqvmMW9qyVDqpRmNq7+bFeqC4Wu4Eqw42Ej+m3m01Yk
        8Ei/UNu37rltOpUhXdqf2oqAp/VLtI65EKXdbth/QLTsSrakmUSpFT3JM/pY7ZcLBj7RCUbD
        HvELUdwtWh6rFK9ecRAtK/iVX1ke2OK8U7T1yML3t9aeHd/njV//aMFo0sfpT5S2vJ3Yrv1I
        u65MZfi65quBls1H3vgnr6jnYnmS72rvwPiB5pTN2UfPxjVPOlYGjBrpfnlyYkK82blXfafX
        4TVtLH7HZ0qXbcP26TQ0dHxZUlzLluTME8aEyo2NfVlV5IOppXpG2mF4+QXaIhn+A7XRG58B
        BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0xTdxTH87v39t4L2OxaUH5Dk5luBjVadouspz7IYnC7MyZqSDAiRBq8
        AUYfpLcYfCUE1JXqrE1kwEWRKFZFI/JSiiKKwcFUfDdo6NBB4qvgY9NgxLKWbgn/fX6/cz7f
        nJMcllQV03FsntkmWs0Go5qOpG4EfvctGs2al/mtZ3AWvLxiR3CqJ0BBx/U7FJQea6Ch7mM7
        AXdG3tDge7YLgfvJDQRtZz0MvPPuRbDvUAmCWyV+BspcdQxUOVeD/fM/CO63H6Jh37lWBbS+
        GCXgkfwTvGl/SELLngcEVPgJcDeNE+D7s4eCF4MnSeiumCDh0lADCbI/Gq75f1HAu5YPBLSf
        ToHmpvJgzTXEgO+5k4H9fT8GZ5TJ778RTj2vZoSDnxoVgvPs3wrBI/sYodpepRAqA+VImOj/
        ixSa6sto4f7uAUoY8F6ihdG+Pkao6V0ndB4+wwgdLT8Lb/3DjDAwdhyt/TJds8xqKbSJc3It
        km25eiMPWg2vB412sV7DJ+oyl2iT1AnJyzaLxrwtojUhOUuTWzf4kCjo3I2KRm+6iWLUZnSg
        CBZzi/GFQCPhQJGsijuO8Nj+xyhciMUXj4yQYY7G414HHWIV9wrh9259iKO5H3DruAOF5Biu
        GmHPH/V06EFyv0Zh+wkvE459ivDrhtLJKJqbjz83P5qMUnLJ2H6yhAoxxc3FvQedQYFlZ3Bp
        uLvHHG6ZjnurhidbIrjVuOv8tUkmuXg8XnOPDPNXuLS1+j+OxY+HjxAHkEqeostTFHmKIk9R
        ahFVj2LEQsmUY5J4jWQwSYXmHE22xdSEgtd3/vrH5jZ0rzG1C3EsUk9T9uvjM1UKwxZpq6kL
        YZZUxyjrJ4Jfys2GrdtEq2WTtdAoSl0oKbibi4ybkW0J3rLZtolP4nWg53WJusTvQB2rtHNX
        M1RcjsEm5otigWj93yPYiLhilDs8e8dTyRm1dP3OWgyOMV2kNnrNb5qZroTtyqjyo1lnhriX
        dHrPrJE9Xje/6m4dgZ7trHhCpkTNRDeb+0vaijoOjwU2LthWlFap7d5Qm5F21Ut26mz5BV/n
        nFth++LTkpWinF6juJ1vrNTNWehZle7Nk1Mvp2SUZe91Zc13rVBTUq6BX0BaJcO/VT11gJMD
        AAA=
X-CMS-MailID: 20190712102902eucas1p232180d90fd3da30bf5b5b1b9616ce2b8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190710215227epcas1p2625f779c483fdff81fa952432c6f4323
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190710215227epcas1p2625f779c483fdff81fa952432c6f4323
References: <20190710215149.9208-1-kieran.bingham+renesas@ideasonboard.com>
        <CGME20190710215227epcas1p2625f779c483fdff81fa952432c6f4323@epcas1p2.samsung.com>
        <20190710215149.9208-7-kieran.bingham+renesas@ideasonboard.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 10.07.2019 23:51, Kieran Bingham wrote:
> The I2C core framework provides a simplified probe framework from commit
> b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new() call-back type").
>
> These drivers do not utilise the i2c_device_id table in the probe, so we
> can easily convert them to utilise the simplfied i2c driver
> registration.
>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


If needed, for S5K5BAF:

Acked-by: Andrzej Hajda <a.hajda@samsung.com>

 --
Regards
Andrzej


> ---
>  drivers/media/i2c/adv7343.c  | 5 ++---
>  drivers/media/i2c/imx274.c   | 5 ++---
>  drivers/media/i2c/max2175.c  | 5 ++---
>  drivers/media/i2c/mt9m001.c  | 5 ++---
>  drivers/media/i2c/mt9m111.c  | 5 ++---
>  drivers/media/i2c/ov2640.c   | 5 ++---
>  drivers/media/i2c/ov2659.c   | 5 ++---
>  drivers/media/i2c/ov5640.c   | 5 ++---
>  drivers/media/i2c/ov5645.c   | 5 ++---
>  drivers/media/i2c/ov5647.c   | 5 ++---
>  drivers/media/i2c/ov772x.c   | 5 ++---
>  drivers/media/i2c/ov7740.c   | 5 ++---
>  drivers/media/i2c/ov9650.c   | 5 ++---
>  drivers/media/i2c/s5k5baf.c  | 5 ++---
>  drivers/media/i2c/s5k6a3.c   | 5 ++---
>  drivers/media/i2c/tc358743.c | 5 ++---
>  drivers/media/i2c/ths8200.c  | 5 ++---
>  drivers/media/i2c/tvp5150.c  | 5 ++---
>  drivers/media/i2c/tvp7002.c  | 4 ++--
>  19 files changed, 38 insertions(+), 56 deletions(-)
>
> diff --git a/drivers/media/i2c/adv7343.c b/drivers/media/i2c/adv7343.c
> index 4a441ee99dd8..63e94dfcb5d3 100644
> --- a/drivers/media/i2c/adv7343.c
> +++ b/drivers/media/i2c/adv7343.c
> @@ -428,8 +428,7 @@ adv7343_get_pdata(struct i2c_client *client)
>  	return pdata;
>  }
>  
> -static int adv7343_probe(struct i2c_client *client,
> -				const struct i2c_device_id *id)
> +static int adv7343_probe(struct i2c_client *client)
>  {
>  	struct adv7343_state *state;
>  	int err;
> @@ -524,7 +523,7 @@ static struct i2c_driver adv7343_driver = {
>  		.of_match_table = of_match_ptr(adv7343_of_match),
>  		.name	= "adv7343",
>  	},
> -	.probe		= adv7343_probe,
> +	.probe_new	= adv7343_probe,
>  	.remove		= adv7343_remove,
>  	.id_table	= adv7343_id,
>  };
> diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
> index f3ff1af209f9..6011cec5e351 100644
> --- a/drivers/media/i2c/imx274.c
> +++ b/drivers/media/i2c/imx274.c
> @@ -1821,8 +1821,7 @@ static const struct i2c_device_id imx274_id[] = {
>  };
>  MODULE_DEVICE_TABLE(i2c, imx274_id);
>  
> -static int imx274_probe(struct i2c_client *client,
> -			const struct i2c_device_id *id)
> +static int imx274_probe(struct i2c_client *client)
>  {
>  	struct v4l2_subdev *sd;
>  	struct stimx274 *imx274;
> @@ -1984,7 +1983,7 @@ static struct i2c_driver imx274_i2c_driver = {
>  		.name	= DRIVER_NAME,
>  		.of_match_table	= imx274_of_id_table,
>  	},
> -	.probe		= imx274_probe,
> +	.probe_new	= imx274_probe,
>  	.remove		= imx274_remove,
>  	.id_table	= imx274_id,
>  };
> diff --git a/drivers/media/i2c/max2175.c b/drivers/media/i2c/max2175.c
> index 7b226fadcdb8..19a3ceea3bc2 100644
> --- a/drivers/media/i2c/max2175.c
> +++ b/drivers/media/i2c/max2175.c
> @@ -1271,8 +1271,7 @@ static int max2175_refout_load_to_bits(struct i2c_client *client, u32 load,
>  	return 0;
>  }
>  
> -static int max2175_probe(struct i2c_client *client,
> -			const struct i2c_device_id *id)
> +static int max2175_probe(struct i2c_client *client)
>  {
>  	bool master = true, am_hiz = false;
>  	u32 refout_load, refout_bits = 0;	/* REFOUT disabled */
> @@ -1433,7 +1432,7 @@ static struct i2c_driver max2175_driver = {
>  		.name	= DRIVER_NAME,
>  		.of_match_table = max2175_of_ids,
>  	},
> -	.probe		= max2175_probe,
> +	.probe_new	= max2175_probe,
>  	.remove		= max2175_remove,
>  	.id_table	= max2175_id,
>  };
> diff --git a/drivers/media/i2c/mt9m001.c b/drivers/media/i2c/mt9m001.c
> index 2df743cbe09d..5613072908ac 100644
> --- a/drivers/media/i2c/mt9m001.c
> +++ b/drivers/media/i2c/mt9m001.c
> @@ -726,8 +726,7 @@ static const struct v4l2_subdev_ops mt9m001_subdev_ops = {
>  	.pad	= &mt9m001_subdev_pad_ops,
>  };
>  
> -static int mt9m001_probe(struct i2c_client *client,
> -			 const struct i2c_device_id *did)
> +static int mt9m001_probe(struct i2c_client *client)
>  {
>  	struct mt9m001 *mt9m001;
>  	struct i2c_adapter *adapter = client->adapter;
> @@ -872,7 +871,7 @@ static struct i2c_driver mt9m001_i2c_driver = {
>  		.pm = &mt9m001_pm_ops,
>  		.of_match_table = mt9m001_of_match,
>  	},
> -	.probe		= mt9m001_probe,
> +	.probe_new	= mt9m001_probe,
>  	.remove		= mt9m001_remove,
>  	.id_table	= mt9m001_id,
>  };
> diff --git a/drivers/media/i2c/mt9m111.c b/drivers/media/i2c/mt9m111.c
> index d10fe3712036..b5fa60068850 100644
> --- a/drivers/media/i2c/mt9m111.c
> +++ b/drivers/media/i2c/mt9m111.c
> @@ -1246,8 +1246,7 @@ static int mt9m111_probe_fw(struct i2c_client *client, struct mt9m111 *mt9m111)
>  	return ret;
>  }
>  
> -static int mt9m111_probe(struct i2c_client *client,
> -			 const struct i2c_device_id *did)
> +static int mt9m111_probe(struct i2c_client *client)
>  {
>  	struct mt9m111 *mt9m111;
>  	struct i2c_adapter *adapter = client->adapter;
> @@ -1391,7 +1390,7 @@ static struct i2c_driver mt9m111_i2c_driver = {
>  		.name = "mt9m111",
>  		.of_match_table = of_match_ptr(mt9m111_of_match),
>  	},
> -	.probe		= mt9m111_probe,
> +	.probe_new	= mt9m111_probe,
>  	.remove		= mt9m111_remove,
>  	.id_table	= mt9m111_id,
>  };
> diff --git a/drivers/media/i2c/ov2640.c b/drivers/media/i2c/ov2640.c
> index 30e7e6b2b293..4df7ffa83217 100644
> --- a/drivers/media/i2c/ov2640.c
> +++ b/drivers/media/i2c/ov2640.c
> @@ -1193,8 +1193,7 @@ static int ov2640_probe_dt(struct i2c_client *client,
>  /*
>   * i2c_driver functions
>   */
> -static int ov2640_probe(struct i2c_client *client,
> -			const struct i2c_device_id *did)
> +static int ov2640_probe(struct i2c_client *client)
>  {
>  	struct ov2640_priv	*priv;
>  	struct i2c_adapter	*adapter = client->adapter;
> @@ -1305,7 +1304,7 @@ static struct i2c_driver ov2640_i2c_driver = {
>  		.name = "ov2640",
>  		.of_match_table = of_match_ptr(ov2640_of_match),
>  	},
> -	.probe    = ov2640_probe,
> +	.probe_new = ov2640_probe,
>  	.remove   = ov2640_remove,
>  	.id_table = ov2640_id,
>  };
> diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
> index 5ed2413eac8a..18d996e90739 100644
> --- a/drivers/media/i2c/ov2659.c
> +++ b/drivers/media/i2c/ov2659.c
> @@ -1386,8 +1386,7 @@ ov2659_get_pdata(struct i2c_client *client)
>  	return pdata;
>  }
>  
> -static int ov2659_probe(struct i2c_client *client,
> -			const struct i2c_device_id *id)
> +static int ov2659_probe(struct i2c_client *client)
>  {
>  	const struct ov2659_platform_data *pdata = ov2659_get_pdata(client);
>  	struct v4l2_subdev *sd;
> @@ -1515,7 +1514,7 @@ static struct i2c_driver ov2659_i2c_driver = {
>  		.name	= DRIVER_NAME,
>  		.of_match_table = of_match_ptr(ov2659_of_match),
>  	},
> -	.probe		= ov2659_probe,
> +	.probe_new	= ov2659_probe,
>  	.remove		= ov2659_remove,
>  	.id_table	= ov2659_id,
>  };
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 759d60c6d630..80d9c0060153 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -2936,8 +2936,7 @@ static int ov5640_check_chip_id(struct ov5640_dev *sensor)
>  	return ret;
>  }
>  
> -static int ov5640_probe(struct i2c_client *client,
> -			const struct i2c_device_id *id)
> +static int ov5640_probe(struct i2c_client *client)
>  {
>  	struct device *dev = &client->dev;
>  	struct fwnode_handle *endpoint;
> @@ -3095,7 +3094,7 @@ static struct i2c_driver ov5640_i2c_driver = {
>  		.of_match_table	= ov5640_dt_ids,
>  	},
>  	.id_table = ov5640_id,
> -	.probe    = ov5640_probe,
> +	.probe_new = ov5640_probe,
>  	.remove   = ov5640_remove,
>  };
>  
> diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> index 124c8df04633..42cf3ebd0831 100644
> --- a/drivers/media/i2c/ov5645.c
> +++ b/drivers/media/i2c/ov5645.c
> @@ -1086,8 +1086,7 @@ static const struct v4l2_subdev_ops ov5645_subdev_ops = {
>  	.pad = &ov5645_subdev_pad_ops,
>  };
>  
> -static int ov5645_probe(struct i2c_client *client,
> -			const struct i2c_device_id *id)
> +static int ov5645_probe(struct i2c_client *client)
>  {
>  	struct device *dev = &client->dev;
>  	struct device_node *endpoint;
> @@ -1355,7 +1354,7 @@ static struct i2c_driver ov5645_i2c_driver = {
>  		.of_match_table = of_match_ptr(ov5645_of_match),
>  		.name  = "ov5645",
>  	},
> -	.probe  = ov5645_probe,
> +	.probe_new = ov5645_probe,
>  	.remove = ov5645_remove,
>  	.id_table = ov5645_id,
>  };
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index 4589631798c9..e7d2e5b4ad4b 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -547,8 +547,7 @@ static int ov5647_parse_dt(struct device_node *np)
>  	return ret;
>  }
>  
> -static int ov5647_probe(struct i2c_client *client,
> -			const struct i2c_device_id *id)
> +static int ov5647_probe(struct i2c_client *client)
>  {
>  	struct device *dev = &client->dev;
>  	struct ov5647 *sensor;
> @@ -644,7 +643,7 @@ static struct i2c_driver ov5647_driver = {
>  		.of_match_table = of_match_ptr(ov5647_of_match),
>  		.name	= SENSOR_NAME,
>  	},
> -	.probe		= ov5647_probe,
> +	.probe_new	= ov5647_probe,
>  	.remove		= ov5647_remove,
>  	.id_table	= ov5647_id,
>  };
> diff --git a/drivers/media/i2c/ov772x.c b/drivers/media/i2c/ov772x.c
> index 2e9a758736a1..2cc6a678069a 100644
> --- a/drivers/media/i2c/ov772x.c
> +++ b/drivers/media/i2c/ov772x.c
> @@ -1352,8 +1352,7 @@ static const struct v4l2_subdev_ops ov772x_subdev_ops = {
>   * i2c_driver function
>   */
>  
> -static int ov772x_probe(struct i2c_client *client,
> -			const struct i2c_device_id *did)
> +static int ov772x_probe(struct i2c_client *client)
>  {
>  	struct ov772x_priv	*priv;
>  	int			ret;
> @@ -1486,7 +1485,7 @@ static struct i2c_driver ov772x_i2c_driver = {
>  		.name = "ov772x",
>  		.of_match_table = ov772x_of_match,
>  	},
> -	.probe    = ov772x_probe,
> +	.probe_new = ov772x_probe,
>  	.remove   = ov772x_remove,
>  	.id_table = ov772x_id,
>  };
> diff --git a/drivers/media/i2c/ov7740.c b/drivers/media/i2c/ov7740.c
> index 70bb870b1d08..181934c807c2 100644
> --- a/drivers/media/i2c/ov7740.c
> +++ b/drivers/media/i2c/ov7740.c
> @@ -1066,8 +1066,7 @@ static const struct regmap_config ov7740_regmap_config = {
>  	.max_register	= OV7740_MAX_REGISTER,
>  };
>  
> -static int ov7740_probe(struct i2c_client *client,
> -			const struct i2c_device_id *id)
> +static int ov7740_probe(struct i2c_client *client)
>  {
>  	struct ov7740 *ov7740;
>  	struct v4l2_subdev *sd;
> @@ -1229,7 +1228,7 @@ static struct i2c_driver ov7740_i2c_driver = {
>  		.pm = &ov7740_pm_ops,
>  		.of_match_table = of_match_ptr(ov7740_of_match),
>  	},
> -	.probe    = ov7740_probe,
> +	.probe_new = ov7740_probe,
>  	.remove   = ov7740_remove,
>  	.id_table = ov7740_id,
>  };
> diff --git a/drivers/media/i2c/ov9650.c b/drivers/media/i2c/ov9650.c
> index eefd57ec2a73..2262ee3e3687 100644
> --- a/drivers/media/i2c/ov9650.c
> +++ b/drivers/media/i2c/ov9650.c
> @@ -1488,8 +1488,7 @@ static int ov965x_detect_sensor(struct v4l2_subdev *sd)
>  	return ret;
>  }
>  
> -static int ov965x_probe(struct i2c_client *client,
> -			const struct i2c_device_id *id)
> +static int ov965x_probe(struct i2c_client *client)
>  {
>  	const struct ov9650_platform_data *pdata = client->dev.platform_data;
>  	struct v4l2_subdev *sd;
> @@ -1616,7 +1615,7 @@ static struct i2c_driver ov965x_i2c_driver = {
>  		.name	= DRIVER_NAME,
>  		.of_match_table = of_match_ptr(ov965x_of_match),
>  	},
> -	.probe		= ov965x_probe,
> +	.probe_new	= ov965x_probe,
>  	.remove		= ov965x_remove,
>  	.id_table	= ov965x_id,
>  };
> diff --git a/drivers/media/i2c/s5k5baf.c b/drivers/media/i2c/s5k5baf.c
> index 727db7c0670a..1b912d2c1146 100644
> --- a/drivers/media/i2c/s5k5baf.c
> +++ b/drivers/media/i2c/s5k5baf.c
> @@ -1949,8 +1949,7 @@ static int s5k5baf_configure_regulators(struct s5k5baf *state)
>  	return ret;
>  }
>  
> -static int s5k5baf_probe(struct i2c_client *c,
> -			const struct i2c_device_id *id)
> +static int s5k5baf_probe(struct i2c_client *c)
>  {
>  	struct s5k5baf *state;
>  	int ret;
> @@ -2049,7 +2048,7 @@ static struct i2c_driver s5k5baf_i2c_driver = {
>  		.of_match_table = s5k5baf_of_match,
>  		.name = S5K5BAF_DRIVER_NAME
>  	},
> -	.probe		= s5k5baf_probe,
> +	.probe_new	= s5k5baf_probe,
>  	.remove		= s5k5baf_remove,
>  	.id_table	= s5k5baf_id,
>  };
> diff --git a/drivers/media/i2c/s5k6a3.c b/drivers/media/i2c/s5k6a3.c
> index 2e140272794b..ebef5a1a372f 100644
> --- a/drivers/media/i2c/s5k6a3.c
> +++ b/drivers/media/i2c/s5k6a3.c
> @@ -278,8 +278,7 @@ static const struct v4l2_subdev_ops s5k6a3_subdev_ops = {
>  	.pad = &s5k6a3_pad_ops,
>  };
>  
> -static int s5k6a3_probe(struct i2c_client *client,
> -				const struct i2c_device_id *id)
> +static int s5k6a3_probe(struct i2c_client *client)
>  {
>  	struct device *dev = &client->dev;
>  	struct s5k6a3 *sensor;
> @@ -381,7 +380,7 @@ static struct i2c_driver s5k6a3_driver = {
>  		.of_match_table	= of_match_ptr(s5k6a3_of_match),
>  		.name		= S5K6A3_DRV_NAME,
>  	},
> -	.probe		= s5k6a3_probe,
> +	.probe_new	= s5k6a3_probe,
>  	.remove		= s5k6a3_remove,
>  	.id_table	= s5k6a3_ids,
>  };
> diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
> index bc2e35e5ce61..dbbab75f135e 100644
> --- a/drivers/media/i2c/tc358743.c
> +++ b/drivers/media/i2c/tc358743.c
> @@ -2026,8 +2026,7 @@ static inline int tc358743_probe_of(struct tc358743_state *state)
>  }
>  #endif
>  
> -static int tc358743_probe(struct i2c_client *client,
> -			  const struct i2c_device_id *id)
> +static int tc358743_probe(struct i2c_client *client)
>  {
>  	static struct v4l2_dv_timings default_timing =
>  		V4L2_DV_BT_CEA_640X480P59_94;
> @@ -2222,7 +2221,7 @@ static struct i2c_driver tc358743_driver = {
>  		.name = "tc358743",
>  		.of_match_table = of_match_ptr(tc358743_of_match),
>  	},
> -	.probe = tc358743_probe,
> +	.probe_new = tc358743_probe,
>  	.remove = tc358743_remove,
>  	.id_table = tc358743_id,
>  };
> diff --git a/drivers/media/i2c/ths8200.c b/drivers/media/i2c/ths8200.c
> index f5ee28058ea2..c52fe84cba1b 100644
> --- a/drivers/media/i2c/ths8200.c
> +++ b/drivers/media/i2c/ths8200.c
> @@ -436,8 +436,7 @@ static const struct v4l2_subdev_ops ths8200_ops = {
>  	.pad = &ths8200_pad_ops,
>  };
>  
> -static int ths8200_probe(struct i2c_client *client,
> -			 const struct i2c_device_id *id)
> +static int ths8200_probe(struct i2c_client *client)
>  {
>  	struct ths8200_state *state;
>  	struct v4l2_subdev *sd;
> @@ -502,7 +501,7 @@ static struct i2c_driver ths8200_driver = {
>  		.name = "ths8200",
>  		.of_match_table = of_match_ptr(ths8200_of_match),
>  	},
> -	.probe = ths8200_probe,
> +	.probe_new = ths8200_probe,
>  	.remove = ths8200_remove,
>  	.id_table = ths8200_id,
>  };
> diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
> index eaddd977ba40..7f4f23f4c7ac 100644
> --- a/drivers/media/i2c/tvp5150.c
> +++ b/drivers/media/i2c/tvp5150.c
> @@ -1691,8 +1691,7 @@ static const char * const tvp5150_test_patterns[2] = {
>  	"Black screen"
>  };
>  
> -static int tvp5150_probe(struct i2c_client *c,
> -			 const struct i2c_device_id *id)
> +static int tvp5150_probe(struct i2c_client *c)
>  {
>  	struct tvp5150 *core;
>  	struct v4l2_subdev *sd;
> @@ -1841,7 +1840,7 @@ static struct i2c_driver tvp5150_driver = {
>  		.of_match_table = of_match_ptr(tvp5150_of_match),
>  		.name	= "tvp5150",
>  	},
> -	.probe		= tvp5150_probe,
> +	.probe_new	= tvp5150_probe,
>  	.remove		= tvp5150_remove,
>  	.id_table	= tvp5150_id,
>  };
> diff --git a/drivers/media/i2c/tvp7002.c b/drivers/media/i2c/tvp7002.c
> index 1b8175cab017..de313b1306da 100644
> --- a/drivers/media/i2c/tvp7002.c
> +++ b/drivers/media/i2c/tvp7002.c
> @@ -930,7 +930,7 @@ tvp7002_get_pdata(struct i2c_client *client)
>   * Returns zero when successful, -EINVAL if register read fails or
>   * -EIO if i2c access is not available.
>   */
> -static int tvp7002_probe(struct i2c_client *c, const struct i2c_device_id *id)
> +static int tvp7002_probe(struct i2c_client *c)
>  {
>  	struct tvp7002_config *pdata = tvp7002_get_pdata(c);
>  	struct v4l2_subdev *sd;
> @@ -1075,7 +1075,7 @@ static struct i2c_driver tvp7002_driver = {
>  		.of_match_table = of_match_ptr(tvp7002_of_match),
>  		.name = TVP7002_MODULE_NAME,
>  	},
> -	.probe = tvp7002_probe,
> +	.probe_new = tvp7002_probe,
>  	.remove = tvp7002_remove,
>  	.id_table = tvp7002_id,
>  };


