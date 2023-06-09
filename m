Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DA51729E90
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Jun 2023 17:32:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240127AbjFIPcs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Jun 2023 11:32:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241492AbjFIPcr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Jun 2023 11:32:47 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3B0B2D7E;
        Fri,  9 Jun 2023 08:32:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7EFB565905;
        Fri,  9 Jun 2023 15:32:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4774CC433EF;
        Fri,  9 Jun 2023 15:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686324765;
        bh=dlYetFzyhLMyF3NusrcGZAmOlPnFI4UTBMPTOwwT0Jo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=q6sMLpBsvPBcyzARdQoeTv3j/scpWnGVpxzpF7M8N075McuHpF8SqL0avX7acboOk
         sTLk9SLd2KIgelmXfioJwSi6jQKY5BkC5iW9JGgNjLT4qp2FZVFa42OJ43grs1QTPy
         Iw6fnPfqtmYb5fnD7ezMpB+iqS8jJk9uEcyiz+L4YAHSZREIoE6n9jpvIknNWpL1ML
         OeW2Zl0+SrwDs741OXwStxiHgsAiaj9VyNzaJF2c+motjDd8r4luiar534amWvfGZe
         hV6PDALEj/LFj8VEyuny/5y90mdPKlVvVXgby/gF+FsobOZ/bZPLXZXUUPfaBt6s71
         u+9iLPsAoGMaA==
Date:   Fri, 9 Jun 2023 17:32:42 +0200
From:   "wsa@kernel.org" <wsa@kernel.org>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Robert Hancock <robert.hancock@calian.com>,
        "michal.simek@amd.com" <michal.simek@amd.com>,
        "shubhraj@xilinx.com" <shubhraj@xilinx.com>,
        "marex@denx.de" <marex@denx.de>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: xiic: Don't try to handle more interrupt events
 after error
Message-ID: <ZINGGmRLYEQ+NfkI@shikoro>
Mail-Followup-To: "wsa@kernel.org" <wsa@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Robert Hancock <robert.hancock@calian.com>,
        "michal.simek@amd.com" <michal.simek@amd.com>,
        "shubhraj@xilinx.com" <shubhraj@xilinx.com>,
        "marex@denx.de" <marex@denx.de>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20230606182558.1301413-1-robert.hancock@calian.com>
 <20230606192453.zjzz4kt76kus5hr5@intel.intel>
 <c763371c710c9952154496026610e2ff583c173a.camel@calian.com>
 <20230606212053.bwpoxyost4fkpati@intel.intel>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="D5hvdBwwauKsvaEG"
Content-Disposition: inline
In-Reply-To: <20230606212053.bwpoxyost4fkpati@intel.intel>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--D5hvdBwwauKsvaEG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> I think the patch is correct and I will ack it:
>=20
> Acked-by: Andi Shyti <andi.shyti@kernel.org>=20
>=20
> I think, though, that this needs a proper fix and testing, in
> order to cover all the possible combinations. The scenario you
> highlighted is indeed one, but not only, potential situation that
> could arise.
>=20
> Can I just ask you to write a bit more in the comment to=20
> highlight the possible failure?

I tend to apply it to for-current because it improves the situation.
Further improvements could be made incrementally? D'accord everyone?


--D5hvdBwwauKsvaEG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSDRhoACgkQFA3kzBSg
KbZoTg//Qjf6/YplAMgDIXOGtvX0j5ZvkMC8lZGeyLubFKKP1Zm08Dh0fFLdS8XW
OV+7j8ApDYQuWm1FHfdwncVBoq/Eo6UXcNhKxWmAU760DAmNeKzgoKFEGkqiKvcJ
d//Qaxvk4o1FlwFIyPQxfsQjPwrCduYjITZlcf8JejsXLA97jeKuydyGOmQIVcJM
24tg9759PONQiscAiNkzB9oo/0nu6FjLOQF4Nlo8Ob8JavO4WLCsDGrZWMJ5Mf5a
uN/ma2sjm8K4BzipWD1sfe+kStCtCM+kIQ/ozHmfXKq4phD3DD4PGt+99gJuRfML
4HMcVyYawsIIpqJgL11up0EMaQMFh3+1pNyOpdYtMKaEoYgzRecg5K/c9Q5FD1a1
AU8O2FM8QW9xxWZ8+s3nIlz8BVs1nycbeodjFw9g4/p0HfykqjpjsFlYlfb2ilK2
/psyP4gv9pjPvW4Sk0QLNrX+LrQqmVnxojT5XvasHS1MVgCQjLx9mJIvwmYpGzjW
l6PvlDBq1BwDtS1gEAMwHWpiJrz69MsTQ5dmH1FqmZPG1BQq9d6Q+UWLqrq2CP/Q
Y+xEGQpJ7amnIp755CQSuytNBt8bYLHMBYUdbvWUGGspmYcH2MDXTKkYRFYEyRqo
Mo+XFKf66usxPdn+6Sv3wmPDvNTM/V93su8ip4oD/1oZujJyHg8=
=dlC7
-----END PGP SIGNATURE-----

--D5hvdBwwauKsvaEG--
