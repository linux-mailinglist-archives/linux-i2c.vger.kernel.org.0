Return-Path: <linux-i2c+bounces-10036-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 221A1A71B26
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Mar 2025 16:55:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB9AF1741C7
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Mar 2025 15:54:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 853571F472E;
	Wed, 26 Mar 2025 15:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="h2mDSSnc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F90E1F4160
	for <linux-i2c@vger.kernel.org>; Wed, 26 Mar 2025 15:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743004463; cv=none; b=pHIZaQu+EfTsrMpJ9VpFxB565PSH+Od2LS7vMwV76SL/2XwuTpIUdSWvxVVkkWugVEBXdiJI0K1ibZckUc4Kw4W26a0kLcVPwZolPtzosXIJ0PWy/wkfLmq/uHsMugqqfFndeqFdu29YE4nW3o7ibsSlHcgQqdPhZ13bAomb8VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743004463; c=relaxed/simple;
	bh=FDUGpv8wkh/L+zMY5NUyNY08daDDaIIU0e+pvQ9oYY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=REHay4mc6qp98Ysj9biOnLOkm7ZRiKs3mnJp5E8ykph2q8QSo+CqAUB/dCeHAzzWnXP37OTmWA3B9Krjp6wcL+XZb2PBSoCahsL3nQcKe9dsyn196VQGQOj6fQB3QZQGYUmXHM4QjJByvqPI1Mfq5lCwIndITXUAry4SLDAfaL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=h2mDSSnc; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=zSLh
	6u4uG99qS3Ry66qHxhfF2ZHYx/p/tn5fAPvS/l8=; b=h2mDSSnclj1MbnFQxta1
	sCPwt85MjWu75wLtwX+zd4fkTII+ZZilK4FjkrDY//3Rlr2g5qRFl0/MBMz/jMng
	v5MAmMYS9INt2nMfSVrqzpoKXBiRZ+cXrdZxCDvdK6hK2dXIbTIm2kVgHXkyOtk0
	djQLFRZazRVKxP+BHqWUT0kqrE8DqdGJSubN1oNA1dtbNrAOkifdN+7+ghmb6sZq
	V2ST7/Axd5GaHmH+clfvXilpbiw5kGsh0KsA8nJvG5h4jp3PALiR4EiW/Y641ST/
	YHe3AfyuGnqW46PM/XYdXxm1Gyx6HzqTG2n732dQLYl/R0ewiURj8ugbybhqtYbb
	og==
Received: (qmail 3662529 invoked from network); 26 Mar 2025 16:54:10 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Mar 2025 16:54:10 +0100
X-UD-Smtp-Session: l3s3148p1@rV0S2UAxBNIujnsv
Date: Wed, 26 Mar 2025 16:54:09 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: syzbot <syzbot+c38e5e60d0041a99dbf5@syzkaller.appspotmail.com>,
	gregkh@linuxfoundation.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH v2] media: dvb: usb: Fix WARNING in
 dib0700_i2c_xfer/usb_submit_urb
Message-ID: <Z-QjIRoOWpoWaL6l@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	syzbot <syzbot+c38e5e60d0041a99dbf5@syzkaller.appspotmail.com>,
	gregkh@linuxfoundation.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
References: <6bb3b80b-a808-4992-8666-535ed9a5c980@rowland.harvard.edu>
 <67e2fed5.050a0220.a7ebc.0053.GAE@google.com>
 <29db5fdc-13c9-45f0-9183-c80d637725c6@rowland.harvard.edu>
 <Z-MKiV0Ei5lmWik6@shikoro>
 <d0fd60d7-5660-42ed-b1c7-4dfd6b8e74b0@rowland.harvard.edu>
 <Z-MrfICsY06DZV-2@shikoro>
 <f8e975a0-87d2-4f83-b580-6858050a252d@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6+vuiCGawqSgBAHG"
Content-Disposition: inline
In-Reply-To: <f8e975a0-87d2-4f83-b580-6858050a252d@rowland.harvard.edu>


