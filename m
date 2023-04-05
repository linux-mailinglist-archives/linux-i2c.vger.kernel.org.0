Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A8F56D7C65
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Apr 2023 14:25:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237940AbjDEMZS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Apr 2023 08:25:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238029AbjDEMZM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Apr 2023 08:25:12 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C8A44ED5;
        Wed,  5 Apr 2023 05:25:10 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id er13so99604710edb.9;
        Wed, 05 Apr 2023 05:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680697508;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eN0KM2SNGnRFBfL39VR5jtzq+pk/KVEl4fBYUnILT98=;
        b=EezTyLnex6GMH9oFHusxqUGKHokqy9J4I7F3zqBectUyLF+0T+FicHRH+qnTui920k
         nThhS80Eubw1NoMd6N4UjATTz2CL3G4H3IRtXUor2BedlsEpoT3n1GBHfkpc1Iw1J0X8
         foLtzCHrxTexSH1CKGYSqiexpwDMV4XIbfzUwypv4ZETJRn7jbEzBCCRozsQVDyG1+51
         6wALaV06AVDuENWzdC1QUqG7cHJ59ajznzT4YHirSfz7Dmv9KhUCMaB0+FcB3xh3xkrT
         LzZmWY9CLuS9nSHq+RQV15uYoP2K8PYHOTaVHpCkQGWYk0lwHIpQ5CyIHVTkas3fpPKE
         QwpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680697508;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eN0KM2SNGnRFBfL39VR5jtzq+pk/KVEl4fBYUnILT98=;
        b=1XcOuVbO/89a4iEUJLTos/cvVbEh883saFc2quV7VXYhb2MTn1DG8v7f4EXpX01RYF
         NwDMxE9nXPJGQnf6jQutevvIQ26BhgyMUBtMdtgfU8q1Ae54RcWAkx9/tkK00SfqvF0Q
         5G5XcVfApk5sSyPl01qi37w/BhJuCjdqCX9v4dt9O9nE6Cqj5zmKSab2ERENgAHqhgQ+
         UOhnqJ8m8kQUonPCY9+r6NAT7sXyz9WyBiz0uc5wxEmTpaNrlitv5Ch4eiPzooNAenVS
         vpszY1fKOfgaIXns9CzNkhox+oFiwBTWMgZZd12rOFeKzi8Bb8+XsoCbF3g1dLMzpsPm
         Daag==
X-Gm-Message-State: AAQBX9fZS9g1uSB2uq842UxkDNrDHbo7EobYQOYkKXpBexJDsFiqeJca
        g7lbJqNuCLuCojcPiZIt5ZWNPzRIS8E=
X-Google-Smtp-Source: AKy350aSdbr3vpDow0+juHf6/PZJ060vzts10b+xma7ejACbrR00gB8QyWBGp5p1mgBTQBicMFhv+Q==
X-Received: by 2002:a17:906:280a:b0:932:a2ce:aac0 with SMTP id r10-20020a170906280a00b00932a2ceaac0mr2430111ejc.62.1680697508255;
        Wed, 05 Apr 2023 05:25:08 -0700 (PDT)
