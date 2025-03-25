Return-Path: <linux-i2c+bounces-10020-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A38DA70AD8
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Mar 2025 20:57:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EDEE189C14B
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Mar 2025 19:57:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4819A1F1913;
	Tue, 25 Mar 2025 19:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Raf7wW+5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4274D1F17E8
	for <linux-i2c@vger.kernel.org>; Tue, 25 Mar 2025 19:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742932626; cv=none; b=SnQymg65WnTISLCDMmN+us7QUmaBauDI+Rr1dAs0ykG+vc/eBt1JjO03flUhKZ1nKen0i4JQKAyL8KJGxVcNEHjAfbs+C/SZjDpFLXp8oGm3C8T6cPS+QCL71pwXRkAeam5k63CHn1+1gvS76BPpeshfyeEGGPKjg3HuxvGeL7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742932626; c=relaxed/simple;
	bh=1tTP058U/RZniMjA5RRXdT5NvSnKY+Avf1zsfo+l6jI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VOVsDRDtjI5B+fArxVS3TlqdVkOWZ8oxrbCN84swYQ5ULTmLduTvuh1w04d+q1n4cBsIbDx8cfKf3UO4Z+F+7Qhw/srqMSNR2q0xpHtazQ/UGXMQIE1mToHN8tzuMQOjaC30pPKbHdE47wtHgQMC9X0Y5rwGEcIr0Hx8cKsz8Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Raf7wW+5; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=/TUv
	Rr1uqxFHiFGPh0oQrQytVTgLxTwwMQrPyS+qaE0=; b=Raf7wW+5del1qQO2rVTc
	dROrNiKXOUWQsLaulfKD+JXXLZ+7rABuEjnLDfC1O5u2TuOm1ZWUG0KpeDjJX3k9
	16fYmYUBsFe/6PUiSISgdtV342p1fBb7CB7kipEQFKyl7pMiKR4V0fdiLW6jz2ve
	FZrlTz0Kjb0oQ/A23rXRGIM1LphkxFOulgXmFPpEh03xX6DvkydwacIm7dZo4blk
	Inq0H6j669xnm4VuQQZnexdZdq+/fY2T38Hd+i/QIngTO1Azshy2ujxJ3N1jSH3v
	q5Ihj073a2+S8surf0YXSE7C/OG+owzEV0M8UtsaKsabM5owfZychASOs9BumqN0
	EQ==
Received: (qmail 3243685 invoked from network); 25 Mar 2025 20:56:59 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Mar 2025 20:56:59 +0100
X-UD-Smtp-Session: l3s3148p1@oNKhHzAxvNgujnsv
Date: Tue, 25 Mar 2025 20:56:57 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: syzbot <syzbot+c38e5e60d0041a99dbf5@syzkaller.appspotmail.com>,
	gregkh@linuxfoundation.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] media: dvb: usb: Fix WARNING in
 dib0700_i2c_xfer/usb_submit_urb
Message-ID: <Z-MKiV0Ei5lmWik6@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	syzbot <syzbot+c38e5e60d0041a99dbf5@syzkaller.appspotmail.com>,
	gregkh@linuxfoundation.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
References: <6bb3b80b-a808-4992-8666-535ed9a5c980@rowland.harvard.edu>
 <67e2fed5.050a0220.a7ebc.0053.GAE@google.com>
 <29db5fdc-13c9-45f0-9183-c80d637725c6@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PdB2PpB4ywylG8dJ"
Content-Disposition: inline
In-Reply-To: <29db5fdc-13c9-45f0-9183-c80d637725c6@rowland.harvard.edu>


--PdB2PpB4ywylG8dJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +	static const struct i2c_adapter_quirks i2c_usb_quirks = {
> +		.flags = I2C_AQ_NO_ZERO_LEN_READ,
> +	};

Why didn't you create the static struct outside of probe?


--PdB2PpB4ywylG8dJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfjCoUACgkQFA3kzBSg
KbZKnw//XPVwaFcMUSIF2UEN3ZMPxQsnn+Jnrn8t49B8jFJe7GPzeJL4Be0ZIgoD
5DXd78EyPvF0QG2yaO6tUVsKOfJQPL6OG6yvKak7HvFFwGaxB7J/XYm44zEnZ3o5
yjp4n5Mx56hFKjoVtzCMaHBR4Rg4q4315k+aWP8cVnIy3tGfJtsAzlB18+zLhKKw
ZcCWXE03dDSsKEspwbPWebyzd4jiDS6VClIAJJREtu1yhvo1EIPMNH38WIXUhpkf
x8K4lXwm2mngnBt3TJvRsAum8mjwjROlBq6iRcCFlUt6Z/Dqij/m6/dSKrLflQzf
RM7j63MOFWGkrraM0qrIPgeJCCB7XDoDJ6/PNGdZ1YH9mkqm/Gr5TuTh7qKAxv5p
L88pcP0zc5faYZN52OhDjwYkd4S31D7QDt26ZAomj7T7BM6ZsPu4c9K5dmYgOf7u
tiOsEVqnkA4g/QDd5ON7zdjVxM3v3sYBl3MQr7dCLZ6p2CNzmvR19KzohCkRLBsu
0K10HXVjn4vWcpvryKiOploFznU1U3Np8Yl+d3l9woyJBbmoFjaPwG/igEABhZAW
nzOFN66meh/sTXll5F1t4uqoSraoNbWFrsJ/WFUpibTLZeUMGZi7wmBIpzisCVv+
cxEbMqXtv5xIJm0Plse5mtB5CDpBTwQ9mvs7rLCnTNKSH29eqKc=
=wPxk
-----END PGP SIGNATURE-----

--PdB2PpB4ywylG8dJ--

