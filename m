Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A85575F5A4F
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Oct 2022 21:04:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230131AbiJETER (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Oct 2022 15:04:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231547AbiJETEJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Oct 2022 15:04:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 604E7474C7;
        Wed,  5 Oct 2022 12:04:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CC07A61799;
        Wed,  5 Oct 2022 19:04:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86140C433D6;
        Wed,  5 Oct 2022 19:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664996647;
        bh=ms2LxKUF/+3C5vyCiRLUbpBT+qKWwk5Y3RBszCPvMdM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=C33c96aPw6GJQctedQVWleVyybb8QjFb7d+tX0UM47FQWEd1Pyqg0MIJmJuZdgSUg
         yexR7zXQnJmPRyHgHWHZlJ25v0Wb0iQEDpskfZFtrD/3IL837n/PRnVjH7cMneH2Te
         XsNOum8aVBaFa63pVDLiDTlhTAaZScGejxlrBi/sR76glISTA55/+vJD3jFt1/I0NU
         kv0m2vW1IX/fIAUGrjfOKbCpNmE6ocaTTMdVc+svfVy/+hTWC0bfnEV/3hL/HyC1vl
         39uj+EGykFMNZ1zyBLBUbojbQECamCccZPh7+HnOug0Pcv604rBR66bShk6hL1h9R3
         T3anS2aJRa6gA==
Date:   Wed, 5 Oct 2022 21:04:02 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Arminder Singh <arminders208@outlook.com>
Cc:     alyssa@rosenzweig.io, asahi@lists.linux.dev,
        benh@kernel.crashing.org, chzigotzky@xenosoft.de,
        darren@stevens-zone.net, linux-arm-kernel@lists.infradead.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, marcan@marcan.st,
        mpe@ellerman.id.au, paulus@samba.org, sven@svenpeter.dev
Subject: Re: [PATCH v2] i2c-pasemi: PASemi I2C controller IRQ enablement
Message-ID: <Yz3VItDOw6mYwxak@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Arminder Singh <arminders208@outlook.com>, alyssa@rosenzweig.io,
        asahi@lists.linux.dev, benh@kernel.crashing.org,
        chzigotzky@xenosoft.de, darren@stevens-zone.net,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        marcan@marcan.st, mpe@ellerman.id.au, paulus@samba.org,
        sven@svenpeter.dev
References: <Yzl16W6+poH8/8h4@shikoro>
 <MN2PR01MB5358FB185A18D2E6C22A45FE9F589@MN2PR01MB5358.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Bvu7jPk+VeUHSDVn"
Content-Disposition: inline
In-Reply-To: <MN2PR01MB5358FB185A18D2E6C22A45FE9F589@MN2PR01MB5358.prod.exchangelabs.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Bvu7jPk+VeUHSDVn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Does fixing the alignment issues and the commit description justify a v3
> of the patch or should the minor fixes go out as a "resend"? Just not sure
> in this particular case as the fixes seem to be very minor ones.

Yes, please send a v3. Since you are only fixing whitespace issues, you
can add the Tested-by tags given here for v3 already.


--Bvu7jPk+VeUHSDVn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmM91SIACgkQFA3kzBSg
KbZ+EBAAnMxkC4kEf5fVj8TlIzY2ZTuYiGbsJBZk2QBuUCBtuLUCvwOLtc9+GRDu
+9o8dkey0GskEOeJOHlCdL7v7t/q0lxXwkRyJnAhZ35ykhPnNCmNqj3aKKxi94fE
QKqhIpR6hEbN5okcdYngYA9UOd1LM23IFXcSEnuw9KaeMWJLzLfJU6xh2N6drOZl
+IoyqPXXMwlGpqX3y/dI84XSxJZ3VfCMZNj6bfe+YvoJO6iyZBrvgBL5fNpch1HI
3ID+7nQEbGZaV9B0Bh22PVYgvc34FyfwUZbnhtSIAgr3aIPGqTvM5n7eDCnNRAEW
YppgIO6CiH3SalgavJqLENIEjf3zm63U8YH8bVMYQXHOFIspu4TyRJewGcgGNEcx
NMKDxUFJ36EB2h8qtqoREo+36bvdMzmobrnJ5M/3yLOFbXvpejMdkq9G9Jsqlst6
jeXQwZ7SaXI0HFxgwp/NtIYfvogi2UEuEWyOYPQCI85f/GlcpT9HEp6EP48P3+rD
wKY1jAW07pbPTr1qLSkjiNORyQdBWMUb9w6BkjPYW4+ZAHvtIh/F3ohOwPdA7Q1b
Kqa1eX2y2Vl36GE7Y56lnZWTSfeFDc867EVp264lG82gSF4ejd4qeOjkfE6u0iOx
CLdQiuFpO158OxZHfz67+RNXlDrLoPLTvpPYiI/mH+IDDKKVVSU=
=yR5q
-----END PGP SIGNATURE-----

--Bvu7jPk+VeUHSDVn--
