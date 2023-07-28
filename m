Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C393766794
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jul 2023 10:46:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235133AbjG1Iqc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Jul 2023 04:46:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234978AbjG1IqG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 Jul 2023 04:46:06 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85AF249FA
        for <linux-i2c@vger.kernel.org>; Fri, 28 Jul 2023 01:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1690533910; x=1722069910;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=39HzfctpthLPLIzHxtcjcYgYWJjzdq8qsoNHjvGlKks=;
  b=BQn5hOmBb8LbbiXBqBeAoTRcaAPe32IrYytM+eaWqoDn6z+7vnPI3brJ
   JoPwFWEfOqNddIE0dhncDzxyWmkeb1n3wwfNyG40UUGDHisu36zpK/gYe
   OFJh+6AyLNwWrEFTeKpYiW/4kpj/dFuHK+XoPo3VF4CAo/NfECfTAJILH
   /6FvUGFB7COGWS4z42Of9aF36/zcP1WRMaQcz486UO5aboL2nWSnKzmDL
   Bby1l+LcWDClY6CtYcltKd76ybd5+KWneAHJ9dhLfCvKQA5tPYa0+Qm97
   CfWv2YKz+dyFP1ptPL91STtblCIE9hf5fCmlGZH+i7tv0lcksZUDVdfs5
   g==;
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="asc'?scan'208";a="238389076"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Jul 2023 01:45:06 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 28 Jul 2023 01:45:06 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 28 Jul 2023 01:45:04 -0700
Date:   Fri, 28 Jul 2023 09:44:30 +0100
From:   Conor Dooley <conor.dooley@microchip.com>
To:     Chen Jiahao <chenjiahao16@huawei.com>
CC:     <daire.mcnamara@microchip.com>, <andi.shyti@kernel.org>,
        <linux-riscv@lists.infradead.org>, <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH -next] i2c: microchip-corei2c: clean up redundant
 dev_err_probe()
Message-ID: <20230728-serotonin-anointer-1771952f3baf@wendy>
References: <20230728083137.3528303-1-chenjiahao16@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2bWGLkERN8vWtbMQ"
Content-Disposition: inline
In-Reply-To: <20230728083137.3528303-1-chenjiahao16@huawei.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

--2bWGLkERN8vWtbMQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 28, 2023 at 04:31:37PM +0800, Chen Jiahao wrote:
> Referring to platform_get_irq()'s definition, the return value has
> already been checked, error message also been printed via
> dev_err_probe() if ret < 0. Calling dev_err_probe() one more time
> outside platform_get_irq() is obviously redundant.
>=20
> Furthermore, platform_get_irq() will never return irq equals 0,
> removing spi->irq =3D=3D 0 checking to clean it up.
>=20
> Signed-off-by: Chen Jiahao <chenjiahao16@huawei.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--2bWGLkERN8vWtbMQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMN/7gAKCRB4tDGHoIJi
0hYsAQDTXZST9uaj9WrULRYu1kxr3aMKII3mUkIzSBf2ukqZ2QD5AQvD8C2/m0oz
MQLAc8wM/frBZFpmAtD8NEr1TosIlwM=
=M4pK
-----END PGP SIGNATURE-----

--2bWGLkERN8vWtbMQ--
