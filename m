Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DF5B725B69
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jun 2023 12:17:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238913AbjFGKRy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Jun 2023 06:17:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238562AbjFGKRx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Jun 2023 06:17:53 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3797F10CA;
        Wed,  7 Jun 2023 03:17:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7E5A1634F0;
        Wed,  7 Jun 2023 10:17:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DC5AC433D2;
        Wed,  7 Jun 2023 10:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686133070;
        bh=NxT1s41dMrFsDV7pTbnj+j5inW1s5/XGtpNxVaCAyRs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NF1foDcxr6BGegOVbHBfFAZEg+WelFojwXZj/FYqSsgSQpP1B9jXjOTs66ij735In
         HNoIIf1I5GWMSUQo5AYhjVUpYAfwwL6o4/zjEl2+xKj+psUKgR9SN4Y7ZoAOXWDapt
         rL4aM+LFQ+awHXU0VJbvQiBuW8v9b0Vidqlhrn2yAJytPNmPDlaq1W8cBvIHv4iKlv
         69w4aJdzoFOHR3iZ2oYrf9arbe5PROHWFrXf44UmV5GfFeVWwfTshaZZd58tcWOSki
         kxfw87JgX1e0yiaSZQCqtM4fU6SQataDIP5W08TGVb/RIoGLuOXYrkvAFnRgZkKUBh
         TIKhuCrUrDUsQ==
Date:   Wed, 7 Jun 2023 12:17:47 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>, Marek Vasut <marex@denx.de>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v3] i2c: Add i2c_get_match_data()
Message-ID: <ZIBZS7Ee1FxH+zoG@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
        Marek Vasut <marex@denx.de>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
References: <20230606130519.382304-1-biju.das.jz@bp.renesas.com>
 <OS0PR01MB592282658E36A14D0A762BBB8653A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="272LYwbpIYZJjSYa"
Content-Disposition: inline
In-Reply-To: <OS0PR01MB592282658E36A14D0A762BBB8653A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--272LYwbpIYZJjSYa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Biju,

> Do we need to enhance the logic to use device_get_match_data
> to support OF/ACPI/I2C match like below [1].

Sure, the more the better. With your original patch, I thought we can
add it incrementally when someone needs it and can test it. But using
device_get_match_data() we already have a well-tested helper we can use
right away. So, let's do that IMO.

Happy hacking,

   Wolfram


--272LYwbpIYZJjSYa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSAWUgACgkQFA3kzBSg
Kba1gg//YMRsUPMkLpiOCkYbAYf8lZkePyvQ5YCjmYZB77dGCzEww6r6hSOakCC2
0cst5ZUcxIgqusbQwVGwsGrKUUKmKzTlidBpEktJWedx5vdjcZdUZLLXjZsjnoXZ
GTw2gIxnhKPdiD2Ae0X5M2IBi/UK5ukRrJvQxI2v+9PnvmMR8EWZOYV/YVPf9MTX
xeahMoIhbeKXe8e7VFXW/YpAYC9VLrc+hBtXaJykL1pzfislAh6dqreu7kZdQIjV
19ZRZsrWfwYJc/KfllNFLSJGeYTdASBLjq+Ottb7atGKDCi4gn5oq3MJVpqnZneJ
+2iThSDVqn4s2miT9AgWkMTSxnvFnif3XTgKI5zNVmi+ic05Aw+LWiP5CR7NKP4U
8aCCR/wZ3gDwdp++qxCjA2debGyUI3gVn6kcP2tcIWnXRlE7egBFmemhNY+SlHZq
bKoy6waxbO53JuD7uh/SZnQweKwbnM8ArhsFSlI08r+jSYMaESwAKWpPsRP9KFJu
h3A7TtgXWxlogeLTm74FxkX3afMCt6Lvc4P68rUaW1UsmqEOc9p8kSUoaRz7eji9
CG88s9nrH+QtNYh1iRSV0e3ZxAQU8ZlbKk79J92M8+U7PHH5v98wRDiI7v2cd3uF
oqm6rw2ya8mdZ+cjS6C19ByHbY8m6Bvq6u9n3jv9V07M9pARdpk=
=SFcu
-----END PGP SIGNATURE-----

--272LYwbpIYZJjSYa--
