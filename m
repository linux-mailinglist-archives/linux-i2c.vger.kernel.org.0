Return-Path: <linux-i2c+bounces-1766-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B41C2856D58
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 20:08:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F6EB28C3BF
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 19:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3CF2139562;
	Thu, 15 Feb 2024 19:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eAgUsKBd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6D81386B3;
	Thu, 15 Feb 2024 19:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708024100; cv=none; b=feKN+e8dEcrLLc+6d6fixb8fNgEX/nQ9scTJzjtzgcDqm9+PgPbR9DFWzPMS9rKrQ9zk/PZeVpATd+ZJaVdbKgnMBYAKsVG4FuBetKa7P47zQZmJcjZc6Ut9vCKFhTE4gMGc9VgsXRb7LOIv3X8DFEulYVoj9yZqg6PCC0+p9zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708024100; c=relaxed/simple;
	bh=zGKMc4hmjCuHx26m6Wg4jWi3wX2vsJdIkSazXYmhNXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D2kmfT8scoynYPh4EbE+gbL71YfRBhlZRQSzXN+yfsm9ZSpvqVTP/jDEKcwjfOUcasFBzoDmIb6I2Y3UUfzdCE66pilF7qgqnG9p5YV87RuBESsIar683tc2AE/0GfodxGb20JpjYxAsZf8Y0GjA7PU1Cb2y9t/Pe/CRymDnX18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eAgUsKBd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F94FC433F1;
	Thu, 15 Feb 2024 19:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708024100;
	bh=zGKMc4hmjCuHx26m6Wg4jWi3wX2vsJdIkSazXYmhNXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eAgUsKBdLrG/AoBl4jxLGxfxS2UGF7JpxEAWtiGZ7rIbBu5BDxt1PhRZzQgrFu1hM
	 EdFc5TS5FpEw8Oy9zH6BK8FldwnGmhmh5bD4RE6iPJl4pkUKjWX8C6freZOTf/de09
	 mgXn72+4fpwnGEbmMJMD4CLqfdQkyqQ3Gc3N/tZf95EMegqglwwBQbvAJ31W3IpyHJ
	 zaPEtXXwtbmz1vrC5Fz7puqKFvltRHUSNR7NEYM5qwIXxkCctCXkP2yuIPY2yImcSA
	 +Rc42ZUiN40+byDmO2FZmzfsEeoOPjLDSIP1YScjj2uSA6p33mm4qsDeCZGgG8NGDV
	 36Up7YjWxEOVQ==
Date: Thu, 15 Feb 2024 20:08:16 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Cc: Jean Delvare <jdelvare@suse.de>, Hans de Goede <hdegoede@redhat.com>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Kai-Heng Feng <kai.heng.feng@canonical.com>,
	Marius Hoch <mail@mariushoch.de>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Dell.Client.Kernel@dell.com, Greg KH <gregkh@linuxfoundation.org>
Subject: Re: Ideas for a generic solution to support accelerometer lis3lv02d
 in Dell laptops/notebooks?
Message-ID: <Zc5hIPxzA0oVHoZc@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
	Jean Delvare <jdelvare@suse.de>,
	Hans de Goede <hdegoede@redhat.com>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Kai-Heng Feng <kai.heng.feng@canonical.com>,
	Marius Hoch <mail@mariushoch.de>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Dell.Client.Kernel@dell.com, Greg KH <gregkh@linuxfoundation.org>
References: <4820e280-9ca4-4d97-9d21-059626161bfc@molgen.mpg.de>
 <a1128471-bbff-4124-a7e5-44de4b1730b7@redhat.com>
 <20231223125350.xqggx3nyzyjjmnut@pali>
 <20240213150708.57148f6a@endymion.delvare>
 <20240215181633.2aevovw6wkxq5si2@pali>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b95QzZChQrFPri/W"
Content-Disposition: inline
In-Reply-To: <20240215181633.2aevovw6wkxq5si2@pali>


--b95QzZChQrFPri/W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Anyway, SMBus ARP is new thing to me, I have never heard about it or its
> usage before. Has anybody else found some device which supports it?
> Would be interesting to know if this is not just another standard which
> was not publicly deployed yet.

SMBus ARP was introduced with spec 2.0 in 2000. I personally have never
seen it used in the wild. I am biased because I am way more familiar
with embedded than, say, servers. But it tells something that we don't
have support for it in the Linux Kernel.


--b95QzZChQrFPri/W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXOYRwACgkQFA3kzBSg
Kbb3vQ//a/t4ssgGJ18uKXlILCbImPCutKb4rulq8S2RotVt1vzB5z78AtX6W1XU
ty2fjG5YUMW9HtLugHB3F4pKACbR8/TyapeB1HCyljupA5CR2c8gEUG5L0fxGCzf
RcvwILH+C/koeEQPnA8hmvafqIr0NcP1Bzh4Tk0kXoy6JT8Gk4eQWR/hKXuLimb1
k+ia/K9mMQZ1z/7aydtUSJq5oEYHN3n16R/4YRVNvBFMTZlmrYGqOln9oUvQWioM
+s/TZ3t4eefQDxRZbdSWvYZY4WJL6eY3hDdOSmWJayx2rmDiyD8kDiqZVRFTPUqC
2x3UMwbn5tXBl4E1OSl3ZrIFjPVLgVaQcqDclClnTv6jCv1tTPnfDhlWNTzEz+1k
dnqpym85j8twlSKPYl4yKwgBvgD+MUHm+dGXnpoDYSts4WVFMPTF8UAB/U3T16qR
C/V1hMlcGvP5Pi+AD4KCP3XYHyFJDiXx9bYmgnEIWecLzKX2NWO9ZQDhrTGl6Cvh
7UN5IZkUKFnPeUQeJFT7rOkqeO9LvM6RM+nUO5UX41khmF6/ZX3nyELh0tYWL/cU
egB/2+MP+QTLyPF72zP56fjgOQvojnMEYojOJx/dFTQ8WP6s5qBO2s3CqaPkdCHE
UbNNgLBFN6k8ABtuI4XXCBh61bWGovUIY4Z6bRGvQGHqvI5AowI=
=/rOg
-----END PGP SIGNATURE-----

--b95QzZChQrFPri/W--