Received: from orome (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id y93-20020a50bb66000000b004fb30fc1dabsm7223700ede.96.2023.04.05.05.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 05:25:07 -0700 (PDT)
Date:   Wed, 5 Apr 2023 14:25:06 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Akhil R <akhilrajeev@nvidia.com>
Cc:     christian.koenig@amd.com, digetx@gmail.com, jonathanh@nvidia.com,
        ldewangan@nvidia.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        sumit.semwal@linaro.org, wsa@kernel.org
Subject: Re: [PATCH v4 1/2] i2c: tegra: Fix PEC support for SMBUS block read
Message-ID: <ZC1oovV5CSfzvhd_@orome>
References: <20230324115924.64218-1-akhilrajeev@nvidia.com>
 <20230324115924.64218-2-akhilrajeev@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="E6P1f4+cP4eqQJsW"
Content-Disposition: inline
In-Reply-To: <20230324115924.64218-2-akhilrajeev@nvidia.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-Spam-Status: No, score=2.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--E6P1f4+cP4eqQJsW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 24, 2023 at 05:29:23PM +0530, Akhil R wrote:
> Update the msg->len value correctly for SMBUS block read. The discrepancy
> went unnoticed as msg->len is used in SMBUS transfers only when a PEC
> byte is added.
>=20
> Fixes: d7583c8a5748 ("i2c: tegra: Add SMBus block read function")
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 38 +++++++++++++++++++++++-----------
>  1 file changed, 26 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegr=
a.c
> index 6aab84c8d22b..83e74b8baf67 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -245,6 +245,7 @@ struct tegra_i2c_hw_feature {
>   * @msg_err: error code for completed message
>   * @msg_buf: pointer to current message data
>   * @msg_buf_remaining: size of unsent data in the message buffer
> + * @msg_len: length of message in current transfer
>   * @msg_read: indicates that the transfer is a read access
>   * @timings: i2c timings information like bus frequency
>   * @multimaster_mode: indicates that I2C controller is in multi-master m=
ode
> @@ -279,6 +280,7 @@ struct tegra_i2c_dev {
>  	size_t msg_buf_remaining;
>  	int msg_err;
>  	u8 *msg_buf;
> +	__u16 msg_len;
> =20
>  	struct completion dma_complete;
>  	struct dma_chan *tx_dma_chan;
> @@ -1169,7 +1171,7 @@ static void tegra_i2c_push_packet_header(struct teg=
ra_i2c_dev *i2c_dev,
>  	else
>  		i2c_writel(i2c_dev, packet_header, I2C_TX_FIFO);
> =20
> -	packet_header =3D msg->len - 1;
> +	packet_header =3D i2c_dev->msg_len - 1;
> =20
>  	if (i2c_dev->dma_mode && !i2c_dev->msg_read)
>  		*dma_buf++ =3D packet_header;
> @@ -1242,20 +1244,32 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_de=
v *i2c_dev,
>  		return err;
> =20
>  	i2c_dev->msg_buf =3D msg->buf;
> +	i2c_dev->msg_len =3D msg->len;
> =20
> -	/* The condition true implies smbus block read and len is already read =
*/
> -	if (msg->flags & I2C_M_RECV_LEN && end_state !=3D MSG_END_CONTINUE)
> -		i2c_dev->msg_buf =3D msg->buf + 1;
> -
> -	i2c_dev->msg_buf_remaining =3D msg->len;
>  	i2c_dev->msg_err =3D I2C_ERR_NONE;
>  	i2c_dev->msg_read =3D !!(msg->flags & I2C_M_RD);
>  	reinit_completion(&i2c_dev->msg_complete);
> =20
> +	/* *
> +	 * For SMBUS block read command, read only 1 byte in the first transfer.
> +	 * Adjust that 1 byte for the next transfer in the msg buffer and msg
> +	 * length.
> +	 */
> +	if (msg->flags & I2C_M_RECV_LEN) {
> +		if (end_state =3D=3D MSG_END_CONTINUE) {
> +			i2c_dev->msg_len =3D 1;
> +		} else {
> +			i2c_dev->msg_buf +=3D 1;
> +			i2c_dev->msg_len -=3D 1;
> +		}
> +	}
> +
> +	i2c_dev->msg_buf_remaining =3D i2c_dev->msg_len;
> +
>  	if (i2c_dev->msg_read)
> -		xfer_size =3D msg->len;
> +		xfer_size =3D i2c_dev->msg_len;
>  	else
> -		xfer_size =3D msg->len + I2C_PACKET_HEADER_SIZE;
> +		xfer_size =3D i2c_dev->msg_len + I2C_PACKET_HEADER_SIZE;
> =20
>  	xfer_size =3D ALIGN(xfer_size, BYTES_PER_FIFO_WORD);
> =20
> @@ -1295,7 +1309,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev =
*i2c_dev,
>  	if (!i2c_dev->msg_read) {
>  		if (i2c_dev->dma_mode) {
>  			memcpy(i2c_dev->dma_buf + I2C_PACKET_HEADER_SIZE,
> -			       msg->buf, msg->len);
> +			       msg->buf, i2c_dev->msg_len);
> =20
>  			dma_sync_single_for_device(i2c_dev->dma_dev,
>  						   i2c_dev->dma_phys,
> @@ -1352,7 +1366,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev =
*i2c_dev,
>  						i2c_dev->dma_phys,
>  						xfer_size, DMA_FROM_DEVICE);
> =20
> -			memcpy(i2c_dev->msg_buf, i2c_dev->dma_buf, msg->len);
> +			memcpy(i2c_dev->msg_buf, i2c_dev->dma_buf, i2c_dev->msg_len);
>  		}
>  	}
> =20
> @@ -1408,8 +1422,8 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap,=
 struct i2c_msg msgs[],
>  			ret =3D tegra_i2c_xfer_msg(i2c_dev, &msgs[i], MSG_END_CONTINUE);
>  			if (ret)
>  				break;
> -			/* Set the read byte as msg len */
> -			msgs[i].len =3D msgs[i].buf[0];
> +			/* Set the msg length from first byte */
> +			msgs[i].len +=3D msgs[i].buf[0];

I'm having trouble understanding why this change is needed. msg->len is
never changed in tegra_i2c_xfer_msg(), as far as I can tell, so it would
contain whatever was in it for the previous transfer. But since we want
to read the message length from the first byte, wouldn't the assignment
(i.e. the old code) be the right way to do that? If we add the length
=66rom the first byte, we could potentially be reading more than whan the
first byte indicated.

What am I missing?

Thierry

--E6P1f4+cP4eqQJsW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmQtaJ8ACgkQ3SOs138+
s6F06w//Xz2CqPMRsPFy2P2HXspREuTXIYZ0ZeLM1F7ydzu3WB40muX/G+PP/W9J
7/djWI1aOT7/H9vdQ6hl/TqpZjcBvh1gRGTzJrkHKxneBjppZKCbHJhf7kW2HI6h
/aiS++t4+au9wn+2+hI4FW4Aq56G0w+uXWoZSHSea36zQeJgm7P2+R6KJ4W9Qstr
2FiilwtjA9hx9ThYhDZ2DDQxW00I3smi5eqbFP28WGDMfpc6jcdVwOlAwm8UkKN0
LvH5/vWRQ5RXob2tM+rssaMitRj9I6pBCnyB8+ERaiwnKvQNwEIwSppTeuuCb07o
0uWIgRHyipq9zZCQrPu81Y/opP1dd3TL7dFyh1C4d+IraDTYBnFqzPnpiXwNkZiP
P1aFS4vm0ZD0xHFcxS3yMDiibYhy/I/I+c0CxSSaf/3iE1FRxv5bLdNsgbp5Bfm9
+kNztTrU8QYzy5vPYjfS9heHoo6PojHJ+pZReMzwHzFXZ06LCfVztkZewZw+3n1/
I8vMtm6J2Q4WZFivcGyw85/rdl2hCOzvtewQGPRedhsTjyb03+iQpfrsJas26DqN
hwFWXzRGL0xIGixlVS+8gqAuQDlkdMBhdcjI2FeCIiAUtXPyAUvpiC9oIXCoDqvs
l4yFRWM4B8sxpud5FsPSp3BNwaBYn6B3VFlSgIj1RS5X1YA5RnU=
=XiFz
-----END PGP SIGNATURE-----

--E6P1f4+cP4eqQJsW--
