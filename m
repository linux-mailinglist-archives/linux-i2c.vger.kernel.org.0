Return-Path: <linux-i2c+bounces-15031-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE64D11464
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 09:39:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26ED03070FDF
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 08:38:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DFA8341056;
	Mon, 12 Jan 2026 08:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eVavJwjc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A683E340D98
	for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 08:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768207100; cv=none; b=FMD9f3J2kkhACL5Z1ASbWleacB23+2iZ+X3sWfRy/VJc6rQdpKUhH5ItYuyQsDmRMLhzIbYRtTtyAAlEcKmK5s0TOEoen6GulhyKyIhg0ICzajIum3uN1oWYt5LIhrw/Wez9uK3Tr3KkhjP4wWsW79hkqEtYMHnoaCwNApNfZIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768207100; c=relaxed/simple;
	bh=iBc+kzWaPMgcq3K488Yse5Oao7k4l/QEY5UX2uhRxHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GIx6Mbt+RBjnxTw3c/qlopGkjJnxjXBv8lPvXICWbDb5gaMsG1DumQ0g/Pgg1hurIR2Bv/Tj7bzFLXaQtcPyq3SiK9a6YlwpsGm1PwnK2Ek662fRVXD+wwyPz/5tnIOeSIhu0yltHJ5/8pm8hbw7TVR2aZQV6XyX1hLNmLi4ums=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eVavJwjc; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-59b76844f89so3737466e87.1
        for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 00:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768207097; x=1768811897; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wlsv0VCIHIiHd0/nEHHL3lk5SEgEXeB9EowWFMHqs2o=;
        b=eVavJwjcJcezgWIMnQEFe+j46bs/q1DA9R3TU2aent6Qr3bOXvr52IAE+vR/Eb4oOY
         I/PU8ckSAyILah+KqiLEUHTfOm9BKRI1K/UsIpmDgDh1sUSdkOcwXkCvDyQGAGUIXYz8
         CzjJGlhrPERJ0QpSpTifxp7fR7aFHfuEpepJ5Y2MTZLOP7mqtF9rHVhcR+uKidDYn4i7
         bBJkv3NC17Nyo5+2Y8FQQ9/hSjTFywl0y4bx9AAsO+CZhhmEJKft+au1RhyuqNk0GJmn
         q54KCRr14M5FX1CgOFyWvX/4Z4MwmtE3yMsj2OiD1Eh4/IJXTP/2JMXYA/SM62V/1U04
         7n8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768207097; x=1768811897;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wlsv0VCIHIiHd0/nEHHL3lk5SEgEXeB9EowWFMHqs2o=;
        b=T0vcUliGacztW8huUguvYJmM3U+wCeZ4fYcNoPhZ3LC/3xGamD/22YuTV+u/G8I46o
         SwcCgzoC99MzQnav3cYCF7iWU5BVHKV6i31fGmUd1Ij0xocT3H1ScbxeOQtnNmcxXjKF
         uhwthCXz5wJs/Q3Evq6/vxdzp4VNty4qimd3ipCDDdnLK4Hky96aEc44tzphtu+YJGvf
         yDaGkbiWal/+8mzMlsAncIAdbC6p342zB71NcX1C2e/GjulynA0bOwJ0hXczJgabXjwe
         fA8QULrxF2Zj98zsjDKaEmUco2ZGGMxSd4+zI/GFvWEjDBdDf4pSNdcVb2r7D3sPSXh+
         9rrQ==
X-Gm-Message-State: AOJu0Yx/iYHBtR1PCBrgmY/sTYztlytq3lq9HqTu2agRa3HRUM0UU52m
	HYIkWiXJgFo0CMybNIo5UJFlAVVVPiNYsIJMLdgXhHvxQAHG6icMu31G
X-Gm-Gg: AY/fxX4kW8wF5Lm/O+A7DV2SKBK0L0L90UY7XeCeKF1UM0I1LccgvNl8xbX3xnPpwsq
	SxjQLYf1i8HKjz8A8sFD+/jI0ja2j3PLcUuP0R77o1rUPLlHJB4DJyxyUK00CPRdmxFEaSU5rVa
	QO6unj++QRc0WeqApZwdTOs01fd3zDryqaIOHJ3ja0+sbqbB45ixpPMbfI3vggolKKDt6ONgZfU
	hKsZeWWYr3pp+aXvzaJTdmL8OoQHli2WCZle5ywRL+Qf2bhheS+QHOytgCUahF8rc05w0YXytQD
	eME/AD6FsbMvLTIHkzNmKnjVdsaRfteV/356L3wGwcQrOfXs4NwylyaOSfVaVkQImlgD1PHLrGo
	kDJAtV4rlyVhAMAYdhe7qPvJJ9/Re+pt2s4lTGws3XHMweesi4YHoa1yrUbLen+upxYpe7lmlF3
	N+lJbcnmqtQohJ1F7hydRhftaxFn9XeWPq37Hl9rTnpndLlK5nfJYIQi9nZHI=
