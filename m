Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E80A24EBE54
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Mar 2022 12:05:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245166AbiC3KHV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 30 Mar 2022 06:07:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245179AbiC3KHU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 30 Mar 2022 06:07:20 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2444FECDB7
        for <linux-i2c@vger.kernel.org>; Wed, 30 Mar 2022 03:05:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AD74A61345
        for <linux-i2c@vger.kernel.org>; Wed, 30 Mar 2022 10:05:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83995C340F3;
        Wed, 30 Mar 2022 10:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648634732;
        bh=FeOiSZTtwl5vyAq2iJLxF2MceUMTbMyAMSpdY/W92hM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PtfS2nk30CaRXY1obBBf7PHt5OGaKtqBBG3JBGA1TyYM4DH5EKCWZ9mXR83pee5U/
         +I1q/LhGTYMKRNJJLiIfouW2QXOV/5psvJrIR3L/Ln5H1JgSHwoR+mDNuW3pAOsFvc
         0LWUZyxuYaqK7Af32Zp5nDqakTS4Pmi0NN/cZLoLShd7tBMw49+IG1DHvYzwV5FZp7
         e0ImIytiJ0qboNm9HbURXSI18vH6hZA9lhYSbDIc9yLIJVtFDLjhtaWADJoNC+c8J8
         yvQkOG/vGg7R6CMAYiScanQdLI6O3W864zlHmsXDGm+zBHkOezknXY5Jvnl8CdZYNK
         LBTUofLKVkmlA==
Date:   Wed, 30 Mar 2022 12:05:29 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Nathaniel Filardo <nwfilardo@gmail.com>, linux-i2c@vger.kernel.org
Subject: Re: i2ctransfer-like tool with stdin not argv?
Message-ID: <YkQradqwT//DsXJf@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Nathaniel Filardo <nwfilardo@gmail.com>, linux-i2c@vger.kernel.org
References: <CAKsvP2YgffxfZ64F_CLyVPQscmfJgnkD1mk1Nw1q4KhMvm=isQ@mail.gmail.com>
 <20220329131215.7bfa05a7@endymion.delvare>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="clQ+/87Vs/tc3XZU"
Content-Disposition: inline
In-Reply-To: <20220329131215.7bfa05a7@endymion.delvare>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--clQ+/87Vs/tc3XZU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi everyone,

adding the i2c-list to CC.

> > Do you know of an i2ctransfer-like tool that could run under something
> > like expect without needing to be re-exec'd for every transaction?
>=20
> I don't.
>=20
> > Would you accept a refactoring if i2ctransfer to add a mode like that?
> > :)
>=20
> You'd rather ask Wolfram (Cc'd), as i2ctransfer is his baby, not mine.

I think such a mode would make sense. I can't make any promise, of
course, I'd need to see some code first. Or at least a sketch how you'd
do it.

Happy hacking,

   Wolfram


--clQ+/87Vs/tc3XZU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJEK2UACgkQFA3kzBSg
KbbQRw/6A3cObZt8c7bmc8/AEzCRJUVdia8pKFd5yXKRZ4yXsifytFjFomYN+oLC
Fh3C2y1sA5XHUIS5Er50+GwFToUmu5wY7OR0tnN11DjrJghUyOI/ZDO7NPEV+ctH
+Gx5gQaZm1D2+T2EXqzoYdX71NoFfyo0NaaYYqR70GovQIc7KuHOW72b6LlQG1OB
F3XnjrbI+UjHc53CNrXGAjvj/z+2sRS/feyKwkv2ThnmSccQlzVRkng4JWtHF2nE
Tv9pTMIqN2brhSbJqj7Brq1MufJB5H3PP/D8FfEDUM6ZhCKSXRk6B0vewPgsjeAq
RuwFPgP3ZQVi/+HaAHoKNwGJO9hFfNXlyZOMRmj+4zq9M/lGrgsyQe5SwwI0o/lF
hQ+dITzc1Ai0grTrPY5sV/Gy08GxUTboKt9jMAkEViWCyl2Msgb4Xcu0HIt1F71G
nZsq5/2oWm2MsDsz9lJD4KQ1MF4m3dJO3Fzwsga5yl0uI1hqYaeEYKK8fPTmItop
C2HcjCs41rwcMp3qmqX1jF27t9mvTMhmrjb58BW5nZT4EoxKD17pwtqa+D0kxZ/7
LC1a9tlpd6/XpZoj1lIyKPDKFeaVyWvwhhnzVIUYm21gAACqJkOi6AWjz9mYIn7U
BPNH8RJDJjqgTBeqM83Wm5iWwM6ODsqbWlR1OZn5lSQG3CFT17c=
=PCUS
-----END PGP SIGNATURE-----

--clQ+/87Vs/tc3XZU--
