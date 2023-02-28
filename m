Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A75426A572D
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Feb 2023 11:53:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231379AbjB1KxM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Feb 2023 05:53:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231389AbjB1Kwq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Feb 2023 05:52:46 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E7DE2ED55;
        Tue, 28 Feb 2023 02:51:18 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5D75861047;
        Tue, 28 Feb 2023 10:50:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E988C4339B;
        Tue, 28 Feb 2023 10:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677581411;
        bh=NZZgpnsY0UlgFo1E00gIN59RX1dFiqsBuwFlHaiymVY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=H+GAIQqpKcyTTct85KSHswPk/2EuH6Uvj76pC6dlBjFGerkhzqebaujrb8V80EsW8
         2QH8/XhqbptV7OaxRdibt7uoTRdmU1PagAxAI8NadpKsOyw+VcXmZQV5jxvOduc/nI
         8Du/8DXCUWjBJyjcOiihH2+wbBybJ+rG8oQEeaLADTzzXhb0z/t0/c9igrzNxmRzgC
         NrEyzueAMahZmkVAZbgdarJcSseEiEwkAEg5bp8XSPC5XDAKDy77YRSIM+XckJ3sZO
         7XCXhSBmEB/2lNolY52xCQIa1u1YHJy2Q53TieMgdmYyDPBC5dlkC+YbkC1rY5u9jn
         7F/gFhY9ousOQ==
Date:   Tue, 28 Feb 2023 11:50:08 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Paul Menzel <pmenzel@molgen.mpg.de>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>, Dell.Client.Kernel@dell.com,
        Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Subject: Re: Accelerometer lis3lv02d is present on SMBus but its address is
 unknown, skipping registration
Message-ID: <Y/3cYL0s1Ul9fgR+@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Paul Menzel <pmenzel@molgen.mpg.de>,
        Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>, Dell.Client.Kernel@dell.com,
        Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
References: <97708c11-ac85-fb62-2c8e-d37739ca826f@molgen.mpg.de>
 <Y/0EIRsycj8EWjrz@ninjato>
 <47ed190e-ebae-fdc6-f46a-f42a36fb6f26@molgen.mpg.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ChaSonXIBMCtBEjJ"
Content-Disposition: inline
In-Reply-To: <47ed190e-ebae-fdc6-f46a-f42a36fb6f26@molgen.mpg.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ChaSonXIBMCtBEjJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Paul,

> So, 29 shows up in the dump. Let=E2=80=99s see if I am going to find the =
time to
> build a Linux kernel. (I couldn=E2=80=99t find a module parameter to forc=
e loading
> at a specific address.)

We do this via sysfs:

# echo lis3lv02d 0x29 > /sys/bus/i2c/devices/i2c-6/new_device

(Depending on your system, you might need to ensure the lis3 driver is
loaded before)

Hope it works!

   Wolfram


--ChaSonXIBMCtBEjJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmP93GAACgkQFA3kzBSg
KbbpeQ//R5UgTX6loyzP5QC9MMZ6cTnyvFvcBkVt4UHFnCS6dC5MJ0N5R0ITbvTw
AmsOcGqlmfAHjOoFT25nOXBAwHCpWTIUoOp0IDx3IyCct45TfAljoL0I5m+CdjFi
w+wsemFwaHyJQbKu/aDfJUXw/7x9BcP3vDJQoaE09N7TyWNYH666Sg3fj+bT2ixI
1AyNSUdoRNRSiwk3zaJsPyK2cLJVfB4q+YBFH7Yq+vT+hpPI9yFZiHZwqOHXcTQ1
0nZKbNuuIhVCgUlgVFfar6kyqeOWB42+tcnEwG21oPpCwEmgUM5v+xxqaAKaIVQQ
17s5jtUGud6fiZIsUfKUbcH4w3WtQe00dDv4HgE9wStsFJbSUpeJpOclOz0jSprZ
DkF1Rji+IBIsWCtMEYfG+/cgreHGOAMGugpCOkrpypRm7CB67FgNLOW+lO4pLPxq
n92VD6EuahrnY5tOqWOTLdLkWz3AsheZyDbcniiDOu/thz1FJYbsW4ZooW+cADZO
prj02wGuGc3JDl3qwDAy/+7zT7ZdluOaJXcyMK50X7jL1807tsbCMOWxkliuDOdw
AXdpyAirawq9e9ExkP17/l4gV3oR7wECl1jENjrjxas1jr4sE9re0B6YGVTURBMD
5gPCuQRBsl1Xx0GaOLnHJCpFl5ZhHLwwU8TL7FRF4floDKhmiRQ=
=CdCI
-----END PGP SIGNATURE-----

--ChaSonXIBMCtBEjJ--
