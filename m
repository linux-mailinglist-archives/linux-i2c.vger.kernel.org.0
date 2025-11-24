Return-Path: <linux-i2c+bounces-14249-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 501FCC82B89
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Nov 2025 23:44:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F0C94344520
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Nov 2025 22:44:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F379726F28F;
	Mon, 24 Nov 2025 22:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="LCIsgyNl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60C5262FD7;
	Mon, 24 Nov 2025 22:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764024129; cv=none; b=Syja86ax1Q59BOThLIEmEiIuLkx5kgls3N2PVB3metTGOZlt0poD50hYAzlSqh4tHYnAp0ltaGYDH9VJm4/oEg3hTEumdEczNcOmPRNAlDM0KbtkDHa9IGGmzQL+SSdLR24KMXkKMRQnSEx5feyztne5R1RcaGa9rqfLkqXB/s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764024129; c=relaxed/simple;
	bh=Tlu8bKMX4PDdWBJudcytF638pod2VynBFEzDv6N0ht8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AMbFV5ahzfopGcXNYXx1QsKXhlwLAe96rig8yaYXDDCgehQ4Z1VXh/UtvaNu49n/OV1cvvV4Um5A4Y+hY48icHRPaXne5Vc2iOXzEnukifaAibRIFxJl1mflzmYMpowQVcrmfMaHd/8/evk8qYuNVUUYis1ajKJoZ4vKhSnvPGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=LCIsgyNl; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=OS46cSn0GTzZaWhjt2U3d/tWjF+K4lRoasUle3E5iss=; t=1764024126;
	x=1764628926; b=LCIsgyNlI3dimsl5cWbbD+oTtYMlsz2Czy46ltdjL0jIhxxoO8GJCZWZdtDN5
	Ja+hCI3tVGJJ1AGRfhI2bNbqxNF7EIwtiqgoXlI6oQwFv1OczLEeuRgfAg2D42CMzbtDXE9iqf4aY
	/BYIVI8e9VwX/FLQZbX1SAZ9dxpg+CXfQeWtUkzCxHMcr+/bFzbtT7FHDK0UbDkfiHrbubpfRr4MG
	z1pw6dTSfypCT7hngPGNLW75wTEcOJCo2CqEdz75IGId3+JPbcIH+CDZOJA35KCrQDF+AHs4x0ujO
	vPRTGYZeJ1A9lg8CEq+GVGvMEbnhD859J0FJD+Ib1fagvf9GCQ==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.99)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1vNfFz-00000001Nvh-2Skf; Mon, 24 Nov 2025 23:42:03 +0100
Received: from dynamic-077-011-209-238.77.11.pool.telefonica.de ([77.11.209.238] helo=[192.168.178.50])
          by inpost2.zedat.fu-berlin.de (Exim 4.99)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1vNfFz-00000002gcC-1Xt1; Mon, 24 Nov 2025 23:42:03 +0100
Message-ID: <b6670aba21de847615cec7534bacce3826e657c9.camel@physik.fu-berlin.de>
Subject: Re: [PATCH] i2c: i2c-elektor: Allow building on SMP kernels
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Magnus Lindholm <linmag7@gmail.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 andi.shyti@kernel.org, 	wsa+renesas@sang-engineering.com
Date: Mon, 24 Nov 2025 23:42:02 +0100
In-Reply-To: <alpine.DEB.2.21.2511242045320.36486@angie.orcam.me.uk>
References: <20251122122846.28493-1-linmag7@gmail.com>
	 <c468dc2e6f5c4ea132f2bf25e6d6976e0c317005.camel@physik.fu-berlin.de>
	 <alpine.DEB.2.21.2511242045320.36486@angie.orcam.me.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

On Mon, 2025-11-24 at 20:49 +0000, Maciej W. Rozycki wrote:
> On Sat, 22 Nov 2025, John Paul Adrian Glaubitz wrote:
>=20
> > > there has since been some fixes/cleanup work to get rid of cli/sti an=
d
> >=20
> > s/has/have/
>=20
>  An ambiguity here comes from the mixture of plural and uncountable for=
=20
> "fixes" vs "... work".
>=20
> > > rely on spinlocks instead (as pointed out by Wolfram Sang). Tested th=
is
> >=20
> > The sentence just ends after "instead". I think you meant to say "inste=
ad,
> > let's allow building the driver on SMP kernels again." or something lik=
e
> > that.
>=20
>  FWIW I can see nothing wrong with the sentence, "... get rid of cli/sti=
=20
> and rely on spinlocks instead." seems like standard English usage to me.

Yes, I was probably misreading it. Either way, I think the v2 looks fine.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

