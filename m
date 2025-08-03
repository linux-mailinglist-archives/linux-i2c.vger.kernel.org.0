Return-Path: <linux-i2c+bounces-12125-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 815ACB1944C
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Aug 2025 17:12:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF5291891E84
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Aug 2025 15:12:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B921265CBE;
	Sun,  3 Aug 2025 15:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="MzVZ3sEM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E9F2135D1;
	Sun,  3 Aug 2025 15:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754233922; cv=none; b=axfOp9lmzPThVXn1OAQcfSVIcDgXBh1lFHg3GIAE864ZZeS8HVl08xIVx8NqwP+2mw2vGqojA365kgqL8HLF66rBoGXXlyY1TqHMBVXflN83nN/6L5EJJecxqok5q19fgddBNHgv+cSN9jiJKLht06GS5klPixzzlC6aYcyKydU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754233922; c=relaxed/simple;
	bh=45OEwlFi3FA4DTTJpqIQp3ta+mUj9ErLXz2mn214KC8=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=KB8/kmGqxOr3H53WhvbBo7tr4A/i6T6mZ03AFXjzcNGQ+aeqQchM7xH8adgMtYIBmOwTmiXJu9Hv3YpCkTAiA86CFLxYP30iORVg6I/UelbhJO1LH1eDmSC+QdlP/U4AsjpuOa2+Acez9+KtLbZkniBl19htmc7mUXpDbsnR9F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=MzVZ3sEM; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1754233913; x=1754838713; i=markus.elfring@web.de;
	bh=45OEwlFi3FA4DTTJpqIQp3ta+mUj9ErLXz2mn214KC8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=MzVZ3sEM+VGyWiSVQ73wEFfbIn0q5qOfyyuujsxrCAEAxQvT04z8lNxy7QAqIpKO
	 zEygFzLQNG679i3XQJLfUSBFMLBlf5AFPdSVP8gCTkLN5oVU9FBN71XquS1HDxNoE
	 y/2D3Lo+muMbONqV37ch1jFQB8iQ8Cfp9an+d9q7V2gEOHyNSkaU79iaDtGjOCn6w
	 CUQopEfpqgVLpfWtI0adAu5ZcyRbeCTO9mcwznzMOqlf4hNzeIDxWDefvZgy2SlHS
	 jVhLxzj3l0sojvgJ7pwbaXYYXtF2KT5IerHdaZmT0GLaRTWDVjs503jd8s24HKMlE
	 56VqQo+tqNME8YmLwg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.186]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MCogm-1urLnk3cyO-007KKQ; Sun, 03
 Aug 2025 17:11:52 +0200
Message-ID: <07f992ab-252c-4892-b292-50e01baf0c82@web.de>
Date: Sun, 3 Aug 2025 17:11:51 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Elad Nachman <enachman@marvell.com>, linux-i2c@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Gregory Clement <gregory.clement@bootlin.com>
References: <20250803101507.659984-2-enachman@marvell.com>
Subject: Re: [PATCH v2] i2c: mv64xxx: prevent illegal pointer access
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250803101507.659984-2-enachman@marvell.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5YbkHNOI57Fz9zC/t85rmaDQsoNdwjVprsmmpsHl8dmVlKEmO4F
 M4DU9ry+yZlbCzFxwyKTji1D68MzgyDPYcd4Y3ZScW5lNjgsU9WbQ3Gl5moUpGehl2xPCnU
 Fm7e9QHP2wwCEJjNO+ZrqD5wtdpAwNOU+HXJNXEuG127zd6tZONGekibELEphF4evfQ0goE
 mcf9fMB2EiWzm6GLnzJtw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8JQ1Y5GFUR0=;+7wBDO7xb0pBxwgHVKs9gWe2NxE
 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

=E2=80=A6
> Add check to verify buffer pointer is not NULL before reading or writing
> the buffer for additional TX or RX operations.

How do you think about to add any tags (like =E2=80=9CFixes=E2=80=9D and =
=E2=80=9CCc=E2=80=9D) accordingly?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.16#n145

Regards,
Markus