--6+vuiCGawqSgBAHG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 26, 2025 at 11:28:19AM -0400, Alan Stern wrote:
> The syzbot fuzzer reported a WARNING related to the dib0700 dvb-usb
> driver:
>=20
> usb 1-1: BOGUS control dir, pipe 80000f80 doesn't match bRequestType c0
> WARNING: CPU: 1 PID: 5901 at drivers/usb/core/urb.c:413 usb_submit_urb+0x=
11d9/0x18c0 drivers/usb/core/urb.c:411
> ...
> Call Trace:
>  <TASK>
>  usb_start_wait_urb+0x113/0x520 drivers/usb/core/message.c:59
>  usb_internal_control_msg drivers/usb/core/message.c:103 [inline]
>  usb_control_msg+0x2b1/0x4c0 drivers/usb/core/message.c:154
>  dib0700_ctrl_rd drivers/media/usb/dvb-usb/dib0700_core.c:95 [inline]
>  dib0700_i2c_xfer_legacy drivers/media/usb/dvb-usb/dib0700_core.c:315 [in=
line]
>  dib0700_i2c_xfer+0xc53/0x1060 drivers/media/usb/dvb-usb/dib0700_core.c:3=
61
>  __i2c_transfer+0x866/0x2220
>  i2c_transfer+0x271/0x3b0 drivers/i2c/i2c-core-base.c:2315
>  i2cdev_ioctl_rdwr+0x452/0x710 drivers/i2c/i2c-dev.c:306
>  i2cdev_ioctl+0x759/0x9f0 drivers/i2c/i2c-dev.c:467
>  vfs_ioctl fs/ioctl.c:51 [inline]
>=20
> Evidently the fuzzer submitted an I2C transfer containing a length-0
> read message.  The dib0700 driver translated this more or less
> literally into a length-0 USB read request.  But the USB protocol does
> not allow reads to have length 0; all length-0 transfers are
> considered to be writes.  Hence the WARNING above.
>=20
> Fix the problem by adding the I2C_AQ_NO_ZERO_LEN_READ adapter quirk
> flag to all the USB I2C adapter devices managed by dvb-usb-i2c.c,
> following Wolfram Sang's suggestion.  This tells the I2C core not to
> allow length-0 read messages.
>=20
> Reported-by: syzbot+c38e5e60d0041a99dbf5@syzkaller.appspotmail.com
> Tested-by: syzbot+c38e5e60d0041a99dbf5@syzkaller.appspotmail.com
> Suggested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> Link: https://lore.kernel.org/linux-usb/67e1a1f5.050a0220.a7ebc.0029.GAE@=
google.com/

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for taking care of it!


--6+vuiCGawqSgBAHG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfkIx4ACgkQFA3kzBSg
KbZQlA/9F/3h5gABvKbiy6ojaD5HfokFTVzFJ/YjhFlvQTXoyoZRIH4BxNRWH2v7
nVafhaGZ9ynojOtXwxASFODJLRgaEQmB3+8Bot9brgaV0ei9TY8mVknRK3mCby/I
a7YtMM5QsLtlrr3NB6jegE5qKhCKRtLOArYseRGh+fnpb2FkL8rnnZt/p9IsiiVe
8zVDnBBpc7BjrRuD7bg9zANX53YTlLjVQ2VhxzMyyvxIkUBneMWxxoqgFOSG9OEz
VlrioknZ6zxjBHBzlzliQylbRUWPBq6Cn4Rt20ST/VaMWg8tPPP/CLKDIvGeq0be
R3YU67eSLmuj56uk8OVmnJcf1To4LCyeT3yvvsrVhNu72olMYwxP+tRabhxVphwL
6eWL1jdJt1BbfSdNXCiKiP6l3hD0bKz04N3tj+bIyLHRiUxd474+H4Vgzzped/j1
4734hpxf5QWsz35CVGAMXGZl7sr39lhB3cU2RZQsigUferCMwz4pD78u19TbkFpz
Vx/EPpxLSpCHBE/UimG2hEpr5/R8e23D44Bu6diZpeFoRVa75MO9fi78RAUqk5we
cduCy7Ciuhagp+a0Im+OkxoVuk/7u/3/dMUgr9Kh2yRKKhuuD8Tljss32sHBJpDb
QpLjPlpdqKoGSts9dr/K8HRm5PBX62WA668VkkUnZLjSutYjW0I=
=Qco2
-----END PGP SIGNATURE-----

--6+vuiCGawqSgBAHG--

