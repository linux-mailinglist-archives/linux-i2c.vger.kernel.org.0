Return-Path: <linux-i2c+bounces-12407-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42052B331A8
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Aug 2025 19:45:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B60A1798A4
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Aug 2025 17:45:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D54022DC32A;
	Sun, 24 Aug 2025 17:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VN3/6+kj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1454D35968;
	Sun, 24 Aug 2025 17:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756057496; cv=none; b=Khd6iyHhCWwtctKd7oADY3J1rPsnfkcuyrYSQi7lWOvdexQf/uoT25/XLVouCQicomxtgXJw+HiOHsjc5yqYZeJQ47bgd7zedEqNIgIHsZtcp7hNdkNLDc29f8LBADbz/O+flQmd8ggLUTuDUqbm8MFcsQ2rYsLILTKppcCqZG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756057496; c=relaxed/simple;
	bh=IWg2jWBDkaK1UwyE1fbjKdTdqtVDfr8WGCpcf20Zdz4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CR5xZUMcT4aJc3e4C2EPRVNLVdIGg2oPmJC98n82X7FGWBkLSSn1t4jAhEd4yKGtIhc/mCWmSdXKwTH7uEBqWTubpCM4Zrml+XX6dJ6+2tUz4u8KBngGzkKkw5mf1g92te7t304dsxrTUVQ+yp7QzVbTx95fX6NQbQxpB6Pdq4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VN3/6+kj; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-afe84202bc2so13617566b.2;
        Sun, 24 Aug 2025 10:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756057493; x=1756662293; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IWg2jWBDkaK1UwyE1fbjKdTdqtVDfr8WGCpcf20Zdz4=;
        b=VN3/6+kj44Nbbafbgwy97UPhgWwlwzPhClloC1/DP2tz/ry2Xg8EbqSInsyo1tf2eA
         WiXbVIdCF+ZGtCeiUCKzUWkRzJEAfP/h71zKgUmarbWx/xW7gyXh7V8xCW392GBWPcWa
         BKGO4FsPSxyW1SZELYsjA7dOtuJvCOPb9EZ5PtDAJuexs/75mWvkLPD7mNWnYGxS4Xcn
         UoFt2+VsLjpm7aZeY2M4VVGD5CqREo0t8lQCBomWccjs9rXk60+D5yTAO+iUYOQNn+eN
         IL6tDOc/ukd2DYSY64LHhpNpf820LhToo7aKO5mxFjzaXF6VnidTJfruNU/J2jfKtsVW
         IxQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756057493; x=1756662293;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IWg2jWBDkaK1UwyE1fbjKdTdqtVDfr8WGCpcf20Zdz4=;
        b=b4lP7iamZzZ7NLmardG0Nx31BOHqiL8V5IFSsenFihix+MJuYkJNmzvhlE5tdqzzAn
         o48WAq0ko5lJlp1D63oIn/o7zk24NCkeBNokMPSGr1jBDV//o1IhrgSmwm0pB3InTHjn
         ycY+KLKyPXc7kIbITttTNwPOOZLGaEehZ0r1RjO0iJpU2KbzN1Gzy+ooWTuOMYBJwk8y
         zWM+09DlDPBQViGJXqL9V8V4gpg3dK493kBNyS0g/X9+BBuy1y4Nu1c5RubMSrMXn3KW
         /7oKDic+cfkoF+ZPvCH/QR7rIxCSdbrxLt1AGytZh3pR895PRBzNBSBeT1S93sdU/RUo
         rdeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuL0/j+kDl9X8sJBuwvMWiJW9eyLaw0KhgK0OWdAZIY1o02dO3tqzsdMbyrp5yjoIBBv0SfqOrSmgo@vger.kernel.org, AJvYcCWtCQ/2MLKxQRgWiljousIAB3eOBB843OdJTAcA0StczE8mHh942J9lrMLw8snqPrRKEXDlfZDiX9xb@vger.kernel.org
X-Gm-Message-State: AOJu0YxYzatzXwnX8Qw5SKb/9GLfSYfkRqG7C3mZQoVYwlp+VC+U7fta
	fB3+A6FC76G5DTlBFIJCPuLHSUwchlPKGzv5RGNnoQgSew4+P7mlUZj1
X-Gm-Gg: ASbGncu2978kaMY625UyNwBu9TZX+1BiOZhOUX57Ow4oBqz2M7nZA1HNR1EKUnUzLeG
	Ox0C+TajZ6dmtnFqbisCHXLyTWbprGgqyxNgjXVIoureAm26t8ZhLbDzBGjA1xZCzhgaP5zknl+
	dzIBw4MVXFoGliBqDgBcjzrulmMWaTtohA2y4eqCbv2SmN9VlX/wDRuHQ0HJiHvUNGQ5r2ZmTRh
	NoeJTp1aCTUoO+B5sl0Lk16LOpKeCj+mTVmHeBuxDxukzy80kZnxK01cvK+tt4FCmByMx4BfcuJ
	Y6qCeZzI9doIsLr3pu0F9vHTkf/Bnw9ahioZZi4XFsgJi6awZ04J77QBuTn4hPWSO76jTZ+2pQr
	pl6txA9RxUe+Z0d+k/AGywxVCci8V3PZOAnFDsUgxEfI398uPrGxLlD8bc6bnrQPDUVZztAq//m
	7oF6UyKDzEJOsbrFdd1JtCCw==
X-Google-Smtp-Source: AGHT+IEidXQu5ah5AQzTFGfwSB6cp+8O4UFDON3xUsv0iXJ3gWLta4TCJrj76xIOoARc7wUj9nXqVA==
X-Received: by 2002:a17:907:9805:b0:ae3:7b53:31bd with SMTP id a640c23a62f3a-afe2943d059mr803168966b.28.1756057493169;
        Sun, 24 Aug 2025 10:44:53 -0700 (PDT)
Received: from ?IPV6:2001:9e8:f104:2132:3c52:27ae:d6c0:d2c8? ([2001:9e8:f104:2132:3c52:27ae:d6c0:d2c8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe48e863d5sm407218266b.18.2025.08.24.10.44.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Aug 2025 10:44:52 -0700 (PDT)
Message-ID: <44c2cab3-6dcb-4775-9396-a8d9754fdbd4@gmail.com>
Date: Sun, 24 Aug 2025 19:44:51 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 10/12] i2c: rtl9300: use scoped guard instead of
 explicit lock/unlock
Content-Language: en-US
To: Markus Elfring <Markus.Elfring@web.de>, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Conor Dooley <conor+dt@kernel.org>, Harshal Gohel <hg@simonwunderlich.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Markus Stockhausen <markus.stockhausen@gmx.de>, Rob Herring
 <robh@kernel.org>, Sven Eckelmann <sven@narfation.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20250824113348.263475-11-jelonek.jonas@gmail.com>
 <95e31ebe-08d8-4b04-a624-f0ecb8a57d3f@web.de>
From: Jonas Jelonek <jelonek.jonas@gmail.com>
In-Reply-To: <95e31ebe-08d8-4b04-a624-f0ecb8a57d3f@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 24.08.25 16:12, Markus Elfring wrote:
> …
>> when the guard goes out of scope, instead of explicity lock/unlock. This
> …
>
> explicit? Would such a word be nicer in the next line?

I think I wanted to write 'explicitly' but not sure which variant is better.
Having it in the next line would probably be better, I'll fix this.

> Regards,
> Markus

Regards,
Jonas

