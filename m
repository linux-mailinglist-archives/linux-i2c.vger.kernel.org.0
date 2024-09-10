Return-Path: <linux-i2c+bounces-6457-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 40AD8972AF3
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 09:38:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73BC51C23FD1
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 07:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E55617E010;
	Tue, 10 Sep 2024 07:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="LBhmRUZl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E69917DFF1
	for <linux-i2c@vger.kernel.org>; Tue, 10 Sep 2024 07:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725953891; cv=none; b=C8nq4lg7rgUA7SKwUrDLvziHPYyTfDhDxEnaVJRi+9a0CbGxRMgK4ikdUfy+2Yu4JTfQDLTDrWNrHjyIXR1EKRD585qMXmbDUrIuqjrGuu4PUYdf6Q5YcW7r9ZxcgwjJPQj4G8F8eLXnBfrTPqY3ckuKVQV/2boDJcpUhy9BnpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725953891; c=relaxed/simple;
	bh=A01gXMPmdOVHjgOXLq8x6wngKiGp/+yBjNa3PTQtGUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EbgjYTGR3KjOwbPVgmZKM4p+ebGueC7bF+HHl+5mH2PgBon2vDIyWwpar+GDqX9Xnm53A2xHzdUiqAGGV/mV4Krpqobfz68p0LrDXBXp2cIcFH0xAOrcIy1SA5azdGAVUEIKRHEZS74MD1AbiVR86Lp+bRVJiQtRCrNFhBvoHBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=LBhmRUZl; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=iXV3
	ojKVxtT97rHN1pIqykrcVcOxIMIMkSB7vjJvKwA=; b=LBhmRUZlsvNQ/pa6Fpdz
	0TAqt0xsp2NEiEvRtx6BsugP0+Vk+LjbkL/ECMo05FlNseAM8EZahcniLj63WtnS
	VrsVUeTJ1XAVeLJohuhs7ul/8iGGroG0TFm6cmp5KIOK8uhq5TcuQrFUIiFGgltP
	C6DD7ILzxfjugO2mhgXfkXvxSVihIV8jvhkk9ng+jBoYGBli8+q5LLTecD1XDuYy
	RN9PN1W10UtIyDka106d06VicjnYCsU6+qngnzP64a+n5quwTC5/v76WimdL/Yu8
	UL4R4zTohs0KXs3CRYphXQw0X/si2LSMyuRX7x7bnUtIhiKjT+x/B01d0m4uRjSJ
	Ig==
Received: (qmail 143903 invoked from network); 10 Sep 2024 09:38:03 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Sep 2024 09:38:03 +0200
X-UD-Smtp-Session: l3s3148p1@hfwY9L4hmyptKPK+
Date: Tue, 10 Sep 2024 09:38:02 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Rob Herring <robh@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree-spec@vger.kernel.org
Subject: Re: [PATCH dt-schema] schemas: i2c: add optional GPIO binding for
 SMBALERT# line
Message-ID: <Zt_3WtlRP_5wt4PN@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rob Herring <robh@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree-spec@vger.kernel.org
References: <20240909105835.28531-1-wsa+renesas@sang-engineering.com>
 <CAL_JsqLui9=K_LdAoEAibxRo30_2ahdGXhCW50ow8rcqCp6jZA@mail.gmail.com>
 <CAMuHMdWGtuAuQ3M3HonY8zfODTTz_izV6g9555iwuPLSY+P9_g@mail.gmail.com>
 <CAL_Jsq+cFb56e5WvipL1nR-0TDz+v6vnFDvz9F9JbXinxkEt1Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QyTWA7hLlIfVNX8Y"
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+cFb56e5WvipL1nR-0TDz+v6vnFDvz9F9JbXinxkEt1Q@mail.gmail.com>


--QyTWA7hLlIfVNX8Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rob,

thanks for your review!

> I believe "gpios" is what was originally supported, but now it is
> preferred if GPIOs are used as interrupts then we use interrupts in
> DT.

I had this originally in my RFC[1]. I got convinced by Geert's arguments
because the DT snippet in the board DTS looked kinda ugly. The board
needs to override the DTSI of the SoC to replace "interrupts" with
"interrupts-extended":

===

 &i2c3	{
 	pinctrl-0 = <&i2c3_pins>;
 	pinctrl-names = "i2c-pwr";
+
+	/delete-property/ interrupts;
+	interrupts-extended = <&gic GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>, <&gpio1 26 IRQ_TYPE_EDGE_FALLING>;
+	interrupt-names = "main", "smbus_alert";
+
+	smbus;
 };

===

It works, though.

All the best,

   Wolfram

[1] http://patchwork.ozlabs.org/project/linux-i2c/patch/20240826150840.25497-5-wsa+renesas@sang-engineering.com/


--QyTWA7hLlIfVNX8Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmbf91YACgkQFA3kzBSg
KbYMIBAAhfr2PCCicOUH5J2Alx4C3Slvz8g8jWcV+Wc2oUkpNFQ9dBb4XaGryGDB
yaKyncFlXp52Nuap8WuClCg6PkxGDQ2m7QDEHPt3adt23WHENaflorE8NCTyIgWN
NZyjeZcBKFGJSVHVF8GQ6OiKF5nN3r83osKZBi5zk/XorZlSFE1qz8VonyvZ5IAP
kImLBW0GnPzS8rRNLGmyjMO5rEicOszqBeObPqB6xwXYqw55hccIdmuM6epWZCS3
/oc9WiuMGd9JXDJfZaJ4CaRFfP0UjiGyFR+AKIcR+CBh6C8y9Njv+CyU921zUICs
UT6RaEalhpvaiJ0ibvXsps3c273t0VJW1cvhThiTwuDtZydlxJbL0et4zzOzyGSm
syh44+071JflBUBVQDZW645DfnKIxlpAcDfzhgpHSbx0eOq9ODe7wZkKYnR/ag4X
u5iN7nwQu45FpxOIWPIPytrp45ReYpuweXzVUQ286AQmB+Cjiy/k+MExzoZMX/RR
Zz9NYJ0huLzAUGEm4OVz7KHBZxTlt6t5vZ+EYTMPQnng9Vl5/9vmdVQP1DjUVOca
eXtaUNeao8pV54bpW0sVWwnr/yRabI5MxnCmzMaHOyBq2HKUH1vBGBdLhbK5TjsT
l3OnJgXjhpVyQUWGK4Urs6kpSvTqHo2gAml6zGizPN9lMclU1iM=
=JUVA
-----END PGP SIGNATURE-----

--QyTWA7hLlIfVNX8Y--

