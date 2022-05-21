Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2EEA52F94C
	for <lists+linux-i2c@lfdr.de>; Sat, 21 May 2022 08:37:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239029AbiEUGhy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 May 2022 02:37:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240382AbiEUGhx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 21 May 2022 02:37:53 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B3D414D7BA
        for <linux-i2c@vger.kernel.org>; Fri, 20 May 2022 23:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=b/8cmJvy/iu2OHdWUSORz5VmfypP
        xaW88x4HhRb4+Ok=; b=Q+3Ogk2Ilm/pXatus2ylKZp/QCbmGP9/giTzDq3ArwgK
        opPzeNvu26H8Nzl1VlxAns4kdEsMJSpTyCQhpphEDlZcR5NeF7lYxQaGsStqa831
        x2dzbyaIrpfvrkEjA5rEhostJEOQKXH+4Pxj1AXNP56Fs7fNd6Lp0E1mXUEjCbg=
Received: (qmail 4065759 invoked from network); 21 May 2022 08:37:50 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 May 2022 08:37:50 +0200
X-UD-Smtp-Session: l3s3148p1@5yGH2H/fvLAgAwDtxwyXAGMY7IbT6g6m
Date:   Sat, 21 May 2022 08:37:50 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 2/2] i2c: rcar: refactor handling of first message
Message-ID: <YoiIvp4BpOnz9hnc@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
References: <20220520103325.81110-1-wsa+renesas@sang-engineering.com>
 <20220520103325.81110-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="XfLjR0s9Yu8DqnAH"
Content-Disposition: inline
In-Reply-To: <20220520103325.81110-3-wsa+renesas@sang-engineering.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--XfLjR0s9Yu8DqnAH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 20, 2022 at 12:33:25PM +0200, Wolfram Sang wrote:
> After moving ICMSR handling to interrupt handlers previously to fix a
> race condition, we can now also move ICMSR handling for the first
> message out of the function to prepare a message. By introducing a
> seperate function to initialize the first message, we can not only
> remove some code duplication but the remaining code is also easier to
> follow. The function to prepare a message is much simpler without ICMSR
> handling.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--XfLjR0s9Yu8DqnAH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKIiL0ACgkQFA3kzBSg
KbYECQ//YYG+y4KbZtqQyyhdLLxvzaBhH4J8CreyByMQU8Mb6frx2wajHIxuI3gI
+NT+jymeOJ9Z0nYSamDrPN4ENxIpQ8sjlCWIqE04uE10hqjh6JKSAbHDiWOL0rNd
BaoDQzjsdNH+reWbkyaU+i9HfWXMohmcMaBgXFZfLSmwBcn7vf94IlslddnC7ET/
Wbs7eVc9nwPLBx9s6ga71kh2vLJdzxD0gPCC7Cf437MxaeMknSOcikpKk/YyNTDd
R3jGB582Ry28l5I5VyQPXjwoWADoTXbA2ihT8N/UBcyK8gFE+aG7LiLkf0mkHxlF
yZshHNRtQ3RpuZveNQKTSJrd8isGkmYVdfpRXvn6jqlp4FeW3ylDsOgzpE8v+aW4
KbWTazMiednGTxVZppbysNiLK2dYnGUUnq8/t6eYjFIbhiSYt6ZSQgjyzvlyBgkw
45EXijnp2vGzDpMUgRl5NfXnxQ95tdGNOMmNPifbKgvPiE5odUFejFwYveu8QodB
A8PixV1g8mr1G3okfLe3TL5+nfel+oX9XDXusLVEO2OtsR7VyLBp5QXDMIPzJiGG
zDd8Oqs5gIbQS2+tXDRlIT2nSAoJZ3TDyDnkKbnRzxEKYyClryIPDfCVZ3w6W4hP
yU4jaCifFHbSj5unnpCXpWgBaRTbmmoQK8GKA2MNnD2qvlqYB8s=
=pSgh
-----END PGP SIGNATURE-----

--XfLjR0s9Yu8DqnAH--
