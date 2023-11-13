Return-Path: <linux-i2c+bounces-141-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBC77EA51C
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 21:55:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0CA41F20628
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 20:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14BA3250F1;
	Mon, 13 Nov 2023 20:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LQaTqPxs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85562374B;
	Mon, 13 Nov 2023 20:55:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBF40C433C7;
	Mon, 13 Nov 2023 20:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699908904;
	bh=HX9WoOacLDigRvGbp357tabXuA7DcFEvIQHKWbMNF6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LQaTqPxspSv8+i8SRdoAcGMGMJWmklQSt2qjaNXA1AMMlyY4c9y0uPRZK6v+driu+
	 PZT+8PlAO2Y0ZIVoKK8JgZWgb0r8FLC9xdYQbyV55NWfJegLb+P+AzXpqSAfuGEYVk
	 jObnlArfM+YzkpXwglUhxc39+XcVMAtVnr3jumiMlgx6fV0Mwxkg3LITDyNZ3DlLif
	 r3gn31aLtJF6maVADxUQ9qAFTgxLc6nkrFcZIFAmg5OyjUklwyIl7Q+ARPC84LaNHV
	 OSBqemaVBcAVWDerDEV+U8L7AyhIYpsVj6XLOGuIlymBEcxs0BenFcnsFiYriMqW/d
	 Q9OncnEY39k2Q==
Date: Mon, 13 Nov 2023 15:54:58 -0500
From: Wolfram Sang <wsa@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: intel-gfx@lists.freedesktop.org, linux-i2c@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	linux-fbdev@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jocelyn Falempe <jfalempe@redhat.com>, linux-sunxi@lists.linux.dev,
	linux-mediatek@lists.infradead.org, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
	Xinwei Kong <kong.kongxinwei@hisilicon.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Yongqin Liu <yongqin.liu@linaro.org>,
	John Stultz <jstultz@google.com>
Subject: Re: [PATCH 00/20] remove I2C_CLASS_DDC support
Message-ID: <ZVKNIn1eSlZ9yzco@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	intel-gfx@lists.freedesktop.org, linux-i2c@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	linux-fbdev@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jocelyn Falempe <jfalempe@redhat.com>, linux-sunxi@lists.linux.dev,
	linux-mediatek@lists.infradead.org, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
	Xinwei Kong <kong.kongxinwei@hisilicon.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Yongqin Liu <yongqin.liu@linaro.org>,
	John Stultz <jstultz@google.com>
References: <20231113112344.719-1-hkallweit1@gmail.com>
 <ZVJhwSS16+/Zzt0f@shikoro>
 <887657ba-86ca-49bc-b6c3-8543610c3230@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6QEpjAXU69jL13kX"
Content-Disposition: inline
In-Reply-To: <887657ba-86ca-49bc-b6c3-8543610c3230@gmail.com>


--6QEpjAXU69jL13kX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> We're not in a hurry. It's just my experience with patch series' affecting
> multiple subsystems that typically the decision was to apply the full
> series via one tree. Also to avoid inquires from maintainers like:
> Shall I take it or are you going to take it?
> Of course there may be different opinions. Please advise.

Ok, then this turns out to be a negotation thing between the drm/fbdev
maintainers and me. I *can* take all the patches, of course. But since
the number of patches touching the non-i2c subsystems is high, I'd like
to hear their preference, too.


--6QEpjAXU69jL13kX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmVSjR4ACgkQFA3kzBSg
KbYBGw//VUbVW9+Ixe9HjIJ3HSfBWxKVxRlhYfBmhO2cE0q82ZWNtXn9KLCRvISh
gZrYpOYKuRPodc9sB1e/Rq02rg4ZUdVslMIs6CARXyHkijz+WjIqexT7uMjM4hVr
8cQfVKgr72AbhCzzD8q1g5KIYbnwkeS4NDPc48YYKs7CgpRsCfBaisBvbCCEZFez
oMVUyEqNtFOeBht//TldZh+lhRVBw8fIEUT2/y4pYtuA1gFAsD5kFKu1JkYRn9uL
WWb9mRIz2ybsmzlxda1ED+z7YegeV6yaNQahG++hboHcVEhYlNeWbCx0few90tpb
8AuP1ArLT8SdvOcYHLRBzcE8C94fpichL7IbfZGeHr74DJSehuD5huLHC6WvcMsR
9A6eW3D82gAa+SCgUFpndu82NbVtBrqOl06BdQpARQZ0sqvQ6SMGx2Vvd4LgKGth
tKnNU5kH9Q1eP04Pn1dJQqHgJYjsA2eaOG5GGIcuZHWigWZIUnYrOpTVKvChlwJc
UV3URepN9RiQ7aOMB65NcBLJ/FSEe02wSE7uLpu7N6G60RaKPFMYPE3hRKjyCXky
/9iJ4EB02vBA2xbP8lV5ZXdxrPv752oaC9kqNnsb2JrmOULiTgXnDanBmSHvtQ9n
o3AwiwXfOeWtBA2twxpEzqOcc28pvOFLTAWBcjgPVsUDVJP8mgE=
=HpzL
-----END PGP SIGNATURE-----

--6QEpjAXU69jL13kX--

