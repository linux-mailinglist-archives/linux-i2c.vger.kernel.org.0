Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F5A47E506E
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Nov 2023 07:46:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231769AbjKHGqR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Nov 2023 01:46:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231622AbjKHGqP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Nov 2023 01:46:15 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62077170E
        for <linux-i2c@vger.kernel.org>; Tue,  7 Nov 2023 22:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1699425973; x=1730961973;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eHyC+WKiJDNkxkLk2QwSxP5pCxTyil4D3ANVe1z8QDg=;
  b=Pph4nxEs69OEVTuncbBXtN++aCX/QoyJK9wRDZiF1XVYMcTOn2ovyWO2
   rPCRL7PxQHeQyylZRgQFuiYJIZB+ooLdDUtXJr7vjkt77DY842AZDRYEd
   BNCWQDWtdSXBAiBidTB3W9NE4M/Yhta2sjHEef6cwD3Vi4uXoA/UNDsPC
   F9pH8vFhs9P0XNhz3EBeyBrFccabsPHarLxSHQOWpOB2C0QVrfZsfj3sT
   j8nG1xb1f/lDjdZtUQTxRtoHnDoQDDTsydCqUDef3HpYqrtAdfinhJjxB
   Po7v9JjwIM7tE++gLka205/EP4M7lra0gEk8mV3dpa/Yiz5D0soyL6DTC
   w==;
X-IronPort-AV: E=Sophos;i="6.03,285,1694728800"; 
   d="scan'208";a="33864469"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 08 Nov 2023 07:46:11 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id C163328007F;
        Wed,  8 Nov 2023 07:46:10 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Wolfram Sang <wsa@kernel.org>,
        Alexander Sverdlin <alexander.sverdlin@siemens.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 1/1] i2c: lpi2c: use clk notifier for rate changes
Date:   Wed, 08 Nov 2023 07:46:12 +0100
Message-ID: <22082032.EfDdHjke4D@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20231107212049.csimqzzvim5uecpa@zenone.zhora.eu>
References: <20231107141201.623482-1-alexander.stein@ew.tq-group.com> <20231107212049.csimqzzvim5uecpa@zenone.zhora.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andi,

Am Dienstag, 7. November 2023, 22:20:49 CET schrieb Andi Shyti:
> Hi Alexander,
>=20
> is it my mail client not working or is is your patch that has
> gone through something terribly bad?

I can't see anything obviously wrong. Can you elaborate?

Thanks
Alexander

> Andi
>=20
> On Tue, Nov 07, 2023 at 03:12:01PM +0100, Alexander Stein wrote:
> > * CLKLO =3D I2C_CLK_RATIO * CLKHI, SETHOLD =3D CLKHI, DATAVD =3D CLKHI/=
2 */
> >=20
> >  static int lpi2c_imx_config(struct lpi2c_imx_struct *lpi2c_imx)
> >  {
> >=20
> > @@ -207,7 +224,7 @@ static int lpi2c_imx_config(struct lpi2c_imx_struct
> > *lpi2c_imx)>=20
> >  	lpi2c_imx_set_mode(lpi2c_imx);
> >=20
> > -	clk_rate =3D clk_get_rate(lpi2c_imx->clks[0].clk);
> > +	clk_rate =3D atomic_read(&lpi2c_imx->rate_per);
> >=20
> >  	if (!clk_rate)
> >  =09
> >  		return -EINVAL;
> >=20
> > @@ -590,6 +607,27 @@ static int lpi2c_imx_probe(struct platform_device
> > *pdev)>=20
> >  	if (ret)
> >  =09
> >  		return ret;
> >=20
> > +	lpi2c_imx->clk_change_nb.notifier_call =3D lpi2c_imx_clk_change_cb;
> > +	ret =3D devm_clk_notifier_register(&pdev->dev, lpi2c_imx->clks[0].clk,
> > +					 &lpi2c_imx->clk_change_nb);
> > +	if (ret)
> > +		return dev_err_probe(&pdev->dev, ret,
> > +				     "can't register peripheral clock=20
notifier\n");
> > +	/*
> > +	 * Lock the clock rate to avoid rate change between clk_get_rate()=20
and
> > +	 * atomic_set()
> > +	 */
> > +	ret =3D clk_rate_exclusive_get(lpi2c_imx->clks[0].clk);
> > +	if (ret)
> > +		return dev_err_probe(&pdev->dev, ret,
> > +				     "can't lock I2C peripheral clock=20
rate\n");
> > +
> > +	atomic_set(&lpi2c_imx->rate_per, clk_get_rate(lpi2c_imx-
>clks[0].clk));
> > +	clk_rate_exclusive_put(lpi2c_imx->clks[0].clk);
> > +	if (!atomic_read(&lpi2c_imx->rate_per))
> > +		return dev_err_probe(&pdev->dev, -EINVAL,
> > +				     "can't get I2C peripheral clock=20
rate\n");
> > +
> >=20
> >  	pm_runtime_set_autosuspend_delay(&pdev->dev, I2C_PM_TIMEOUT);
> >  	pm_runtime_use_autosuspend(&pdev->dev);
> >  	pm_runtime_get_noresume(&pdev->dev);


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


