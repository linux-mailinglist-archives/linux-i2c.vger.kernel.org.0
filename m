Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E3256E08E4
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Apr 2023 10:27:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230224AbjDMI1J (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Apr 2023 04:27:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbjDMI1I (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Apr 2023 04:27:08 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B588FB5;
        Thu, 13 Apr 2023 01:27:05 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-505934ccc35so827667a12.2;
        Thu, 13 Apr 2023 01:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681374424; x=1683966424;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kkz2uDgva49dN6lWtJwlQLU1AEg3H1Vxvc2TRMDax8A=;
        b=M+wZycboir+QiB3Msy8MPDxA7HBvL3I+qmKXWEXjMN7aVm691r+fcvMn3AlWiWjXu7
         HLzkU+D4AN7gEwfB/Nw++GEndzKyJbpvoLOZHF9izY+CkUMYSa26GCD7SnF3qmbeMqId
         ps1asDIH/CbbFHun6v61uFFjPn/Y+JASW9fw6F1gRIe35YDUg8fX65Ydkxh6DZk4aVfD
         /U9/qDjQbfMAzyhPx8dcsvtQW6K8uVmseW6McXGSg1kg3qRhFE+1KHp3rlD9zh4reBlH
         bvpwBh/5bxWwPpgNXRQ2avvRzoOvQKaFuaiOnW0VBS94s5tGwfYtP9ohlH8bPZsyP6st
         397g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681374424; x=1683966424;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kkz2uDgva49dN6lWtJwlQLU1AEg3H1Vxvc2TRMDax8A=;
        b=DZBaaFkV4LWeBCf3nvERUTbBcn1PJpQ6fn2aLWWxM3aatvk6ut2XDxbOAUF5LySogb
         lcBrKFH5baFx5GToThCl5zSwi57SDZ5fdLI5jsahyWbzpwgNgm+vLWeWBVbJbaKvU5QR
         FY0FA/nNaGggu4xjdJRHjoutOIGXnVQH3P9a7FPiHkJW9fUq9n2nCZeMHcAPUg3FqvjV
         gMgCPvoa9oMChOuZAXBDJIJCBzpqt3y0jDBEfh7DVrtO+qXSg7TK3m4dGO/IbvRPU5Wg
         ly99f/pXuEHFRTuBxDbfjwZZ1qOcgUR/xD+vkMSoTUAGU6H5QZlrpIUW3nUDHYzHTFcT
         K7hQ==
X-Gm-Message-State: AAQBX9cadTj01GB5mGrQs7C4qd+SNvP9Bn0trt4QIAOAd+qhN5v0LLxa
        VsiOifSzDAMK1KEzpsD3F0E=
X-Google-Smtp-Source: AKy350ZDjVv43yHvUzDS9rJSI1yH/i6skapLuc9iM73LIpxBwl24MUUsydrJVLYCaFKX0tIHt98tjw==
X-Received: by 2002:a05:6402:202f:b0:4fe:9374:30d0 with SMTP id ay15-20020a056402202f00b004fe937430d0mr1611455edb.39.1681374423969;
        Thu, 13 Apr 2023 01:27:03 -0700 (PDT)
Received: from orome (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id g11-20020aa7d1cb000000b0050505e68660sm512177edp.71.2023.04.13.01.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 01:27:03 -0700 (PDT)
Date:   Thu, 13 Apr 2023 10:27:01 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Akhil R <akhilrajeev@nvidia.com>
Cc:     "christian.koenig@amd.com" <christian.koenig@amd.com>,
        "digetx@gmail.com" <digetx@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "wsa@kernel.org" <wsa@kernel.org>
Subject: Re: [PATCH v4 1/2] i2c: tegra: Fix PEC support for SMBUS block read
Message-ID: <ZDe81UQpj8esAjTO@orome>
References: <20230324115924.64218-1-akhilrajeev@nvidia.com>
 <20230324115924.64218-2-akhilrajeev@nvidia.com>
 <ZC1oovV5CSfzvhd_@orome>
 <SJ1PR12MB6339EFB7B8496F95CD4225CFC0909@SJ1PR12MB6339.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="syCJBqMyhVFTAA1a"
Content-Disposition: inline
In-Reply-To: <SJ1PR12MB6339EFB7B8496F95CD4225CFC0909@SJ1PR12MB6339.namprd12.prod.outlook.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-Spam-Status: No, score=0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--syCJBqMyhVFTAA1a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 05, 2023 at 04:11:31PM +0000, Akhil R wrote:
> > On Fri, Mar 24, 2023 at 05:29:23PM +0530, Akhil R wrote:
> > > Update the msg->len value correctly for SMBUS block read. The discrep=
ancy
> > > went unnoticed as msg->len is used in SMBUS transfers only when a PEC
> > > byte is added.
> > >
> > > Fixes: d7583c8a5748 ("i2c: tegra: Add SMBus block read function")
> > > Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> > > ---
> > >  drivers/i2c/busses/i2c-tegra.c | 38 +++++++++++++++++++++++---------=
--
> > >  1 file changed, 26 insertions(+), 12 deletions(-)
> > >
> > > diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-=
tegra.c
> > > index 6aab84c8d22b..83e74b8baf67 100644
> > > --- a/drivers/i2c/busses/i2c-tegra.c
> > > +++ b/drivers/i2c/busses/i2c-tegra.c
> > > @@ -245,6 +245,7 @@ struct tegra_i2c_hw_feature {
> > >   * @msg_err: error code for completed message
> > >   * @msg_buf: pointer to current message data
> > >   * @msg_buf_remaining: size of unsent data in the message buffer
> > > + * @msg_len: length of message in current transfer
> > >   * @msg_read: indicates that the transfer is a read access
> > >   * @timings: i2c timings information like bus frequency
> > >   * @multimaster_mode: indicates that I2C controller is in multi-mast=
er
> > mode
> > > @@ -279,6 +280,7 @@ struct tegra_i2c_dev {
> > >  	size_t msg_buf_remaining;
> > >  	int msg_err;
> > >  	u8 *msg_buf;
> > > +	__u16 msg_len;
> > >
> > >  	struct completion dma_complete;
> > >  	struct dma_chan *tx_dma_chan;
> > > @@ -1169,7 +1171,7 @@ static void tegra_i2c_push_packet_header(struct
> > tegra_i2c_dev *i2c_dev,
> > >  	else
> > >  		i2c_writel(i2c_dev, packet_header, I2C_TX_FIFO);
> > >
> > > -	packet_header =3D msg->len - 1;
> > > +	packet_header =3D i2c_dev->msg_len - 1;
> > >
> > >  	if (i2c_dev->dma_mode && !i2c_dev->msg_read)
> > >  		*dma_buf++ =3D packet_header;
> > > @@ -1242,20 +1244,32 @@ static int tegra_i2c_xfer_msg(struct
> > tegra_i2c_dev *i2c_dev,
> > >  		return err;
> > >
> > >  	i2c_dev->msg_buf =3D msg->buf;
> > > +	i2c_dev->msg_len =3D msg->len;
> > >
> > > -	/* The condition true implies smbus block read and len is already
> > read */
> > > -	if (msg->flags & I2C_M_RECV_LEN && end_state !=3D
> > MSG_END_CONTINUE)
> > > -		i2c_dev->msg_buf =3D msg->buf + 1;
> > > -
> > > -	i2c_dev->msg_buf_remaining =3D msg->len;
> > >  	i2c_dev->msg_err =3D I2C_ERR_NONE;
> > >  	i2c_dev->msg_read =3D !!(msg->flags & I2C_M_RD);
> > >  	reinit_completion(&i2c_dev->msg_complete);
> > >
> > > +	/* *
> > > +	 * For SMBUS block read command, read only 1 byte in the first
> > transfer.
> > > +	 * Adjust that 1 byte for the next transfer in the msg buffer and m=
sg
> > > +	 * length.
> > > +	 */
> > > +	if (msg->flags & I2C_M_RECV_LEN) {
> > > +		if (end_state =3D=3D MSG_END_CONTINUE) {
> > > +			i2c_dev->msg_len =3D 1;
> > > +		} else {
> > > +			i2c_dev->msg_buf +=3D 1;
> > > +			i2c_dev->msg_len -=3D 1;
> > > +		}
> > > +	}
> > > +
> > > +	i2c_dev->msg_buf_remaining =3D i2c_dev->msg_len;
> > > +
> > >  	if (i2c_dev->msg_read)
> > > -		xfer_size =3D msg->len;
> > > +		xfer_size =3D i2c_dev->msg_len;
> > >  	else
> > > -		xfer_size =3D msg->len + I2C_PACKET_HEADER_SIZE;
> > > +		xfer_size =3D i2c_dev->msg_len + I2C_PACKET_HEADER_SIZE;
> > >
> > >  	xfer_size =3D ALIGN(xfer_size, BYTES_PER_FIFO_WORD);
> > >
> > > @@ -1295,7 +1309,7 @@ static int tegra_i2c_xfer_msg(struct
> > tegra_i2c_dev *i2c_dev,
> > >  	if (!i2c_dev->msg_read) {
> > >  		if (i2c_dev->dma_mode) {
> > >  			memcpy(i2c_dev->dma_buf +
> > I2C_PACKET_HEADER_SIZE,
> > > -			       msg->buf, msg->len);
> > > +			       msg->buf, i2c_dev->msg_len);
> > >
> > >  			dma_sync_single_for_device(i2c_dev->dma_dev,
> > >  						   i2c_dev->dma_phys,
> > > @@ -1352,7 +1366,7 @@ static int tegra_i2c_xfer_msg(struct
> > tegra_i2c_dev *i2c_dev,
> > >  						i2c_dev->dma_phys,
> > >  						xfer_size,
> > DMA_FROM_DEVICE);
> > >
> > > -			memcpy(i2c_dev->msg_buf, i2c_dev->dma_buf, msg-
> > >len);
> > > +			memcpy(i2c_dev->msg_buf, i2c_dev->dma_buf,
> > i2c_dev->msg_len);
> > >  		}
> > >  	}
> > >
> > > @@ -1408,8 +1422,8 @@ static int tegra_i2c_xfer(struct i2c_adapter
> > *adap, struct i2c_msg msgs[],
> > >  			ret =3D tegra_i2c_xfer_msg(i2c_dev, &msgs[i],
> > MSG_END_CONTINUE);
> > >  			if (ret)
> > >  				break;
> > > -			/* Set the read byte as msg len */
> > > -			msgs[i].len =3D msgs[i].buf[0];
> > > +			/* Set the msg length from first byte */
> > > +			msgs[i].len +=3D msgs[i].buf[0];
> >=20
> > I'm having trouble understanding why this change is needed. msg->len is
> > never changed in tegra_i2c_xfer_msg(), as far as I can tell, so it would
> > contain whatever was in it for the previous transfer. But since we want
> > to read the message length from the first byte, wouldn't the assignment
> > (i.e. the old code) be the right way to do that? If we add the length
> > from the first byte, we could potentially be reading more than whan the
> > first byte indicated.
> >=20
> > What am I missing?
> >=20
> The value in the first byte will contain only the number of bytes to read=
 further.
> The value excludes the first byte as well as the PEC byte.=20
> The function i2c_smbus_xfer_emulated(), in file i2c-core-smbus.c, increme=
nts
> msg->len based on 'wants_pec'. Other functions, specifically the function=
=20
> i2c_smbus_check_pec() expects msg->len to be the number of bytes of data =
+=20
> first length byte + PEC byte.
>=20
> To avoid reading more bytes, I added another parameter ' i2c_dev->msg_len'
> which will contain the exact number of bytes to read in the current xfer_=
msg().

Okay, sounds good:

Acked-by: Thierry Reding <treding@nvidia.com>

--syCJBqMyhVFTAA1a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmQ3vNUACgkQ3SOs138+
s6GDig//aVivvLg5vlG6uOo7QIiqS45I8kzJohG81Q9Wt76vtJIDhiMGLf+y/ZSX
wHGbTZj6b732rVarjw5gqD/dtviySt6ZVu/9ppzGH84NvRmPqHu/N5ZzPTv0bsJ5
h+41D+DB9ARWEnjFJQi88EjGNw62nX6QCjVqhdZFuoNeo+sk0fZguHRaoYd6vSmk
hyfOctHtGSF2+tod6bmH3fRDo8cT3RizPO/CLG460t82oTO7jhPEi5pnK8DZYIku
2+6dnA/Zxzk5Dttiox2EDooB0oS1oKs7Y8pLkVO3f01dDvMfgSjgDL+K/tJREHxz
juF+uw4O8MLTyVzyYipQ+WxqZeoUVU+tb/Cl8UiB5En5mteesfTlupmjxwkm13dF
lnur9es02Mfdguw8rek/EKfywkd7mMLLRpV2QFLveFaxeiHLlIKOFfoBqkGevVG+
s0gEPxUf74FeZuVN58UJ5euZcUNYR6/t6c/bxezx8at3pHLnlUnUyd6roHCybxGb
HLWsHzcONr8W7elhauHXl8r3QFPE9YI1fz9jL6UlOjlZ3sUPp5T1fPbCzEsLbjnt
jOiGaqZqB9IYtx2GqXoh/gEAWR8tJjHzsoVjUe7TyXjZEAuecCA07wVrodIuRta8
/ZRxmTQFuxX3cSxF5Vgr+n3U5fYakePwfQEynu6wAZLX1pKuA3E=
=e+2e
-----END PGP SIGNATURE-----

--syCJBqMyhVFTAA1a--
