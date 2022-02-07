Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E3DD4AC371
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 16:31:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232383AbiBGPav (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 10:30:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1443831AbiBGPQH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 10:16:07 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41C72C0401DC
        for <linux-i2c@vger.kernel.org>; Mon,  7 Feb 2022 07:15:31 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id B5847CE111A
        for <linux-i2c@vger.kernel.org>; Mon,  7 Feb 2022 15:15:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ED22C004E1;
        Mon,  7 Feb 2022 15:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644246928;
        bh=+JqO28kUR3rOxUC67QeZD+AjDsfL8gu4TTcYwegB4Ak=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=pWgtbJsYwxY1mJbodoR3n2HCpJusplO6mhYhN4XHM+Xgb46j0dAP44yHziiIaYY8l
         5IRLjocEwDR7ZzzkQiVQhzppYpu4pDVaWDlFB63hJk8goGIMTkB2iW8/1mDdBZyud3
         3Inn5JEVlaEAjbSWynJORfT/4jpXeCWwLI3fx2Nca1m3h1HmZhZ2qpe/UmX952noy9
         fR+TNGzsLAwd4Q2v6xeBenkKo0PHLEwigpW4vuIqMJ/fdLV1Ll+X7zbU3K3FmKt2mT
         z2w9E+jREZcL28bzDa17LWlkJ/xxmQLQbS47w2KT9QdmRlXJ/KbnMjbMINVv8F5Zbw
         EWa3yaSoBP9OQ==
Date:   Mon, 7 Feb 2022 16:15:24 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     "Ivan T. Ivanov" <iivanov@suse.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Phil Elwell <phil@raspberrypi.org>
Subject: Re: [PATCH] i2c: bcm2835: Set clock-stretch timeout to 35ms
Message-ID: <YgE3jMkzisFZFHb5@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        "Ivan T. Ivanov" <iivanov@suse.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Phil Elwell <phil@raspberrypi.org>
References: <20220117102504.90585-1-iivanov@suse.de>
 <YfPHawUXJRPDHPmM@shikoro>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Y5BybGMFeBTrWi51"
Content-Disposition: inline
In-Reply-To: <YfPHawUXJRPDHPmM@shikoro>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Y5BybGMFeBTrWi51
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> By default, busses are I2C and not SMBus, so it looks like we should
> finally apply this patch which disables CLKT:
>=20
> http://patchwork.ozlabs.org/project/linux-i2c/patch/1519422151-6218-1-git=
-send-email-stefan.wahren@i2se.com/

I applied this now to for-current and added stable. That should avoid
unwanted timeouts.

> If you really want the SMBus timeout applied, you can check for a
> "smbus" property in DT and then set CLKT accordingly in a seperate
> patch.

This still holds.


--Y5BybGMFeBTrWi51
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIBN4wACgkQFA3kzBSg
Kbb9SQ//TNA8luBprnVEuD0pIynkBtQJyXgzeTpTlaJRtndonh0QITAzJiANb5fe
tdZIiHubQL30JwYHGzplYsuDJQFyJOI60xqAQnWGM5X6kvlHIf7/99Ox5GyJXjhF
VUjSyDU7Xu5ialNgvkyeq25rGwhbxfNX+DeJi43iTMJV8IoPp+hs0t4hNpltxXnS
lto6skVs1L/h9Ny3wll3pfXQ7O87mVuwcT2pUU7D2aeOqUuPL7KRaAkhPC4cvZPV
mAfpjKWzkH6wBUC97Za+jTSlO/QuR6z6XNc3K0Ghtn7JsuMke7VJkHbwJJPEH+Z/
X8+t3pNBAdt9MRiOs/SRN+1HTb54AwWojVHHAmMscmY4nD0Tpv/qqlQdAgoQ/G6b
/AnwWLYJTEgwX6YlUHLAQMByOHNstthU4ZMIStI0hJ8irtTwv8OANAh+CXyh94xm
eSHX+LOZJcetm1WMkesgMsAcBqrb1GjvMhYxb68qNoga6Qb0XJ8RJK7U4/GUCgWj
Ae7URA9UhGVhG+Glr0yGDqyAdIuugHlSN7iBEVCi3AdkGBXwGsVNIDMPDNOFzQZo
smmSovbBRnlrZRuWh+nzTjXKr4mBz4HqfapwHk7QiFVsQWbUtWDoHrRRqipsh78K
9f0OdD+McVO5oQdAQqh3HDGdB+QRA7iuZlDJG59Bo1TeatA30bE=
=8JCW
-----END PGP SIGNATURE-----

--Y5BybGMFeBTrWi51--
