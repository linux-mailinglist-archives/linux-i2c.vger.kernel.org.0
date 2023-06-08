Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7C18727EAA
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Jun 2023 13:24:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235178AbjFHLYP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Jun 2023 07:24:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233739AbjFHLYO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Jun 2023 07:24:14 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C37181FF3;
        Thu,  8 Jun 2023 04:24:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 34B5C60E55;
        Thu,  8 Jun 2023 11:24:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BC80C433D2;
        Thu,  8 Jun 2023 11:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686223452;
        bh=C0+ZCw3WXH74XZgo+jq6NMYpfOAeHvfG17938qy+FaQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uRT8p1+ziG2U0UC307FFX1ud1peLbdUGDJRM9SzHr28nJbhBn1c72iSuC0VsVZ47s
         hbY78cCxUHJcdvlYGUN1PccsoBKXfBM/Q+NlMzdDTjFLTNkCt4VsU1vq2OUYbbMkBY
         rtccu/bEtTfnWkOOd8eF9TKlQ4IgE5vMu813RQgjwRyxMtY76tktsGsUAW/tyM/dlB
         d0RN8iMojTMuvued/54051/Ux5PfMV/gQDlrhVyYnMcnvxn6eH9eCaaJPf8Fadrm4W
         hJb4/bQDqA8c45Zo9iGTn4awTZH+1NzWTyx5MmXnxZOepTFna3rmTJ6HceIIuDRCgC
         /4Zt4FFA3GHug==
Date:   Thu, 8 Jun 2023 13:24:03 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     Andrew Davis <afd@ti.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] i2c: davinci: Use struct name not type with
 devm_kzalloc()
Message-ID: <ZIG6UzLMb7cj4bbj@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Markus Elfring <Markus.Elfring@web.de>, Andrew Davis <afd@ti.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
References: <20230515175042.495377-2-afd@ti.com>
 <61846ef5-26fb-52bf-11a3-b1c0b3b53b94@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bVKwg6CrWJN33/Mx"
Content-Disposition: inline
In-Reply-To: <61846ef5-26fb-52bf-11a3-b1c0b3b53b94@web.de>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--bVKwg6CrWJN33/Mx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Should desirable changes be split into better update steps?

It is done. It has already been applied.


--bVKwg6CrWJN33/Mx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSBuk8ACgkQFA3kzBSg
Kba17w/9EPHkVoPeDecot6s8LaD5W3ZuIQoPT4FG+daZSG2tHDKkViYviHJIuppS
DS04mkUSULmWorRr5dYlDEx/PjnykJ3KHY13+SKmC5d+nzUoQdyQod8o93U3d3kU
6m28GseOazRWgQiakkgy/N8O4EEb6TUnnyEMpJUIqqdd1NS34SflRukzygxrKoEH
tpDAZeOXTTAhjt1qWhC/M75O/h5n9lRH13CbrGLSzb3OpDjMMMoU0Xm9wh7/QHn1
pyE3edZuyI2QwIhHaI+a44M26buuwsV9QiMrzUvdi/Hi7UWF+HRDyHdzsBjwn1gK
njWp3MkN+u3LWkRy01jou83TY/8Gv4iYIZjbVE80AGRuK2vaDvq/WHMjbhafhocr
FRmuWQ3YniBI+ZjPKFb3nSjze4l749fG23ZaczxMiB1GtM0bXNI87C/EnS9TL9CR
mnvIMX/Ke1qcklkQAqzXLgtiD0OTgyQq4Ti+EXC76iSh2ivgZuCdlfTXbOIpZjV/
65rKug2eP/3lhdodnqxAbEzwpRLSjnbrAsYA2lzeZoJI6MkfAGzn4Lt/2A0vcSMn
NsIWApZwUzUFPrChBhMRTCrVMotHcwhHoSFRr13WLx0hRIxCrPaE7td2Z+nXKobE
J+RvarSc9SGcx512/cktbHWDeI8Uw3tK7oJQnn2oSfJBjDOkY6g=
=Dopb
-----END PGP SIGNATURE-----

--bVKwg6CrWJN33/Mx--
