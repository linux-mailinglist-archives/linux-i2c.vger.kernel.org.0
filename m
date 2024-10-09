Return-Path: <linux-i2c+bounces-7292-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 676A699673A
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2024 12:27:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 02665B261F0
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2024 10:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82A0F18E041;
	Wed,  9 Oct 2024 10:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="IaSZNmMU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C0515382F;
	Wed,  9 Oct 2024 10:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728469631; cv=none; b=P0Cat8mvS6aUd4qvsevRwF+DjTaZNtPY80u47Dbbo0K25SN3fvVFjIr9+Vnhw6Xzh+GWnLJgPj2pbkAilm8N0UiW+VlIEirDmqWBIOuGh8FHWrG9kSwGpzdPZo4oqXX/P6xgv5eCK9W5uigudiajaDAOe9aN72X2fytYIZ1otjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728469631; c=relaxed/simple;
	bh=5ZenLqU4VTWx8D4jCHpR0AkhS1gX0UMjyUhU2joZlLc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=jctKml0nIroi1QtqL32CquKw13Kifga4W44mqgepx5vix+xZUUbiNs3j4Ky6GIJzwuhk4kwwFHdq2yzM3oQ75pRPUuK7MReUwbNT9OeT1y3k+H7rGbFO/so4EQZnEtFMY+lvBqtE2X1z4C2jYpXerpMRAXCvffuoMOKmqtITxCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=IaSZNmMU; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id BAF6BFF807;
	Wed,  9 Oct 2024 10:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728469627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kYFf+MxvDup/RI+1Ncetwr45O3Q+xf0MstIDXJK3vW4=;
	b=IaSZNmMUGBhEeWI3TA/wm7PqsHBAdZB9oovNm9/LaIHN8rK00jZ3mmYxWjduw5/5KYwqCl
	zPlfOjzy4IVbyLlYrAICwciDTO+pMj/9p0rkQOo96+tHAusUG/cTpBTOdrxg/Yws4qxaTz
	2mJBOErBo2LLiH/W2HzzGnr9djcO3WrdKOXvV88On7ah9U9P488xtJwanNllkdHB94gThC
	eciqHtYW8k4Hy7Vm7/Uskx9GhXlkWS9zdJLaLDosJbyf0ZLxfmaYh13HxX9rcjQYy8C96Q
	hIhx+2Z8qbiY1QS1VoVK5I72EvWt3QwEhLTW0aq2xjlWYD2hYE0t75KHw+/anA==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Oct 2024 12:27:06 +0200
Message-Id: <D4R7CGGQAJ50.U5UY2B7PBGG@bootlin.com>
Cc: "Linus Walleij" <linus.walleij@linaro.org>, "Andi Shyti"
 <andi.shyti@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vladimir
 Kondratiev" <vladimir.kondratiev@mobileye.com>,
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH 2/4] i2c: nomadik: support Mobileye EyeQ6H I2C
 controller
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241008-mbly-i2c-v1-0-a06c1317a2f7@bootlin.com>
 <20241008-mbly-i2c-v1-2-a06c1317a2f7@bootlin.com>
 <oxcxs6n7y4bw33yfgaacd2cayf7otfochvlaofva2kabzjim6h@d6pam3gciepl>
 <D4QI63B6YQU5.3UPKA7G75J445@bootlin.com>
 <fc17ef3d-7895-4ee8-bfa0-d31dd45f2f2c@kernel.org>
In-Reply-To: <fc17ef3d-7895-4ee8-bfa0-d31dd45f2f2c@kernel.org>
X-GND-Sasl: theo.lebrun@bootlin.com

On Tue Oct 8, 2024 at 6:03 PM CEST, Krzysztof Kozlowski wrote:
> On 08/10/2024 16:43, Th=C3=A9o Lebrun wrote:
> > On Tue Oct 8, 2024 at 3:39 PM CEST, Krzysztof Kozlowski wrote:
> >> On Tue, Oct 08, 2024 at 12:29:41PM +0200, Th=C3=A9o Lebrun wrote:
> >>> +	bool is_eyeq6h =3D of_device_is_compatible(np, "mobileye,eyeq6h-i2c=
");
> >>> +	bool is_eyeq5 =3D of_device_is_compatible(np, "mobileye,eyeq5-i2c")=
;
> >>
> >> You should use match data, not add compatibles in the middle of code.
> >> That's preferred, scallable pattern. What you added here last time doe=
s
> >> not scale and above change is a proof for that.
> >=20
> > I would have used match data if the driver struct had a .of_match_table
> > field. `struct amba_driver` does not. Are you recommending the approach
> > below?
> >=20
> > I don't see how it brings much to the driver but I do get the scaling
> > issue as the number of support compatibles increases. This is a fear
> > based on what *could* happen in the future though.
>
> You still have adev->dev.of_node, which you can use for matching in
> probe. See for example of_match_device() (and add a note so people will
> not convert it to device_get_match_data() blindly).

Just sent the new revision [0]. It uses of_match_device() in the same
way as was shown in my previous answer to this thread [1]. Followed
your recommendation and added a comment to avoid conversions to
device_get_match_data().

Thanks!

[0]: https://lore.kernel.org/lkml/20241009-mbly-i2c-v2-0-ac9230a8dac5@bootl=
in.com/
[1]: https://lore.kernel.org/lkml/D4QI63B6YQU5.3UPKA7G75J445@bootlin.com/

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


