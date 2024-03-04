Return-Path: <linux-i2c+bounces-2150-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A440870434
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 15:32:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBFF11C20F47
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 14:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41D513F9F4;
	Mon,  4 Mar 2024 14:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UlFpoy3w"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A29722630;
	Mon,  4 Mar 2024 14:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709562768; cv=none; b=agv/mRe4+JX9OgNbxwxMjEw037h8WqF3PQz8AtFJ0YsIAXK2Kk37Hj2Ii94IGnvtl3vXEBy8ZODROPqG/g3auIWAQgnDC8f+A9lcuM2JCE1bnyE3OKdKLg9L7jvp9lHkKhMGITmeno7o4o6KIA5m4Zp62jSbllyJ4pbfa2TH9LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709562768; c=relaxed/simple;
	bh=GTxNYf9/QPpJeKyDdvLNK9UeysxfJxAAQUupeLW1ux0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=SxDpmDEiZELll28xrtxgi1oTgf3nBJoquKeubktizF+Rt0ByMRJC36bBz3YHyLRMZjHZsmVjqB+vmHRELMgSPq0/ypHMUoZFq1ARutqmae+VO7xz95OdWta6ePwo3DWqZYipc+TcT98TPBNqMTzKlUV7ef6BzUGoxSPO/5S/4Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UlFpoy3w; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id CFD5FE0016;
	Mon,  4 Mar 2024 14:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709562759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VVcCK+YkQiSdvPAjSAPwRLt7JpKB10rUh9LOYhzJwGM=;
	b=UlFpoy3wrHro67QQBJ0DptvXOr4Cqkfs1JFHZjHquMpwfsgqOWNanaS78AQYrF9yxr6PXj
	9TpZZSsXQxDYVwQOyuta/S9JRhVfqZS+52iaQkzZ8LF3DByo60Fgk7BkVMVM7UBw4gk3kx
	UgmdtzavFb9uDZmyYbSxz6M2i4CEeWe2KpmTL0qRUV8PhtiLEI9JzQS5S1ory1ZPRDs9D9
	uDjcKKpSZ+20wWrm5gMYzwfbqm6ROWR9eFRvCdLuCTH0sNzPftgyRkwABBtcaeQkXHPuic
	jHFsqlcnpDG3KELTx5kgf9eeRN+Xvg3h2SsDW4pjudTqcLNy+Cf3F/MesMR7zg==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 04 Mar 2024 15:32:38 +0100
Message-Id: <CZL1F576XCJB.2DBGD5Z7UUXIH@bootlin.com>
Subject: Re: [SPAM] [PATCH v2 06/11] i2c: nomadik: support short xfer
 timeouts using waitqueue & hrtimer
Cc: "Linus Walleij" <linus.walleij@linaro.org>, "Rob Herring"
 <robh+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mips@vger.kernel.org>, "Gregory Clement"
 <gregory.clement@bootlin.com>, "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>
To: "Andi Shyti" <andi.shyti@kernel.org>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.15.2
References: <20240229-mbly-i2c-v2-0-b32ed18c098c@bootlin.com>
 <20240229-mbly-i2c-v2-6-b32ed18c098c@bootlin.com>
 <uq6n6s4ksuxvkonowouhr747cnu4ccwvhgpl6r7txgdtnimqnz@sl33zjshzemk>
In-Reply-To: <uq6n6s4ksuxvkonowouhr747cnu4ccwvhgpl6r7txgdtnimqnz@sl33zjshzemk>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello,

On Mon Mar 4, 2024 at 2:54 PM CET, Andi Shyti wrote:
> Hi Theo,
>
> ...
>
> > +static bool nmk_i2c_wait_xfer_done(struct nmk_i2c_dev *priv)
> > +{
> > +	if (priv->timeout_usecs < jiffies_to_usecs(1)) {
> > +		unsigned long timeout_usecs =3D priv->timeout_usecs;
> > +		ktime_t timeout =3D ktime_set(0, timeout_usecs * NSEC_PER_USEC);
> > +
> > +		wait_event_hrtimeout(priv->xfer_wq, priv->xfer_done, timeout);
> > +	} else {
> > +		unsigned long timeout =3D usecs_to_jiffies(priv->timeout_usecs);
> > +
> > +		wait_event_timeout(priv->xfer_wq, priv->xfer_done, timeout);
> > +	}
> > +
> > +	return priv->xfer_done;
>
> You could eventually write this as
>
>   static bool nmk_i2c_wait_xfer_done(struct nmk_i2c_dev *priv)
>   {
> 	if (priv->timeout_usecs < jiffies_to_usecs(1)) {
> 		...
>
> 		return !wait_event_hrtimeout(...);
> 	}
>
> 	...
> 	return wait_event_timeout(...);
>   }
>
> It looks a bit cleaner to me... your choice.

The full block would become:

static bool nmk_i2c_wait_xfer_done(struct nmk_i2c_dev *priv)
{
	if (priv->timeout_usecs < jiffies_to_usecs(1)) {
		unsigned long timeout_usecs =3D priv->timeout_usecs;
		ktime_t timeout =3D ktime_set(0, timeout_usecs * NSEC_PER_USEC);

		return !wait_event_hrtimeout(priv->xfer_wq, priv->xfer_done,
					     timeout);
	}

	return wait_event_timeout(priv->xfer_wq, priv->xfer_done,
				  usecs_to_jiffies(priv->timeout_usecs));
}

Three things:

 - Deindenting the jiffy timeout case means no variable declaration
   after the if-block. This is fine from my point-of-view.

 - It means we depend on the half-mess that are return values from
   wait_event_*timeout() macros. I wanted to avoid that because it
   looks like an error when you read the above code and see one is
   negated while the other is not.

 - Also, I'm not confident in casting either return value to bool; what
   happens if either macro returns an error? This is a theoretical case
   that shouldn't happen, but behavior might change at some point or
   bugs could occur. We know priv->xfer_done will give us the right
   answer.

My preference still goes to the original version, but I'm happy we are
having a discussion about this code block.

> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks for your review Andi!

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


