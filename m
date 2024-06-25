Return-Path: <linux-i2c+bounces-4344-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B23C916AC7
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2024 16:41:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 031C328C2D2
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2024 14:41:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FCB416F0ED;
	Tue, 25 Jun 2024 14:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="cMTLoiU4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB4A17167F
	for <linux-i2c@vger.kernel.org>; Tue, 25 Jun 2024 14:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719326436; cv=none; b=G/Vve2wfISxW96/oftAPprqEgrTPRXItYhr13SMFcT49QsGETBMFkrdggeA6CeWGaYZ+uaHNuusw92hZPcNgV4jInlF64g30RwxnRqqttcyjMfzCAT0nHJt/a0lBch2ytACe8Ujbogd4GTTZu0sbEHR4ZuasKjOxrX+OJ8sQNxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719326436; c=relaxed/simple;
	bh=3mJVHd8KBZFHT/thrSQkQw2hQgCEKhQ/2kzH+DJ7kIE=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jp+wyn/eCJGR2YJCY/QEodHIEKnYzSW6yRO7pqD6a0YT9dKhErtUBSNB2o/dtBdTUyJClmFuyFKdHiwEa/N6myJsLJYr/2PRibAG7trlOHBDGoSQu8Wwhy+XAvxE9JQVFxtoi/jfkWYLCMjGpCn3JL8FUkiKee5Sjmx8aUdd5h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=cMTLoiU4; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-57cbc66a0a6so371295a12.1
        for <linux-i2c@vger.kernel.org>; Tue, 25 Jun 2024 07:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719326431; x=1719931231; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6kztJXKkjSq58lR5mrDXGoKvLAaQvzj68ZEFzcn43O8=;
        b=cMTLoiU43RuVpcRAVgQcBH6NelJ9AuJmBG0sfvJRAJPzO/SgAulMyWRXyN5NTqZ+VH
         kw12BbDg/trmS5AJ6gY3dqYDSedomSBAeRUO14mrpNJYqDozIURvy0StojTLm6ANDLx1
         Rhcfft6kUuxtlwdy0HSd8gyAX/KtQbnm2TieXsG7TThSwD7onSd5WkftHN5pnrzAGS7p
         T5Ro6YVah3tOMIrAh/CpLrCiA97ZX4SfYYTtGXv0y2HhQXv0roxLqAc91iFAez3yF+Ov
         v+PSbssEamF5MsUZaJdXMi/5SZXePYSgHs0N18rEfml7cpwiOzjAs7Eey2FKrK7BXM97
         HCMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719326431; x=1719931231;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6kztJXKkjSq58lR5mrDXGoKvLAaQvzj68ZEFzcn43O8=;
        b=qA19JbV6/gYJx+RmHTIkSN+/J+NohFYwbxJsud794E1bXQLVI0a++56/8Grv51vusi
         s4jCobXZtzwteUyVmsuw1mcModPo3Iu6qkCjLuVr2Ezkqm8+03iKis4xcfz70Jr962F7
         dUu8c9qoTciVfMEGuDurAyp/LYWSCB2Ui7kXog+SZjnGH24wufxHb3N/+IjforM4VjdG
         OJwFY6BuwjQtCQ2K8JQnvJ6bSz8rPVErNkhzAxYwUhUTekN2/hBmaXCUrTnTmqgnlq4X
         zTADW59U2ybEb4T6h858WVa0ANpcu1QtMVdrBhBykS2NcVvozpA55Dd8xcQvK/0/wss7
         8wIA==
X-Forwarded-Encrypted: i=1; AJvYcCUrVz5zEEzA/z79DzVkyqwgbmsbBunnDwDkaq5gl/B9JjT5UJq7vAsR0wfKmMsdbhRiuSOQxLjNYs/v7aVjHk8IjDKfL+OpD0TK
X-Gm-Message-State: AOJu0YyxC+lMZePsEMkA2fgwDlCHuIKA9U0B1qJjFN9qUSmwFbzNQiVq
	XJCkM/BEJAIJ1qaIFb1QWMHu6MXN4JgZn26L+n3pWj5HDBKy4HPJVgre7ef1yLc=
X-Google-Smtp-Source: AGHT+IFKW7+IFrFPHjDWuZRqySwLJPLqxFFEuDqszxboU3tI7sZEywMmk5XbNU3H561wYP8mjFp3Ew==
X-Received: by 2002:a05:6402:34c6:b0:57d:45af:112c with SMTP id 4fb4d7f45d1cf-57d45af127amr8103974a12.4.1719326431233;
        Tue, 25 Jun 2024 07:40:31 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:aab0:97bd:4d50:ddf1])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d303da254sm6007172a12.1.2024.06.25.07.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 07:40:30 -0700 (PDT)
