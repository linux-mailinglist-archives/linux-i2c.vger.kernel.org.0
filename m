Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3875E614AF8
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Nov 2022 13:42:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230461AbiKAMmb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Nov 2022 08:42:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230526AbiKAMm3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Nov 2022 08:42:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 150DC1A398;
        Tue,  1 Nov 2022 05:42:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9A61E61092;
        Tue,  1 Nov 2022 12:42:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EDA0C43149;
        Tue,  1 Nov 2022 12:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667306542;
        bh=KzGRg5qkuvMpcyZBQVa6HjEtBiE9z54YDbSgDbPAeHg=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=NwPt1aZTBxMYnAZEcLL75Z7eEiL5AOs4Nplj0/gxG+tY641khPpoJ/VSS1BQ8qIP5
         VvjulI8ipJsBLrUfQLWaPyKnBzXKc0exstJMEj81Smbtl3UqqOcjCX9Dg9jj3Zm0J0
         Goj3XKLbbnEHK54ia3dMVNobwT4gw/fcvldap2U+r5twYWL1/tQZTUpELqhJwc27IE
         KnZLbA+A8rbCRI5CESeJT4/wzWnznpR4gEfgomuTQ0+PilMmMl+/TYxixIzTg3qD62
         XWpLPNcLa4qgTIuYufZ+ZuFa+fr9mORC9y434H0DmUaXCmbnRKGRpoJ7t+mWhsJSDy
         Ln4QBT5rMkXrQ==
Date:   Tue, 1 Nov 2022 13:42:18 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Raju Rangoju <Raju.Rangoju@amd.com>, syniurge@gmail.com,
        shyam-sundar.s-k@amd.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, rajesh1.kumar@amd.com,
        Basavaraj Natikar <basavaraj.natikar@amd.com>
Subject: Re: [PATCH] i2c: amd-mp2: use msix/msi if the hardware supports
Message-ID: <Y2EUKpto2ZRZorLd@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Raju Rangoju <Raju.Rangoju@amd.com>, syniurge@gmail.com,
        shyam-sundar.s-k@amd.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, rajesh1.kumar@amd.com,
        Basavaraj Natikar <basavaraj.natikar@amd.com>
References: <20221025181124.421628-1-Raju.Rangoju@amd.com>
 <Y2ESGbkgfEXsx9es@shikoro>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vVNqkArORQcowHZ6"
Content-Disposition: inline
In-Reply-To: <Y2ESGbkgfEXsx9es@shikoro>
X-Spam-Status: No, score=-8.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--vVNqkArORQcowHZ6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> > Fixes: 529766e0a011 ("i2c: Add drivers for the AMD PCIe MP2 I2C controller")

I dropped this Fixes tag, though. Looks like a new feature to me.


--vVNqkArORQcowHZ6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNhFCoACgkQFA3kzBSg
KbZ/+Q/9HKi/y2D/PRTfhcqwVMgcFygahYoZfMV7bHg5eo0OaByo1J1z8uX5ue6a
sEl9GL9xuUoN13DZPP11C1TWmAQHs2Xgk3lCxcNW5aP67+9B5VeyEgLzH5K5EEav
PsKcQPSK96JV2awZzHkarTr/upHVu6TrIKUBGzPkEPn5PGXc2DrUU5LdRqEm8CLw
QDHYOrMch1THjoPNtuk70mWuhnVZfAhlW/YGotU6GzUrmeE8kx7JdloVwaFtGmUC
TGTpbXFYvUkCkpCygCMkRjV2KmheP7q/UPXU9nsyVzVv+2s6sraeWM3jZqKx7m/g
xoWYNfAltDN59O7BAsUEi6njFQ85t4fHUzn5gbvddHjnnwgnGf9f9Wl11+zDNVh/
cL7TodXRjU0/EKJNkaLNMKuwWvaDoc4Oid/5fy8syGgkhoeVjnG6oVxeKIxC4poh
u0u/sLo0DqKVyWNcpEX1eDqGzWAiCOuN22C5QPc8qUsucQLgudvoXZsHyXUB90ju
kBHCAisjdU6m04Iitz48X3LaGZebJvkvrjp88PcSyH/k5ixN2eriJJWO83yDrnsj
b8B6QkphpL438yTb25JidHeoTScYhvY8gyEIhTmMjOPg54uBeDJsfAyDWB7Kz4kP
bj5WjYSfi9l3gd/bi0pewqEilXfpVHmGl5dXNib0tqIWFVq2n4w=
=lbyW
-----END PGP SIGNATURE-----

--vVNqkArORQcowHZ6--
