Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2289476B5F4
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Aug 2023 15:35:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234318AbjHANfA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Aug 2023 09:35:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234321AbjHANe6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Aug 2023 09:34:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5F412121
        for <linux-i2c@vger.kernel.org>; Tue,  1 Aug 2023 06:34:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 88ACD6159E
        for <linux-i2c@vger.kernel.org>; Tue,  1 Aug 2023 13:34:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F270C433C8;
        Tue,  1 Aug 2023 13:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690896893;
        bh=5RlOyzIMWLWXN4Z4Qiob7qteiDrYb0Yp3IkTAwrDLno=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YLX2EzmlGBtWwKnF+UGxOMh3KaiSuGkutIyGCMvPXUfWln6Xa6X7r2wFWjsFWi5QT
         Xcldzk9bGs5/N3PqKSmS6vAaXpVWzGGFrU0O1rQiTGewJNWJp4b6o0OCL9mAOqXUIm
         G/UGfzrZzRCiedyhNEBCRKsmVzokfPUDFEEzhveNBnHdZBEumruLrfIWMcBtZWMo7i
         Jp9a3THEuC2gFze9Oj+nNCeqEMYkhW+VsilwUC7ALcNfd5aDKJzgdfTiaXV2bbABV4
         VCNOhFHoddFjzxED9hacoty0omWM3t/wZSB8gTdS5kaCWcQ2VwHWjAGIj/2TkO82cv
         1elq6qQ4YfX7Q==
Date:   Tue, 1 Aug 2023 14:34:49 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Zhu Wang <wangzhu9@huawei.com>
Cc:     brgl@bgdev.pl, andi.shyti@kernel.org, conor.dooley@microchip.com,
        daire.mcnamara@microchip.com, linux-arm-kernel@lists.infradead.org,
        linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH -next] i2c: remove redundant dev_err_probe()
Message-ID: <20230801-faceplate-craving-e913d24b0b5a@spud>
References: <20230801124551.138541-1-wangzhu9@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="BHH9ywCRFSmsCg/p"
Content-Disposition: inline
In-Reply-To: <20230801124551.138541-1-wangzhu9@huawei.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--BHH9ywCRFSmsCg/p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 01, 2023 at 08:45:51PM +0800, Zhu Wang wrote:
> When platform_get_irq() is called, the error message has been printed,
> so it need not to call dev_err_probe() to print error, and

> platform_get_irq() never returned zero.

Is that strictly true?

> Signed-off-by: Zhu Wang <wangzhu9@huawei.com>
> ---
>  drivers/i2c/busses/i2c-davinci.c           | 2 +-

>  drivers/i2c/busses/i2c-microchip-corei2c.c | 5 ++---

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.


--BHH9ywCRFSmsCg/p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMkJ+QAKCRB4tDGHoIJi
0t5bAP43t8TJDs1IIKjx0D5zL3GTqbU2KL6KUqtqRuTDgkxDPAD/RJA0wbEb2+f6
7IDa2eS/bkt4nyzHj+nw2T1xmq6cOwQ=
=JSqC
-----END PGP SIGNATURE-----

--BHH9ywCRFSmsCg/p--
