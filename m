Return-Path: <linux-i2c+bounces-2122-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0165C86F4E5
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Mar 2024 13:50:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8DFAAB21C6F
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Mar 2024 12:50:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33462BA56;
	Sun,  3 Mar 2024 12:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WtOIA8hQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C75BA28
	for <linux-i2c@vger.kernel.org>; Sun,  3 Mar 2024 12:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709470199; cv=none; b=FJAUu54MsXBG6Co5Ksw/LD2yAEFQuMc1DV4KiJqVGpU8doisPVBSFtBJsjBgX2wHcaiaFmUKApssJLo7kL1OsX37nMjwvPmCjKFFH7jXlCZWaf3K60YyODJq4E7NpngZZZLW9vVj24/vIp2uygwOxlr/f5ZMpeBuTm8KudCO7tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709470199; c=relaxed/simple;
	bh=5xQh+jRHgD8O9nvWUFO2fEQVFVkSy9anofndFYyV4aw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uaFqE871/8Ga74qPppnCWH/9q3zjRzU2kFEI5iFY8VgB3ZQwYmipZUD8SpqMvDDoNRJs+7joi/Z6NfnexVPBpC/FbwOBtiwYCLT6VBW7Hqn8Mm/iXVJ5SI2QACABHBCuHQv9AKyvbwHWx3yZpQXuC2D7dFH77U8YD+xCrp3zcxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WtOIA8hQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B88FCC433C7;
	Sun,  3 Mar 2024 12:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709470198;
	bh=5xQh+jRHgD8O9nvWUFO2fEQVFVkSy9anofndFYyV4aw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WtOIA8hQ1ilnaFOPKfqlaGZDecYZD6SYfNDxJZqd+pXA4mTvzH6p62LQr334teD4C
	 9L/8U63PNyM7uGkEa2XwZKO3hA8hIXo+BrwjhOKr0u3Elql0RoYUV+lXZ2E4q3gzyn
	 Eem1xHB7ka0WXsBadE41xscK2/i3aNfyevKInjdXlpmxBoLO1CC7G8iv08/MHNYOdX
	 zW+XhqZdhsZF1+Xo6IjY9TEURWmrrrQMY73gnrnhVwZZA1AkUYwDx9EqAYCjZGSSZO
	 rczkqhFEkuFKIxjHvgEzYOmmGtUy8zB6QFDq5NgJ3eD5vkhKFFwse/NJwaV3ec1/9g
	 k0ebowhm94epA==
Date: Sun, 3 Mar 2024 13:49:53 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Jean Delvare <jdelvare@suse.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH RFC 1/2] i2c: smbus: Prepare i2c_register_spd for usage
 on muxed segments
Message-ID: <ZeRx8aDFST_OKIgy@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <eac54582-44f6-4101-93d9-012eb4ee3241@gmail.com>
 <db378364-018e-4e6b-8e41-8cdd21ce2afd@gmail.com>
 <ZdxoVALRR8rz23Z5@shikoro>
 <b06a0a71-c30e-4288-b648-fba2c75a5131@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b7rZ7EAL4t59F8sk"
Content-Disposition: inline
In-Reply-To: <b06a0a71-c30e-4288-b648-fba2c75a5131@gmail.com>


--b7rZ7EAL4t59F8sk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> how many slots are populated. But we have a printout per populated slot
> already: "Successfully instantiated SPD at 0x%hx\n"
> So IMO we don't loose any relevant info.

Right. That makes me think we could even remove the dev_info() entirely.
But I leave this up to you.

> Actually a developer has to add the config to i801's mux_dmi_table[].
> So yes, we should change the message to something like:
> "More than 8 memory slots on a single bus, contact i801 maintainer to
> add the missing mux configuration"

Sounds good!


--b7rZ7EAL4t59F8sk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXkce0ACgkQFA3kzBSg
KbZXwhAAiJks5EzUWrR0iEIkv71mYcCunB8JaX6ik2tTZXhnEvugeD0DFx9IpZ0v
DImdil7yIgL8kVNcTXxdXsMGMW1BBLi0dJJBdZ1hvyLqp++YLXRV6kBDodoQMgPU
/aauKEK8HSk8KqHgeuEw5XvpWcX53W5dM02YOKD5h3uDkSWLizxeO17PBfTXBePw
Glp9IQmPxLJa00bPLq72YRVl3cm5q1Im/e0OLHv6hMvSUYC77aw8GkmWn0Iq3Osi
kF7lGhge/h6szmF9slbrBitUOmyR9VeJ0EYoSyMWpRdLATtM2xSMibiVj0+jT068
ch7uyGfcAMdlCb5I59/QxcZPxA3M6NKTK+Dk0YPBY1dr+Vq6EtyjmgQiBtDf6HPO
7Vx8emlyHgY763OJHiXfq2bNKOQvJKshxD44Dg6Z3g8clFt1Vlqxm4nBBFe7Bvdn
IPV2vH24TxhZ2fEFsoUeTHXNRoxHXZ8/FyF2zaB1xP1TgMDGf95G3Cn4xzwPla+X
P/3AUwTaaZ7ZKQnC3ADAUu+GOCNFTw2Mf/Tb/ykl519yMp2aGC3bO1TbKXpg9w1h
WWBLv+fSbwZjoowP2O2bjB3ibygzEgmgx1++Iwzt0SzLsfZqhQGRczYSfIAIppUZ
a2BWhQdfMF5jZVqWrsFy1lgPITmJdzmwD9uL4xKSCqhntj+Upqg=
=C27F
-----END PGP SIGNATURE-----

--b7rZ7EAL4t59F8sk--

