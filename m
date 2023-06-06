Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9DAE7236CD
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Jun 2023 07:27:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231715AbjFFF1C (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Jun 2023 01:27:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230121AbjFFF1B (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 6 Jun 2023 01:27:01 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 918C1A7;
        Mon,  5 Jun 2023 22:27:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2243B62508;
        Tue,  6 Jun 2023 05:27:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22C2FC433EF;
        Tue,  6 Jun 2023 05:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686029219;
        bh=BLl0mkMoL0v1sW48e4IHDWa6iCQ8N7NjfDo/zzW2nkE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dAQO5qCv+gWcmiSiduWE/+ZDJpM78Nw7L5YlXvvTQ4CK/g/FRPuDGGmOnc6Vd4NwV
         0HFcGgcMAcgSWJmQ1Fq7iHeP7fw9CCEb2LkPYfwGVQJHkTz34wYAfaNGDjtxKuNluI
         OuIRNdUqIiS8CPx+iMIj17MFubj8Kjol0drKITAFuArj4/PglIdN0EDeB9SdJGQOIr
         Pckt1C/4c9rPL5Mg3fcQXvmKBIllfiUCmh8NroG1GLoB1RjeWGJ9ySwTgJjphe7eDG
         GaHvvRzog8v8W+A8WxTgCiwddWS9BFHZdC4lNGqOjL+cgv5WDJWF1IIC4XYBGKPtBB
         5gEvTB1qSBmwA==
Date:   Tue, 6 Jun 2023 07:26:56 +0200
From:   'Wolfram Sang' <wsa@kernel.org>
To:     Jiawen Wu <jiawenwu@trustnetic.com>
Cc:     "'Russell King (Oracle)'" <linux@armlinux.org.uk>,
        netdev@vger.kernel.org, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, Jose.Abreu@synopsys.com, andrew@lunn.ch,
        hkallweit1@gmail.com, linux-i2c@vger.kernel.org,
        linux-gpio@vger.kernel.org, mengyuanlou@net-swift.com,
        'Piotr Raczynski' <piotr.raczynski@intel.com>
Subject: Re: [PATCH net-next v11 2/9] i2c: designware: Add driver support for
 Wangxun 10Gb NIC
Message-ID: <ZH7DoH7ZeO43xPvj@kunai>
Mail-Followup-To: 'Wolfram Sang' <wsa@kernel.org>,
        Jiawen Wu <jiawenwu@trustnetic.com>,
        "'Russell King (Oracle)'" <linux@armlinux.org.uk>,
        netdev@vger.kernel.org, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, Jose.Abreu@synopsys.com, andrew@lunn.ch,
        hkallweit1@gmail.com, linux-i2c@vger.kernel.org,
        linux-gpio@vger.kernel.org, mengyuanlou@net-swift.com,
        'Piotr Raczynski' <piotr.raczynski@intel.com>
References: <20230605025211.743823-1-jiawenwu@trustnetic.com>
 <20230605025211.743823-3-jiawenwu@trustnetic.com>
 <ZH2IaM86ei2gQkfA@shikoro>
 <00c901d9977e$af0dc910$0d295b30$@trustnetic.com>
 <ZH2UT55SRNwN15t7@shikoro>
 <00eb01d99785$8059beb0$810d3c10$@trustnetic.com>
 <ZH2zb7smT/HbFx9k@shikoro>
 <ZH22jS7KPPBEVS2a@shell.armlinux.org.uk>
 <ZH3bwBZvjyIoFaVv@shikoro>
 <018701d9981a$7278a0a0$5769e1e0$@trustnetic.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ZFZ+vYFy7tC5jGbx"
Content-Disposition: inline
In-Reply-To: <018701d9981a$7278a0a0$5769e1e0$@trustnetic.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ZFZ+vYFy7tC5jGbx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> Okay, v12 series will be other 8 patches for net-next.
> Do I need to send this independent patch to I2C tree?

No, it is already applied.


--ZFZ+vYFy7tC5jGbx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmR+w5QACgkQFA3kzBSg
KbZqoA//TIjh4sRiK7Przqrp3B8C96QjTxGC43wKbwKJO8CKPaceclhZ5FsDg3Xb
6E+auV+tJs7cruYSvK8sahs+HCFDhezmU+79JnTaZLzUBbdU10BEiZyDmqjvSq1D
RdkymmRwQOxY6vQkNz6ykaofnNhBz2q26t1vE1CI9jnksrvmBc6u25d+zS7aEAdp
Bxd+AVaBVil68B8C+4QZbo5W4r700TfJ42zv/f90fESJj5CU/1ASt2MaaXkxdvHP
ss9BX9pkaB3T3CvbhcbYHmH0Cz3yg1C5u6z7xDDERTVO/Hmg/Gc4xUjUEOMushYh
M3X0SuMrFejjbshlYPZ+GDjXnUvU5HRKYI4M31/vdt4yTck8GTb911mOF4KUV5cL
z8QfJHzB1ZfB4FTTZ2DQESy/gUT6AUcdEVFfDTXAkSCqSWunberFDG9yr9S09OO2
P3fo/k4WV+Q724cxk9nvxbTdWhnFPiCG8kvbAYoUt1IpVBM8N8rF+wxf8veUKPxE
OVs7w2G/iTvlkgAjFFQF6zHn86ut8V/qAe87+/L8yWGUEB8X0hdVe+tNe1zjG57t
qkw7M/UheUExql8a6ymBSMfwi1o/KKoiKsx13Mo77P1ZExc3ac9f0Gy9tn8aGePL
PVAEtFXAfCDFWOSDxH68Sxy4sN5okfk3UCBgslKos4QWQp4GwgQ=
=Otg4
-----END PGP SIGNATURE-----

--ZFZ+vYFy7tC5jGbx--
