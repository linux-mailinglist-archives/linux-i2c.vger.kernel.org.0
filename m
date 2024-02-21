Return-Path: <linux-i2c+bounces-1890-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2971785D804
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Feb 2024 13:39:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC3E41F2233C
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Feb 2024 12:39:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 315F569313;
	Wed, 21 Feb 2024 12:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mMqOkvwR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A496930D
	for <linux-i2c@vger.kernel.org>; Wed, 21 Feb 2024 12:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708519167; cv=none; b=YwsvvFbe/kiucm5K/9VLUSOZ0Sl8sc4XipJ6V+aVfZB8auIdGm3TDe5ThyToatN7AZPm2cmjSINRvZwmspjRYc3qopKmh3eRtqteLhdB/NxgvEK1POS+12pgebSkXQZ5t6JPQiH0d+hXq88NrHKWrGG/GxAnxDw45oWpGOpoA1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708519167; c=relaxed/simple;
	bh=I+IHEsOSnHDC5i018V9a1N9X/FhiCXbyKml4C0uf7n0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=irzw+O1BAtrvy97GIavtD+Lrk3pcpS6ib70kZuM/4RBqdC3P1Te/S+1uZSaKhhROsxrEcoBF1RechLVKUEYuD8K/YUKq5prJO+s3K5BS9EGlXC2HJ2aDhCrSC0sG9gjTNiIIKpQBljVxGOZe9rorf+pI3FzUL2hDhd9DPuK3WSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mMqOkvwR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 632A0C433C7;
	Wed, 21 Feb 2024 12:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708519166;
	bh=I+IHEsOSnHDC5i018V9a1N9X/FhiCXbyKml4C0uf7n0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mMqOkvwRMJwNARag8mSHd6VYa9VSyv20+ceVuL3eFyBtRaYMaAGUeTuei4xbRaKLr
	 5GYNREv0kuKlHA7dyWzU5R5K2XN6RuBta8RPWOnBK50rB8EkSmVI9g7C40gWnjKpdd
	 B5GdhIY0960/ER9lvuCV+VK1C5bveSQxlk22Ie6+MnCYR8I5iWaWo1aRB9iWNtZnhw
	 y/IUjAyUOI3HdYIny+p9KPrHu76RD5/DkuSA2I356nFs9YtSTjExvgA61879nsmfQO
	 QXi/jzrTC93pYAXWyvdwj2QS3K1oAn95JkdkXKVssIhyxhxvur7DB/zbov3pBvi/xp
	 nCLxYMK1c05rQ==
Date: Wed, 21 Feb 2024 13:39:23 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Hans Hu <hanshu-oc@zhaoxin.com>
Cc: andi.shyti@kernel.org, linux-i2c@vger.kernel.org, cobechen@zhaoxin.com
Subject: Re: [PATCH v7 5/6] i2c: wmt: add platform type VIAI2C_PLAT_WMT
Message-ID: <ZdXu-4HONHGl6cNc@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Hans Hu <hanshu-oc@zhaoxin.com>, andi.shyti@kernel.org,
	linux-i2c@vger.kernel.org, cobechen@zhaoxin.com
References: <cover.1704440251.git.hanshu-oc@zhaoxin.com>
 <37b0418dee4e92542f84eab927d5692884ac8d2b.1704440251.git.hanshu-oc@zhaoxin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TM6BztZ3dqztPj4t"
Content-Disposition: inline
In-Reply-To: <37b0418dee4e92542f84eab927d5692884ac8d2b.1704440251.git.hanshu-oc@zhaoxin.com>


--TM6BztZ3dqztPj4t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +enum {
> +	VIAI2C_PLAT_WMT = 1,
> +};

Minor, but why not starting at 0?

>  struct viai2c {
>  	struct i2c_adapter	adapter;
>  	struct completion	complete;
> @@ -62,11 +66,12 @@ struct viai2c {
>  	u16			cmd_status;
>  	ktime_t			t1;
>  	ktime_t			t2;
> +	int			platform;

unsigned int?


--TM6BztZ3dqztPj4t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXV7vsACgkQFA3kzBSg
KbZr7hAAqBJdRTy0lCRJvwmfgmFQhXwKkrzicvOYQmBDyFfSaQLwrVE5OHiKfEZb
8sqfXE0eRBI1MyONJWlHt8C2C2/m6ytUrSLWPszoSDKmMkrTl4DMcxgn4n7oJfXl
txrQbxjXe7wOzO5bpyKoC9PIyaQBbpEbjqwnDuhcuSexN/sTSLt3gly1XXtJ5PtK
7oH98fNJjUEol4w6q0jdHi88eYUZ9AsKm1rO9VHDGmvsc8ouyyh1U6fpVWBiKVic
e3xSuiIxbqdZddC3koePyuD9zk8FCBtCtO3++Tg3WFfWVHkhaDtywboa4C2Re4cZ
OBBxwGwMpZ3LBlk0s3TtUNqCh/KNotrmvUFgaJFEaE+sLP49sp7RTUxetlHzXaks
XzS2CkUh6GrwXneopi8AJPtLZVB5jxr+I00Fs0NfXQphOY3NYdAuwpu1SdiY6hnH
Bl+sc/ezNgvRk/vrZvMn2CzwDKphQMVWs1BqkbqkagW4+r3Z0LZCFl2r1GrJYDyj
sQ9p0zISDsDQ54XyPmeX212W98Eyh8L7eUcLqfVk29qfNktJNpnkqyHwm4muH6XZ
L0kJifCH/mBe0Vd5TYA8I8dClME9a7CzvBkgfSbzMFt5m89rNJQw2uKya7yAo6FO
w73OmqCgyIUh0l8JGaT5/mS+6YD8Q/weUeZUuKRu/n1cmPDuv+0=
=ZRvg
-----END PGP SIGNATURE-----

--TM6BztZ3dqztPj4t--

