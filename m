Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80E88728996
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Jun 2023 22:36:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229660AbjFHUg4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Jun 2023 16:36:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236177AbjFHUgy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Jun 2023 16:36:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD44230C4
        for <linux-i2c@vger.kernel.org>; Thu,  8 Jun 2023 13:36:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3EFA461520
        for <linux-i2c@vger.kernel.org>; Thu,  8 Jun 2023 20:36:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4247C433EF;
        Thu,  8 Jun 2023 20:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686256606;
        bh=qcsPXVUfNrO5VaksuCPHsrro1Y+RCN8k67on2J6uhBk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CDARGi2MnA5E4wFs9KnFE7QwUIrgyOoWluIoF9RCHritmDWI54AHcXUkl9OupxZpF
         LVNaryuxGXVOp/H2n1MuI7c5eZRc/BRUSVbxRBCv7H0AczDEQPZJZWsLATiV5LTqhj
         Xeih2G9ObwSKhufOQE00xrIfVA412GUwXS+eC4NDm1+yCBQJYOXf1rH/1k++8XcF/D
         9zFwHykrbjz8W29SWzwZ4IbHKGiSpPJol21vgV6huwUUeegaI6PXZWvm21itM+d7w+
         LcIhCmM2b9phgSLtvZZQPyQpG+xGDqk0HwtuTWNFm/4OGu3FkSFnUMSI+gb/GvT9bg
         cmhFofzF7Sodg==
Date:   Thu, 8 Jun 2023 22:36:42 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-i2c@vger.kernel.org, syniurge@gmail.com,
        shyam-sundar.s-k@amd.com, Raju.Rangoju@amd.com,
        basavaraj.natikar@amd.com
Subject: Re: [PATCH -next] i2c: amd-mp2: drop free_irq() of
 devm_request_irq() allocated irq
Message-ID: <ZII72v6/ZQ4Oj+Wm@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Yang Yingliang <yangyingliang@huawei.com>,
        linux-i2c@vger.kernel.org, syniurge@gmail.com,
        shyam-sundar.s-k@amd.com, Raju.Rangoju@amd.com,
        basavaraj.natikar@amd.com
References: <20221103121146.99836-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Z9R52bUe4m7l6Z4n"
Content-Disposition: inline
In-Reply-To: <20221103121146.99836-1-yangyingliang@huawei.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Z9R52bUe4m7l6Z4n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 03, 2022 at 08:11:46PM +0800, Yang Yingliang wrote:
> irq allocated with devm_request_irq() will be freed in devm_irq_release(),
> using free_irq() in ->remove() will causes a dangling pointer, and a
> subsequent double free. So remove the free_irq() in the error path and
> remove path.
>=20
> Fixes: 969864efae78 ("i2c: amd-mp2: use msix/msi if the hardware supports=
")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---

Elie, Shyam, are you OK with this patch?

>  drivers/i2c/busses/i2c-amd-mp2-pci.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-amd-mp2-pci.c b/drivers/i2c/busses/i2=
c-amd-mp2-pci.c
> index 143165300949..ef7370d3dbea 100644
> --- a/drivers/i2c/busses/i2c-amd-mp2-pci.c
> +++ b/drivers/i2c/busses/i2c-amd-mp2-pci.c
> @@ -327,13 +327,11 @@ static int amd_mp2_pci_init(struct amd_mp2_dev *pri=
vdata,
>  			      amd_mp2_irq_isr, irq_flag, dev_name(&pci_dev->dev), privdata);
>  	if (rc) {
>  		pci_err(pci_dev, "Failure requesting irq %i: %d\n", privdata->dev_irq,=
 rc);
> -		goto free_irq_vectors;
> +		goto err_dma_mask;
>  	}
> =20
>  	return rc;
> =20
> -free_irq_vectors:
> -	free_irq(privdata->dev_irq, privdata);
>  err_dma_mask:
>  	pci_clear_master(pci_dev);
>  err_pci_enable:
> @@ -376,7 +374,6 @@ static void amd_mp2_pci_remove(struct pci_dev *pci_de=
v)
>  	pm_runtime_forbid(&pci_dev->dev);
>  	pm_runtime_get_noresume(&pci_dev->dev);
> =20
> -	free_irq(privdata->dev_irq, privdata);
>  	pci_clear_master(pci_dev);
> =20
>  	amd_mp2_clear_reg(privdata);
> --=20
> 2.25.1
>=20

--Z9R52bUe4m7l6Z4n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSCO9oACgkQFA3kzBSg
KbYXcRAAqjHxx95d+QJ9sLUXMIg/fj3X/qXpIz16vJ0I3AYBIigO/HyiiK57Z93m
q6lz2XLPMkKeMKBnE02o1fcitcmtitaQR3HfBZuLDd+OnymB6xhF5c2Bza6iAeXL
jgHpQC9Z2bqZ2MOpcSbGWPOoIMw5cb7un7cvRfPU1y5b4TQ/HQAyg3Ql/IFjbflm
PBPf0O8Ntx6PAo5deChznmrpla90c4/Qw5MqOtNNR3A8cEVxCyib7Flpi6187BWp
Y8/mSKam6Sfkwo225W0YwIdRTtwYTDzN1ctb4JD19m7bfq87H6uj+usSnyFb02Ii
xQ1yeCQYdfI9+iK0F2WxgGuaRwWxxQoOVlQg0/BhcIxGhMA3/zsHuMFRdyHOgYTB
mcl5UEAEX6p4OQSHmlGf94YqZHkF304FpjpELyCR84tfyXPU61AYTLHfYiLnB3tU
RV3o6t10/n0aU6oWFTZW+jEfqUluOyVmg+BDN6ClLzrz+AM/hjHlrmi9lhU1vY7t
oLEf9ad6gBuHzoGPbmq+YzF+r8lIb+W9zio3jMMLtP6K14LmbS5cOAj8//9UM0uW
mqYmOcKVukcDNV4c1Y45FpRSyo4cZVcRTTuPgSjmvhVK3cVAeiX7ydqd13GmN2Y9
GH+SJqkeA2QhgvD1kXiwnsnprkuu8SXIzovDVEL1tZAcGnqzCV8=
=51Tk
-----END PGP SIGNATURE-----

--Z9R52bUe4m7l6Z4n--
