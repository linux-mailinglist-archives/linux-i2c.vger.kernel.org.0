Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7A84320509
	for <lists+linux-i2c@lfdr.de>; Sat, 20 Feb 2021 12:08:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229828AbhBTLIN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 20 Feb 2021 06:08:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:34056 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229603AbhBTLIL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 20 Feb 2021 06:08:11 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id EA7CD64D9A;
        Sat, 20 Feb 2021 11:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613819247;
        bh=TSDNZuEKSGoPrAhixmN5CuAFhUteHr/uzLbWwh9XhlY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=q9/H6PDb1pLIZDli/3+T7pcPPS6W6l/ulIG8lsWmDTD8bj3Miz2D2P0iC8aZSsAB6
         x6Xs030eSe//kTMH85pd/hfY5gtG+F1Zp04cDq3S1pQ8QFTFfEct24w54VoDAOlN3o
         qp6/ul03BrhlC89eQs+LpKDDH08G8QTgFx6NuottESGd8i4tnpqaboWk7Wadtz+iTg
         VBY1tvk0XIfpkso39TobsUvKvfrgkOeP5tIWTWArr0Kjs1BdBUE/7VaHXD15txB53t
         rSpInt6Z+erPcVFl3+jmVU8rvDbX4YTFHkVlpEB7b6wZQ2BkiQOcm6i9Vu+Z3E8gE8
         gcWsPYiWQ6qBw==
Date:   Sat, 20 Feb 2021 12:07:18 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     "Jonas Mark (BT-FIR/ENG1-Grb)" <Mark.Jonas@de.bosch.com>
Cc:     Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Support Opensource <Support.Opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
        "RUAN Tingquan (BT-FIR/ENG1-Zhu)" <Tingquan.Ruan@cn.bosch.com>,
        "Streidl Hubert (BT-FIR/ENG1-Grb)" <Hubert.Streidl@de.bosch.com>
Subject: Re: [PATCH v4] mfd: da9063: Support SMBus and I2C mode
Message-ID: <20210220110718.GA953@ninjato>
References: <20210208152758.13093-1-mark.jonas@de.bosch.com>
 <PR3PR10MB41422B90076115ACCE07D2A5808E9@PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM>
 <90bd35fa8c6f420fb1656c678c016509@de.bosch.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="AqsLC8rIMeq19msA"
Content-Disposition: inline
In-Reply-To: <90bd35fa8c6f420fb1656c678c016509@de.bosch.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Is the patch already on the way upstream?

Can't really speak for Lee here, but during the merge window patches are
usually not applied. So, in something like 2 weeks, usually collecting
for the next cycle begins. Looking at the CC list, I think you added all
the relevant people, so it seems all good.


--AqsLC8rIMeq19msA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAw7WIACgkQFA3kzBSg
KbYghA/+K7IULf1UGHDAaXLtv/FzzZryupsHDxfsS1PagPIw2cRW3EBywOE+/8g1
4d5dgR5x2a9S8W322jfVlP9OzofLeB2wu+3sIsdR2fUwW/eCaOk8f2VBE25Nvpa4
pVm9mcZBIbC6ByvOWCgKxDPh/FIbYq0RiBqiZZGyPOi9SoYO2T2Hn1GbOow/bP3p
9o4v4T6pvkSLJqF371HXVP7y7s2N+i+q/gdppK4jT2dzfDYoRqnIlKRPZ/dl2tgd
A03sHBf59Yj2yvHC7ns/KjsxA4vwOz0OwQGH3WpxkkQK/DUIrYYspsp0Zz+2u+qT
tFn7SJfmKA/OMor1L6oZXWsc87JAZChFriXjpSR9cTRstJZxjZgeVHZpkWs7slZY
nhvjfsEoFQajCmT4VwfZKn/UrlzIJ0qFr/3xNH7vco4pOhoqU0ptxwfIBwz662oR
spOYAQE9/KWBlBVLjeYzkEUn2eIxe5k5Y/Ov6G/56kf1QvHRLsmuqK4C8gKRzf5J
4LbxtCUXuyyX2s/ewsJ/XiEYsp23GXRf/8uqWdyvKcuBHZh8kroDLnZhtXDgrPxF
Dh9o0GorEzNwTow8xL3ZUUrRYrdyfng1wXxa/tJNuFS98bUE8AzODKx00PauWMjw
6YJxHcSTRcbDzWeIn+dKHbW2sBRv68WOlHhqJl7wn7VfrrQ9oXU=
=wAXN
-----END PGP SIGNATURE-----

--AqsLC8rIMeq19msA--
