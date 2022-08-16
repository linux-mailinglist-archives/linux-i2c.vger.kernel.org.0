Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDDC659593B
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Aug 2022 13:03:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235166AbiHPLDK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Aug 2022 07:03:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235170AbiHPLCg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Aug 2022 07:02:36 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68DAEF4F
        for <linux-i2c@vger.kernel.org>; Tue, 16 Aug 2022 03:18:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DE7CDB8169C
        for <linux-i2c@vger.kernel.org>; Tue, 16 Aug 2022 10:18:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5EC0C433C1;
        Tue, 16 Aug 2022 10:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660645089;
        bh=lFT0prABNhAWLIrVWKkSc681WWTywJQ5GltxrRFHYuY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=giE+7SrgDv4Sy5iwNYGcaD/4nhDFMEEfMLXLlQS2EMf/Sp3QW/+1UzCLZNJ58SnGW
         30CWfj016rBo7tGJG6clQgDVi48uabITKWDNcZP7epkJEKNmL1kL1q4sSwXhr8z+4R
         DOOIqo35vz2gdvvCQaNpzjFXCUTNHLwzML5CKfrvOREyGQDu/DiDLTzP64bTknlguP
         np6jlNYH2rWa4o77aPEB/GHKNufok3WVw2VqjGE0i8+aUUeS/sWkTd985J6KfAqcmF
         YhZnLxScUBDUJ+IT6RyqK34e1eTp395sMcUwoBqnYTKFOTtpkhqBW4M6gzExNGw28B
         gxcnG5zT0s4wQ==
Date:   Tue, 16 Aug 2022 12:18:03 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Josef Johansson <josef@oderland.se>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 1/1] i2c: scmi: Replace open coded
 device_get_match_data()
Message-ID: <Yvtu29D/LkoMzubP@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Josef Johansson <josef@oderland.se>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org
References: <20220708120958.74034-1-andriy.shevchenkolinux!intel!com>
 <4d2d5b04-0b6c-1cb1-a63f-dc06dfe1b5da@oderland.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="558ZjsR7iDbjYhiw"
Content-Disposition: inline
In-Reply-To: <4d2d5b04-0b6c-1cb1-a63f-dc06dfe1b5da@oderland.se>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--558ZjsR7iDbjYhiw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

> I tried build Linux 6.0 and run under Xen 4.14.5. I got a kernel null pointer dereferenced while booting. Reverting this commit allowed the system to boot.

Thank you for the report and the provided information. I will give Andy
a bit of time to come up with a fix. If a fix is not easily possible,
this will get reverted for rc2.

Thanks again,

   Wolfram


--558ZjsR7iDbjYhiw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmL7btcACgkQFA3kzBSg
KbZMNg//WnTjAyEA3i48hSWyVREBcFAOFlQYyGg90/JkRPSmCblfW2qCgrOTwlnt
dM/wk1C2CNMzuc4OSyaFFzevWjl1q1MWUu2PrKatd/jYLSweddFqL4vJUpSKrzhG
bpjX1GIYJZMIIUukVBieyF3k9gxVEc2Hv6/H1G+IxhiFm8bkA3cQ/clwjRmCkOFZ
r3CWa8YL1Gl+u4vIyD8KUfZufAFxDhvzbsRL25On3YuOsuOzXQK3djOrDzBkLAgV
zE9VrjO2/g5ViH22P9b7STV2UBkBN4YlZIWlrHvQTsbeYJ4SOr9TjF9kFt/PrCBz
wUbSWC7Ave7qLUAawnK6UKBkZPfSV2rBXQLVC0IMAD+ealpVF+IuJuTqP5Kwi3l5
WqOuRvHekB8+/f6ecvwXUVa6ho0g1C9RUYHOPQX5u1WRfG0aip4q6ZsmcJ7W9v0W
Hh6MA2uoAcN7w/WeftNyfVW6ZaQgeuprWVsaQv2jgMepQGqIZt20ZFGqwnQXOD5i
9lwM19ajUbndOw6QSPITzQ1US38OihaEBQvqiLJtd5Cih6zj7RFvgyoFQZ1H4GzE
ADopRloJk2chvdGaSTem3MHvje6hufTpB5GDm5FMRN47cFLGUijEbVcL6DHk76hz
RAD1CHlODCORbq39qCPM1itT1/PIgvxkkveOtwEAoIwganj97Qs=
=XWEZ
-----END PGP SIGNATURE-----

--558ZjsR7iDbjYhiw--
