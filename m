Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AD5E73B2E0
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Jun 2023 10:47:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231440AbjFWIry (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Jun 2023 04:47:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231433AbjFWIrx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Jun 2023 04:47:53 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B44121706
        for <linux-i2c@vger.kernel.org>; Fri, 23 Jun 2023 01:47:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3CA12619C0
        for <linux-i2c@vger.kernel.org>; Fri, 23 Jun 2023 08:47:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF4CDC433C0;
        Fri, 23 Jun 2023 08:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687510071;
        bh=4HOK+KCqD7+9r9i4xEP9Ro40ExhOpZgLkxJd2gvQYMg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Nyz8bA3DQrq12A8j7w3K8Y+hCDMpsYm61O+0caFWz8p/nAF8q4hJnbHKy5LBi2yAi
         s95YUZMc1Yy9gvK56W1jQSbBO9WBUuDD7yYg3tPKxIt3otv1ukAR1AJ+CW2/iZPcxf
         dX8OMWaNp7wsXv3i+/M5QZS5MjS/cjB3wJV69fa8//rzap7s4RGnl7TrO1Ut1sX9VH
         IVRmWvJrdQI/Xi0J+Of/p8V3VPNEnBc20dzSPiGL2eFE5APBL+XAli+0kleZbp6oRj
         +8qdknEMYsoBQ24fzV1A9wFB8r9c64LjFyxUQ55Dg/7oRrtdbfaN8448deRvtxmOWJ
         LmOXOQu1dRwAw==
Date:   Fri, 23 Jun 2023 10:47:48 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Hans Hu <hanshu-oc@zhaoxin.com>
Cc:     andi.shyti@kernel.org, krzk@kernel.org, TonyWWang@zhaoxin.com,
        cobechen@zhaoxin.com, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v6] i2c: add support for Zhaoxin I2C controller
Message-ID: <ZJVcNIDWEbB6Jq7a@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Hans Hu <hanshu-oc@zhaoxin.com>, andi.shyti@kernel.org,
        krzk@kernel.org, TonyWWang@zhaoxin.com, cobechen@zhaoxin.com,
        linux-i2c@vger.kernel.org
References: <20230614073433.280501-1-hanshu-oc@zhaoxin.com>
 <20230614094858.317652-1-hanshu-oc@zhaoxin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="1+hYB6VzyQex5yI/"
Content-Disposition: inline
In-Reply-To: <20230614094858.317652-1-hanshu-oc@zhaoxin.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--1+hYB6VzyQex5yI/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

thank you for submitting this driver!

> diff --git a/drivers/i2c/busses/i2c-zhaoxin.c b/drivers/i2c/busses/i2c-zhaoxin.c
> new file mode 100644
> index 000000000000..bd5432bec7be
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-zhaoxin.c
> @@ -0,0 +1,599 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + *  i2c-zhaoxin-i2c.c - Zhaoxin I2C controller driver

This doesn't match the real file name anymore. I suggest to leave out
the filename completely.

> + *
> + *  Copyright(c) 2023 Shanghai Zhaoxin Semiconductor Corporation.
> + *                    All rights reserved.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/i2c.h>
> +#include <linux/pci.h>
> +#include <linux/platform_device.h>

Some includes are missing here. For example, module.h as you are using
some of its functionality directly. Probably some more includes are
needed.

> + * registers
> + */
> +/* I2C MMIO Address Constants */
> +#define ZXI2C_CR_L                     0x00
> +#define   ZXI2C_CPU_RDY          BIT(3)
> +#define   ZXI2C_TX_END           BIT(2)
> +#define   ZXI2C_RX_ACK           BIT(1)

The register layout looks similar to the i2c-wmt driver. Could this
driver maybe be reused for your hardware? I'll stop reviewing here
because we need to have that clear first.

Thank you and happy hacking,

   Wolfram


--1+hYB6VzyQex5yI/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSVXDAACgkQFA3kzBSg
KbaorBAApsI7rGlkRLVtlqo0LbrA8xCn3LHfTLLLvBPIZzf/SjjE+zfxn4lhIUfn
b3gKVygWf0G7gbCYvU3h0h4rL/tkmgxp2g44IBFXy3kCezPHkDJKPSAUdyi9qeYv
+z9og99OZmbtT9RgCBwMbJKLY5qP5hf19cQFYiundTnrVvaa9JsNLw+svcECGPJ5
gcTxdL9zQdSrHj7pPfJtKxtPaNePgri4fBMDq3ts0YD6GZLVoJPhVXuMkiidIgWX
zjk4XexiI4gUiSmyQJ7XZxzO6waRBY6DWLOCfHOqCwlU6JHFSnAUOqduH0yRhmYh
g5SJr4stxRkXF+l3YaCUOuK4c/h8r5kkUO+j3wzB+mrRUEE+HhTMcXV8NZx4tL67
DTP0mZOLUmdKv0yJOC5D7p/SCib4EBqYlqagxGIKQPReKhLjKrqQb3bfLe+lbD3Z
wEOpxOIhWZzj0RV0iAjVZb3a9d53woiWYC5y8jCBwPHazrxGzkBjXrgMP/OSbbnH
/ZTr9y5WoHmQQdy04y+S5Uw52oc2PsP5eo0Sx2abdgKpYTo6gsCWCsKmeF2GeLwS
F1f25cV8zh5lmHL2GIkpxVWO1Z5t7e1xcNGawFdtF7fkJG9KP6oFJD7A/kjyKwXu
Z8PCMe1yrdnC1/33VQW39fL3T83EmZkQjtp9+fcoM6GFyxHbHEw=
=A/3S
-----END PGP SIGNATURE-----

--1+hYB6VzyQex5yI/--
