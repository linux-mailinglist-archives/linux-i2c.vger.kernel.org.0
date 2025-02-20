Return-Path: <linux-i2c+bounces-9506-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E30FA3D383
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Feb 2025 09:44:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 059C7172C94
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Feb 2025 08:44:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 149301EB1A9;
	Thu, 20 Feb 2025 08:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="JeZbldPB";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="pKzWVbxx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC571E9B36;
	Thu, 20 Feb 2025 08:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.165
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740041043; cv=pass; b=N3XRXiSDu3IIIgGHYaXofF68+JQeVKKjrOel7K4ByFP8Rn6ExpzWQnbjGVc2wOIj5AIKpreRwIEVDOFq13yZmY14hOB2X4Nr3aU/rdnYapb4A5c35q+OcOuWohVuITNyMs86DYc6V9A7oB+Qt6lT1LzyOqcgfQhuFNSkMaZb28I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740041043; c=relaxed/simple;
	bh=zieZ0fjy2Z/FwxLjt+yC+FHgdeOXQn5pllZY6zkxF6I=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=brapnCB5Y9++p+ATqP/YpOM/dQFqa07V0pP8fyqNxftWRt07KooLZlpbuso/5svGqCWdt2UezBJRjmOibatRR2af7W7LCFhYoCqnHzGDM+LDhKBu6owb/N8dELdmuQe84yw/CKgFMF1WtNnHut4rn8n5l3CwwhQakHfv+ayOqOg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=JeZbldPB; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=pKzWVbxx; arc=pass smtp.client-ip=81.169.146.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
ARC-Seal: i=1; a=rsa-sha256; t=1740041022; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=NX4gri5O599Gk5hovWOCAimvx5nDDfF37HEcbwOc554NFCRxtS55or3CJTLhmmK2ji
    W2AB7beSFIFpO6sxXG1/ynOs5+e9I9eVtaQcpyVhrDsIGo/iRSsM9j/5hcRdNQ5FL3SO
    bpinrELHaCPiOMEFCoBdEmBdPCarjWk6HPCFkjLVcd3z0v+hj2fctkU4OkADBMXaYGPY
    ub1H8XLApEzuqq4SarG5BQo2AV+cDcjCWYEOxyevoyxR0H2kTIfLE+O8egpcF9kbZtW8
    L2/85vTR8Bi/TFrDFXAve+VCWdQLpIyiC7mEgw0eO46CwPIS+dWLBE1sg4ANswVPvZn3
    Gl9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1740041022;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=zieZ0fjy2Z/FwxLjt+yC+FHgdeOXQn5pllZY6zkxF6I=;
    b=kH+FUFDgnO/WU9FFnvIur3zF0GXGBYkzT8kRAhO5n7KeRdh01TUq3YVmibNfCOSVuk
    QJltTvJ44uIU03D0OJ6FS4AonSJXEnmd9/nqI0QqqHHDwCYPUQ0fyfrqzU+f+i1vmECf
    KQGCu/kwv4GCfTyH/f1QrANgXM/+AUuopcxtmDJjUEtdLl3bkcnPmaUQ3WISEEhB0aOi
    5diVkx1LMTSXMOXDShLp4umfHcBtT9PLJZGSSuPXCZwW/F5ACy6+ipVM8ozc6+L+ur7i
    TUfYKOA0ZB0IZZNyYmui/HW+eu+IRJ2Tm2ht6p3vtrLQWqQJ4ZpqU0lDC+Q0lvF4OZee
    nvPg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1740041022;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=zieZ0fjy2Z/FwxLjt+yC+FHgdeOXQn5pllZY6zkxF6I=;
    b=JeZbldPBQGvyw69RKgnqbD4c+ycP/WyEp4IfuFLDyO77ZvWXTKn60hz/0Qm3XpYG9w
    w2pzdQfftUXURWlBEcpFbP+nMlugxVt2+/a6eWfxn4ByYWGq7eqjkRHZWKJph4OYUx0a
    xEl1xb1hx6pogB35GNeiNOCqA3aFzv0s+nYA96KDlMoMI30WGZHFT2fQVKLDtEXrQ5HD
    K3ZXHAziEcYLqvXKBzmyk471GX4LRdPcxXOoNWnJELtIYPZ+gj3qJJAAB/3fqIlqRjHq
    QSYOtuouZrRT+iMCK5+tZXf3uLS9/K3ubT3EVRR+r3g6F9Xotc581noISZxrbCHNN1Y/
    q5UA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1740041022;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=zieZ0fjy2Z/FwxLjt+yC+FHgdeOXQn5pllZY6zkxF6I=;
    b=pKzWVbxxrmVw+NsDoQlNO72yFL1u3g7dcWn02GUONkoU2x4O6L5UjlLvfgfzNzOUzz
    HMJCcBZnn2yl4bUogbCQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrSj5oLyciNUndkHxYx0Ti5SZ9cNhe0mfWn0QeU"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 51.2.23 AUTH)
    with ESMTPSA id Qe5b2211K8hfSbq
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Thu, 20 Feb 2025 09:43:41 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.1\))
Subject: Re: [PATCH] i2c: omap: fix IRQ storms
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <c3bcusjbn23z5yd2a3xtm7swnfizkl7rb6ufhicdhn52epnjvb@5uqm3g6jcony>
Date: Thu, 20 Feb 2025 09:43:30 +0100
Cc: Andreas Kemnade <andreas@kemnade.info>,
 "Raghavendra, Vignesh" <vigneshr@ti.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>,
 Tony Lindgren <tony@atomide.com>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Reid Tonking <reidt@ti.com>,
 wsa@kernel.org,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 linux-i2c@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 stable@kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <115FEE67-85FB-4D79-B87E-8DEF08019958@goldelico.com>