X-Google-Smtp-Source: AGHT+IEArGBiKYPwRJ0Az/vkHndV/i+f9BSZpjpqWUBeI/o2LCXpED5ibt7YfNHt4LjcdnLJN4jYOA==
X-Received: by 2002:a2e:a992:0:b0:383:1bcc:117d with SMTP id 38308e7fff4ca-3831bcc13ecmr27420461fa.35.1768207096425;
        Mon, 12 Jan 2026 00:38:16 -0800 (PST)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38319ec5b73sm20131591fa.48.2026.01.12.00.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 00:38:15 -0800 (PST)
Date: Mon, 12 Jan 2026 09:38:13 +0100
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH RESEND v3 0/5] I2C Mux per channel bus speed
Message-ID: <aWSy9U-JFocPAI9X@gmail.com>
References: <20251202-i2c-mux-v3-0-877dcf478a9f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uN/jfTvb9pytjRRb"
Content-Disposition: inline
In-Reply-To: <20251202-i2c-mux-v3-0-877dcf478a9f@gmail.com>


--uN/jfTvb9pytjRRb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 02, 2025 at 09:09:47AM +0100, Marcus Folkesson wrote:
> This was a RFC on how to implement a feature to have different bus
> speeds on different channels with an I2C multiplexer/switch.
> As no major complaints on the design came up during the review, I
> decided to submit the series without the RFC tag.
>=20
> The benefit with this feature is that you may group devices after
> the fastest bus speed they can handle.
> A real-world example is that you could have e.g. a display running @400kHz
> and a smart battery running @100kHz using the same I2C controller.
>=20
> There are many corner cases where this may cause a problem for some
> hardware topologies. I've tried to describe those I could think of
> in the documentation, see Patch #5.
>=20
> E.g. one risk is that if the mux driver does not disconnect channels
> when Idle, this may cause a higher frequency to "leak" through to
> devices that are supposed to run at lower bus speed.
> This is not only a "problem" for changing bus speed but could also be
> an issue for potential address conflicts.
>=20
> The implementation is split up into several patches:
>=20
> Patch #1 Introduce a callback for the i2c controller to set bus speed
> Patch #2 Introduce functionality to adjust bus speed depending on mux
>          channel.
> Patch #3 Cleanup i2c-davinci driver a bit to prepare it for set_clk_freq
> Parch #4 Implement set_clk_freq for the i2c-davinci driver
> Parch #5 Update documentation with this feature
>=20
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---

Hi all,

This series has been in its final shape for a while now.
With multiple resends and pings on this series for the last four
months, I think everyone interested has had the chance to review it.

Wolfram Sang, could you please take a look on this series and consider
pick it up for merging?=20


Thank you in advance,
Marcus Folkesson


--uN/jfTvb9pytjRRb
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmlksvAACgkQiIBOb1ld
UjIPdg//fETqNNW85f1AucnMByabxMZanfL15C1uuB87na7/jwdjkf4UOC/cdbTt
IY2NeyF1Boc825p7iSi8zPmZYECp6hYebLP77DPVVJjFkqSPIcDr1c4kfXAyNSAp
Tm1YwwTLIIPiMfAAzCCeZgoAUihY8m/8NtmY3MVWWWWeozj65Wa5Ey4oxNC/LuPc
2DRp5kjGfvHN/fRCT1FB0AdSP2WU+XnFm36hCnieB04zvf5vZojEFEcbRg4RLMmq
ITQTHipPySdVPv8CnKtaJony5VfSCLjjBJml2fyslzuL1frwO/WtZok7XRDqwuaI
lf4MGraiyMv2Kylwf84nqWGdse88a4N38EEwd6akMTK/IEK68gE3MEc9K0yDfHZM
3yMvXTVQ9lYI42dnmY5OqwDBalnZ8RxOvcj9dzJx6FhkIz7zAngjNtolOiWPwGl+
zuYehjmXugmYxNhr5DdxarSYyaIe3qxqDu4Vay0zSwqDLL8NUS1GYQNF6v2lgkWK
Bge8Zju90GWGTzqMXKLvmeCtp/mUE4gzdaWzi1rtUCeMKU4CCy4MZ+pAnhbRPUX2
6OW4b6KwRfc8hboO6YoAjzWBsn1srSZdIxIsNfrE98j39xcO4+rP39F7sCGjrdN0
+u6+GwWiXSN42/dK+PeBZ8uCZpr/QZZQOejAXZ042LHNbmbHvj4=
=aKQV
-----END PGP SIGNATURE-----

--uN/jfTvb9pytjRRb--

