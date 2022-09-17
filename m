Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 732515BB9EA
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Sep 2022 20:34:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbiIQSeG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 17 Sep 2022 14:34:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbiIQSeF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 17 Sep 2022 14:34:05 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FD582C678
        for <linux-i2c@vger.kernel.org>; Sat, 17 Sep 2022 11:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=R6w3vdJsQs1uiDf58gfDxxQzlIRL
        k2VzIag6RW0keH4=; b=DFwB/0yRetUy7mV6hYzGVcqv2iHSeTW6fGrQHgBD7n/Z
        cDnU43aGiSfdPvkymk934ChPvKDhVBtyniECzPny5AEbwCPbhApPHZvsCYZ1jk45
        +Bbbu9W33/ILC7/8mzTyFXvupp39m0O02NBUl1A9aSVYMYE4vYLth4y7ygZ/Pl0=
Received: (qmail 3861212 invoked from network); 17 Sep 2022 20:34:02 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Sep 2022 20:34:02 +0200
X-UD-Smtp-Session: l3s3148p1@AvLsuOPoKoO5aIoe
Date:   Sat, 17 Sep 2022 20:34:01 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Asmaa Mnebhi <asmaa@nvidia.com>
Cc:     robh@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Khalil Blaiech <kblaiech@nvidia.com>
Subject: Re: [PATCH v3 9/9] i2c-mlxbf.c: Update binding devicetree
Message-ID: <YyYTGcULoUN4Igon@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Asmaa Mnebhi <asmaa@nvidia.com>, robh@kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Khalil Blaiech <kblaiech@nvidia.com>
References: <20220908173544.32615-1-asmaa@nvidia.com>
 <20220908173544.32615-10-asmaa@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="MuqTtxpBgIJbh5WW"
Content-Disposition: inline
In-Reply-To: <20220908173544.32615-10-asmaa@nvidia.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--MuqTtxpBgIJbh5WW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 08, 2022 at 01:35:44PM -0400, Asmaa Mnebhi wrote:
> In the latest version of the i2c-mlxbf.c driver, the "Smbus block"
> resource was broken down to 3 separate resources "Smbus timer",
> "Smbus master" and "Smbus slave" to accommodate for BlueField-3
> SoC registers' changes.
>=20
> Reviewed-by: Khalil Blaiech <kblaiech@nvidia.com>
> Signed-off-by: Asmaa Mnebhi <asmaa@nvidia.com>

You didn't CC the DT list, so noone reviewed it until now.

Anyhow, patches 7-9 need fixed versions of patches 1+4, I think. Please
use proper "i2c: <driver>" prefix in $subject when you resend.


--MuqTtxpBgIJbh5WW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMmExgACgkQFA3kzBSg
KbYkxA/9HR8HhTg0FK5m2/Eod2uCUiJmW51APtW5r32LXirSqYw3DFvu2LNev2o8
xOGEGyN92SqGTCPV51OI6QBulDwIIvogEY1V3ENVD+dH4nWw6F93C5K9FC84bDFa
sKu/pFW/jiiVs4pcJLRyFGEU1HsQ6Qql2paXusXKO28BJ/KsjNiu6olbjp3t5LGs
3RCzae09mlP203taHJRotx2Aepy7YMen4izr9Aa+HrZ9aspHySwHZhrFFJ1ERS7F
UgKF6C5F7y1//OJ/yLVVptDHJKUacSZaNv1j6yxfd/zyKY5c26f/+xTdd5wd32TT
0nkGzQrL2ltpKUHHoc/H9GTtlYTbBcd682hy6dETUN0J6Z+72pY3eCoRxvAHZfP5
8xQ6SOMYakdQcOG7cawNmm5SR+elDX9VtihNsAx45tCr2otbNee52XOlZKc7/zoH
3Na90Jk5EU5J0OyQ+cqKNX7QiYXmXSEXWz8/v5LJDQxvo+99BoHETn6zwQKLXA0R
vb/fuPUVfPdVmMQkAWZ+JUgwNGC1sor1iNT32iEIZy/5g6Pcl6iUj77PsUBzNoxe
mjb3/0T9P7B9iNsk4NFF/e5ADBdFSZT90i7kUn8O0jetC1PFTdbr9aRzqxqNqhCn
wOFTrZT1j/sd/n6hFIgasS81G0i+JDPFSVXpGg63lySaFEQXZ9w=
=KwwH
-----END PGP SIGNATURE-----

--MuqTtxpBgIJbh5WW--
