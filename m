Return-Path: <linux-i2c+bounces-13064-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF85B8CD9B
	for <lists+linux-i2c@lfdr.de>; Sat, 20 Sep 2025 19:10:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1E6737AE3BB
	for <lists+linux-i2c@lfdr.de>; Sat, 20 Sep 2025 17:09:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A96932248BD;
	Sat, 20 Sep 2025 17:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="KWOTw+Bj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2C61F152D
	for <linux-i2c@vger.kernel.org>; Sat, 20 Sep 2025 17:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758388242; cv=none; b=OW3u8OECmoXlk/4k67KgFgxH+ezeERq5iu3XLd1XLHWJyFjQHslh4JZ+XI9cN+lyOkt7omDWlIMsdiFamFkH5wjLL66i6670fWyzyBsMHkCQRduAL/Q/3NzW3qjLjPwbvLap+BmL6XjzOiAppiaVP7EdXYGwAMY9oTIxEidAKL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758388242; c=relaxed/simple;
	bh=RSI3VckpD7CHAKqWHV0G2q67lpmUbI91NOEpha6163c=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=BAawpcUWOlYvc8WVEoBsR3SiUrrZZbx4XaLmdrgVyqe21aJ3rg4IeFhrmkPN0joS4mYl5StxiLBeYk0g23pyeMrZdP3rUPZ6zoq+9xO7viRTcTKEruoAKdMF9DtAVQxEzC+nAm7z7/Tx9bnjehpOIj05EylSGprcdnofCxh60Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=KWOTw+Bj; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=KWOTw+Bj4OOXsGaJJvWbSUILi4HVd/QLUfoPr/16Gp8cZtp1ULhP9Uvde66AYpwH+WOk0EbAxWbrC3JHegoga1Gd5SGcaipmCa+ETY0SU6gft8I8jTz8nrWehQvVHM55Xf/avlX/MAo0XVcMSQzllJXv3x409IJsiU6w+SkkSQ93s8R7rYZyQWRCBBm6eJmP+l4a/Hyj2VKbaC+W6w6aZSmHGs6K516FFesf/Kp2srxyoz6EKA+M/ElqYYUcZbQ4Zy8ZtjCkviIokVZqkqesih8R1JOSnR/TzIuCj5+oqKO1sKZKR4D8zv4a2H/XAXZa6Y6NiWpI9ETmEG6UHvRvvQ==; s=purelymail1; d=purelymail.com; v=1; bh=RSI3VckpD7CHAKqWHV0G2q67lpmUbI91NOEpha6163c=; h=Feedback-ID:Received:Date:Subject:From:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-i2c@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 362739118;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sat, 20 Sep 2025 17:10:05 +0000 (UTC)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 20 Sep 2025 19:10:02 +0200
Message-Id: <DCXSLGK9ONQV.21BWV4YL6FG4E@mentallysanemainliners.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <linux-i2c@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 0/2] i2c: Add support for MT6878 I2C controllers
From: "Igor Belwon" <igor.belwon@mentallysanemainliners.org>
To: "Igor Belwon" <igor.belwon@mentallysanemainliners.org>, "Qii Wang"
 <qii.wang@mediatek.com>, "Andi Shyti" <andi.shyti@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Matthias Brugger"
 <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250920-mt6878-i2c-bringup-v1-0-d1527ffd3cd7@mentallysanemainliners.org>
In-Reply-To: <20250920-mt6878-i2c-bringup-v1-0-d1527ffd3cd7@mentallysanemainliners.org>

On Sat Sep 20, 2025 at 5:31 PM CEST, Igor Belwon wrote:
> Hi all,
>
> This patchest adds support for the i2c units found in the MediaTek=20
> MT6878 SoC. These units use the new v3 register offset scheme=20
> (differing only in OFFSET_SLAVE_ADDR).
>
> Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
> ---

Hi,

Please DROP this patchset from the queue.

This patchset can be simplified into one commit (only bindings changes),
as the compatible data is 1:1 from mt8188.

Sincere apologies,
Igor