References: <20250207185435.751878-1-andreas@kemnade.info>
 <c3bcusjbn23z5yd2a3xtm7swnfizkl7rb6ufhicdhn52epnjvb@5uqm3g6jcony>
To: Andi Shyti <andi.shyti@kernel.org>
X-Mailer: Apple Mail (2.3776.700.51.11.1)

Hi,

> Am 19.02.2025 um 20:22 schrieb Andi Shyti <andi.shyti@kernel.org>:
>=20
> Hi,
>=20
> On Fri, Feb 07, 2025 at 07:54:35PM +0100, Andreas Kemnade wrote:
>> On the GTA04A5 writing a reset command to the gyroscope causes IRQ
>> storms because NACK IRQs are enabled and therefore triggered but not
>> acked.
>>=20
>> Sending a reset command to the gyroscope by
>> i2cset 1 0x69 0x14 0xb6
>> with an additional debug print in the ISR (not the thread) itself
>> causes
>>=20
>> [ 363.353515] i2c i2c-1: ioctl, cmd=3D0x720, arg=3D0xbe801b00
>> [ 363.359039] omap_i2c 48072000.i2c: addr: 0x0069, len: 2, flags: =
0x0, stop: 1
>> [ 363.366180] omap_i2c 48072000.i2c: IRQ LL (ISR =3D 0x1110)
>> [ 363.371673] omap_i2c 48072000.i2c: IRQ (ISR =3D 0x0010)
>> [ 363.376892] omap_i2c 48072000.i2c: IRQ LL (ISR =3D 0x0102)
>> [ 363.382263] omap_i2c 48072000.i2c: IRQ LL (ISR =3D 0x0102)
>> [ 363.387664] omap_i2c 48072000.i2c: IRQ LL (ISR =3D 0x0102)
>> repeating till infinity
>> [...]
>> (0x2 =3D NACK, 0x100 =3D Bus free, which is not enabled)
>> Apparently no other IRQ bit gets set, so this stalls.
>>=20
>> Do not ignore enabled interrupts and make sure they are acked.
>> If the NACK IRQ is not needed, it should simply not enabled, but
>> according to the above log, caring about it is necessary unless
>> the Bus free IRQ is enabled and handled. The assumption that is
>> will always come with a ARDY IRQ, which was the idea behind
>> ignoring it, proves wrong.
>> It is true for simple reads from an unused address.
>>=20
>> So revert
>> commit c770657bd261 ("i2c: omap: Fix standard mode false ACK =
readings").
>>=20
>> The offending commit was used to reduce the false detections in
>> i2cdetect. i2cdetect warns for confusing the I2C bus, so having some
>> rare false detections (I have never seen such on my systems) is the
>> lesser devil than having basically the system hanging completely.
>>=20
>> No more details came to light in the corresponding email thread since
>> several months:
>> =
https://lore.kernel.org/linux-omap/20230426194956.689756-1-reidt@ti.com/
>> so no better fix to solve both problems can be developed right now.
>=20
> I need someone from TI or someone who can test to ack here.
>=20
> Can someone help?

Well, I think since this is simply a full revert of

commit c770657bd261 ("i2c: omap: Fix standard mode false ACK readings")

to the status before. Therefore the status after revert was tested for =
many years
until c770657bd261 arrived to try to solve one issue but it apparently =
introduced
another one which is more severe and difficult to work around.

For real world tests please see also:

=
https://lore.kernel.org/linux-omap/664241E0-8D6B-4783-997B-2D8510ADAEA3@go=
ldelico.com/
=
https://lore.kernel.org/linux-omap/ad0fe7ca-fb6c-4c19-b4b3-0f29ddaa92c3@jm=
0.eu/

BR and thanks,
Nikolaus


