Return-Path: <linux-i2c+bounces-3583-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 470228C9379
	for <lists+linux-i2c@lfdr.de>; Sun, 19 May 2024 07:26:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4EB87B20E7A
	for <lists+linux-i2c@lfdr.de>; Sun, 19 May 2024 05:26:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19437DF49;
	Sun, 19 May 2024 05:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="Qk50wyx1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2619F33D5;
	Sun, 19 May 2024 05:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716096363; cv=none; b=neRi58iLgm8SRkJb3N3IPRUn8fDuxNBq8oT8NXKr7Cehd5bDmY2viMHr5k+AV/jMk4ClhLoMaeZARkQlLJ1FHJcF9i1yWYe/FFXAnUcJYeKc2W8ufzw09Fc+uNNOgcUepmPZocnn7LiIVsX7ojgAybfaJRA2qNKXpwkv/VI5cHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716096363; c=relaxed/simple;
	bh=ZFrmNUxtsmYdUc3cQmt52uM4wMxGux6XqZ1iap+SKes=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=MT3z54Mqmm5nxG14EbL7FLLkj90SN/38i0ovqPlvPB74gN4/OuWFoPSzP/+xe1DlWhlJ7zIrz7mvO2CmMs5cWvhukY3WotM7pWZWY4fZAuf8Uh4peAOcJ0ez3TxZ+duZoPPCK18PFE897hA59iAf/fD0hPBge8h9nTO/nTjGGZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=Qk50wyx1; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1716096339; x=1716701139; i=markus.elfring@web.de;
	bh=ZFrmNUxtsmYdUc3cQmt52uM4wMxGux6XqZ1iap+SKes=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Qk50wyx13wLvGfife7KAhFcMZ9tTn8lEstgAUxChlAOWSypOIWwkcelbN1UzwWUj
	 LmWxXJjwjXDNWulQXFerBS8w6jAS41/W8PvJJnnGXHIVuRWsUSZjUvTaeerVfIGCd
	 bmTq+sSGNGjn7LJjzlB1h61+VHLculoz3iqhj+FIMGBMDxPsW9/32kmODj07LajwJ
	 Dh88yt6obeSgHM0Qc51FVqsW9FyNUeZ8+SBt32V1heTfkAap/H1S9FbftASnwwQQ8
	 BXYsaHCkOCn7fUmJp694iV4SB+81PE07+TyhuG3v+cXQaxs1mdMGNKT1DcJ1aElFv
	 FHpJZPUuG3dD8iAadQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.82.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MK56y-1rqTPB2pN0-00LXsS; Sun, 19
 May 2024 07:25:39 +0200
Message-ID: <6eee1069-81ae-495a-850f-7f526006db8b@web.de>
Date: Sun, 19 May 2024 07:25:15 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Grygorii Tertychnyi <grygorii.tertychnyi@leica-geosystems.com>,
 bsp-development.geo@leica-geosystems.com, linux-i2c@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Peter Korsgaard <peter@korsgaard.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Grygorii Tertychnyi <grembeter@gmail.com>
References: <20240517191000.11390-1-grygorii.tertychnyi@leica-geosystems.com>
Subject: Re: [PATCH] i2c: ocores: set IACK bit after core is enabled
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240517191000.11390-1-grygorii.tertychnyi@leica-geosystems.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6oA+99mdUNDDUSA01G21YEo+PC4BnDqvvY2xvbVENWHN5HVRnyT
 gcS8BXd+/i3aOSecsvib068rNEm3k9dI62B4BZkTmEuItrd2pTNb9CXxoQTKsBo8vmBRGgG
 R5AfHpOTfYaA+MYGbe3yYissxQsWg3KjoIIhOdELLHUkBcC7SrKH9QG+c8yCGiYhucxB3yq
 i1bPNCr9cr+QloDweQOcA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:j1e7MMVA6lo=;vdsdIj3621+iotpg125XlCQEuSI
 bCASiOv0rPsrGZ50gGf+vRjYeGqGgh5BWzegSMxAp8M1GyujAJYBaI5Mxxqfq82TRRwsqqDW1
 KSkFKpNjDSvZgnpteFGR64uF2WZRLLZEz18FmpLI4BQ3cIqdnrxQ/ZiEN9TUcehFMU19V8+gi
 Ecpl5tgIxJPVwnwKnjX0GmP9pzv+T8o0D8GaSkbx9bvPAiDSPMMnjkN1WbXIt+GpvzlK6SGga
 o1uv+XKrmTO1SsaJpgBHnASrlvyaCSO1oDLEtb7/fBVRYw+p5HkTOmljRCgM5ILXR1OgKq8ds
 fSjICc917ozo9Kp+yi7a0Hnj0uBL1+sRMd//BW4Ox8yaURZn3nRnTFUElzbgSnHUsnsN/G8e3
 1yR6K8pugKFljZdixGVYKFXLhpOnjCaCVKSBwngo7AmKlAESQh9F5QC8UAHC+UJ2SAHXYTiWr
 O5VftgphFiuOQyN7C8zbuptAXHaG1icc9FlCDoKpg+jgyzJZzSYqKPV6DE3sy+xAkv96jpKKY
 gjbrmRZ/LU6Kedz7zTxVvIYDiG7AwxBKpy4e01Ew06pV1v81sfIK6odnuh0+ebYxP1Mgp82Qe
 KrzEsHG4jdVQFXk0fI62lJrVpzsUjZYzQRLt4rm4AZYKjcFruneYp76XHUQOXsh+xywi79bw4
 lH/U639XZ2uNijiuRj2jHsOxi0W7w4GasOByPtJKE+XKRrtC5sBBLP7oMWZWBqDxaaClSEMdF
 raM7oXlsg1bDf1tVRPfroL9PopaDimaHxRlmQ82hqlJRA8uG6PkP4Zh8Rb+EH8rbT64QALEXE
 FlQLf827KddMQUgG4YlTrtEaBNXVsdFEV6stj7wOKGLe8=

=E2=80=A6
> Sometimes it causes failure for the very first message transfer, =E2=80=
=A6

Does such an information indicate the need for the tag =E2=80=9CFixes=E2=
=80=9D?

Regards,
Markus

