Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEBD769B4E2
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Feb 2023 22:40:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbjBQVk5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Feb 2023 16:40:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbjBQVk4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Feb 2023 16:40:56 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD2C564B19
        for <linux-i2c@vger.kernel.org>; Fri, 17 Feb 2023 13:40:54 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 72E44B82B45
        for <linux-i2c@vger.kernel.org>; Fri, 17 Feb 2023 21:40:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C218C433EF;
        Fri, 17 Feb 2023 21:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676670052;
        bh=FTYZ5fJPr8ugt1A65tEYy/6I5jJHYocMfZzypP1humA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Lo/VNxmQTUCbHXZUDmUNu7oj06ZRcU2vx4JhIZdKoCZXHZT+gUZIBn2Z4WvQxKc14
         mFrGfpPzIwwius454Cx+zMyAcTmC143xaMHUSC+RHM0q49fN7bQIiMzYdioLLLRRHj
         +NVqDD6UnNOgySrskHrOgG1WZc/IB9vB8a2XQ49H923n5rB3f89Qh5MS4laKFJ3bpK
         oXQ1dFDeXaaPPBJ0gph5K19J1bP+7Fsfiv8IHqGDdUpySzhg2WMy2ZVXQXwt8guqAy
         IEbDTHu8gKaijYlsWbyo/JX1ODKSZOmVo+N341PnGJO05OJiJof5/k7wQf92q41P86
         m/LXA8RQkT3ow==
Date:   Fri, 17 Feb 2023 22:40:48 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v3 3/6] i2c: i801: Centralize configuring non-block
 commands in i801_simple_transaction
Message-ID: <Y+/0YFOoJzgjcqvU@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>
References: <20230216170830.206f0bb9@endymion.delvare>
 <20230216171212.77c74d39@endymion.delvare>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="rIP0iIdP9WHDQd6/"
Content-Disposition: inline
In-Reply-To: <20230216171212.77c74d39@endymion.delvare>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--rIP0iIdP9WHDQd6/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 16, 2023 at 05:12:12PM +0100, Jean Delvare wrote:
> From: Heiner Kallweit <hkallweit1@gmail.com>
>=20
> Currently configuring command register settings is distributed over multi=
ple
> functions. At first centralize this for non-block commands in
> i801_simple_transaction().
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> Reviewed-by: Jean Delvare <jdelvare@suse.de>

Applied to for-next, thanks!


--rIP0iIdP9WHDQd6/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPv9GAACgkQFA3kzBSg
KbY1Ew/+JFHd+Ux99BNGprAg5QpjYyqR84d4gcfMpa3SiLyThbNciKfgJmJGEhCq
dbYv5fP66QoeFJten1nXas3wpC+QiG5OdPj540RcQ28K5kRiV4Xp6Dl3O2GGKojZ
49us69MQMS1tln0kLoeaJFKfQ5BML5yhQ3mZ0esoFO1cgMBqDz9dKV+gZrZfSzSh
CLF8YRorHCnNHu034M6OMKxlSgEZqnqiCnBs6SBy/KMR/O+kfp9xoJn+fsdyFJCy
vU7fdQe5FF6yexNLKHh/Pu6kBqXk/z3w+BsoeAP24AhXNVwUtxEpSvCI2KGvGhKB
3RAD6cfWitvDqdzhxoAMNUzOzT4u4MZfRQSxWtRxxV0VfKEvv3tcfHLdn5ZYX6Vc
58mAgPLhY1MNLHAwYrxH/uH7ceKrGa8hoCrCoRjTszOYuud9vHGo4FVQl3tk8jsV
/LQyOMrSWTy1XaxRnkQute1ZmplDLgVnVzGwHRrsGB7h96CvvbAYfXviZx/htMch
NJNr+wxuGSmHk70UdPAjWM5+HhtebuGQNiPrtGwSZnf9YMunToTWhdhsgq3tTEii
j3OTSbblgZTVQmhEwS4X/fnnlXsBXDUy7IGmkdkQFaXeHT/he47w9Lzt4kvlAkJw
slxv70ILsW9Ag1t6J1/z54MArjqSuiia8hBtVP46RYIJ/xS4hKU=
=CNXh
-----END PGP SIGNATURE-----

--rIP0iIdP9WHDQd6/--
