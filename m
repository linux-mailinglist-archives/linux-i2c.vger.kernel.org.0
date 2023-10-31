Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC94F7DC8B9
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Oct 2023 09:55:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235289AbjJaIzZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Oct 2023 04:55:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235313AbjJaIzX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 Oct 2023 04:55:23 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C393CC2
        for <linux-i2c@vger.kernel.org>; Tue, 31 Oct 2023 01:55:21 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD9C3C433C7;
        Tue, 31 Oct 2023 08:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698742521;
        bh=h5i707uObXlDx/XWdU+Fm64Pg+HInoPbONPBICcxFn4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qdi4GU6ak1QC9S4YEd9h67TFR/KcKYq8wayQaXFZ3MLkzj8HH0GQ0+T8FWL7IQx1M
         hohgkSSUnC/tiMq1S1npXMcwoCA4Fl98GBUJa/x2H4/K5Z4XJjwkOsqmVSml08Wzbw
         PTNW2rHIoOBv0+zqlyaW8/oE0+cMPD+36kokX3hvp5vgL8ImhpkuXgEFzakjWYWyf1
         1TQI2dtpngmhmLFrKckG6CoSb5+tqqendxmTMRvREq3v2w8EtdahKto0H7xe5kgP1n
         zv73Ap2yGhU51O8kST5tGCR+1fx1MRDdgstxfT7jUMF4MJTDExNYB3LB+STbMQgZM/
         1vBzBXM0dqzjg==
Date:   Tue, 31 Oct 2023 09:55:17 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c: Mark I2C_CLASS_DDC as deprecated and emit warning
 if adapters declare support for it
Message-ID: <ZUDA9f20IwtUzhrw@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <5c521229-18be-47dc-baa9-cabd78420cad@gmail.com>
 <ZTqj6BKcNYzEkZpp@shikoro>
 <704b82a3-4532-4aef-964e-75a9c700b5df@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="A+xbfsU4+mMUa3NK"
Content-Disposition: inline
In-Reply-To: <704b82a3-4532-4aef-964e-75a9c700b5df@gmail.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--A+xbfsU4+mMUa3NK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I reactivated my rudimentary Coccinelle skills and think I'll prepare
> a series that removes definition of I2C_CLASS_DDC and all its users.
> Means you can drop the patch introducing a depreciation warning.

Okay, cool!


--A+xbfsU4+mMUa3NK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmVAwPIACgkQFA3kzBSg
KbarnA/+NSyxpB+URXrFPsGwGtTQqJwmU1eL6l/NegJ++ClDRiHMsLnJvcEwGheL
cVVrk4NKjQzJ4suGk0/JQVHYMrOZPmg0CCjyMLii5irI/YkwYYcuVRLVE8yxjdFB
A1mOE9hFD7fZppVHiHRMu71q8nc3DgBjf+W5EgJOoJj+/pElP/ahYp5TpZz2SWfg
aNaIKduWU2rNPuLE3lUBQ1ktGqEzNKk9Fw/3Muc+Yg+bxRFf/OZkobSwwmgiqwAX
qGIos+H/bc3pnMoRXaa01gAifVYB5iSvsLFSMKfUmoTIm6jn3mauU9vY1wrsbzKI
ho+P9bXY5IHxC2MhZ/FYfc46YeFpfcOAuuE/pwimjKBkvwCx54dGUo+Ey5HSPMiL
8LO9o6625LMdxMpIhHGW43bcb+wORekshbct1EpOP2B+mLQrV5zKJ7jS0ZN2eUva
rK7mMzZdgRXV6KXdOPenMJ9T0blwWOx71Sic/4TL/NNr7ClkQvpB09pvGvjTs/PX
blEdE9nQWB9qHYdWb0WWtIzd2d1uf3SfJMj+eo2vCPx6OOOJV3+Ifs44GRt+RGhT
cz4q/k33Uy7Mm939FGp9siyj81b+WOz82DKy8XaMoYceis303cTExwlixJHwRfyh
5MwaF97Ip1Ji+e9QZ394Ha4Fym+2Sg2uDShX8xJ6xeatSEueqIE=
=4tMU
-----END PGP SIGNATURE-----

--A+xbfsU4+mMUa3NK--
