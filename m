Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27E0D272276
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 13:28:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726578AbgIUL24 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 07:28:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726826AbgIUL2v (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 07:28:51 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72879C061755;
        Mon, 21 Sep 2020 04:28:50 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id a9so12267083wmm.2;
        Mon, 21 Sep 2020 04:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1gQr8qCWiTOEbqu4on8bklkWOaFxA9UObiO0rKRcnUo=;
        b=QxBJLW9bWVv2UHFwW9INAzhhhyf8MV0DrjLAL5rNuySd76RlnfLxln95mKjmL5i+EQ
         THlLVudxJyUYR6pM4gEPCMAfEyTTUXNET/gZz3BKF+kjj7J+aBEXg/WJGunxqWTqxG7q
         P2YLf9XFP4qBiRfMENni6qLqgU4ZTz5NjmLbg8VRMfjymnbE3iiZAz5utzGkn1aJXoqo
         sayr3XtZLi0U38FOD3oeGzT3nwTobPXv3xguVppbDg35altqe8needfw2jnk8kIt+coM
         cPpGl8daPjcF7BfmaFp/sk8y3MaOQM5B6N23SyC2Kc7VZLRisY1U2wGDpILFucgi7QsN
         eOfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1gQr8qCWiTOEbqu4on8bklkWOaFxA9UObiO0rKRcnUo=;
        b=nWYxv7gtvrQfVwELTS+b1NtEJeRTIktpdUm+h3COAen0wj8wJgqF/WGPHR26AsC7Dl
         yQHlrCCzBj/IO6K9MhoOgTmx0LqQFZxMYgpcBetV1KwnpDtZy9ZkVie2u2aKvYIURuO+
         hEkVGTwdR52xYHIfL2JoRA9qzyuxKHUm1WWSto9AYPomSN7CxsRTCyNFvXP15WaX5Aii
         /f0ehJCq3NAtE3N7zdGsE6NxgHmMu7F3aEDvo6yDwLpnICIHL1bW1G/GM+hDX84WTPkk
         DvkgKa3xd3QcTpxJNcROhiurkC6h7+rxWcsv04SzRUlWDg4QRD4i56AzJU9bGztmiWrW
         YPzg==
X-Gm-Message-State: AOAM532ns/eWqzEeNZ1SSBy1cTSBAQA+/x8hTXvk1rwDvZOHzZHHHC7I
        LQEkXiwLrD8CJMdwAM1zFmetKDGiXZ4=
X-Google-Smtp-Source: ABdhPJxmTz8Hctv84ZKesHR6nqDGdbfXUBBV2p23UHETaQd3ZD202VavW2StJu6Yll+/n9MlEoHCtw==
X-Received: by 2002:a1c:4187:: with SMTP id o129mr29029256wma.113.1600687729139;
        Mon, 21 Sep 2020 04:28:49 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id q20sm18612043wmj.5.2020.09.21.04.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 04:28:48 -0700 (PDT)
Date:   Mon, 21 Sep 2020 13:28:46 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 29/34] i2c: tegra: Improve formatting of variables
Message-ID: <20200921112846.GL3950626@ulmo>
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-30-digetx@gmail.com>
 <20200917121640.GH3515672@ulmo>
 <6957eafb-8be2-3323-9c55-bb6eee6ab6bf@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Mit9XoPEfICDqq/V"
