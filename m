Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4CFF6F3DC1
	for <lists+linux-i2c@lfdr.de>; Tue,  2 May 2023 08:50:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229722AbjEBGua (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 May 2023 02:50:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233507AbjEBGuT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 2 May 2023 02:50:19 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8E7D4237;
        Mon,  1 May 2023 23:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1683010209; x=1714546209;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=YkZqd9ppIY7yEIAiINZ3ndGmS/bfhayyJibhgAwO8Ds=;
  b=Vrod4UF0J7aSDZ83RWJ5VxHmEWki6MczMcAplYsmpEfQ1lXc3+eeFfWM
   tYMQrNWj36DGUQKqiy857CgCIxD5CjIGsxZbQljXtgBmT1M0AZad5TUGC
   m+/9MA1t6p5WqaSht0DOttgnyVJ9+0qidVfoYByuKGEN2uUH4vPgfAXuM
   UxPMs5qRJ1iKbxdj/ILTSeZ7OmTR1GeCElyqQwmPP5RSfB5oHggOxJKEg
   T4ousCzXUhIvOZhHimYrlJLM681gCgYEZvTXLLBt2tOhI1Rd2gKf9LSeP
   uzK4+f1vKevbv0DDJRLwLhR/ddlVD5bu251zIjnj3HAITS01prVqam3LH
   g==;
X-IronPort-AV: E=Sophos;i="5.99,243,1677538800"; 
   d="scan'208";a="30655272"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 02 May 2023 08:50:06 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 02 May 2023 08:50:06 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 02 May 2023 08:50:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1683010206; x=1714546206;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=YkZqd9ppIY7yEIAiINZ3ndGmS/bfhayyJibhgAwO8Ds=;
  b=dPrYNrEwCA6bui24GyFYdJ6BXqoQavuC/GRQo02bZvpTFrwe4O4LykyE
   m/CWzysdUm/95BL8+v+nkBd4xkRiLrQOZCfHmkgCZKSGMVc7Wl4yKMmST
   kEoEN2FXoPmhViE8ozvQgMUwpHSIED/9tAUV12Xo4R4WEIY0DzQIpbdNU
   9+jI/2RfXD76RZ8Gk9RkSa6MnuauZQbsw/0ksJaYvn7e0z0Roivwy2spt
   2JolWpXZ4hIdGBNlIPof5zPaD2+WB5RXW7hl9m/8N1PQ8fSE/3o+iMC8k
   mfWumxNqCruVPlSdRa23JOHJ+E5ZVKp5a3wo+SxaZhoI5ZSy9GMFc/+6U
   Q==;
X-IronPort-AV: E=Sophos;i="5.99,243,1677538800"; 
   d="scan'208";a="30655271"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 02 May 2023 08:50:06 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 80EF4280056;
        Tue,  2 May 2023 08:50:06 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        "A. Sverdlin" <alexander.sverdlin@siemens.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] i2c: lpi2c: cache peripheral clock rate
Date:   Tue, 02 May 2023 08:50:06 +0200
Message-ID: <2143344.irdbgypaU6@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <ZE4TU0rCw9MSwrmB@sai>
References: <20230310130815.562418-1-alexander.sverdlin@siemens.com> <4797405.GXAFRqVoOG@steina-w> <ZE4TU0rCw9MSwrmB@sai>
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

Hello Wolfgang,

Am Sonntag, 30. April 2023, 09:05:55 CEST schrieb Wolfram Sang:
> * PGP Signed by an unknown key
>=20
> > > IIRC this is a general problem^w limitation of the clock framework,
> > > clock providers cannot use clocks themselves in certain callback, e.g.
> > > set_rate.
> >=20
> > Well, that's essentially impossible when this clock provider is attached
> > via i2c. i2c transfers potentially need to change or prepare clocks.
>=20
> So, as I get it, this is not a specific lpi2c problem but affecting any
> I2C controller driver which uses get_rate() to setup a transfer to a
> remote I2C clock provider? And this lockdep warning is a false-positive?

Yes, IMHO this could potentially occur on every I2C controller driver, if a=
=20
clock provider while holding the clk_prepare_lock, e.g. during registration=
,=20
issues an i2c transfer.
I'm not so sure if this is a false-positive, but more like trying to do a=20
nested lock.

Best regards
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