Date: Tue, 25 Jun 2024 16:40:28 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: Drop explicit initialization of struct
 i2c_device_id::driver_data to 0
Message-ID: <pja67neo74zw6rqpv5n7ekivlhejbmpuge6umtuatwhgjbmcwr@7u7f7vhpnwtt>
References: <20240625083131.2205302-2-u.kleine-koenig@baylibre.com>
 <rb2fmtnhaqicg2behqfijfypfsvkqatud4h6klal77u6scw2gp@cznyn5vof4x4>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ackgh62dyqhxvezi"
Content-Disposition: inline
In-Reply-To: <rb2fmtnhaqicg2behqfijfypfsvkqatud4h6klal77u6scw2gp@cznyn5vof4x4>


--ackgh62dyqhxvezi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Wolfram,

On Tue, Jun 25, 2024 at 11:47:29AM +0200, Wolfram Sang wrote:
> > This prepares putting driver_data in an anonymous union which requires
> > either no initialization or named designators.
>=20
> Any preview/RFC of what you are aiming for with this one?

There is an inconsistency in the different *_device_id structures. Some
have a kernel_ulong_t for driver private data, others have a void*.
Depending on how it's used in the drivers, one or the other is better.
To get the best from both the idea is to do

diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetabl=
e.h
index 4338b1b4ac44..594c5ace303a 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -477,7 +477,10 @@ struct rpmsg_device_id {
=20
 struct i2c_device_id {
 	char name[I2C_NAME_SIZE];
-	kernel_ulong_t driver_data;	/* Data private to the driver */
+	union {
+		kernel_ulong_t driver_data;	/* Data private to the driver */
+		const void *data;
+	};
 };
=20
 /* pci_epf */

which then allows to drop quite a few casts, e.g.

diff --git a/drivers/clk/clk-cdce925.c b/drivers/clk/clk-cdce925.c
index 2354d12ddad8..6ba5dce0c951 100644
--- a/drivers/clk/clk-cdce925.c
+++ b/drivers/clk/clk-cdce925.c
@@ -818,10 +818,10 @@ static const struct clk_cdce925_chip_info clk_cdce949=
_info =3D {
 };
=20
 static const struct i2c_device_id cdce925_id[] =3D {
-	{ .name =3D "cdce913", .driver_data =3D (kernel_ulong_t)&clk_cdce913_info=
, },
-	{ .name =3D "cdce925", .driver_data =3D (kernel_ulong_t)&clk_cdce925_info=
, },
-	{ .name =3D "cdce937", .driver_data =3D (kernel_ulong_t)&clk_cdce937_info=
, },
-	{ .name =3D "cdce949", .driver_data =3D (kernel_ulong_t)&clk_cdce949_info=
, },
+	{ .name =3D "cdce913", .data =3D &clk_cdce913_info, },
+	{ .name =3D "cdce925", .data =3D &clk_cdce925_info, },
+	{ .name =3D "cdce937", .data =3D &clk_cdce937_info, },
+	{ .name =3D "cdce949", .data =3D &clk_cdce949_info, },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, cdce925_id);
diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 49fdcb3eb8f6..d19ffe79681b 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -129,7 +129,7 @@ const void *i2c_get_match_data(const struct i2c_client =
*client)
 		if (!match)
 			return NULL;
=20
-		data =3D (const void *)match->driver_data;
+		data =3D match->data;
 	}
=20
 	return data;

The only downside is that all initializers have to use either ".data =3D"
or ".driver_data =3D". IMHO that is OK, as named initializers are more
robust and explicit.

Best regards
Uwe

--ackgh62dyqhxvezi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmZ61tkACgkQj4D7WH0S
/k5TfQf/ZlpTjTe8IPmN2WUY736MIn5dUtO0Hw+8Srz07CA8iLlq7GG3MyypSxdv
vna3KTTbwWUPzXgbHQXKVwFHfNCo+V4dPRhT1LFIeCb3fzBoOQ0deGLkE4zzG4Qr
UXCyU+15k/ie4FV5++h8hZbTFNj6j7Azei3gQZwmjD1egdiNaix8nHvLjQkbft6T
Rdyd/T3Ca/oT+kFnCwHnm+cczzmIQBdbeSxGQcuEdSFHM1hwvyC1qffYFHPLFL41
U9TLhCzyTamUgTfx4PI66VrZ/P+3nETes0kJoHo2I6Vm86aKtlXe7EoyKS/ucsGW
oe8WLxA3SotFZxv3mleOJahQVRz7lQ==
=jPEM
-----END PGP SIGNATURE-----

--ackgh62dyqhxvezi--