Content-Disposition: inline
In-Reply-To: <6957eafb-8be2-3323-9c55-bb6eee6ab6bf@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Mit9XoPEfICDqq/V
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2020 at 06:13:36PM +0300, Dmitry Osipenko wrote:
> 17.09.2020 15:16, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Wed, Sep 09, 2020 at 01:40:01AM +0300, Dmitry Osipenko wrote:
> >> Reorder definition of variables in the code to have them sorted by len=
gth
> >> and grouped logically, also replace "unsigned long" with "u32". Do thi=
s in
> >> order to make code easier to read.
> >>
> >> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >> ---
> >>  drivers/i2c/busses/i2c-tegra.c | 97 ++++++++++++++++------------------
> >>  1 file changed, 45 insertions(+), 52 deletions(-)
> >>
> >> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-t=
egra.c
> >> index ac40c87f1c21..2376f502d299 100644
> >> --- a/drivers/i2c/busses/i2c-tegra.c
> >> +++ b/drivers/i2c/busses/i2c-tegra.c
> >> @@ -259,42 +259,48 @@ struct tegra_i2c_hw_feature {
> >>   */
> >>  struct tegra_i2c_dev {
> >>  	struct device *dev;
> >> -	const struct tegra_i2c_hw_feature *hw;
> >>  	struct i2c_adapter adapter;
> >> -	struct clk *div_clk;
> >> -	struct clk_bulk_data *clocks;
> >> -	unsigned int nclocks;
> >> +
> >> +	const struct tegra_i2c_hw_feature *hw;
> >>  	struct reset_control *rst;
> >> -	void __iomem *base;
> >> -	phys_addr_t base_phys;
> >>  	unsigned int cont_id;
> >>  	unsigned int irq;
> >> -	bool is_dvc;
> >> -	bool is_vi;
> >> +
> >> +	phys_addr_t base_phys;
> >> +	void __iomem *base;
> >> +
> >> +	struct clk_bulk_data *clocks;
> >> +	unsigned int nclocks;
> >> +
> >> +	struct clk *div_clk;
> >> +	u32 bus_clk_rate;
> >> +
> >>  	struct completion msg_complete;
> >> +	size_t msg_buf_remaining;
> >>  	int msg_err;
> >>  	u8 *msg_buf;
> >> -	size_t msg_buf_remaining;
> >> -	bool msg_read;
> >> -	u32 bus_clk_rate;
> >> -	bool is_multimaster_mode;
> >> +
> >> +	struct completion dma_complete;
> >>  	struct dma_chan *tx_dma_chan;
> >>  	struct dma_chan *rx_dma_chan;
> >> +	unsigned int dma_buf_size;
> >>  	dma_addr_t dma_phys;
> >>  	u32 *dma_buf;
> >> -	unsigned int dma_buf_size;
> >> -	bool is_curr_dma_xfer;
> >> -	struct completion dma_complete;
> >> +
> >> +	bool is_multimaster_mode;
> >>  	bool is_curr_atomic_xfer;
> >> +	bool is_curr_dma_xfer;
> >> +	bool msg_read;
> >> +	bool is_dvc;
> >> +	bool is_vi;
> >>  };
> >> =20
> >> -static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
> >> -		       unsigned long reg)
> >> +static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val, u32 re=
g)
> >=20
> > I actually prefer unsigned long/int over u32 for offsets because it
> > makes it clearer that this is not in fact a 32-bit value that we're
> > writing into a register. This is especially true for these register
> > accessors where the "offset" is called "reg" and may be easily
> > mistaken for a register value.
>=20
> That is a bit questionable, at least it definitely won't save me from a
> mistake :)

There's obviously no way of guaranteeing that nobody makes a mistake.
But especially with accessors the value and offset parameters are
inconsistently ordered, so any help we can provide at the API level
may help avoid mistakes. If you only look at the prototype, having two
u32 parameters doesn't give you *any* clue about what they are. But a
32-bit accessor that takes a u32 and an unsigned int is pretty obviously
expecting the 32-bit value in the u32 parameter and then the unsigned
int must obviously be the offset.

Thierry

--Mit9XoPEfICDqq/V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9ojm4ACgkQ3SOs138+
s6H8FQ/9G8bF9ZlXZUk0yJk4m+kBswXUobZ0A4kDoaFJxsk7/huKkkbmd/XmVBlY
NpIUaabdFg6GBUDJ4thaSP5N1iTrIpplljnpdB2NPZH2Gn7FzW+e7RtikNpXhXVO
U4ap0YmHEujg+Z/7Z55U2dOPi3iECS+E8V4691a6aUI7RD4uMR/DKIpthjR1WjyG
XRDIwhTnkNiQTcBdS183BsbM2VKuIdTPCuq7+bP6lpVOyJ9ijdtCzSiwbhFpLYzS
BoD1RjYwPmIXDkuxBMt8PoxhcICa70+0GqBAqlOpm4dHFwexwvyDS0Sb7gS1xma7
RAQmb7StbrvqWXuU0QMgftd2hsd5F7sxJhdqpdCLNtUrzuWbzswqEMPi9HnpAKWX
78EOZ+uxYpCNfUHqLyfzisKWuOEKPDW0rJaMDSUs3qvg0Rui4v6/oyvxFoloh2+w
KCLVXYnkGF/Zk/XQVC4Rw0SQp8ECSobxVLs9+cUF3mv4lkvEZdg9tC+6kmW2RgBu
GBWFONZgJkLrj7tbulc5UM3HpPMuygwHsxCdQR+lO7Nj4UtPzsKnH3jfI3mRc0zW
OxdclgUwjOCQzW/1TbDW/A6ZkmzbTjZUUEoEVQu1cbSGGbEfwRy9aG9u+wZBzBw0
kfLLaJaVZouBuu7VUnYCLPArZpk6L/DYbgeKQnRDJ62KWdQXiEo=
=PEve
-----END PGP SIGNATURE-----

--Mit9XoPEfICDqq/V--
