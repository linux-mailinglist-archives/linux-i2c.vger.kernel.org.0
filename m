Return-Path: <linux-i2c+bounces-5433-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F2832953A4F
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 20:43:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A567D1F2505B
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 18:43:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E3B29476;
	Thu, 15 Aug 2024 18:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Zm/rKg88"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C88C5B69E
	for <linux-i2c@vger.kernel.org>; Thu, 15 Aug 2024 18:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723747383; cv=none; b=FbzbHEN/rI4GPZ5pmmklKPAO9dXyXKbI5Z4Tlj6oBNx3KJhjNCIb6yn8xLBjJcPcTArhEZg0jtrSopsPQqkoJxtGHXMFBqo6K7RMR8kMyZgOCm6hqRVBjPDK6Cs2A0LTkO/PzVNjjwIuPW7gYZoHj3NjqGw0ptRieaQEyyx626M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723747383; c=relaxed/simple;
	bh=jlqrXpGS7045UvhOkOfAA48RpG3MMb4ZcjxSm0yZ/E0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QbgRtSZ5cha4/jCcVdgYteHhWmDAGISDW9z3pvS7ITNjAtXhhFdzTA8I/ep7/139gYLlFnYQjeSO+jq942+HRgQ2bN1HpnhuTBM7XZ284SZSYNwii0grJCOfueFNXvKkwqjsEhultqwCLvyXWUsmOW5W8f9Bt0L8itYYHcUinmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Zm/rKg88; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=fqan
	2kodwJblWR0mVVlVZKRs9Tz4t8XOgM7iL+e0kcU=; b=Zm/rKg88w7EYDWdlFDZE
	8BlDh7fsQAgXJhZ9WCYt7P20Dz6qKpibLBUNEkkELk0o80+K7l8ywDpSm5yo6S3Y
	6VK5/+fc+StXMgJUjyE5kGjONKZF5SeOLaWSMEQSMn6re6+TyAfL7jhW+2fICGmn
	fHF7lUmdSdtmQ3QxzQz1lNhYVdkkMkbcueh7ymPK5yye2MM/3W1HSvcbsznkt7rE
	aXeERcCTe5rSvrN6mHnq0tsG7/WqmKkku6o0YeAEhyPggdBx61Wm+DT+TvK36Yly
	WlaHLY8DjGchraEloiTSVoZtP/7OoTv1LR6wWFHbTYg+3zzfeSd5hti9P7Aq3oJc
	lw==
Received: (qmail 2371965 invoked from network); 15 Aug 2024 20:42:58 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Aug 2024 20:42:58 +0200
X-UD-Smtp-Session: l3s3148p1@DYMvNr0fpMdehhrc
Date: Thu, 15 Aug 2024 20:42:58 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Rob Herring <robh@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree-spec@vger.kernel.org
Subject: Re: [PATCH dt-schema 3/3] schemas: i2c: add generic interrupt name
 for I2C controllers
Message-ID: <Zr5MMrRAw8VhIJri@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rob Herring <robh@kernel.org>, linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org, devicetree-spec@vger.kernel.org
References: <20240815120935.5871-1-wsa+renesas@sang-engineering.com>
 <20240815120935.5871-4-wsa+renesas@sang-engineering.com>
 <CAL_Jsq+FggVdyJBJ_jA=wfiK87qtwYh42+49Lu2p_mi=_+n74A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4AkUjHLlMlbZ3LI8"
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+FggVdyJBJ_jA=wfiK87qtwYh42+49Lu2p_mi=_+n74A@mail.gmail.com>


--4AkUjHLlMlbZ3LI8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rob,

thanks for the super-fast review!

> > "smbus_alert" is a generic interrupt name for controllers, so document
> > it. Introduce also "irq" for the primary interrupt.
>=20
> I wouldn't add "irq". It's kind of odd in that we have it for I2C
> devices in the first place and we don't try to do that anywhere else.

Yes, I am actually happy to remove "irq". I only added it for
consistency.

> > +  interrupt-names:
> > +    anyOf:
> > +      - {} # Any name is allowed.
> > +      - items:
> > +          enum:
> > +            - irq
> > +            - smbus_alert
>=20
> It doesn't really matter with the {}, but the 2nd entry is only true
> if interrupt-names only contains these 2 names. I'd use 'contains'
> rather than 'items' here.

So, just replace "items:" with "contains:", right? Should I also change
this for I2C targets and add this chunk to patch 2?

All the best,

   Wolfram


--4AkUjHLlMlbZ3LI8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAma+TDIACgkQFA3kzBSg
Kba5JA//TdfgprHtfh5UUQdgv79CEijte475hZ8Ajhd0arA8+zTS2vrHM0zmJSgM
y25+z5XwTeZ51GNvRg8dWoLQ14fG8BF02/Mq7TB8EjMdc9d6rL1gwLzBl0a0NmPt
JSRvjlJLRe/z9cY8LuFGJ5a6r6AVmlizNlH7c+zdop3uTw68rWGg9ngkW1hfPwRZ
X/P+Rn1rNuyHHhf+EUgaozEi7A6AKggYW7Z1mFHDgabrecps21xz8Rizaw2selT9
tNsB/lbzoO6cIhpH8Qbeq5GHdh3vvtNeYqYnYvHkvXVXrqnxVSPpw6Drc2pafQ9N
ZOgrbaQMf4f25OYOzjix04XXCnrVXf5kgE2S55Y2wZ0tzN483L2QNmuz7Zgu1ZpQ
GZ2Ll4VKLjXzhj75Up+/0gOaTrhwOuL/a3CAAJgIkkokL8uF3DZSSzk00g2mpTVE
mjMElrkfEmWEWkAcdRqF/FNOx2SA0fDuOz0T6sb9WxWMe3UeBtw+F6SWWNmVdo9F
EHhxHxJj+yq3XQauHW80YzK6eQ4pEJOBSdYPY0IqX5IiZArau+fnTXq4G5uSBQEO
DeJ1TzXAU2qgAkCGlafl0aLp04KsK9amJtLWT+9HHfOqFDqAEl8JGRi4TiuRzGa7
NiOBo6qjzEauZ7ec7kvWVJLVvLXtUvJ0oQlMNkCICJl2nvbaBGc=
=UY4B
-----END PGP SIGNATURE-----

--4AkUjHLlMlbZ3LI8--

