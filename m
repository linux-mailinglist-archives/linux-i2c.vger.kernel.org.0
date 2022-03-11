Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B8DE4D603D
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Mar 2022 11:57:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346696AbiCKK66 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Mar 2022 05:58:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346129AbiCKK65 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Mar 2022 05:58:57 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A692BFBA77;
        Fri, 11 Mar 2022 02:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1646996274; x=1678532274;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3DJWRY8DxKyOlSga9F41zew51/GuSj1jE3Ph1MQJt8Y=;
  b=o7ebj9CS08+koP150V/bvVKSFP17oPq1gXb293SgV4/TUDZlWXAMefqd
   QjeOpVFkWUB/xWbd1ARKC7gKbA3nVUvOK1Rd7KWbiPv3PYpOdfJ0s+qP5
   4kW6m/UaqrqTJDRDU3Udz8HHMu+P/d1MwPjJjNvmxUkR59vAOsM5dTjQH
   eJoh6aKxtfMUxgiI6h19G+R3kLaiUj+O25Au5hw+StDIBceMZQHj2zs9G
   c6IU2hy+nc50RG1cldYeF428ytfW6139h9byu9iSxhbojLXetYEy20s0b
   +G8rZwRgJ6yHm8cQxneg5/Tpb30tvjnvuiXXzE9Uv5CoWOuzGkSSPy+ri
   Q==;
X-IronPort-AV: E=Sophos;i="5.90,173,1643670000"; 
   d="scan'208";a="22608829"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 11 Mar 2022 11:57:51 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 11 Mar 2022 11:57:51 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 11 Mar 2022 11:57:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1646996271; x=1678532271;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3DJWRY8DxKyOlSga9F41zew51/GuSj1jE3Ph1MQJt8Y=;
  b=YNN0iYzRCHmLitYGgTinhhK1M5AwB2Nrb78y5oKbHqwYImogY2X9CX6l
   7pLf7XLFEGrValAEsaaQtAs36mIhtQEaPOUsbKyAcvrSWRFNPUAtuK6wV
   9nrBm52Blrzu+KpCH0bzh/47vzeVzo/q98E03eV0ZK43JA1dULMZ7S2on
   HtT3enQv48RBQWF56TRFLL4vsS0adUD7O4JfjajefAU8OgGjzKnt2E4We
   8+vEWYDo41K5G0ET2Ch/bt6eGrbv57UI016ZGD4bfW8iwEeWpIZnBQclQ
   i31DGCDORaTi5Spx6mtnCiyHBQHUcLBE7Lp9DZ7O9RJZ3PLVbVoJunF4b
   g==;
X-IronPort-AV: E=Sophos;i="5.90,173,1643670000"; 
   d="scan'208";a="22608828"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 11 Mar 2022 11:57:51 +0100
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id CB1F2280065;
        Fri, 11 Mar 2022 11:57:50 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Alifer Moraes <alifer.m@variscite.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        eran.m@variscite.com, festevam@gmail.com, kernel@pengutronix.de,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, linux@rempel-privat.de,
        pierluigi.p@variscite.com, s.hauer@pengutronix.de,
        shawnguo@kernel.org, gaopan <b54642@freescale.com>,
        Fugang Duan <B38611@freescale.com>,
        Vipul Kumar <vipul_kumar@mentor.com>
Subject: Re: (EXT) [PATCH] i2c: imx: add irqf_no_suspend
Date:   Fri, 11 Mar 2022 11:57:48 +0100
Message-ID: <3676803.kQq0lBPeGt@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20220307143630.28697-1-alifer.m@variscite.com>
References: <20220307143630.28697-1-alifer.m@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hallo,

Am Montag, 7. M=E4rz 2022, 15:36:30 CET schrieb Alifer Moraes:
> From: gaopan <b54642@freescale.com>
>=20
> The i2c irq is masked when pcie starts a i2c transfer process
> during noirq suspend stage. As a result, i2c transfer fails.
> To solve the problem, IRQF_NO_SUSPEND is added to i2c bus.
>=20
> Signed-off-by: Gao Pan <b54642@freescale.com>
> Signed-off-by: Fugang Duan <B38611@freescale.com>
> Signed-off-by: Vipul Kumar <vipul_kumar@mentor.com>
> ---
>  drivers/i2c/busses/i2c-imx.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 27f969b3dc07..fcc09a1e7f44 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1478,7 +1478,8 @@ static int i2c_imx_probe(struct platform_device *pd=
ev)
> goto rpm_disable;
>=20
>  	/* Request IRQ */
> -	ret =3D request_threaded_irq(irq, i2c_imx_isr, NULL, IRQF_SHARED,
> +	ret =3D request_threaded_irq(irq, i2c_imx_isr, NULL,
> +				   IRQF_SHARED | IRQF_NO_SUSPEND,
>  				   pdev->name, i2c_imx);
>  	if (ret) {
>  		dev_err(&pdev->dev, "can't claim irq %d\n", irq);


I stumbled across Documentation/power/suspend-and-interrupts.rst which stat=
es:
> For this reason, using IRQF_NO_SUSPEND and IRQF_SHARED at the
> same time should be avoided.
Given this IMHO at least a comment should be inserted why this is fine. I d=
ont=20
have a full picture about the situation, but to me it seems there is a=20
reference missing, or why/how does some PCIe start some I2C transfer when t=
he
controller is suspended already? Do I miss something?

Best regards,
Alexander



