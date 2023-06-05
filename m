Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED3147226AE
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jun 2023 14:59:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230189AbjFEM7C (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Jun 2023 08:59:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232600AbjFEM7A (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Jun 2023 08:59:00 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87ADCE5A;
        Mon,  5 Jun 2023 05:58:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 159C5623E3;
        Mon,  5 Jun 2023 12:57:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDB62C4339B;
        Mon,  5 Jun 2023 12:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685969860;
        bh=w92Xq6xwU5/tyThn8NVIB3i/bx1EhmWfmR3FDBXsqiI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WPLqx9yAHdkBL4uvM5Ns002jO7Ug2gxugUe3OdAwbeVP+gpok4HXguKE14tv/zHYh
         S7JNmXEGKdVjA5caaEeShelM6u/U1zZo6Ujxf8NBYT3BiR5iKU3w0CdvXgjNKmNnZ7
         Ua6xBMLmlpcyj9TzGtcv8zitVZtvE+AG8+vyAw46p2AJQ30fQoThFxAPkOZAUUUxdX
         CA54BL6zR6yuRFSohefdIJ8HO1hL4SqFiTWV/b1pdEPSNGR3BBRtHigODHGRbKHNnq
         hAwQFuV3S9Qeiwiqsx4sd46GW9tPmkdJORrbILAWPdBeh2EWyBr5gnXq/GyfoiqVxs
         wQt99bkaNXRRA==
Date:   Mon, 5 Jun 2023 14:57:36 +0200
From:   'Wolfram Sang' <wsa@kernel.org>
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     Jiawen Wu <jiawenwu@trustnetic.com>, netdev@vger.kernel.org,
        jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, jsd@semihalf.com,
        Jose.Abreu@synopsys.com, andrew@lunn.ch, hkallweit1@gmail.com,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        mengyuanlou@net-swift.com,
        'Piotr Raczynski' <piotr.raczynski@intel.com>
Subject: Re: [PATCH net-next v11 2/9] i2c: designware: Add driver support for
 Wangxun 10Gb NIC
Message-ID: <ZH3bwBZvjyIoFaVv@shikoro>
Mail-Followup-To: 'Wolfram Sang' <wsa@kernel.org>,
        "Russell King (Oracle)" <linux@armlinux.org.uk>,
        Jiawen Wu <jiawenwu@trustnetic.com>, netdev@vger.kernel.org,
        jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, jsd@semihalf.com,
        Jose.Abreu@synopsys.com, andrew@lunn.ch, hkallweit1@gmail.com,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        mengyuanlou@net-swift.com,
        'Piotr Raczynski' <piotr.raczynski@intel.com>
References: <20230605025211.743823-1-jiawenwu@trustnetic.com>
 <20230605025211.743823-3-jiawenwu@trustnetic.com>
 <ZH2IaM86ei2gQkfA@shikoro>
 <00c901d9977e$af0dc910$0d295b30$@trustnetic.com>
 <ZH2UT55SRNwN15t7@shikoro>
 <00eb01d99785$8059beb0$810d3c10$@trustnetic.com>
 <ZH2zb7smT/HbFx9k@shikoro>
 <ZH22jS7KPPBEVS2a@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4vJFpEDhy/jzD6wj"
Content-Disposition: inline
In-Reply-To: <ZH22jS7KPPBEVS2a@shell.armlinux.org.uk>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--4vJFpEDhy/jzD6wj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Be careful... net-next uses patchwork, and I suspect as this is posted
> as a series which the subject line states as being destined by the
> author for the "net-next" tree, the entire series will end up being
> slurped into the net-next tree.

Thanks for the pointer. Jiawen Wu, would you kindly send a v12 of the
series (without the I2C patch)?


--4vJFpEDhy/jzD6wj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmR928AACgkQFA3kzBSg
KbYAlQ/8CsD/+N2Zcc03AXNNyePkY7YwqKQ89NT9H0P05i639jHKWOzocHyZ9J8j
OGqeKxao+GUCgv+nODspUJgt+2j8rTlE7Ael8zMpvEJYWckVeryzaaNAo+EcE3jq
VWZHkRM0PFrl9Wpb94xuWFzilN9dzwjT4rT5TOA6axIwYlGMcedv3Ngjx7a37RUi
aeX11lLHlbdkz2SUEc11TtSBAgak6pGrJX4hD3Ffntg3s3w5gkHghcHkkXGMfavX
J9cqm89YJg3sKzEIU9NYhGMYvvHfZ/68MbLZDgnAMXhKenpVvJoXKR8IUiehmbW9
ih28X9F/XJ0jzqIVOPJ1NkYvkMaEFiejHtCwiLTnDmvkNjCqfysjJ0RLg6ZGuN+C
04Aafq4tpGSKhnvGNROHN7DIyZxuzlt9811kmJKBT96U71artA28+rysHyCuiujf
eeBMvU11//308vd9TsTfNYFlaaLQoPmy8aK0C+xo3/dQ6aTQWKpMZ4oJwehnO/yz
n4JFsfzSYfsybTWVzlus2V4TFySbKRS0RlZ83ugmaMSgLuYeyezfo9ZmV548iJdR
GNelCyktqDCOLDA/3ZxelNEoBfwfzTcg7nNM/FQYU6QjQ4sx7KDM/uGe4EqsYvNb
V/jzLOsok3oB4y2F0an0el0xSxq4Tenyg5GDRV2KJZ+yLH5AygM=
=iCS4
-----END PGP SIGNATURE-----

--4vJFpEDhy/jzD6wj--
