Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C5B0614B05
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Nov 2022 13:45:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229534AbiKAMpQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Nov 2022 08:45:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbiKAMpP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Nov 2022 08:45:15 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 435CB1AF1C;
        Tue,  1 Nov 2022 05:45:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id F39D5B81C9C;
        Tue,  1 Nov 2022 12:45:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14D0DC433D6;
        Tue,  1 Nov 2022 12:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667306712;
        bh=44cQ93c6tk7IF1CBO+5gDPy5bTD1a+eBcb6QrsNdutM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gpyeBIQo2ErA2v7MzdGXIVTZv2uYGXonifv4KEkySlNyGSxu9JMHz+03YNkMydgpb
         8nVpUnPB11YnlC0I5CckHciGcEIb4GGdE/S/If5nachg7WD2vrp0a2PdZB1VIcfBKm
         hHW4fhnyk9WVuIBTlxIwhpPnlxeJplc3B3MzdAIcvEtmPC738Y+8pCTHeP7xCKKlQC
         toSJtTL8FPw+eRtxQR1BC+8/i4TMFeAslfx6yEJaAcusVjQvphy0yxFtIRs8hkOAsB
         +pp2n0nGn4eFrGr4KqUGADNOVdIj1T4wA13k/V2TwJq8TFVd5nG7Po4gX8jpOErf3g
         O5PoNHSqZ53dg==
Date:   Tue, 1 Nov 2022 13:45:09 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc:     linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: npcm7xx: Group bank 0/1 registers together for
 readability
Message-ID: <Y2EU1SbtBwoF24yc@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        linux-kernel@vger.kernel.org
References: <20221008125924.1220203-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Yyo+CywAAMaOGClx"
Content-Disposition: inline
In-Reply-To: <20221008125924.1220203-1-j.neuschaefer@gmx.net>
X-Spam-Status: No, score=-8.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Yyo+CywAAMaOGClx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 08, 2022 at 02:59:23PM +0200, Jonathan Neusch=C3=A4fer wrote:
> The unlabelled registers NPCM_I2CCTL4 to NPCM_I2CSCLHT overlap with the
> bank 1 registers below, and they are accessed after selecting bank 0, so
> they clearly belong to bank 0.
>=20
> Move them together with the other bank 0 registers, and move the
> unrelated definition of npcm_i2caddr down to keep the banked registers
> in one piece.
>=20
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

Applied to for-next, thanks!


--Yyo+CywAAMaOGClx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNhFNUACgkQFA3kzBSg
KbZ7vA/+NMNAb3/LudrY1sd1RO0JeFXNUeakp4Tw8wnp2nMdolmbLvmMo4qNdaBj
2JJwTsjlqw8zhBD+/tXbU/5F8UInX8EF7PYIBAM44DYpH/ZeX0SFvjb3/xYYK4+F
Ooxh4NxjXb40VXeD/8a63FxVVi2EUV8c5nBLAhn40EvIOfoXI+SPL6lHZfY2AJk5
J1ADPm3kvo11JkP1fNazOOUMD61/HzZ7pSRXSZfpLAF+WT2+btRaL1I9aIB+WQiO
NUsif/nkrqHHm4uYLYAVDS56fzg/KfdScoEEiPWXAB0dciIL4B3fN9cGwMmRAS0w
PjzMgYYViZajSzBxcXWzXNbB5+tqVB1NbZCDrzs91nAtaC0kYUc2NByRoAC+iRrv
uI8fAdNcuy8EmBRG1wP+e/KQUbewNU8Hh5eNkllBakBUfrT3yNl9keUE5Gn63N4B
hUwWou06sckVlueXk3+FMIlVE5PNlmxrEm58RNkx2+K+KvXHgqpbBiHHPnGuB0/B
FN8Oio6vYvzepKMs2YfuSo0AvJ+IlEBPFAVhfu7JmnJ6q8QbyNKGa1ZkAhV20RUn
+bUFSUcy9l+TyYvvWMtg92g8lWDzNr27WA9dU/X0Bw+1rHWL8sNUEv468ThDqH2f
mkF+x3WbjqZe2k/UBahpxEfZWUom5pKlvQiWaxDCg+NwRSwf7Bk=
=F1sB
-----END PGP SIGNATURE-----

--Yyo+CywAAMaOGClx--
