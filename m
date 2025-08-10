Return-Path: <linux-i2c+bounces-12199-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C38B1F963
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 10:49:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F33783B0769
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 08:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1321923B623;
	Sun, 10 Aug 2025 08:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="RT+nOuju"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12FF78BEE;
	Sun, 10 Aug 2025 08:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754815750; cv=none; b=gNjLnX3dstfhD1y6+uiiOx/SjT8e6GYFQXnZgoikVki8Z+rxh9xPZfd+bnqyxOkvAea9Vii5/mdaLM3j8G1TGa9M+rmT3UPffD+PT5BRHY20yXB06S3kwZcuP0PrbSkb8IxV3agNcvKNZuMw2EYAjurnAfsAsae7qQOa39RxcOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754815750; c=relaxed/simple;
	bh=/kOk89GvpNfBaL7XxH0pqrvvRcY0VzmrgI5x60htp5Y=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=lTJTqSSI/dtBMcWu2JAxykUN0VSuwFXbdxTHIkfgLWitFxP+26MhzIvfbgglV7Yzyft21QNJV8IizvjVrqYzuq7ulW+9HINnu+ZFiDWO5mStc0XTMbbMMvkwFGKsYJXZyEk/cyn/oWeeFwO0crEpOxlB8N2mW4wPUAq5QvUJo9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=RT+nOuju; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1754815745; x=1755420545; i=markus.elfring@web.de;
	bh=LwPH/7zGfYv0GP0GapXKzcmodC44YjENczgCk0jA0tc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=RT+nOujul3YzaQHsvOfHn3Oj5gYPzqPj0fwRjhH4MaweUytX7jel1aR/y5lYLd0v
	 7JEvzL8cjohVn1gVaPq0MHngoD9WpYMaOQ+PH+gF/sUrhLWUFTDxFsQLaDln3lE3F
	 pZoe2bslIQXx0CfT/PIMN+b2h5vlB/qwSVKfoa2L8eBYHXxQ9QCAJA/M69cNQPFnv
	 4ocWBe/Oabzjl027nKa24qWxlrs5szGBo2ox5Pug7XHziA2r8oSCe6QaMTH5/KPrj
	 EPadvke81z1ow9VohiG/xRYP9uiVukRGYeh8wGTbQJYOFBzstOLm64fDkzOgHnr+w
	 CTEYKm6x2Vi84HfpEg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.214]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MLRYf-1v3Npq3615-00P1D7; Sun, 10
 Aug 2025 10:49:05 +0200
Message-ID: <9a1616dc-34b2-42fd-8f64-9d46fa3bb92f@web.de>
Date: Sun, 10 Aug 2025 10:49:02 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jonas Jelonek <jelonek.jonas@gmail.com>, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Harshal Gohel <hg@simonwunderlich.de>,
 Markus Stockhausen <markus.stockhausen@gmx.de>,
 Sven Eckelmann <sven@narfation.org>
References: <20250809220713.1038947-8-jelonek.jonas@gmail.com>
Subject: Re: [PATCH v5 07/11] i2c: rtl9300: move setting SCL frequency to
 config_io
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250809220713.1038947-8-jelonek.jonas@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:B1q3YJ0WPNynJtHyitSae3d0P8GqZL5bOYKY9H9HnFIBq0vAzkZ
 u25KthQ2ALbsQr0m+KSqcJi79qpSscTJn5P6CUDo9ecjHATCZgG6X84z4axY3QqOYyHZ1Yk
 XpUxETlOQHalAZ1cNhVQSy/rZzWQ6cC/UTjkYaM0oJpGX//cFCin1ovo2lwHPRGalFb+lS+
 5HH3zX7t8Qi+yl4Cv1gOw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:NV3Nsajis04=;uedKBDY3giglMgIqIBWpAKjB/ac
 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
 kuugI39DJIA==

=E2=80=A6
> +++ b/drivers/i2c/busses/i2c-rtl9300.c
=E2=80=A6
> +static int mshv_vtl_sint_ioctl_set_eventfd(struct mshv_vtl_set_eventfd =
__user *arg)
> +{
=E2=80=A6
> @@ -244,7 +245,7 @@ static int rtl9300_i2c_smbus_xfer(struct i2c_adapter=
 *adap, u16 addr, unsigned s
> =20
>  	mutex_lock(&i2c->lock);
>  	if (chan->sda_num !=3D i2c->sda_num) {
> -		ret =3D rtl9300_i2c_config_io(i2c, chan->sda_pin);
> +		ret =3D rtl9300_i2c_config_io(i2c, chan);
>  		if (ret)
>  			goto out_unlock;
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(mutex)(&i2c->lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.16/source/include/linux/mutex.h#L225

Regards,
Markus

